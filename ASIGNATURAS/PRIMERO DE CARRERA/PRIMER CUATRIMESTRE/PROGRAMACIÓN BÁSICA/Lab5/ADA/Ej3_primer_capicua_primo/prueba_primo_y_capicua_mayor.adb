with Ada.Text_Io, Ada.integer_Text_Io;
use Ada.Text_Io, Ada.integer_Text_Io;

with primo_y_capicua_mayor;

procedure prueba_primo_y_capicua_mayor is
   -- este programa hace llamadas a la funcion es_primo y es util
   -- para comprobar si su funcionamiento es correcto

begin
   Put("Primera prueba: Primo_y_capicua_mayor(1) debe ser 2 y el resultado es ");
   Put(primo_y_capicua_mayor(1));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Segunda prueba: Primo_y_capicua_mayor(17) debe ser 101 y el resultado es ");
   Put(primo_y_capicua_mayor(17));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Tercera prueba: Primo_y_capicua_mayor(3000) debe ser 10301 y el resultado es ");
   Put(primo_y_capicua_mayor(3000));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Cuarta prueba: Primo_y_capicua_mayor(3000000) debe ser 3001003 y el resultado es ");
   Put(primo_y_capicua_mayor(3000000));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Quinta prueba: Primo_y_capicua_mayor(2) debe ser 3 y el resultado es ");
   Put(primo_y_capicua_mayor(2));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Sexta prueba: Primo_y_capicua_mayor(47874) debe ser 70207 y el resultado es ");
   Put(primo_y_capicua_mayor(47874));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Septima prueba: Primo_y_capicua_mayor(352) debe ser 353 y el resultado es ");
   Put(primo_y_capicua_mayor(352));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

end prueba_primo_y_capicua_mayor;

