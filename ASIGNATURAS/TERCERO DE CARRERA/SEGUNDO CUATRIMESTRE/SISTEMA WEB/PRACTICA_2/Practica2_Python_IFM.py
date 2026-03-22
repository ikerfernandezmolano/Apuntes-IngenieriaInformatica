import requests
from bs4 import BeautifulSoup
import getpass
import sys
import csv
import urllib.parse
import os
from urllib.parse import urljoin

BASE_URL = "https://egela.ehu.eus"

def print_request(method, url, headers=None, body=None):
    print(f"{method} {url}")
    if headers:
        print("Headers:", headers)
    if body:
        print("Body:", body)
    print()

def print_respuesta(respuesta):
    print(f"{respuesta.status_code} {respuesta.reason}")
    if 'Location' in respuesta.headers:
        print("Location:", respuesta.headers['Location'])
    if 'Set-Cookie' in respuesta.headers:
        print("Set-Cookie:", respuesta.headers['Set-Cookie'])
    print("\n")


def obtener_cookie(set_cookie):
    for p in set_cookie.split(';'):
        if "MoodleSessionegela" in p:
            return p.strip()
    return ""


def descargar_archivo(url, ruta_destino, cookie):
    cabeceras = {
        "Host": "egela.ehu.eus",
        "Cookie": cookie
    }

    r = requests.get(url, headers=cabeceras, allow_redirects=False)

    if r.status_code == 303:
        if r.headers.get("Location"):
            if ".py" in r.headers.get("Location"):
                r = requests.get(r.headers.get("Location"), headers=cabeceras, allow_redirects=False)
                disposition = r.headers.get("Content-Disposition", "")
                ruta = f"{ruta_destino}/{disposition.split('filename="')[1].split('"')[0]}"
                if os.path.exists(ruta):
                    return
                with open(ruta, "w", newline="") as f:
                    f.write(r.content.decode('utf-8'))
            elif ".pdf" in r.headers.get("Location"):
                r = requests.get(r.headers.get("Location"), headers=cabeceras, allow_redirects=False)
                disposition = r.headers.get("Content-Disposition", "").encode('latin-1').decode('utf-8')
                ruta = f"{ruta_destino}/{disposition.split('filename="')[1].split('"')[0]}"
                if os.path.exists(ruta):
                    return
                with open(ruta, "wb") as f:
                    f.write(r.content)


