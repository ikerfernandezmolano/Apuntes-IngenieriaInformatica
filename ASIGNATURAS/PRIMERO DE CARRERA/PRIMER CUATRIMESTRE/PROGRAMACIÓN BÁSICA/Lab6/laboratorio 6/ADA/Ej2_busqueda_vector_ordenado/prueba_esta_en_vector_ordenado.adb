with Ada.Text_Io; use Ada.Text_Io;
with vectores; use vectores;
with esta_en_vector_ordenado;

procedure prueba_esta_en_vector_ordenado is
   -- este programa hace llamadas a la funcion esta_en_vector_ordenado y es util
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

   vector1 :=(1,3,5,7,9,11,13,15,17,19);
   put_line("Caso 1: el valor esta en medio");
   put_line(" esta_en_vector_ordenado(13, (1,3,5,7,9,11,13,15,17,19))");
   put_Line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector_ordenado(13,vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_Line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector1 :=(1,3,5,7,9,11,13,15,17,19);
   put_line("Caso 2: el valor esta al final");
   put_line(" esta_en_vector_ordenado(19, (1,3,5,7,9,11,13,15,17,19))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector_ordenado(19,vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_Line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector1 :=(1,3,5,7,9,11,13,15,17,19);
   put_line("Caso 3: el valor esta al principio");
   put_line(" esta_en_vector_ordenado(1, (1,3,5,7,9,11,13,15,17,19))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector_ordenado(1,vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_Line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector1 :=(1,3,5,7,9,11,13,15,17,19);
   put_line("Caso 4: El valor no esta y para cuando llega al 13, porque no puede ser mayor que los proximos elementos");
   put_line(" esta_en_vector_ordenado(12, (1,3,5,7,9,11,13,15,17,19))");
   put_line(" debe ser False y el resultado es ");
   rdo:=esta_en_vector_ordenado(12,vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_Line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   put_line("A partir de ahora, probaremos con un vector que tiene 25 elementos, en vez de 10.");
   new_line(3);

   vector2 := (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50);
   put_line("Caso 5: el valor esta al principio");
   put_line(" esta_en_vector(1, (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector_ordenado(1, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50);
   put_line("Caso 6: el valor esta al final");
   put_line(" esta_en_vector(50, (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector_ordenado(50, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50);
   put_line("Caso 7: El valor no esta y para cuando llega al 22, porque no puede ser mayor que los proximos elementos");
   put_line(" esta_en_vector(21, (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50))");
   put_line(" debe ser False y el resultado es ");
   rdo:=esta_en_vector_ordenado(21, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector2 := (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50);
   put_line("Caso 8: el valor no esta y se para desde el principio, porque 0<1");
   put_line(" esta_en_vector(0, (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50))");
   put_line(" debe ser False y el resultado es ");
   rdo:=esta_en_vector_ordenado(0, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);


   vector2 := (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50);
   put_line("Caso 9: el valor no esta y se para al final, porque 49<50");
   put_line(" esta_en_vector(49, (1,3,5,7,9,11,13,15,17,19,20,22,23,24,25,30,32,35,37,39,40,41,43,45,50))");
   put_line(" debe ser False y el resultado es ");
   rdo:=esta_en_vector_ordenado(49, vector2);
   escribir_booleano(rdo);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   put_line("A partir de ahora, probaremos con un vector que tiene 2 elementos.");
   new_line(3);

   vector3 :=(1,3);
   put_line("Caso 10: el valor esta al final");
   put_line(" esta_en_vector_ordenado(3, (1,3))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector_ordenado(3,vector3);
   escribir_booleano(rdo);
   new_line(3);
   put_Line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector3 :=(1,3);
   put_line("Caso 11: el valor esta al principio");
   put_line(" esta_en_vector_ordenado(1, (1,3))");
   put_line(" debe ser True y el resultado es ");
   rdo:=esta_en_vector_ordenado(1,vector3);
   escribir_booleano(rdo);
   new_line(3);
   put_Line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   vector3 :=(1,3);
   put_line("Caso 12: El valor no esta y para cuando llega al 1, porque no puede ser mayor que los proximos elementos");
   put_line(" esta_en_vector_ordenado(0, (1,3))");
   put_line(" debe ser False y el resultado es ");
   rdo:=esta_en_vector_ordenado(0,vector1);
   escribir_booleano(rdo);
   new_line(3);
   put_Line("Pulsa return para continuar");
   skip_line;
   new_line(3);

end prueba_esta_en_vector_ordenado;

