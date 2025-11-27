with datos;
use datos;

function posicion_de_dni (Lista: in Lista_tutorias_alumnos; DNI: in Positive) return Integer is
   -- Pre: Lista no contiene numeros de DNI repetidos
   -- Post: Devuelve la posicion de Lista en la que se encuentra el DNI
   --       Si el DNI no se encuentra en Lista, se devuelve el valor -1
   encontrado:Boolean:=False;
   pos:Integer:=1;
begin
   while not encontrado and pos<=Lista.Cuantas loop
      if Lista.Tutorias(pos).DNI=DNI then
         encontrado:=True;
      else
         pos:=pos+1;
      end if;
   end loop;
   if not encontrado then
      pos:=-1;
   end if;
   return pos;
end posicion_de_dni;
