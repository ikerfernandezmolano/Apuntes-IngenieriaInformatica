def escribir_vector(V):
    print(V)

def intercambiar(V,posA,posB):
    num=V[posA]
    num_aux=V[posB]
    V[posA]=num_aux
    V[posB]=num
    return(V)

def buscar_posicion_del_minimo(V,posComienzo):
#Pre:	  0 <= posComienzo < len(V)
#Post:  pos_min contiene la posicion del valor minimo de los
#       comprendidos entre posComienzo y len(V)
    num=V[posComienzo]
    for Ind in range(posComienzo,len(V)):
        if num>=V[Ind]:
            num=V[Ind]
            pos_min=Ind
    return(pos_min)

def ordenar_por_seleccion(V):
    ya_ordenados=0
    for Ind in range(0,len(V)):
        pos_min=buscar_posicion_del_minimo(V,ya_ordenados)
        intercambiar(V,ya_ordenados,pos_min)
        ya_ordenados=ya_ordenados+1
    return(V)

def principal():
     #Caso 1 
     vector1 = [9, 5, 3, 4, 10, 8, 13, 24, 15, 11]
     print("El vector inicial es (9,5,3,4,10,8,13,24,15,11):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_seleccion(vector1)
     print("El vector final deberia ser (3,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n") 
    
     #Caso 2 
     vector1 = [9, 5, 3, 4, 10, 8, 13, 8, 15, 11]
     print("El vector inicial es (9,5,3,4,10,8,13,8,15,11):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_seleccion(vector1)
     print("El vector final deberia ser (3,4,5,8,8,9,10,11,13,15) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        
     #Caso 3 
     vector1 = [3, 4, 5, 8, 9, 10, 11, 13, 15, 24]
     print("El vector inicial es (3,4,5,8,9,10,11,13,15,24):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_seleccion(vector1)
     print("El vector final deberia ser (3,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
    
    #Caso 4 
     vector1 = [24, 15, 13, 11, 10, 9, 8, 5, 4, 0]
     print("El vector inicial es (24,15,13,11,10,9,8,5,4,0):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_seleccion(vector1)
     print("El vector final deberia ser (0,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        
     #Caso 5
     vector1 = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
     print("El vector inicial es (0,1,0,1,0,1,0,1,0,1):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_seleccion(vector1)
     print("El vector final deberia ser (0,0,0,0,0,1,1,1,1,1) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
                
     #Caso 6
     vector1 = [0]
     print("El vector inicial es (0):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_seleccion(vector1)
     print("El vector final deberia ser (0) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
principal()

