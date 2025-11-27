with Ada.Text_Io, Ada.Integer_Text_Io;
use Ada.Text_Io, Ada.Integer_Text_Io;
with datos2; use datos2;
with es_palindromo;

procedure prueba_es_palindromo is
   -- este programa hace llamadas a la funcion es_palindromo y es util
   -- para comprobar si su funcionamiento es correcto

Cad: Cadena;

	procedure pedir_return_y_continuar is
	begin
	  new_line(3);
	  put_line("Pulsa return para continuar");
	  skip_line;
	  new_line(3);
	end pedir_return_y_continuar;


begin

   Cad.long:=0;
   put_line("Caso 1: Cadena sin caracteres.");
   put_line("El resultado deberia ser True");
   put(" y el resultado es: ");
   if es_palindromo(Cad) then put("True");
   else put("False");
   end if;
   pedir_return_y_continuar;


   put_line("Caso 2: Arriba la birra !!!");
   Cad.Caracteres(1..15):= "arriba la birra";
   Cad.long:=15;
   put_line("El resultado deberia ser True");
   put(" y el resultado es: ");
   if es_palindromo(Cad) then put("True");
   else put("False");
   end if;
   pedir_return_y_continuar;

   put_line("Caso 3: Hacemos programacion");
   Cad.Caracteres(1..20):= "hacemos programacion";
   Cad.long:=20;
   put_line("El resultado deberia ser False");
   put(" y el resultado es: ");
   if es_palindromo(Cad) then put("True");
   else put("False");
   end if;
   pedir_return_y_continuar;

   put_line("Caso 4: Zorra come arroz");
   Cad.Caracteres(1..16):= "zorra come arroz";
   Cad.long:=16;
   put_line("El resultado deberia ser False");
   put(" y el resultado es: ");
   if es_palindromo(Cad) then put("True");
   else put("False");
   end if;
   pedir_return_y_continuar;

   put_line("Caso 5: ¿Acaso hubo búhos acá? (Con un espacio al final)");
   Cad.Caracteres(1..21):= "acaso hubo buhos aca ";
   Cad.long:=21;
   put_line("El resultado deberia ser True");
   put(" y el resultado es: ");
   if es_palindromo(Cad) then put("True");
   else put("False");
   end if;
   pedir_return_y_continuar;

   put_line("Caso 6:  Arriba la birra !!! (Con un espacio al inicio)");
   Cad.Caracteres(1..16):= " arriba la birra";
   Cad.long:=16;
   put_line("El resultado deberia ser True");
   put(" y el resultado es: ");
   if es_palindromo(Cad) then put("True");
   else put("False");
   end if;
   pedir_return_y_continuar;

end prueba_es_palindromo;

