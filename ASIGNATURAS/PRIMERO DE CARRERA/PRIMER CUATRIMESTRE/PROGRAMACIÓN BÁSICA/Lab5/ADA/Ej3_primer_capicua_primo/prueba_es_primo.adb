with Ada.Text_Io;
use Ada.Text_Io;

with es_primo;

procedure prueba_es_primo is 
   -- este programa hace llamadas a la funcion es_primo y es util
   -- para comprobar si su funcionamiento es correcto

   package Boolean_E_S is new Enumeration_Io(Boolean);
   use Boolean_E_S;
   -- esto sirve para leer y escribir valores de tipo Boolean

begin
   Put("Primera prueba: es_primo(1) debe ser true y el resultado es ");
   Put(es_primo(1));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;
   -- esta instrucción lee un caracter "return", es decir, sirve para
   -- esperar a que el usuario pulse return

   Put("Segunda prueba: es_primo(2) debe ser true y el resultado es ");
   Put(es_primo(2));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Tercera prueba: es_primo(3) debe ser true y el resultado es ");
   Put(es_primo(3));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;
   
    Put("Cuarta prueba: es_primo(4) debe ser false y el resultado es ");
   Put(es_primo(4));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Quinta prueba: es_primo(49) debe ser false y el resultado es ");
   Put(es_primo(49));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

   Put("Sexta prueba: es_primo(137) debe ser true y el resultado es ");
   Put(es_primo(137));
   New_Line(3);
   Put_Line("Pulsa return para continuar");
   Skip_Line;

end prueba_es_primo;

