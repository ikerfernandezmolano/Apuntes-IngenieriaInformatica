import sys

import requests
import urllib.parse
import json
import psutil
import signal
import csv
import random as r
import time

USER_API_KEY = "UIHPK06071TLZPHJ"
id=None
write_api_key=None

def obtenerdatos(cuerpo):
    global id, write_api_key
    id = cuerpo['id']
    write_api_key = None
    for k in cuerpo['api_keys']:
        if k['write_flag']:
            write_api_key = k['api_key']
            break

    with open("datos_ifmCanal.txt", "w") as fichero:
        fichero.write("CHANNEL_ID=" + str(id) + "\n")
        fichero.write("WRITE_API_KEY=" + write_api_key + "\n")

    print("Data saved on datos_canal.txt")

def upload_data(cpu = 0.0, ram = 0.0):
    metodo = 'POST'
    uri = "https://api.thingspeak.com/update"
    cabeceras = {'Host': 'api.thingspeak.com',
                 'Content-Type': 'application/x-www-form-urlencoded'}
    cuerpo = {
        'api_key': write_api_key,
        'field1': cpu,
        'field2': ram
    }
    cuerpo_encoded = urllib.parse.urlencode(cuerpo)
    cabeceras['Content-Length'] = str(len(cuerpo_encoded))
    requests.request(metodo, uri,
                                 headers=cabeceras, data=cuerpo_encoded)

def get_cpu_ram():
    while True:
        # CODIGO: utilizando la libreria psutil, obtener %CPU y %RAM
        cpu = psutil.cpu_percent(interval=15, percpu=False)
        ram = psutil.virtual_memory().percent
        print("Uploading data...")
        upload_data(cpu, ram)

def create_channel():
    metodo = 'POST'
    uri = "https://api.thingspeak.com/channels.json"
    cabeceras = {'Host': 'api.thingspeak.com',
                 'Content-Type': 'application/x-www-form-urlencoded'}
    cuerpo = {'api_key': USER_API_KEY,
              'name': 'ifmCanal',
              'field1': "%CPU",
              'field2': "%RAM"}
    cuerpo_encoded = urllib.parse.urlencode(cuerpo)
    print(cuerpo_encoded)
    cabeceras['Content-Length'] = str(len(cuerpo_encoded))
    respuesta = requests.request(metodo, uri, headers=cabeceras,
                                 data=cuerpo_encoded, allow_redirects=False)
    codigo = respuesta.status_code

    if codigo == 200:
        print("Channel created successfully.")
        obtenerdatos(json.loads(respuesta.content))
    elif codigo == 422:
        print("Channel limit reached.")

def try_create():
    metodo = 'GET'
    uri = "https://api.thingspeak.com/channels.json"
    cabeceras = {'Host': 'api.thingspeak.com',
                 'Content-Type': 'application/x-www-form-urlencoded'}
    cuerpo = {'api_key': USER_API_KEY}
    cuerpo_encoded = urllib.parse.urlencode(cuerpo)
    cabeceras['Content-Length'] = str(len(cuerpo_encoded))
    respuesta = requests.request(metodo, uri, headers=cabeceras,
                                 data=cuerpo, allow_redirects=False)
    cuerpo = respuesta.content
    cuerpo = json.loads(cuerpo)
    created = False

    print("Checking if channel is already created")
    for k in cuerpo:
        if k['name'] == "ifmCanal":
            print(f"Channel {k['name']} was already created.")
            created = True
            obtenerdatos(k)
            break

    if not created:
        print("Creating channel...")
        create_channel()

def backup_last100():
    metodo = 'GET'
    uri = f"https://api.thingspeak.com/channels/{id}/feeds.json"
    cabeceras = {'Host': 'api.thingspeak.com',
                 'Content-Type': 'application/x-www-form-urlencoded'}
    params = {'api_key': write_api_key,
              'results': 100}
    respuesta = requests.request(method=metodo,url=uri, headers=cabeceras,
                                 params=params, allow_redirects=False)
    feed= json.loads(respuesta.content)['feeds']

    with open("last100_data.csv", mode="w", newline="") as csvfile:
        escritor = csv.writer(csvfile)
        escritor.writerow(["timestamp", "cpu", "ram"])
        for item in feed:
            escritor.writerow([
                item["created_at"],
                item["field1"],
                item["field2"]
            ])

def clearchannel():
    metodo = 'DELETE'
    uri = f"https://api.thingspeak.com/channels/{id}/feeds.json"
    cabeceras = {'Host': 'api.thingspeak.com',
                 'Content-Type': 'application/x-www-form-urlencoded'}
    cuerpo = {'api_key': USER_API_KEY}
    cuerpo_encoded = urllib.parse.urlencode(cuerpo)
    cabeceras['Content-Length'] = str(len(cuerpo_encoded))
    respuesta = requests.request(metodo, uri, headers=cabeceras,
                                 data=cuerpo_encoded, allow_redirects=False)
    if respuesta.status_code == 200:
        print("Channel cleared successfully.")

def handler(sig_num, frame):
    print("Ctrl+C detected.")
    backup_last100()
    clearchannel()
    sys.exit(0)

def quickload():
    print("Proceeding with the quick data upload...")

    metodo= "POST"
    uri = f"https://api.thingspeak.com/channels/{id}/bulk_update.json"

    updates = []

    # Generar 100 muestras simuladas
    for i in range(100):
        updates.append({
            "created_at": time.strftime(
                "%Y-%m-%dT%H:%M:%SZ",
                time.gmtime(time.time() - (100 - i) * 15)
            ),
            "field1": round(r.uniform(1, 14), 1),
            "field2": round(r.uniform(58, 64), 1)
        })

    body = {
        "write_api_key": write_api_key,
        "updates": updates
    }

    requests.request(metodo, uri, json=body)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, handler)
    try_create()
    # Para no esperar las 100 muestras ejecuta el programa añadiendo como parámetro "cargaRapida"
    if 'cargaRapida' in sys.argv:
        quickload()
    get_cpu_ram()