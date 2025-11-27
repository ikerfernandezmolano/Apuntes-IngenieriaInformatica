with tipos; use tipos;
with Ada.Text_Io, Ada.Integer_Text_Io,Ada.Float_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_Io,Ada.Float_Text_IO;

procedure obtener_partidos_con_mas_de_un_3_por_ciento (
      L_P         : in     T_Lista_Partidos_Votos; 
      L_P_3_o_Mas : out	   T_Lista_Partidos_Votos  ) is 
	  
    --Pre:   L_P contiene informacion sobre los votos obtenidos por todos los partidos ordenados en orden 
    --	     decreciente de numero de votos. La tabla estara llena, es decir, habra informacion sobre
    --       Max_Num_Partidos.
    -- Post: L_P_3_o_mas contiene la misma informacion que L_P pero solo para aquellos partidos que han 
    --	     obtenido mas de un 3% de los votos totales

   function total_votos ( L_P : in     T_Lista_Partidos_Votos ) return Integer is 
    -- pre:
    -- post: el resultado es el total de votos de todos los partidos
    
	Total : Integer;  

   begin
      Total := 0;
      for I in 1 .. L_P.Num_Partidos loop
         Total := Total + L_P.Tabla_Partidos(I).Votos;
      end loop;

      return Total;
   end total_votos;

   Porcentaje : Float;  
   Total      : Integer;  

begin  -- comienzo del subprograma obtener_partidos_con_mas_de_un_3_por_ciento
   Total := total_votos (L_P);
   L_P_3_o_Mas.Num_Partidos := 0;

   for I in 1 .. L_P.Num_Partidos loop
      Porcentaje :=  (Float(L_P.Tabla_Partidos(I).Votos) / Float(Total))*100.0;
      if Porcentaje > 3.0 then
         L_P_3_o_Mas.Num_Partidos := L_P_3_O_Mas.Num_Partidos + 1;
         L_P_3_o_Mas.Tabla_Partidos(L_P_3_O_Mas.Num_Partidos) := L_P.Tabla_Partidos(I);
      end if;
   end loop;
   
end obtener_partidos_con_mas_de_un_3_por_ciento;

 