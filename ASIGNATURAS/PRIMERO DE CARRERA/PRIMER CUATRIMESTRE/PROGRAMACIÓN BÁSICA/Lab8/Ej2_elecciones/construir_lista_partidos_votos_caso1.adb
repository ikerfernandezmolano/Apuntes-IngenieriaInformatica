with tipos; use tipos;

procedure construir_lista_partidos_votos_caso1 ( L_P_V : out  T_Lista_Partidos_Votos) is 
   -- Pre: -
   -- Post: En L_P_V tenemos los cocientes de los partidos.

begin
   L_P_V.Num_Partidos:=8;
   --Vamos a  rellenar la estructura de dos formas diferentes
   --para que veais diferentes formas de hacerlo.
   
   --Elemento a elemento de cada registro T_info_partido (primero nombre, luego votos)
                                    --123456789012345    !15 caracteres!
   L_P_V.Tabla_Partidos(1).Nombre := "       partido1";
   L_P_V.Tabla_Partidos(1).Votos  := 1802959;
   L_P_V.Tabla_Partidos(2).Nombre := "       partido2";
   L_P_V.Tabla_Partidos(2).votos  := 40202;
   L_P_V.Tabla_Partidos(3).Nombre := "       partido3";
   L_P_V.Tabla_Partidos(3).Votos  := 38192;
   
   --Todo un registro de golpe:
   L_P_V.Tabla_Partidos(4) := ("       partido4", 28141);
   L_P_V.Tabla_Partidos(5) := ("       partido5", 20103);
   L_P_V.Tabla_Partidos(6) := ("       partido6", 20101);
   L_P_V.Tabla_Partidos(7) := ("       partido7", 28101);
   L_P_V.Tabla_Partidos(8) := ("       partido8", 28100);
   
end construir_lista_partidos_votos_caso1;