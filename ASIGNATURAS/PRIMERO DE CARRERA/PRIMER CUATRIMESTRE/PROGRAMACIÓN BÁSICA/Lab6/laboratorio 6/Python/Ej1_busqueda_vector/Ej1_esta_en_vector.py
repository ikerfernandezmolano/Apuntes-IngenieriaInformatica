def esta_en_vector(x,vec):
    cont=0
    esta=False
    while esta==False and cont<len(vec):
        num=vec[cont]
        cont=cont+1
        if num==x:
            esta=True 
    return esta

def principal():
    Vector1 = [1, 13, 55, 27, 99, 111, 133, 150, 17, 6]
    print("Prueba1: el valor esta en medio")
    print(" esta_en_vector(111, (1, 13, 55, 27, 99, 111, 133, 150, 17, 6))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector(111,Vector1)
    print(rdo)
    print()
 
    Vector1 = [16, 33, 567, 73, 9, 111, 153, 15, 197, 1]
    print("Prueba2: el valor esta al final")
    print(" esta_en_vector(1, (16, 33, 567, 73, 9, 111, 153, 15, 197, 1))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector(1,Vector1)
    print(rdo)
    print()

    Vector1 = [19, 3, 556, 72, 91, 11, 1, 15, 817, 199]
    print("Prueba3: el valor no esta")
    print(" esta_en_vector(45, (19, 3, 556, 72, 91, 11, 1, 15, 817, 199))")
    print(" debe ser False y el resultado es ")
    rdo=esta_en_vector(45,Vector1)
    print(rdo)
    print()

    Vector1 = [19, 3, 556, 72, 91, 11, 1, 15, 817, 199, 4, 5 , 87, 423, 12]
    print("Prueba4: el valor esta al principio")
    print(" esta_en_vector(19,(19, 3, 556, 72, 91, 11, 1, 15, 817, 199, 4, 5 , 87, 423, 12))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector(19,Vector1)
    print(rdo)
    print()	
    
    Vector1 = [19, 3, 556, 72, 91, 11, 1, 15, 817, 199, 4, 5 , 87, 423, 12]
    print("Prueba5: el valor esta al final")
    print(" esta_en_vector(12, (19, 3, 556, 72, 91, 11, 1, 15, 817, 199, 4, 5 , 87, 423, 12))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector(12,Vector1)
    print(rdo)
    print()	
          
    Vector1 = [19, 3, 556, 72, 91, 11, 1, 15, 817, 199, 4, 5 , 87, 423, 12]
    print("Prueba6: el valor esta en medio")
    print(" esta_en_vector(1, (19, 3, 556, 72, 91, 11, 1, 15, 817, 199, 4, 5 , 87, 423, 12))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector(1,Vector1)
    print(rdo)
    print()	
          
    Vector1 = [19, 3, 556, 72, 91, 11, 1, 15, 817, 199, 4, 5 , 87, 423, 12]
    print("Prueba7: el valor no esta")
    print(" esta_en_vector(432, (19, 3, 556, 72, 91, 11, 1, 15, 817, 199, 4, 5 , 87, 423, 12))")
    print(" debe ser False y el resultado es ")
    rdo=esta_en_vector(432,Vector1)
    print(rdo)
    print()	
    
    Vector1 = [19]
    print("Prueba8: el valor esta")
    print(" esta_en_vector(19, (19))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector(19,Vector1)
    print(rdo)
    print()	
    
    Vector1 = [19]
    print("Prueba9: el valor no esta")
    print(" esta_en_vector(20, (19))")
    print(" debe ser False y el resultado es ")
    rdo=esta_en_vector(20,Vector1)
    print(rdo)
    print()	
    
principal()
