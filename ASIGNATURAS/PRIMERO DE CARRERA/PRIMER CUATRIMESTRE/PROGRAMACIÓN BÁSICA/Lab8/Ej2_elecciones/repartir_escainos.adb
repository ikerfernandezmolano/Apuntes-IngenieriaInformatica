with tipos; use tipos;
with obtener_partidos_con_mas_de_un_3_por_ciento, distribuir_votos;
with calcular_todos_cocientes, asignar_maximos;

procedure repartir_escainos (
      L_P      : in     T_Lista_Partidos_Votos; 
      Escainos : out    T_Lista_Escainos         ) is 

  -- Post: el resultado es el numero de escainos de cada partido, aplicando la ley D'Hont
  --       Se han repartido Num_Escainos escainos de acuerdo a los votos conseguidos

   function numero_de_escainos (Cocientes : in T_Cocientes_Partido ) return Integer is 
   
      Total : Integer;  

   begin
      Total:= 0;
      for J in 1 .. Num_Escainos loop
         if Cocientes(J).Es_Max then
            Total := Total + 1;
         end if;
      end loop;
      return Total;
   end numero_de_escainos;

   L_P_Mas_De_3   : T_Lista_Partidos_Votos;  
   D_Hont         : T_Tabla_Dhont;  
   Total_Escainos : Integer;  

begin  -- Comienzo del subprograma repartir_escainos

   obtener_partidos_con_mas_de_un_3_por_ciento(L_P, L_P_Mas_De_3);
   distribuir_votos(L_P_Mas_De_3, D_Hont);
   calcular_todos_cocientes(D_Hont);
   asignar_maximos(D_Hont);
   
   Escainos.Num_Partidos := 0;
   for I in 1 .. D_Hont.Num_Partidos loop
      Total_Escainos := numero_de_escainos(D_Hont.Tabla_Dhont(I));
      if Total_Escainos > 0 then
         Escainos.Num_Partidos := Escainos.Num_Partidos + 1;
         Escainos.Tabla_Escainos(Escainos.Num_Partidos).Nombre  := L_P_Mas_De_3.Tabla_Partidos(I).Nombre;
         Escainos.Tabla_Escainos(Escainos.Num_Partidos).Escainos := Total_Escainos;
      end if;
   end loop;

end repartir_escainos;

 
