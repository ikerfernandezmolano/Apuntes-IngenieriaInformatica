def escribir_vector(V):
    print(V)

def intercambiar(V,posA,posB):
    num=V[posA]
    num_aux=V[posB]
    V[posA]=num_aux
    V[posB]=num
    return(V)    
        
def ordenar_por_burbuja_eficiente(V):
    for X in range(0,len(V)):
        for Ind in range(0,len(V)-1):
            num=V[Ind]
            num_aux=V[Ind+1]
            if num>=num_aux:
                V=intercambiar(V,Ind,Ind+1)
    return(V)

def principal():
     #Caso 1 
     vector1 = [9, 5, 3, 4, 10, 8, 13, 24, 15, 11]
     
     print("El vector inicial es (9,5,3,4,10,8,13,24,15,11):")
     escribir_vector(vector1)
     print("\n")
     vector1=ordenar_por_burbuja_eficiente(vector1)
     print("El vector final deberia ser (3,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        
     #Caso 2 
     vector1 = [9, 5, 3, 4, 10, 8, 13, 8, 15, 11]
     print("El vector inicial es (9,5,3,4,10,8,13,8,15,11):")
     escribir_vector(vector1)
     print("\n")
     vector1=ordenar_por_burbuja_eficiente(vector1)
     print("El vector final deberia ser (3,4,5,8,8,9,10,11,13,15) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        
     #Caso 3 
     vector1 = [3, 4, 5, 8, 9, 10, 11, 13, 15, 24]
     print("El vector inicial es (3,4,5,8,9,10,11,13,15,24):")
     escribir_vector(vector1)
     print("\n")
     vector1=ordenar_por_burbuja_eficiente(vector1)
     print("El vector final deberia ser (3,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
    
    #Caso 4 
     vector1 = [24, 15, 13, 11, 10, 9, 8, 5, 4, 0]
     print("El vector inicial es (24,15,13,11,10,9,8,5,4,0):")
     escribir_vector(vector1)
     print("\n")
     vector1=ordenar_por_burbuja_eficiente(vector1)
     print("El vector final deberia ser (0,4,5,8,9,10,11,13,15,24) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
        
     #Caso 5
     vector1 = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
     print("El vector inicial es (0,1,0,1,0,1,0,1,0,1):")
     escribir_vector(vector1)
     print("\n")
     vector1=ordenar_por_burbuja_eficiente(vector1)
     print("El vector final deberia ser (0,0,0,0,0,1,1,1,1,1) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
                
     #Caso 6
     vector1 = [0]
     print("El vector inicial es (0):")
     escribir_vector(vector1)
     print("\n")
     vector1=ordenar_por_burbuja_eficiente(vector1)
     print("El vector final deberia ser (0) y es:")
     escribir_vector(vector1)
     print("\n\n\n")
principal()
