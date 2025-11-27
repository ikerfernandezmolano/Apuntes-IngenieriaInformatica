def O_o_mayor(n):
    if n==0:
        print("0", end="")
    elif n>0:
        dec_a_hex(n)

def dec_a_hex (n):
    if n>0:
        dec_a_hex(n//16)
        if n%16==15:
            print("F", end="")
        elif n%16==14:
            print("E", end="")
        elif n%16==13:
            print("D", end="")
        elif n%16==12:
            print("C", end="")
        elif n%16==11:
            print("B", end="")
        elif n%16==10:
            print("A", end="")
        elif n%16<10:
            print(n%16, end="")
            
def prueba_dec_a_hex():
    
    print("Caso 1: Para el número decimal 0, su hexadecimal es 0.")
    print("El programa devuelve: ", end="")
    O_o_mayor(0)
    print("\n")
    
    print("Caso 2: Para el número decimal 1, su hexadecimal es 1.")
    print("El programa devuelve: ", end="")
    O_o_mayor(1)
    print("\n")
    
    print("Caso 3: Para el número decimal 10, su hexadecimal es A.")
    print("El programa devuelve: ", end="")
    O_o_mayor(10)
    print("\n")
    
    print("Caso 4: Para el número decimal 15, su hexadecimal es F.")
    print("El programa devuelve: ", end="")
    O_o_mayor(15)
    print("\n")
    
    print("Caso 5: Para el número decimal 16, su hexadecimal es 10.")
    print("El programa devuelve: ", end="")
    O_o_mayor(16)
    print("\n")
    
    print("Caso 6: Para el número decimal 62, su hexadecimal es 3E.")
    print("El programa devuelve: ", end="")
    O_o_mayor(62)
    print("\n")

    print("Caso 7: Para el número decimal 100, su hexadecimal es 64.")
    print("El programa devuelve: ",end="")
    O_o_mayor(100)
    print("\n")
    

    print("Caso 8: Para el número decimal 6345, su hexadecimal es 18C9.")
    print("El programa devuelve: ",end="")
    O_o_mayor(6345)
    print("\n")
    
prueba_dec_a_hex()
