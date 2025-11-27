with datos, posicion_de_dni, eliminar_repetidos, ordenar;
use datos;

procedure obtener_alumnos_y_tutorias_totales (Calendario: in Info_calendario; Lista: out Lista_tutorias_alumnos) is
  -- Pre: Calendario contiene informacion sobre la asistencia a tutorias (por cada dia
  --      laborable del cuatrimestre, la fecha y los numeros de DNI de quienes han acudido
  --      a tutorias).
  -- Post: Lista esta ORDENADA por el numero total de tutorias a las que han asistido los
  --       estudiantes.
  --       Si un alumno ha acudido mas de una vez a tutorias el mismo dia, solamente se le
  --       contabilizara una vez por ese dia para computar el numero total de asistencias.
   DNI:Positive;
   Un_dia:Info_dia;
begin
   Lista.Cuantas:=0;
   for Ind in 1..Calendario.Cuantos_Dias loop
      Un_dia:=Calendario.Dias(Ind);
      eliminar_repetidos(Un_dia);
      for Y in 1..Un_dia.Cuantos_alumn loop
         DNI:=Un_dia.DNIs(Y);
         if posicion_de_dni(Lista,DNI)=-1 then
            Lista.Cuantas:=Lista.Cuantas+1;
            Lista.Tutorias(Lista.Cuantas).DNI:=DNI;
            Lista.Tutorias(Lista.Cuantas).Tutorias_Totales:=1;
         else
            Lista.Tutorias(posicion_de_dni(Lista,DNI)).Tutorias_Totales:=Lista.Tutorias(posicion_de_dni(Lista,DNI)).Tutorias_Totales+1;
         end if;
      end loop;
   end loop;
   ordenar(Lista);
end obtener_alumnos_y_tutorias_totales;

