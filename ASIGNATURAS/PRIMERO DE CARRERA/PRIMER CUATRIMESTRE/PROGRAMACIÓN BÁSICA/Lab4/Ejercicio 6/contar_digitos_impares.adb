with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
procedure contar_digitos_impares is   -- declaracion de variables
   cant_impar:Integer:=0;
   aux:Integer:=0;
   num:Integer;
begin   --inicializaciones
   put("Introduce un numero natural: ");
   get(num);
   while (num>=1) loop    --descomponer el numero en digitos
      aux:=num rem 10;
      num:=num/10;
	  if(aux rem 2/=0) then
	      cant_impar:= cant_impar+1; --contar el digito actual solo si es impar
	  end if;
   end loop;
   put_line("El numero contiene ");
   put(cant_impar);
   put(" digitos impares.");
end contar_digitos_impares;
