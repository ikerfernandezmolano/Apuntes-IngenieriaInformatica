def intercambiar (n1,n2):
    b=n1
    a=n2
    return a,b

def ordenar_dos_numeros (n1,n2):
    if n1<n2:
        a,b=intercambiar(n1,n2)
    else:
        a=n1;
        b=n2;
    return a,b

def ordenar_tres_numeros (a,b,c):
    n1,n2=ordenar_dos_numeros(a,b)
    n2,n3=ordenar_dos_numeros(n2,c)
    n1,n2=ordenar_dos_numeros(n1,n2)
    return n1,n2,n3

def prueba():
    #totalmente desordenados
    # 2, 5, 7
    n1=2
    n2=5
    n3=7
    n1,n2,n3=ordenar_tres_numeros(n1,n2,n3)
    print("2,5,7 Tu programa deberia escribir 7 5 2 y escribe: %d %d %d" %(n1,n2,n3))
    
    # 2, 7, 5
    n1=2
    n2=7
    n3=5
    n1,n2,n3=ordenar_tres_numeros(n1,n2,n3)
    print("2,7,5 Tu programa deberia escribir 7 5 2 y escribe: %d %d %d" %(n1,n2,n3))

    # 7, 2, 5
    n1=7
    n2=2
    n3=5
    n1,n2,n3=ordenar_tres_numeros(n1,n2,n3)
    print ("7,2,5 Tu programa deberia escribir 7 5 2 y escribe: %d %d %d" %(n1,n2,n3))
         
    # 5, 7, 2
    n1=5
    n2=7
    n3=2
    n1,n2,n3=ordenar_tres_numeros(n1,n2,n3)
    print ("5,7,2 Tu programa deberia escribir 7 5 2 y escribe: %d %d %d" %(n1,n2,n3))                                                                      
                                                                            
    # 7, 5, 2
    n1=7
    n2=5
    n3=2
    n1,n2,n3=ordenar_tres_numeros(n1,n2,n3)
    print("7,5,2 Tu programa deberia escribir 7 5 2 y escribe: %d %d %d" %(n1,n2,n3))
    
    # 0, 0, 0 Ceros y todos iguales
    n1=0
    n2=0
    n3=0
    n1,n2,n3=ordenar_tres_numeros(n1,n2,n3)
    print("0,0,0 Tu programa deberia escribir 0 0 0 y escribe: %d %d %d" %(n1,n2,n3))

    # 7, 2, 2 Dos de los números son iguales
    n1=7
    n2=2
    n3=2
    n1,n2,n3=ordenar_tres_numeros(n1,n2,n3)
    print("7,2,2 Tu programa deberia escribir 7 2 2 y escribe: %d %d %d" %(n1,n2,n3))

prueba()