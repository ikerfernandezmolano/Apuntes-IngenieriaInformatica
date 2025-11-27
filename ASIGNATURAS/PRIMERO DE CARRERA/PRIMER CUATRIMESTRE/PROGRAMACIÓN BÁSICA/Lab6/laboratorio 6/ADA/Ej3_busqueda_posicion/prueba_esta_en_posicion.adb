with Ada.Text_Io,Ada.Integer_Text_IO; use Ada.Text_Io,Ada.Integer_Text_IO;
with vectores; use vectores;
with esta_en_posicion;

procedure prueba_esta_en_posicion is 
   -- este programa hace llamadas a la funcion Esta_En_Posicion y es util
   -- para comprobar si su funcionamiento es correcto
   
   vector1: Vector_de_enteros(1..10);
   vector2: Vector_de_enteros(1..25);
   vector3: Vector_de_enteros(1..2);
pos: Integer;
begin
  
   vector1 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9);  
   put_line("Caso 1: el valor esta en medio");
   put_line(" esta_en_posicion(13, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9))");
   put_line(" debe ser 7 y el resultado es ");
   pos:=esta_en_posicion(13,vector1);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector1 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9); 
   put_line("Caso 2: el valor esta al final");
   put_line(" esta_en_posicion(9, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9))");
   put_line(" debe ser 10 y el resultado es ");
   pos:=esta_en_posicion(9,vector1);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   Vector1 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9);
   put_line("Caso 3: el valor no esta, se debe recorrer todo el vector");
   put_line(" esta_en_posicion(45, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9))");
   put_line(" debe ser -1 y el resultado es ");
   pos:=esta_en_posicion(45,vector1);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);
   
   put_line("A partir de ahora, probaremos con un vector que tiene 25 elementos, en vez de 10.");
   new_line(3);

   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 4: el valor esta al principio");
   put_line(" esta_en_posicion(1, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser 1 y el resultado es ");
   pos:=esta_en_posicion(1, vector2);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 5: el valor esta al final");
   put_line(" esta_en_posicion(0, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser 25 y el resultado es ");
   pos:=esta_en_posicion(0, vector2);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 6: el valor esta en medio");
   put_line(" esta_en_posicion(4, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser 13 y el resultado es ");
   pos:=esta_en_posicion(4, vector2);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 7: el valor no esta, se debe recorrer todo el vector");
   put_line(" esta_en_posicion(978, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser -1 y el resultado es ");
   pos:=esta_en_posicion(978, vector2);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);


   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 8: el valor aparece dos veces");
   put_line(" esta_en_posicion(3, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser 2 y el resultado es ");
   pos:=esta_en_posicion(3, vector2);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   put_line("A partir de ahora, probaremos con un vector que tiene 2 elementos.");
   new_line(3);

   vector3 := (1, 3);  
   put_line("Caso 9: el valor esta en medio");
   put_line(" esta_en_posicion(1, (1, 3))");
   put_line(" debe ser 1 y el resultado es ");
   pos:=esta_en_posicion(1,vector3);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector3 := (1, 3); 
   put_line("Caso 10: el valor esta al final");
   put_line(" esta_en_posicion(3, (1, 3))");
   put_line(" debe ser 2 y el resultado es ");
   pos:=esta_en_posicion(3,vector3);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   Vector3 := (1, 3);
   put_line("Caso 11: el valor no esta, se debe recorrer todo el vector");
   put_line(" esta_en_posicion(9, (1, 3))");
   put_line(" debe ser -1 y el resultado es ");
   pos:=esta_en_posicion(9,vector3);
   put(pos);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);



end prueba_esta_en_posicion;

