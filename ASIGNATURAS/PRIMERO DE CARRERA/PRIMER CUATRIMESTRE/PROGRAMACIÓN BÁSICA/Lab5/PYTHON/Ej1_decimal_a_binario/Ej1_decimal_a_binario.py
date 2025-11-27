def decimal_a_binario(num):
    aux=num
    binario=0
    cont=0
    while aux!=0:
        binario=aux%2*10**cont+binario
        aux=aux//2
        cont=cont+1
    return(binario)
def prueba():
    #prueba 1
    decimal=1
    resultado=decimal_a_binario(decimal)
    pantalla='decimal vale 1 y en binario es 1. Tu programa devuelve: '+str(resultado)
    print(pantalla)
    #prueba 2
    decimal=2
    resultado=decimal_a_binario(decimal)
    pantalla='decimal vale 2 y en binario es 10. Tu programa devuelve: '+str(resultado)
    print(pantalla)
    #prueba 3
    decimal=5
    resultado=decimal_a_binario(decimal)
    pantalla='decimal vale 5 y en binario es 101. Tu programa devuelve: '+str(resultado)
    print(pantalla)
    #prueba 4
    decimal=24
    resultado=decimal_a_binario(decimal)
    pantalla='decimal vale 24 y en binario es 11000. Tu programa devuelve: '+str(resultado)
    print(pantalla)
    #prueba 5
    decimal=127
    resultado=decimal_a_binario(decimal)
    pantalla='decimal vale 127 y en binario es 1111111. Tu programa devuelve: '+str(resultado)
    print(pantalla)
    #prueba 6
    decimal=146
    resultado=decimal_a_binario(decimal)
    pantalla='decimal vale 146 y en binario es 10010010. Tu programa devuelve: '+str(resultado)    
    print(pantalla)
    #prueba 7
    decimal=0
    resultado=decimal_a_binario(decimal)
    pantalla='decimal vale 0 y en binario es 0. Tu programa devuelve: '+str(resultado)    
    print(pantalla)
prueba()