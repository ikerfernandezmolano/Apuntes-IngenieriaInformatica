def esta_en_posicion(x,vec):
    esta=False
    cont=0
    while esta==False and cont<len(vec):
        num=vec[cont]
        cont=cont+1
        if num==x:
            cont=cont
            esta=True
    if esta==False:
        cont=-1
    return esta,cont

def principal():
    Vector1 = [1, 3, 5, 17, 9, 11, 131, 15, 170, 19]
    print("Prueba 1:  el valor esta en medio")
    print(" esta_en_posicion(131, (1, 3, 5, 17, 9, 11, 131, 15, 170, 19))")
    print(" debe ser True y el resultado es ")
    rdo, posi=esta_en_posicion(131,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(131,posi))
    else:
        print("El numero no esta")
    print ()

    Vector1 = [1, 3, 5, 17, 9, 11, 131, 15, 170, 19]
    print("Prueba 2:  el valor esta al final")
    print(" esta_en_posicion(19, (1, 3, 5, 17, 9, 11, 131, 15, 170, 19))")
    print(" debe ser True y el resultado es ")
    rdo, posi=esta_en_posicion(19,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(19,posi))
    else:
        print("El numero no esta")
    print ()

    Vector1 = [1, 3, 5, 17, 9, 11, 131, 15, 170, 19]
    print("Prueba 3: el numero no esta ")
    print(" esta_en_posicion(1912, (1, 3, 5, 17, 9, 11, 131, 15, 170, 19))")
    print(" debe ser False y el resultado es ")
    rdo, posi=esta_en_posicion(1912,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(1912,posi))
    else:
        print("El numero no esta")
    print ()

    Vector1 = [1]
    print("Prueba 4: el numero esta ")
    print(" esta_en_posicion(1, (1))")
    print(" debe ser True y el resultado es ")
    rdo, posi=esta_en_posicion(1,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(1,posi))
    else:
        print("El numero no esta")
    print ()
    
    Vector1 = [1]
    print("Prueba 5: el numero esta ")
    print(" esta_en_posicion(2, (1))")
    print(" debe ser False y el resultado es ")
    rdo, posi=esta_en_posicion(2,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(2,posi))
    else:
        print("El numero no esta")
    print ()
   
    Vector1 = [1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590]   
    print("Prueba 6: el numero esta ")
    print(" esta_en_posicion(1, (1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590))")
    print(" debe ser True y el resultado es ")
    rdo, posi=esta_en_posicion(1,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(1,posi))
    else:
        print("El numero no esta")
    print ()
    
    Vector1 = [1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590]   
    print("Prueba 7: el numero esta ")
    print(" esta_en_posicion(15, (1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590))")
    print(" debe ser True y el resultado es ")
    rdo, posi=esta_en_posicion(15,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(15,posi))
    else:
        print("El numero no esta")
    print ()
    
    Vector1 = [1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590]   
    print("Prueba 8: el numero esta ")
    print(" esta_en_posicion(590, (1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590))")
    print(" debe ser True y el resultado es ")
    rdo, posi=esta_en_posicion(590,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(590,posi))
    else:
        print("El numero no esta")
    print ()
    
    Vector1 = [1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590]   
    print("Prueba 9: el numero esta y repetido ")
    print(" esta_en_posicion(9, (1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590))")
    print(" debe ser True y el resultado es ")
    rdo, posi=esta_en_posicion(9,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(9,posi))
    else:
        print("El numero no esta")
    print ()
    
    Vector1 = [1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590]   
    print("Prueba 10: el numero no esta")
    print(" esta_en_posicion(587, (1, 3, 5, 17, 9, 11, 131, 15, 170, 19, 142, 14, 634, 9, 590))")
    print(" debe ser False y el resultado es ")
    rdo, posi=esta_en_posicion(587,Vector1)
    if rdo:
        print("el numero %d esta en la posicion %d " %(587,posi))
    else:
        print("El numero no esta")
    print ()
    
principal()
