def binario_a_decimal():
    #inicializaciones
    num=int(input("Introduce un numero binario que comience en 1"))
    cont=0
    decimal=0

    #descomponer el numero binario y crear el decimal
    while num>=1:
        aux=num%10
        num=num//10
        decimal=decimal+aux*2**cont
        cont=cont+1
    print("el numero en decimal es: " + str(decimal))

#llamada al subprograma
binario_a_decimal()