with Ada.Text_Io, Ada.Integer_Text_Io;
use Ada.Text_Io, Ada.Integer_Text_Io;

with def_datos; use def_datos;

procedure escribir_lista (L : in    Lista_De_Enteros ) is 
   --Pre:	  
   --Post:  se han escrito todos los valores de V por pantalla
   --          
begin
   for pos in  1 .. L.Cuantos   loop
      Put(L.Numeros(pos), width => 3);
   end loop;
   new_line;

end Escribir_Lista;

