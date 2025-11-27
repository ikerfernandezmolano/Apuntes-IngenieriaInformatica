with tipos; use tipos;

procedure distribuir_votos (
      Votos : in     T_Lista_Partidos_Votos; 
      Dhont : out    T_Tabla_Dhont             ) is 

   -- Pre:  Lista de partidos con mas de un 3% de los votos emitidos. Votos en 
   --		 orden decreciente.
   -- Post: Dhont contiene en la primera columna los votos correspondientes a cada 
   --	     partido en orden decreciente

begin
   Dhont.Num_Partidos := Votos.Num_Partidos;

   for I in 1 .. Votos.Num_Partidos loop
      Dhont.Tabla_Dhont(I)(1).Cociente := Votos.Tabla_Partidos(I).Votos;
   end loop;

end distribuir_votos;