def crear_csv():
    with open("tareas.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["Titulo", "Fecha", "Link"])

def anadir_tarea(url, cookie):
    metodo = "GET"
    cabeceras = {
        "Host": "egela.ehu.eus",
        "Cookie": cookie
    }

    respuesta_tarea = requests.request(metodo, url, headers=cabeceras)
    soup_tarea = BeautifulSoup(respuesta_tarea.text, "html.parser")

    items = soup_tarea.find_all("li", class_="breadcrumb-item")
    if items:
        ultimo_item = items[-1]
        titulo = ultimo_item.get_text(strip=True)
    fecha = soup_tarea.find('th', string=lambda t: t and "Última modificación" in t).find_next_sibling('td').text.strip()

    with open("tareas.csv", "a", newline="") as f:
        writer = csv.writer(f)
        writer.writerow([titulo, fecha, url])

def obtener_temas(soup_curso, course_url):
    temas = []
    vistos = set()

    for enlace in soup_curso.find_all("a", href=True):
        href = enlace.get("href")
        texto = enlace.get_text(" ", strip=True)
        href_abs = urljoin(course_url, href)

        if "Destacado" not in texto:
            continue

        nombre_tema = texto.replace("Destacado", "").strip()

        if not nombre_tema:
            continue

        if href_abs not in vistos:
            temas.append((nombre_tema, href_abs))
            vistos.add(href_abs)

    return temas

def descargar_recursos_y_tareas(course_url, cookie):
    carpeta_base = "Sistemas_Web"
    os.makedirs(carpeta_base, exist_ok=True)

    metodo= "GET"
    cabeceras = {
        "Host": "egela.ehu.eus",
        "Cookie": cookie
    }

    respuesta_curso = requests.request(metodo, course_url, headers=cabeceras)

    soup_curso = BeautifulSoup(respuesta_curso.text, "html.parser")
    temas = obtener_temas(soup_curso, course_url)

    descargados = set()
    crear_csv()
    for nombre_tema, tema_url in temas:
        carpeta_tema = os.path.join(carpeta_base, nombre_tema)
        os.makedirs(carpeta_tema, exist_ok=True)

        respuesta_tema = requests.request(metodo, tema_url, headers=cabeceras)
        soup_tema = BeautifulSoup(respuesta_tema.text, "html.parser")

        for enlace in soup_tema.find_all("a", href=True):
            href = enlace.get("href")
            url = urljoin(tema_url, href)

            if "/mod/assign/view.php" in url:
                anadir_tarea(url,cookie)
                continue

            if "/mod/resource/view.php" not in url:
                continue

            if url in descargados:
                continue

            descargados.add(url)

            descargar_archivo(url, carpeta_tema, cookie)

def main():
    username = sys.argv[1]
    nombre = sys.argv[2]
    password = getpass.getpass("Contraseña: ")

    # ========================
    # REQUEST 1
    # ========================
    metodo = "GET"
    uri = BASE_URL + "/login/index.php"
    cabeceras = {"Host": "egela.ehu.eus"}
    print_request(metodo, uri, cabeceras)

    r1 = requests.request(metodo, uri, headers=cabeceras)
    print_respuesta(r1)

    cookies = obtener_cookie(r1.headers.get("Set-Cookie", ""))

    soup = BeautifulSoup(r1.text, "html.parser")
    logintoken = soup.find("input", {"name": "logintoken"})["value"]

    # ========================
    # REQUEST 2
    # ========================
    metodo = "POST"
    uri = BASE_URL + "/login/index.php"
    cuerpo = {
        "username": username,
        "password": password,
        "logintoken": logintoken
    }
    cuerpo_encoded = urllib.parse.urlencode(cuerpo)
    cabeceras = {
        "Host": "egela.ehu.eus",
        "Content-Type": "application/x-www-form-urlencoded",
        "Content-Length": str(len(cuerpo_encoded)),
        "Cookie": cookies
    }

    print_request(metodo, uri, cabeceras, cuerpo_encoded)

    r2 = requests.request(metodo, uri, headers=cabeceras, data=cuerpo_encoded, allow_redirects=False)

    print_respuesta(r2)

    cookies = obtener_cookie(r2.headers.get("Set-Cookie", ""))

    # ========================
    # REQUEST 3
    # ========================
    metodo = "GET"
    location = r2.headers.get("Location")
    uri = location if location.startswith("http") else BASE_URL + "/" + location

    cabeceras = {
        "Host": "egela.ehu.eus",
        "Cookie": cookies
    }

    print_request(metodo, uri, cabeceras)

    r3 = requests.request(metodo, uri, headers=cabeceras, allow_redirects=False)

    print_respuesta(r3)

    # ========================
    # REQUEST 4
    # ========================
    metodo = "GET"
    location = r3.headers.get("Location")
    uri = location if location.startswith("http") else BASE_URL

    cabeceras = {
        "Host": "egela.ehu.eus",
        "Cookie": cookies
    }

    print_request(metodo, uri, cabeceras)

    r4 = requests.request(metodo, uri, headers=cabeceras)

    print_respuesta(r4)

    # ========================
    # REQUEST 5 (VALIDACIÓN LOGIN)
    # ========================
    metodo = "GET"
    uri = BASE_URL + "/user/profile.php"
    cabeceras = {
        "Host": "egela.ehu.eus",
        "Cookie": cookies
    }

    print_request(metodo, uri, cabeceras)

    r5 = requests.request(metodo, uri, headers=cabeceras)

    print_respuesta(r5)

    if nombre in r5.text:
        print("Login correcto")
        input("Para continuar, pulsa cualquier tecla...")
    else:
        print("Login incorrecto")
        sys.exit(1)

    # ========================
    # REQUEST 6
    # ========================
    soup = BeautifulSoup(r4.text, "html.parser")
    course_url = None

    for link in soup.find_all("a"):
        if "Sistemas Web" in link.get_text(" ", strip=True):
            course_url = link.get("href")
            break

    descargar_recursos_y_tareas(course_url, cookies)
    print("Proceso finalizado.")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Uso: python script.py usuarioLDAP Nombre")
        sys.exit(1)

    main()