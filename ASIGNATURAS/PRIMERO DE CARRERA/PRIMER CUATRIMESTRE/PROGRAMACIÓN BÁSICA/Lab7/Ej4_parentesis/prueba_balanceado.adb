with Ada.Text_Io, Ada.Integer_Text_Io;
use Ada.Text_Io, Ada.Integer_Text_Io;
with datos; use datos;
with balanceado;

procedure prueba_balanceado is
   -- este programa hace llamadas a la funcion balanceado y es util
   -- para comprobar si su funcionamiento es correcto

Cad1: Cadena;

	procedure pedir_return_y_continuar is
	begin
	  new_line(3);
	  put_line("Pulsa return para continuar");
	  skip_line;
	  new_line(3);
	end pedir_return_y_continuar;


begin

   Cad1.long:=0;
   put_line("Caso1: No hay elementos en la tabla de entrada");
   put_line("El resultado deberia ser que la entrada esta balanceada");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;


   put_line("Caso2: Todos los parentesis de apertura estaban cerrados y nos llega uno de cierre:");
   put_line(" entrada si(a=(1+2))+3){a:=a-2};b:=b+4; Mirando solo los parentesis:  (())){}");
                           -- 123456789012345678901234567890
   Cad1.Caracteres(1..30) := "si(a=(1+2))+3){a:=a-2};b:=b+4;";
   Cad1.long:=30;
   put("el resultado deberia de ser no balanceado ");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;


   put_line("Caso3: configuracion (}:");
   put_line(" entrada si(}=1+2))+3){a:=a-2};b:=b+4; Mirando solo los parentesis:  (}))){}");
   new_line;
                           -- 12345678901234567890123456789
   Cad1.Caracteres(1..29) := "si(}=1+2))+3){a:=a-2};b:=b+4;";
   Cad1.long:=29;
   put_line(" el resultado deberia de ser no balanceado");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;


   put_line("Caso4: configuracion (}:");
   put_line(" entrada si(a=1+2){+3){a:=a-2};b:=b+4; Mirando solo los parentesis:  (){){}");
   new_line;
                           -- 12345678901234567890123456789
   Cad1.Caracteres(1..29) := "si(a=1+2){+3){a:=a-2};b:=b+4;";
   Cad1.long:=29;
   put_line(" y el resultado deberia de ser no balanceado");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;


   put_line("Caso5: los parentesis empiezan con ):");
   put_line(" entrada si)a=1+2))+3){a:=a-2};b:=b+4; Mirando solo los parentesis:  )))){}");
                           -- 12345678901234567890123456789
   Cad1.Caracteres(1..29) := "si)a=1+2))+3){a:=a-2};b:=b+4;";
   Cad1.long:=29;
   put_line(" el resultado deberia de ser no balanceado");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;


   put_line("Caso6: Los parentesis estan balanceados:");
   put_line(" entrada si(a=b){a:=(a+(3));};a:=(3-2)/(b+3); Mirando solo los parentesis: (){(())}()()");
                           -- 12345678901234567890123456789012345
   Cad1.Caracteres(1..35) := "si(a=b){a:=(a+(3));};a:=(3-2)/(b+3)";
   Cad1.long:=35;
   put_line(" y el resultado deberia de ser: balanceado ");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;

   put_line("Caso7: los parentesis empiezan con }:");
   put_line(" entrada si)a=1+2))+3){a:=a-2};b:=b+4; Mirando solo los parentesis:  }}}}()");
   -- 12345678901234567890123456789
   Cad1.Caracteres(1..29) := "si}a=1+2}}+3}(a:=a-2);b:=b+4;";
   Cad1.long:=29;
   put_line(" el resultado deberia de ser no balanceado");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;

   put_line("Caso8: termina con una } suelta:");
   put_line(" entrada !{(p||!q)<->(q->!p)}&&q} Mirando solo los parentesis:  {()()}}");
   -- 12345678901234567890123456789
   Cad1.Caracteres(1..24) := "!{(p||!q)<->(q->!p)}&&q}";
   Cad1.long:=24;
   put_line(" el resultado deberia de ser no balanceado");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;

   put_line("Caso9: empieza por ), el resto se cumple:");
   put_line(" entrada )!{(p||!q)<->(q->!p)}&&q Mirando solo los parentesis:  ){()()}");
   -- 12345678901234567890123456789
   Cad1.Caracteres(1..24) := ")!{(p||!q)<->(q->!p)}&&q";
   Cad1.long:=24;
   put_line(" el resultado deberia de ser no balanceado");
   put(" y el resultado es: ");
   if not balanceado(Cad1) then put("la entrada no esta balanceada");
   else put("la entrada esta balanceada");
   end if;
   pedir_return_y_continuar;




end prueba_balanceado;

