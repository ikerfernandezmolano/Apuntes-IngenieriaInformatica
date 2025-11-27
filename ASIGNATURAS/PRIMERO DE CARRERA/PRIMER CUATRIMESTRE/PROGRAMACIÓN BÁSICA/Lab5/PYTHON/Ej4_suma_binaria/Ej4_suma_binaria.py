def suma_binaria(bin1,bin2):
    suma=0
    llevada=0
    binario1=bin1
    binario2=bin2
    cont=0
    while binario1!=0 or binario2!=0:
        resto1=binario1%10
        binario1=binario1//10
        resto2=binario2%10
        binario2=binario2//10
        if resto1+resto2+llevada==3:
            llevada=1
            suma=suma+1*10**cont
        elif resto1+resto2+llevada==2:
            llevada=1
            suma=suma+0*10**cont
        elif resto1+resto2+llevada==1:
            llevada=0
            suma=suma+1*10**cont
        cont=cont+1
    if llevada==1:
        suma=suma+llevada*10**cont
    return suma     

def prueba():
  
    binario1=0;
    binario2=0;
    resultado=suma_binaria(binario1,binario2);
    print("0 + 0 en binario es 0 y segun tu programa es %d." %resultado);
          
    binario1=0;
    binario2=1;
    resultado=suma_binaria(binario1,binario2);
    print("0 + 1 en binario es 1 y segun tu programa es %d." %resultado);

    binario1=1;
    binario2=0;
    resultado=suma_binaria(binario1,binario2);
    print("1 + 0 en binario es 1 y segun tu programa es %d." %resultado);

    binario1=1;
    binario2=1;
    resultado=suma_binaria(binario1,binario2);
    print("1 + 1 en binario es 10 y segun tu programa es %d." %resultado);

    binario1=11;
    binario2=11;
    resultado=suma_binaria(binario1,binario2);
    print("11 + 11 en binario es 110 y segun tu programa es %d." %resultado);
    
    binario1=110;
    binario2=11;
    resultado=suma_binaria(binario1,binario2);
    print("110 + 11 en binario es 1001 y segun tu programa es %d." %resultado);
    
    binario1=11;
    binario2=1110;
    resultado=suma_binaria(binario1,binario2);
    print("11 + 1110 en binario es 10001 y segun tu programa es %d." %resultado);
    
    binario1=1000;
    binario2=0;
    resultado=suma_binaria(binario1,binario2);
    print("1000 + 0 en binario es 1000 y segun tu programa es %d." %resultado);

prueba()