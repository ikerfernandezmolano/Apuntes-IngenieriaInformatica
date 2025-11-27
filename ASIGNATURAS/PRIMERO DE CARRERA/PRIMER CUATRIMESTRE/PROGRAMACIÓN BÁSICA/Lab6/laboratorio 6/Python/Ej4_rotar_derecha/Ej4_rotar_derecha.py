def escribir_vector(V):
#Entrada: un array de enteros
#Pre:-
#Salida: se muestra por pantalla los elementos del array
#Post:
    for i in range(0, len(V)):
        print(V[i], end=" ")
       
def rotar_derecha(V):
#Entrada: un array de enteros
#Pre:-
#Salida: un array de enteros
#Post: el array de salida tiene los elementos del array de entrada desplazados
#una posicion a la derecha 
    num=V[len(V)-1]
    num_aux=V[0]
    V[0]=num
    for cont in range(1,len(V)):
        num=V[cont]
        V[cont]=num_aux
        num_aux=num
    return V

def principal(): 
    
    vector1=[1,2,3,4,5,6,7,8,9,10]
    print("un vector de diez elementos: \n [1,2,3,4,5,6,7,8,9,10]")
    print(" Los elementos del vector inicial son: ")
    escribir_vector(vector1)
    print("\n", end="")
    print(" al rotar los elementos el resultado es:  ")
    vector1=rotar_derecha(vector1)
    escribir_vector(vector1)
    print("\n")
    
    vector1=[1,2]
    print("un vector de dos elementos: \n [1,2]")
    print(" Los elementos del vector inicial son: ")
    escribir_vector(vector1)
    print("\n", end="")
    print(" al rotar los elementos el resultado es:  ")
    vector1=rotar_derecha(vector1)
    escribir_vector(vector1)
    print("\n")
    
    vector1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    print("un vector de dos elementos: \n [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]")
    print(" Los elementos del vector inicial son: ")
    escribir_vector(vector1)
    print("\n", end="")
    print(" al rotar los elementos el resultado es:  ")
    vector1=rotar_derecha(vector1)
    escribir_vector(vector1)
    print("\n")
    
    
principal()
