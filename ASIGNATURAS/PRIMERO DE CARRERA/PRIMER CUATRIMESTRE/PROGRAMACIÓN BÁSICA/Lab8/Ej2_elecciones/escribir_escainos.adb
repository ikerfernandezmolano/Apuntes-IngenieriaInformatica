with tipos; use tipos;
with Ada.Text_Io, Ada.Integer_Text_Io; use Ada.Text_Io, Ada.Integer_Text_Io;

procedure escribir_escainos ( Escainos : in  T_Lista_Escainos ) is 
   -- Post: Escribe por pantalla la informacion de los partidos que han conseguido algun escaino.

begin

   for I in 1 .. Escainos.Num_Partidos loop
      put("El partido: ");
      put(Escainos.Tabla_Escainos(I).Nombre);
      put(" tiene ");
      Put(Escainos.Tabla_Escainos(I).Escainos, Width => 0);
      put(" escanos.");
      New_Line;
   end loop;

end escribir_escainos ;
