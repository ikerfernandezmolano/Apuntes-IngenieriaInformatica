def escribir_vector(V):
    print("[ ", end="")
    for i in range(0,len(V)):
        print(str(V[i]) + " ", end="")        
    print("]", end="")  
    print("\n")
    
def intercambiar(V,pos1,pos2):
    num=V[pos1]
    V[pos1]=V[pos2]
    V[pos2]=num
    return V

def ordenar_pares_e_impares(V):
    colocados_par=0
    colocados_impar=len(V)-1
    while colocados_par<colocados_impar:
        if V[colocados_par]%2!=0 and V[colocados_impar]%2==0:
            intercambiar(V,colocados_par,colocados_impar)
            colocados_impar-=1
            colocados_par+=1
        elif V[colocados_par]%2==0:
            colocados_par+=1
        else: 
            colocados_impar-=1
    return V

def principal():
    
    #Caso 1 
     print("===============================================================\n")
     vector1 = [10, 3, 13, 4, 6, 3, 5, 2, 9, 7, 8, 18, 12, 2]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (10, 2, 12, 4, 6, 18, 8, 2, 9, 7, 5, 3, 13, 3)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
    
    #Caso 2 
     vector1 = [13, 3, 13, 4, 6, 3, 5, 2, 9, 7, 8, 18, 12, 2]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (2, 12, 18, 4, 6, 8, 2, 5, 9, 7, 3, 13, 3, 13)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
        
     #Caso 3
     vector1 = [12, 2, 13, 4, 6, 3, 5, 2, 9, 7, 8, 18, 12, 2]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (12, 2, 2, 4, 6, 12, 18, 2, 8, 7, 9, 5, 3, 13)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
    
     #Caso 4
     vector1 = [12, 2, 4, 4, 6, 6, 8, 2, 0, 4, 8, 18, 12, 2]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (12, 2, 4, 4, 6, 6, 8, 2, 0, 4, 8, 18, 12, 2)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
        
     #Caso 5
     vector1 = [1, 2, 4, 4, 6, 6, 8, 2, 0, 4, 8, 18, 12, 2]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (2, 2, 4, 4, 6, 6, 8, 2, 0, 4, 8, 18, 12, 1)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
    
     #Caso 6
     vector1 = [12, 2, 4, 4, 6, 6, 1, 2, 0, 4, 8, 18, 12, 2]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (12, 2, 4, 4, 6, 6, 8, 2, 0, 4, 8, 18, 12, 1)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
        
     #Caso 7
     vector1 = [7, 5, 3, 7, 3, 1, 9, 5, 3, 1, 11, 13, 15, 21]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (7, 5, 3, 7, 3, 1, 9, 5, 3, 1, 11, 13, 15, 21)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
    
     #Caso 8
     vector1 = [7, 2]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (2,7)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
        
     #Caso 9
     vector1 = [10, 3, 13, 4, 6, 3, 5, 2, 9, 7, 8, 18, 12, 2, 15, 12, 13, 7, 8]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (10, 8, 12, 4, 6, 2, 12, 2, 18, 8, 7, 9, 5, 3, 15, 13, 13, 7, 3 )\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
    
     #Caso 10
     vector1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (10, 2, 8, 4, 6, 5, 7, 3, 9, 1)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
        
     #Caso 11
     vector1 = [1]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (1)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
    
     #Caso 12
     vector1 = []
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser ()\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
        
     #Caso 13
     vector1 = [-2, -3, 2, 5, -1]
     
     print("El vector inicial es:", end=" ")
     escribir_vector(vector1)
     vector1=ordenar_pares_e_impares(vector1)
     print("El vector final deberia ser (-2, 2, -3, 5, -1)\n")
     print("SIN IMPORTAR EL ORDEN de los pares entre si, ni de los impares entre si")
     print("y segun vuestro programa es:")
     escribir_vector(vector1)
     print("===============================================================\n")
    
principal()
