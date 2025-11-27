with tipos; use tipos;
with Ada.Text_Io; use Ada.Text_Io;
with escribir_lista_partidos_votos, escribir_escainos, repartir_escainos;

procedure prueba_repartir_escainos is 
      
   L_P_V_Original: T_Lista_Partidos_Votos; 
   Escainos      : T_lista_escainos;

begin

   -- Caso 1
   put_line("Caso 1. -> La tabla de partidos tiene informacion sobre 1 partido. ");
   L_P_V_Original.Num_Partidos:=1;
   L_P_V_Original.Tabla_Partidos(1) := ("       partido1", 80141);
   put_line("Y la informacion sobre ese partido en la tabla de partidos es: ");
   escribir_lista_partidos_votos(L_P_V_Original);
   put_line("el resultado deberia ser: partido 1 -> 25 escainos");
   new_line(2);
   put_line("y el resultado segun vuestro programa es   ");
   repartir_escainos(L_P_V_Original, Escainos);
   escribir_escainos(Escainos);
   new_line(4);
   put_line("pulsa return para continuar");
   skip_line;
   
   -- caso2
   -- Ahora vamos a modificar L_P_V_original tal que haya 5 partidos 
   L_P_V_Original.Num_Partidos:=5;
   L_P_V_Original.Tabla_Partidos(1) := ("       partido1", 140141);
   L_P_V_Original.Tabla_Partidos(2) := ("       partido2", 128103);
   L_P_V_Original.Tabla_Partidos(3) := ("       partido3", 100241);
   L_P_V_Original.Tabla_Partidos(4) := ("       partido4",  60050);
   L_P_V_Original.Tabla_Partidos(5) := ("       partido5",  30200);
   
   ---Y probamos con la nueva informacion:
   put_line("Caso 2. -> La tabla de partidos tiene informacion sobre 5 partidos. ");
   new_line;
   put_line("Y la informacion sobre esos partidos en la tabla de partidos es: ");
   escribir_lista_partidos_votos(L_P_V_Original);

   put_Line("el resultado deberia ser  ");
   put_line("partido 1 -> 8 escainos");
   put_line("partido 2 -> 7 escainos");
   put_line("partido 3 -> 6 escainos");
   put_line("partido 4 -> 3 escainos");
   put_line("partido 5 -> 1 escainos");
   new_line(2);
   put_line("y el resultado segun vuestro programa es   ");
   repartir_escainos(L_P_V_Original, Escainos);
   escribir_escainos(Escainos);
   
   -- caso3
   -- Ahora vamos a modificar L_P_V_original tal que haya 5 partidos 
   L_P_V_Original.Num_Partidos:=6;
   L_P_V_Original.Tabla_Partidos(1) := ("       partido1", 30000);
   L_P_V_Original.Tabla_Partidos(2) := ("       partido2", 30000);
   L_P_V_Original.Tabla_Partidos(3) := ("       partido3", 30000);
   L_P_V_Original.Tabla_Partidos(4) := ("       partido4", 30000);
   L_P_V_Original.Tabla_Partidos(5) := ("       partido5", 30000);
   L_P_V_Original.Tabla_Partidos(6) := ("       partido6", 30000);
   
   
   ---Y probamos con la nueva informacion:
   put_line("Caso 3. -> La tabla de partidos tiene informacion sobre 5 partidos. ");
   new_line;
   put_line("Y la informacion sobre esos partidos en la tabla de partidos es: ");
   escribir_lista_partidos_votos(L_P_V_Original);

   put_Line("el resultado deberia ser  ");
   put_line("partido 1 -> 8 escainos");
   put_line("partido 2 -> 7 escainos");
   put_line("partido 3 -> 6 escainos");
   put_line("partido 4 -> 3 escainos");
   put_line("partido 5 -> 1 escainos");
   new_line(2);
   put_line("y el resultado segun vuestro programa es   ");
   repartir_escainos(L_P_V_Original, Escainos);
   escribir_escainos(Escainos);
   
   

end prueba_repartir_escainos ;
