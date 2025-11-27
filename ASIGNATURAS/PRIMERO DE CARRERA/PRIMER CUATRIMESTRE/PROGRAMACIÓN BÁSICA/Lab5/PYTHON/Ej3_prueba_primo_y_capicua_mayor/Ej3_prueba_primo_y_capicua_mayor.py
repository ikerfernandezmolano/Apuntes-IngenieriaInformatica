def es_capicua(num):
    numero=num
    N_Inverso=0
    capicua=False
    if numero>=0 and numero<=9:
        N_Inverso=numero
    else:
        while numero!=0:
            N_Inverso=N_Inverso*10+(numero % 10)
            numero=numero//10
    if N_Inverso==num:
        capicua=True
    return capicua

def es_primo(num):
    primo=True
    posible_multiplo=2
    if num>3:
        while primo and posible_multiplo!=num//2+1:
            if num%posible_multiplo==0:
                primo=False
            posible_multiplo=posible_multiplo+1
    return primo

def primo_y_capicua_mayor(num):
    x=0
    primo_capymay=False
    while primo_capymay==False: 
        x=x+1
        if es_capicua(num+x):
            if es_primo(num+x):
                primo_capicua_mayor=num+x
                primo_capymay=True
    return primo_capicua_mayor

def prueba():
    #prueba 1
    print('El valor de entrada es 1, tu programa debe devolver 2.')
    resultado=primo_y_capicua_mayor(1)
    print('Y devuelve %d.' %resultado)
    print('')
    #prueba 2
    print('El valor de entrada es 7, tu programa debe devolver 11.')
    resultado=primo_y_capicua_mayor(7)
    print('Y devuelve %d.' %resultado)   
    print('')
    #prueba 3
    print('El valor de entrada es 32, tu programa debe devolver 101.')
    resultado=primo_y_capicua_mayor(32)
    print('Y devuelve %d.' %resultado)   
    print('')
    #prueba 4
    print('El valor de entrada es 453, tu programa debe devolver 727.')
    resultado=primo_y_capicua_mayor(453)
    print('Y devuelve %d.' %resultado)
    print('')
    #prueba 5
    print('El valor de entrada es 3000000, tu programa debe devolver 3001003.')
    resultado=primo_y_capicua_mayor(3000000)
    print('Y devuelve %d.' %resultado)
    print('')
    #prueba 6
    print('El valor de entrada es 2, tu programa debe devolver 3.')
    resultado=primo_y_capicua_mayor(2)
    print('Y devuelve %d.' %resultado)
    print('')
    #prueba 7
    print('El valor de entrada es 47874, tu programa debe devolver 70207.')
    resultado=primo_y_capicua_mayor(47874)
    print('Y devuelve %d.' %resultado)
    print('')

prueba()