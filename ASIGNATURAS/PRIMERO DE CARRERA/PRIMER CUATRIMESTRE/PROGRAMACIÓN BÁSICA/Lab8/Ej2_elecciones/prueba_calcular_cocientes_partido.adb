with tipos; use tipos;
with Ada.Text_Io; use Ada.Text_Io;
with escribir_tabla_cocientes_partidos;
with distribuir_votos,calcular_cocientes_partido;

procedure prueba_calcular_cocientes_partido is 
      
   L_P_V_Original : T_Lista_Partidos_Votos; 
   T_Dhont:T_Tabla_Dhont ;

begin
   --caso1
   ---rellenamos la tabla de partidos en este caso con un solo partido
   L_P_V_Original.Num_Partidos:=1;
   L_P_V_Original.Tabla_Partidos(1) := ("       partido1", 80141);
   distribuir_votos (L_P_V_Original,T_Dhont);
   Put("Segun el programa la lista de Dhont en este punto contiene: ");
   new_line;
   calcular_cocientes_partido(T_Dhont.Tabla_Dhont(1));
   escribir_tabla_cocientes_partidos(T_Dhont.Tabla_Dhont(1)); -- donde se guarda el nombre de los partido
   new_line(4);
end prueba_calcular_cocientes_partido;