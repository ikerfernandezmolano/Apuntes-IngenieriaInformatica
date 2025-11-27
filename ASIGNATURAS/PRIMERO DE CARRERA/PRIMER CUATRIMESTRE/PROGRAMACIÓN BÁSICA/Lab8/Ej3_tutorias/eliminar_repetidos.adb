with datos;
use datos;
procedure eliminar_repetidos (Un_dia: in out Info_dia) is
   -- Pre:
   -- Post: Se han eliminado las apariciones repetidas de DNI en Un_dia (es decir, que si
   --       un mismo DNI se encontraba mas de una vez en Un_dia, ahora solamente aparece una vez)
   --       El orden en el que queden los DNIs una vez eliminados los repetidos no es relevante, lo
   --       que significa que, por eficiencia, puede no mantenerse el orden original de los DNIs
   Ind:Integer:=2;
   hecho:Boolean:=False;
begin
   while Ind<=Un_dia.Cuantos_alumn loop
      for X in 1..Ind-1 loop
         if Un_dia.DNIs(Ind)=Un_dia.DNIs(X) then
            Un_dia.DNIs(Ind):=Un_dia.DNIs(Un_dia.Cuantos_alumn);
            Un_dia.Cuantos_alumn:=Un_dia.Cuantos_alumn-1;
            hecho:=True;
         end if;
      end loop;
      if hecho then
         Ind:=Ind-1;
      end if;
      hecho:=False;
      Ind:=Ind+1;
   end loop;
end eliminar_repetidos;
