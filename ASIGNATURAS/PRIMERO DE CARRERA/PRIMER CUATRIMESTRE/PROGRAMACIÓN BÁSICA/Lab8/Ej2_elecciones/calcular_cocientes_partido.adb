with tipos; use tipos;

procedure calcular_cocientes_partido ( Partido : in out T_Cocientes_Partido ) is 
   -- Pre: Partido contiene en su primera posicion los votos correspondientes 
   --      a dicho partido.
   -- Post: Para todo i entre 2 y Num_escainos, Partido(i)= Partido(1)/i.

begin
   Partido(1).Es_Max:= False;
   for I in 2 .. Num_Escainos loop
      Partido(I).Cociente := Partido(1).Cociente / I;
      Partido(I).Es_Max:= False;
   end loop;
   
end calcular_cocientes_partido;
