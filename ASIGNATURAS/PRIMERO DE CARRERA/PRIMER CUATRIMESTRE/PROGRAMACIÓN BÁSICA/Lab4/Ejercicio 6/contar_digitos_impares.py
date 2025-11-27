def contar_digitos_impares():
    #inicializaciones
    num=int(input("Introduce un numero natural"))
    cant_impar=0
    #descomponer el numero y contar sus digitos impares
    while num>=1:
        aux=num % 10
        num = num // 10
        if(aux % 2!=0):
            cant_impar=cant_impar+1
    
    print("El número contiene " + str(cant_impar) + " dígitos impares.")
    
#llamada al subprograma
contar_digitos_impares()