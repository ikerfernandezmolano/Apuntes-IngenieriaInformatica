def esta_en_vector_ordenado(x,vec):
    cont=0
    esta=False
    parar=False
    while esta==False and parar==False and cont<len(vec):
        num=vec[cont]
        cont=cont+1
        if num==x:
            esta=True 
        elif x<num:
            parar=True
    return esta

def principal():
    Vector1= [30, 31, 255, 270, 281, 290, 630, 700, 900, 960] 
    print("Prueba 1: el valor esta en medio")
    print(" esta_en_vector_ordenado(290, (30, 31, 255, 270, 281, 290, 630, 700, 900, 960))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector_ordenado(290,Vector1)
    print(rdo)
    print()

    Vector1=  [30, 31, 255, 270, 281, 290, 630, 700, 900, 960]
    print("Prueba 2: el valor esta al final")
    print(" esta_en_vector_ordenado(960, (30, 31, 255, 270, 281, 290, 630, 700, 900, 960))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector_ordenado(960,Vector1)
    print(rdo)
    print()

    Vector1=  [30, 31, 255, 270, 281, 290, 630, 700, 900, 960]
    print("Prueba 3: el valor no esta")
    print(" esta_en_vector_ordenado(45, (30, 31, 255, 270, 281, 290, 630, 700, 900, 960))")
    print(" debe ser False y el resultado es ")
    rdo=esta_en_vector_ordenado(45,Vector1)
    print(rdo)
    print()

    Vector1=  [30]
    print("Prueba 4: el valor esta")
    print(" esta_en_vector_ordenado(30, (30))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector_ordenado(30,Vector1)
    print(rdo)
    print()	
    
    Vector1=  [30]
    print("Prueba 5: el valor no esta")
    print(" esta_en_vector_ordenado(31, (30))")
    print(" debe ser False y el resultado es ")
    rdo=esta_en_vector_ordenado(31,Vector1)
    print(rdo)
    print()	
          
    Vector1=  [30, 31, 33, 255, 270, 281, 290, 333, 630, 666, 700, 900, 960, 970, 999]
    print("Prueba 6: el valor esta al principio")
    print(" esta_en_vector_ordenado(30, (30, 31, 33, 255, 270, 281, 290, 333, 630, 666, 700, 900, 960, 970, 999))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector_ordenado(30,Vector1)
    print(rdo)
    print()
    
    Vector1=  [30, 31, 33, 255, 270, 281, 290, 333, 630, 666, 700, 900, 960, 970, 999]
    print("Prueba 7: el valor esta al final")
    print(" esta_en_vector_ordenado(999, (30, 31, 33, 255, 270, 281, 290, 333, 630, 666, 700, 900, 960, 970, 999))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector_ordenado(999,Vector1)
    print(rdo)
    print()
    
    Vector1=  [30, 31, 33, 255, 270, 281, 290, 333, 630, 666, 700, 900, 960, 970, 999]
    print("Prueba 8: el valor esta en el medio")
    print(" esta_en_vector_ordenado(666, (30, 31, 33, 255, 270, 281, 290, 333, 630, 666, 700, 900, 960, 970, 999))")
    print(" debe ser True y el resultado es ")
    rdo=esta_en_vector_ordenado(666,Vector1)
    print(rdo)
    print()
    
    Vector1=  [30, 31, 33, 255, 270, 281, 290, 333, 630, 666, 700, 900, 960, 970, 999]
    print("Prueba 9: el valor no esta")
    print(" esta_en_vector_ordenado(777, (30, 31, 33, 255, 270, 281, 290, 333, 630, 666, 700, 900, 960, 970, 999))")
    print(" debe ser False y el resultado es ")
    rdo=esta_en_vector_ordenado(777,Vector1)
    print(rdo)
    print()
    
principal()
