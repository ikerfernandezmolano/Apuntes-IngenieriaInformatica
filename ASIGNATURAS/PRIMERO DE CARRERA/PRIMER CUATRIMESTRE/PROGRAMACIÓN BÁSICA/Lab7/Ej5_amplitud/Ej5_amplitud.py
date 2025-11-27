def escribir_lista(L):
    print("[ ", end="")
    for i in range(0,len(L)):
        print(str(L[i]) + " ", end="")        
    print("]", end="")
    
def calcular_amplitud_max (Lista): 
    # Pre: Lista tiene al menos dos elementos y comienza con una
    #      subsecuencia ascendente 
    #      La lista no tiene dos elementos iguales consecutivos
    # Post: Devuelve la longitud del segmento de mayor amplitud
    #       En caso de que no haya ningun segmento el resultado sera cero
    Pos=0
    Longitud_Anterior=0
    Amplitud_Max=0
    Ha_ascendido=False
    Ha_descendido=False
    while Pos<len(Lista)-1:
         if Lista[Pos]<Lista[Pos+1]:
             Ha_ascendido=True
             while Pos<len(Lista)-1 and Lista[Pos]<Lista[Pos+1]:
                 Pos=Pos+1
             if Pos<len(Lista)-1 and Lista[Pos]>Lista[Pos+1]:
                 Ha_descendido=True
             while Pos<len(Lista)-1 and Lista[Pos]>Lista[Pos+1]:
                 Pos=Pos+1
             if Ha_ascendido and Ha_descendido:
                 Amplitud=Pos+1-Longitud_Anterior
                 if Amplitud>Amplitud_Max:
                     Amplitud_Max=Amplitud
             Longitud_Anterior=Pos
             Ha_descendido=False
             Ha_ascendido=False
         else:
             Pos=Pos+1
    return Amplitud_Max
        
def prueba_calcular_amplitud_max(): 
   # Este programa hace llamadas a la funcion calcular_amplitud_max y  
   # permite comprobar si su funcionamiento es correcto
    
    L = [12, 16]
   
    print("Prueba 1: Solo ascendente, 2 elementos.")
    print("La entrada es ", end="")
    escribir_lista(L)
    print(". El resultado deberia ser 0 y es: ")
    print(calcular_amplitud_max(L))
    print()
    
    L = [12, 16, 17, 18, 19, 20]
   
    print("Prueba 2: Solo ascendente, 6 elementos.")
    print("La entrada es ", end="")
    escribir_lista(L)
    print(". El resultado deberia ser 0 y es: ")
    print(calcular_amplitud_max(L))
    print()
   
    L = [12, 16, 13]
   
    print("Prueba 3: Asciende y desciende, 3 elementos.")
    print("La entrada es ", end="")
    escribir_lista(L)
    print(". El resultado deberia ser 3 y es: ")
    print(calcular_amplitud_max(L))
    print()
    
    L = [12, 13, 16, 13, 12, 11, 10 ,13, 14, 15]
   
    print("Prueba 4: Asciende y desciende, 10 elementos, al principio.")
    print("La entrada es ", end="")
    escribir_lista(L)
    print(". El resultado deberia ser 7 y es: ")
    print(calcular_amplitud_max(L))
    print()
    
    L = [1, 2, 3, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1, 0, 1, 2, 3, 2]
   
    print("Prueba 5: Asciende y desciende, 18 elementos, en medio.")
    print("La entrada es ", end="")
    escribir_lista(L)
    print(". El resultado deberia ser 11 y es: ")
    print(calcular_amplitud_max(L))
    print()
    
    L = [1, 2, 3, 2, 3, 4, 5, 6, 7, 6]
   
    print("Prueba 6: Asciende y desciende, 10 elementos, al final")
    print("La entrada es ", end="")
    escribir_lista(L)
    print(". El resultado deberia ser 7 y es: ")
    print(calcular_amplitud_max(L))
    print()
    
    L = [1, 2, 3, 2, 3, 4, 5, 6, 7, 8]
   
    print("Prueba 7: Asciende y desciende, 10 elementos, al principio, pero hay un intervalo mayor, pero que solo asciende")
    print("La entrada es ", end="")
    escribir_lista(L)
    print(". El resultado deberia ser 4 y es: ")
    print(calcular_amplitud_max(L))
    print()
   
prueba_calcular_amplitud_max()