with tipos; use tipos;
with calcular_cocientes_partido;

procedure calcular_todos_cocientes ( Dhont : in out T_Tabla_Dhont ) is 
   -- Pre: Dhont contiene en la primera columna los votos correspondientes a cada partido en orden 
   --	      decreciente.
   -- Post: Para todo i entre 1 y DHont.Num_partidos y para todo j entre 2 y Num_escainos,
   --         DHont(i)(j)= DHont(i)(1)/j.

begin

   for I in 1 .. Dhont.Num_Partidos loop
      calcular_cocientes_partido(Dhont.Tabla_Dhont(I));
   end loop;

end calcular_todos_cocientes;
