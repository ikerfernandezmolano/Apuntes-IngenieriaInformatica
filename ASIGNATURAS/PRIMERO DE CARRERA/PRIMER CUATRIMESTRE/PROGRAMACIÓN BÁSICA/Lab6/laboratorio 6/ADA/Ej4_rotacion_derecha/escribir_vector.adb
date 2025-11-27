with Ada.Text_Io, Ada.Integer_Text_Io; use Ada.Text_Io, Ada.Integer_Text_Io;
with vectores; use vectores;

procedure escribir_vector (V : in Vector_De_Enteros) is 
   --Pre:	  
   --Post:  se han escrito en pantalla todos los valores de V
   --          
begin
   for pos in 1..V'last loop
      put(V(pos), width => 3);
   end loop;
   new_line;

end escribir_vector;

