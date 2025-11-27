def escribir_vector(V):
    print(V)

def desplazar_una_posicion_a_la_derecha(V,posActual,posComienzo):
    num=V[posComienzo]
    for Ind in range(posComienzo,posActual):
        num_aux=V[Ind+1]
        V[Ind+1]=num
        num=num_aux
    return(V);

def buscar_posicion_de_insercion(V,posActual,elem):
    tiene_lugar=False
    for Ind in range(0,posActual+1):
        if elem<=V[Ind] and tiene_lugar==False:
            lugar=Ind
            tiene_lugar=True
    if tiene_lugar==False:
        lugar=posActual+1
    return(lugar)

def ordenar_por_insercion(V):
    posActual=1
    for Ind in range(1,len(V)):
        elemento=V[Ind]
        lugar=buscar_posicion_de_insercion(V,posActual,elemento)
        V=desplazar_una_posicion_a_la_derecha(V,posActual,lugar)
        V[lugar]=elemento
        posActual=posActual+1
    return(V)

def principal():
     #Caso 1 
     vector1 = [9, 5, 3, 4, 10, 8, 13, 24, 15, 11]
     
     print("El vector inicial es (9,5,3,4,10,8,13,24,15,11):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_insercion(vector1)
     print("El vector final deberia ser (3,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
    
     #Caso 2 
     vector1 = [9, 5, 3, 4, 10, 8, 13, 8, 15, 11]
     
     print("El vector inicial es (9,5,3,4,10,8,13,8,15,11):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_insercion(vector1)
     print("El vector final deberia ser (3,4,5,8,8,9,10,11,13,15) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        
     #Caso 3 
     vector1 = [3, 4, 5, 8, 9, 10, 11, 13, 15, 24]
     
     print("El vector inicial es (3,4,5,8,9,10,11,13,15,24):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_insercion(vector1)
     print("El vector final deberia ser (3,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
    
    #Caso 4 
     vector1 = [24, 15, 13, 11, 10, 9, 8, 5, 4, 0]
     
     print("El vector inicial es (24,15,13,11,10,9,8,5,4,0):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_insercion(vector1)
     print("El vector final deberia ser (0,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        
     #Caso 5
     vector1 = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
     
     print("El vector inicial es (0,1,0,1,0,1,0,1,0,1):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_insercion(vector1)
     print("El vector final deberia ser (0,0,0,0,0,1,1,1,1,1) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        
     #Caso 6
     vector1 = [0]
     
     print("El vector inicial es (0):")
     escribir_vector(vector1)
     print("\n")
     ordenar_por_insercion(vector1)
     print("El vector final deberia ser (0) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        

principal()
