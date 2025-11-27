with Ada.Text_Io; use Ada.Text_Io;
with vectores; use vectores;
with esta_en_vector;

procedure prueba_esta_en_vector is
   -- este programa hace llamadas a la funcion esta_en_vector y es util
   -- para comprobar si su funcionamiento es correcto

   procedure escribir_booleano(valor: in Boolean) is
   begin
      if(valor) then
         put("True");
      else
         put("False");
      end if;
   end escribir_booleano;

   vector1: Vector_de_enteros(1..10);
   vector2: Vector_de_enteros(1..25);
   vector3: Vector_de_enteros(1..2);
   rdo: boolean;
begin

   vector1 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9);
   put_line("Caso 1: el valor esta en medio");
   put_line(" esta_en_vector(13, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(13, vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector1 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9);
   put_line("Caso 2: el valor esta al final");
   put_line(" esta_en_vector(9, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(9, vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector1 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9);
   put_line("Caso 3: el valor esta al principio");
   put_line(" esta_en_vector(1, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(1, vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector1 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9);
   put_line("Caso 4: el valor no esta, se debe recorrer todo el vector");
   put_line(" esta_en_vector(45, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9))");
   put_line(" debe ser False y el resultado es ");
   rdo:=esta_en_vector(45, vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   put_line("A partir de ahora, probaremos con un vector que tiene 25 elementos, en vez de 10.");
   new_line(3);

   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 5: el valor esta al principio");
   put_line(" esta_en_vector(1, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(1, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 6: el valor esta al final");
   put_line(" esta_en_vector(0, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(0, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 7: el valor esta en medio");
   put_line(" esta_en_vector(1, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(4, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 8: el valor no esta, se debe recorrer todo el vector");
   put_line(" esta_en_vector(978, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser False y el resultado es ");
   rdo:=esta_en_vector(978, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);


   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0);
   put_line("Caso 9: el valor aparece dos veces");
   put_line(" esta_en_vector(3, (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 2, 4, 3, 10, 357, 11, 75, 189, 23, 33, 5, 6543, 1000, 0))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(3, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   put_line("A partir de ahora, probaremos con un vector que tiene 2 elementos.");
   new_line(3);

   vector3 := (1, 3);
   put_line("Caso 10: el valor esta al final");
   put_line(" esta_en_vector(3, (1, 3))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(3, vector3);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector3 := (1, 3);
   put_line("Caso 11: el valor esta al principio");
   put_line(" esta_en_vector(1, (1, 3))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector(1, vector3);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector3 := (1, 3);
   put_line("Caso 12: el valor no esta, se debe recorrer todo el vector");
   put_line(" esta_en_vector(45, (1, 3))");
   put_line(" debe ser False y el resultado es ");
   rdo:=esta_en_vector(45, vector3);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);


end prueba_esta_en_vector;

