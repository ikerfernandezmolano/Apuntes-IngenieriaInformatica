with Ada.Text_Io; use Ada.Text_Io;
with vectores; use vectores;
with rotar_derecha, escribir_vector;

procedure prueba_rotar_derecha is 
   -- este programa hace llamadas a rotar_derecha y es util
   -- para comprobar si su funcionamiento es correcto

   Vector1: Vector_de_enteros(1..10);
   Vector2: Vector_de_enteros(1..15);
   Vector3: Vector_de_enteros(1..2);
 
begin
 
   vector1 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9);
   put_line("Caso 1: (1, 3, 5, 7, 19, 6, 13, 15, 17, 9)");
   put_line(" rotar_derecha((1, 3, 5, 7, 19, 6, 13, 15, 17, 9))");
   put_Line(" debe dar como resultado ");
   put_line(" 9, 1, 3, 5, 7, 19, 6, 13, 15, 17");
   rotar_derecha(vector1);
   escribir_vector(vector1);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
    
   vector2 := (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 15, 99, 45, 0);
   put_line("Caso 1: (1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 15, 99, 45, 0");
   put_line(" rotar_derecha((1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 15, 99, 45, 0))");
   put_Line(" debe dar como resultado ");
   put_line(" 0, 1, 3, 5, 7, 19, 6, 13, 15, 17, 9, 8, 15, 99, 45");
   rotar_derecha(vector2);
   escribir_vector(vector2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   
   vector3 := (1, 3);
   put_line("Caso 1: (1, 3");
   put_line(" rotar_derecha((1, 3))");
   put_Line(" debe dar como resultado ");
   put_line("3, 1");
   rotar_derecha(vector3);
   escribir_vector(vector3);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   
end prueba_rotar_derecha;

