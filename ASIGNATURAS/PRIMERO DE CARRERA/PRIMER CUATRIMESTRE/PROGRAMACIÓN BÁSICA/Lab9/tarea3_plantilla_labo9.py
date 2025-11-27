import time
import random

def escribir_vector(V):
# Pre:  len(V) >= 0    
# Post: se muestran por pantalla todos los elementos de V
    print(V)

def ordenar(V):
# Pre:  len(V) >= 0    
# Post: se devuelve V con sus elementos ordenados de mayor a menor

    if len(V) > 1:
            medio=len(V)//2
            izquierda = V[:medio]
            derecha = V[medio:]
            ordenar(izquierda)
            ordenar(derecha)
            i = 0
            j = 0
            k = 0
            while i < len(izquierda) and j < len(derecha):
                if izquierda[i] <= derecha[j]:
                    V[k] = izquierda[i]
                    i=i+1
                else:
                    V[k] = derecha[j]
                    j=j+1
                k=k+1
            while i < len(izquierda):
                V[k] = izquierda[i]
                i=i+1
                k=k+1
            while j < len(derecha):
                V[k]=derecha[j]
                j=j+1
                k=k+1
    return V


def principal():
    
    V = list(range(-800,800))+list(range(-200))
    random.shuffle(V)
    
    print("ANTES DE ORDENAR:")
    escribir_vector(V)
    
    reloj = time.time()
    
    V = ordenar(V)
    
    reloj = time.time() - reloj
    
    print("DESPUES DE ORDENAR:")
    escribir_vector(V)
    
    print("Han transcurrido "+ str(round(reloj,3)) + " segundos")
    
    
principal()