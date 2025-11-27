with tipos; use tipos;
with ada.text_io; use ada.text_io;

with repartir_escainos, escribir_escainos;

procedure calcular_escainos (	LPV_Bizkaia, LPV_Araba, LPV_Gipuzkoa: in     T_Lista_Partidos_Votos;
                                Resultados                           : out    T_Lista_Escainos         )  is
   -- Pre:  las 3 variables de entrada contienen los resultados de las elecciones en
   --       cada una de las 3 provincias.
   -- Post:  el resultado es el numero de escainos de cada partido. Este resultado se
   --        calcula asignando los 25 escainos a repartir en cada provincia, y
   --        acumulandolos finalmente por cada partido.
   function esta ( Nombre_Partido : in     T_Nombre;
                   Escainos       : in     T_Lista_Escainos) return Integer is
      -- pre:
      -- post: el resultado es 0 si el partido no esta en "Escainos", y la posicion en que se encuentra en caso de que este
      I   : Integer:=1;
      Enc : Boolean:=False;
      Pos: Integer:=0;
   begin
      while not enc and I<=Escainos.Num_Partidos loop
         if Escainos.Tabla_Escainos(I).Nombre=Nombre_Partido then
            enc:=True;
            Pos:=I;
         else
            I:=I+1;
         end if;
      end loop;
      return Pos;	  
   end esta;

   procedure acumular_escainos (Escainos_Totales : in out T_Lista_Escainos;
                                Escainos         : in     T_Lista_Escainos) is
      -- pre:
      -- post: se han sumado los escainos de "Escainos" a los de "Escainos_Totales"
      Pos : Integer;
   begin
      for Partido in 1..Escainos.Num_Partidos loop
         Pos:=esta(Escainos.Tabla_Escainos(Partido).Nombre,Escainos_Totales);
         if Pos=0 then
            Escainos_Totales.Num_Partidos:=Escainos_Totales.Num_Partidos+1;
            Escainos_Totales.Tabla_Escainos(Escainos_Totales.Num_Partidos):=Escainos.Tabla_Escainos(Partido);
         else
            Escainos_Totales.Tabla_Escainos(Pos).Escainos:=Escainos_Totales.Tabla_Escainos(Pos).Escainos+Escainos.Tabla_Escainos(Partido).Escainos;
         end if;
      end loop;
   end acumular_escainos;
   
   Escainos_Bizkaia, Escainos_Araba, Escainos_Gipuzkoa: T_Lista_Escainos;

begin  -- Comienzo del subprograma calcular_escainos
   repartir_escainos(LPV_Bizkaia,Escainos_Bizkaia);
   repartir_escainos(LPV_Araba,Escainos_Araba);
   repartir_escainos(LPV_Gipuzkoa,Escainos_Gipuzkoa);
   Resultados:=Escainos_Bizkaia;
   acumular_escainos(Resultados,Escainos_Araba);
   acumular_escainos(Resultados,Escainos_Gipuzkoa);
end calcular_escainos;

 
