with tipos; use tipos;
with Ada.Text_Io; use Ada.Text_Io;
with obtener_partidos_con_mas_de_un_3_por_ciento, escribir_lista_partidos_votos;
with construir_lista_partidos_votos_caso1, escribir_lista_partidos_votos;

procedure prueba_obtener_partidos_con_mas_de_un_3_por_ciento is 

   procedure pedir_return is 
   begin
      put_line("pulsa return para continuar");
      skip_line;
   end pedir_return;
   
   L_P_V_original, L_P_mayor_3 : T_Lista_Partidos_Votos;  

begin

   put_line("Caso 1. -> Solo un partido consigue mas del 3 por ciento. ");
   put_line("Vuestro programa deberia escribir SOLO partido1. ");
   new_line(2);
   put("la lista del recuento de votos es: ");
   new_line;
   construir_lista_partidos_votos_caso1(L_P_V_Original);
   escribir_lista_partidos_votos(L_P_V_Original);
   put("Segun vuestro programa la lista de partidos que tienen mas de un 3 por ciento es: ");
   new_line;
   obtener_partidos_con_mas_de_un_3_por_ciento(L_P_V_original, L_P_mayor_3);
   escribir_lista_partidos_votos(L_P_mayor_3);
   pedir_return;
   new_line(10);
   
   -- Ahora vamos a modificar L_P_V_original tal que haya 3 partidos que cumplan 
   -- tener mas del 3 por ciento de los votos
   L_P_V_original.Tabla_Partidos(2) := ("       partido2", 80141);
   L_P_V_Original.Tabla_Partidos(3) := ("       partido3", 68103);
   -- Y probamos:
   put_line("Caso 2. -> 3 partidos consiguen mas del 3 por ciento. ");
   put_line("Vuestro programa deberia escribir partido1, partido2 y partido3. ");
   new_line(2);
   put("la lista (original) del recuento de votos ahora es: ");
   new_line;
   escribir_lista_partidos_votos(L_P_V_Original);
   put("Segun vuestro programa la lista de partidos que tienen mas de un 3 por ciento es: ");
   new_line;
   obtener_partidos_con_mas_de_un_3_por_ciento(L_P_V_original, L_P_mayor_3);
   escribir_lista_partidos_votos(L_P_mayor_3);
   pedir_return;
   new_line(10);

   -- Ahora vamos a modificar L_P_V_original tal que todos los partidos cumplan 
   -- tener mas del 3 por ciento de los votos
   L_P_V_original.Tabla_Partidos(2) := ("       partido2", 100141);
   L_P_V_Original.Tabla_Partidos(3) := ("       partido3", 100103);
   L_P_V_original.Tabla_Partidos(4) := ("       partido4", 98141);
   L_P_V_original.Tabla_Partidos(5) := ("       partido5", 89103);
   L_P_V_original.Tabla_Partidos(6) := ("       partido6", 80141);
   L_P_V_original.Tabla_Partidos(7) := ("       partido7", 79100);
   L_P_V_original.Tabla_Partidos(8) := ("       partido8", 78103);
   -- Y probamos:
   put_line("Caso 3. -> Todos los partidos consiguen mas del 3 por ciento. ");
   put_line("Vuestro programa deberia escribir partido1, partido2, partido3, partido4, partido5, partido6, partido7 y partido8. ");
   new_line(2);
   put("la lista (original) del recuento de votos ahora es: ");
   new_line;
   escribir_lista_partidos_votos(L_P_V_Original);
   put("Segun vuestro programa la lista de partidos que tienen mas de un 3 por ciento es: ");
   new_line;
   obtener_partidos_con_mas_de_un_3_por_ciento(L_P_V_original, L_P_mayor_3);
   escribir_lista_partidos_votos(L_P_mayor_3);
   pedir_return;

end prueba_obtener_partidos_con_mas_de_un_3_por_ciento;