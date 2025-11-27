with tipos; use tipos;

procedure asignar_maximos (Dhont : in out T_Tabla_Dhont ) is 
   -- Pre: Dhont contiene valores calculados de todos los cocientes.
   -- Post: Dhont se actualiza poniendo, en num_escainos posiciones de DHont, el campo es_max a true. 
   --	    Se actualizan los Num_escainos maximos de la tabla Dhont.

   procedure calcular_maximo_cociente (
         Tabla      : in     T_Tabla_Dhont; 
         P_Partido,                         
         J_Cociente :    out Positive       ) is 
      -- Pre: En Tabla cada partido i tiene los cocientes de sus votos
      --       y los numeros de escainos posibles
      -- Post: El maximo numero de Tabla es 
      --         Tabla.Tabla_Dhont(P_Partido).P_Cocientes(J_Cociente)
      Max : Integer; 
   begin
     max:=-1;
     for I in 1..Tabla.Num_Partidos loop
        for J in 1 .. Num_Escainos loop
            if not Tabla.Tabla_Dhont(i)(j).Es_Max -- no ha sido ya un maximo
                  then
               if Tabla.Tabla_Dhont(I)(J).Cociente > Max then
                  Max        := Tabla.Tabla_Dhont(I)(J).Cociente ;
                  P_Partido  := I;
                  J_Cociente := J;
               end if;
            end if;
        end loop;
     end loop;
   end calcular_maximo_cociente ;

   procedure asignar_voto_y_borrar_cociente_mayor ( Tabla : in out T_Tabla_Dhont ) is 
      -- Pre: L_Votos contiene los votos conseguidos por los partidos.
      -- Post: Se ha ainadido un escaino al partido que tenia el maximo 
      --       entero de Tabla en uno de sus cocientes
      --       En el cociente que contenia ese maximo se ha puesto cero.
      P, J : Integer;  
   begin
      calcular_maximo_cociente (Tabla, P, J);
      Tabla.Tabla_Dhont(P)(J).Es_Max := True;
   end asignar_voto_y_borrar_cociente_mayor ;

begin
   -- Comienzo del subprograma asignar_maximos
   for I in 1 ..Num_Escainos loop
      asignar_voto_y_borrar_cociente_mayor (Dhont);
   end loop;
end asignar_maximos ;
