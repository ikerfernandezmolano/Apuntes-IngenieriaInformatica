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
    
    V = [1,2,5,2,3,4,5,6,7,3,7,8,1,4] # Vector que se va a ordenar
    
    print("ANTES DE ORDENAR:")
    escribir_vector(V)
      
    V = ordenar(V)
    
    print("DESPUES DE ORDENAR:")
    escribir_vector(V)
    
principal()