with datos;
use datos;

procedure ordenar (Lista: in out Lista_tutorias_alumnos) is
   -- Pre:
   -- Post: Lista esta ordenada de mayor a menor numero total de asistencias a tutorias
Tuto:Info_Tutorias;
begin
   for Ind in 1..Lista.Cuantas loop
      for X in 1..Lista.Cuantas-1 loop
         if Lista.Tutorias(X).Tutorias_Totales<Lista.Tutorias(X+1).Tutorias_Totales then
            Tuto:=Lista.Tutorias(X+1);
            Lista.Tutorias(X+1):=Lista.Tutorias(X);
            Lista.Tutorias(X):=Tuto;
         end if;
      end loop;
   end loop;
end ordenar;
