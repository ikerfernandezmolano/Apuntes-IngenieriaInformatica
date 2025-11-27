with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
procedure binario_a_decimal is
   -- declaracion de variables
   aux:Integer;
   cont,decimal:Integer:=0;
   num:Integer;

begin
   --inicializaciones
   put("Introduce un numero binario que comience en 1: ");
   get(num);
   while(num>=1) loop --descomponer el numero binario y crear el decimal
      aux:=num rem 10;
      num:=num/10;
      decimal:=decimal+aux*2**cont;
      cont:=cont+1;
   end loop;
   put_line("El numero en decimal es:");
   put(decimal);
end binario_a_decimal;
