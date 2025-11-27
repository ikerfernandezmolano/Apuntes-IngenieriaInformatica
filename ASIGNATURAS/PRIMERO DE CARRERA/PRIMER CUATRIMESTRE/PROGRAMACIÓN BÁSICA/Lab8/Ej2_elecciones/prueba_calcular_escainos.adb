with tipos; use tipos;
with Ada.Text_Io; use Ada.Text_Io;
with escribir_lista_partidos_votos, escribir_escainos, calcular_escainos;

procedure prueba_calcular_escainos is

   L_P_V_Bizkaia,
   L_P_V_Araba,
   L_P_V_Gipuzkoa : T_Lista_Partidos_Votos;
   Escainos       : T_Lista_Escainos;

begin
   --CASO 1
   Put_Line("=============================================================");
   new_line(1);
      --- Ahora vamos a modificar L_P_V_Bizkaia tal que haya 6 partidos
   L_P_V_Bizkaia.Num_Partidos:= 6;
   L_P_V_Bizkaia.Tabla_Partidos(1) := ("         PNV/EA", 264774);
   L_P_V_Bizkaia.Tabla_Partidos(2) := ("       PSE-PSOE", 151347);
   L_P_V_Bizkaia.Tabla_Partidos(3) := ("             PP", 113867);
   L_P_V_Bizkaia.Tabla_Partidos(4) := ("           EHAK",  65431);
   L_P_V_Bizkaia.Tabla_Partidos(5) := ("          EB-IU",  36258);
   L_P_V_Bizkaia.Tabla_Partidos(6) := ("         ARALAR",  10187);
   --- Ahora vamos a modificar L_P_V_Araba tal que haya 6 partidos
   L_P_V_Araba.Num_Partidos:= 6;
   L_P_V_Araba.Tabla_Partidos(1) := ("         PNV/EA", 51601);
   L_P_V_Araba.Tabla_Partidos(2) := ("             PP", 43765);
   L_P_V_Araba.Tabla_Partidos(3) := ("       PSE-PSOE", 43765);
   L_P_V_Araba.Tabla_Partidos(4) := ("           EHAK",  14180);
   L_P_V_Araba.Tabla_Partidos(5) := ("          EB-IU",  8395);
   L_P_V_Araba.Tabla_Partidos(6) := ("         ARALAR",  2541);
   --- Ahora vamos a modificar L_P_V_Gipuzkoa tal que haya 6 partidos
   L_P_V_Gipuzkoa.Num_Partidos:= 6;
   L_P_V_Gipuzkoa.Tabla_Partidos(1) := ("         PNV/EA", 147498);
   L_P_V_Gipuzkoa.Tabla_Partidos(2) := ("           EHAK", 78088);
   L_P_V_Gipuzkoa.Tabla_Partidos(3) := ("             PP", 70577);
   L_P_V_Gipuzkoa.Tabla_Partidos(4) := ("       PSE-PSOE",  51163);
   L_P_V_Gipuzkoa.Tabla_Partidos(5) := ("          EB-IU",  20278);
   L_P_V_Gipuzkoa.Tabla_Partidos(6) := ("         ARALAR",  15273);

   put_line("Los votos iniciales son: ");
   escribir_lista_partidos_votos(L_P_V_Bizkaia);
   escribir_lista_partidos_votos(L_P_V_Araba);
   escribir_lista_partidos_votos(L_P_V_Gipuzkoa);

   put_line("El resultado final deberia ser   ");

   put_line("         PNV/EA  29");
   put_line("           EHAK   9");
   put_line("             PP  17");
   put_line("       PSE-PSOE  16");
   put_line("          EB-IU   3");
   put_line("         ARALAR   1");
   new_line(2);
 
   put_line("El resultado final segun vuestro programa es   ");
   calcular_escainos(L_P_V_Bizkaia, L_P_V_Araba, L_P_V_Gipuzkoa, Escainos);
   new_line(2);
   escribir_escainos(Escainos);
   skip_line;
   
   --CASO 2
   Put_Line("=============================================================");
   new_line(1);
      --- Ahora vamos a modificar L_P_V_Bizkaia tal que haya 1 partido que se ha llevado todos los votos
   L_P_V_Bizkaia.Num_Partidos:= 1;
   L_P_V_Bizkaia.Tabla_Partidos(1) := ("         PNV/EA", 100000);

   --- Ahora vamos a modificar L_P_V_Araba tal que haya 1 partido que se ha llevado todos los votos
   L_P_V_Araba.Num_Partidos:= 1;
   L_P_V_Araba.Tabla_Partidos(1) := ("         PNV/EA", 100000);
   --- Ahora vamos a modificar L_P_V_Gipuzkoa tal que haya 1 partido que se ha llevado todos los votos
   L_P_V_Gipuzkoa.Num_Partidos:= 1;
   L_P_V_Gipuzkoa.Tabla_Partidos(1) := ("         PNV/EA", 100000);


   put_line("Los votos iniciales son: ");
   escribir_lista_partidos_votos(L_P_V_Bizkaia);
   escribir_lista_partidos_votos(L_P_V_Araba);
   escribir_lista_partidos_votos(L_P_V_Gipuzkoa);

   put_line("El resultado final deberia ser   ");

   put_line("         PNV/EA  75");
   new_line(2);
 
   put_line("El resultado final segun vuestro programa es   ");
   calcular_escainos(L_P_V_Bizkaia, L_P_V_Araba, L_P_V_Gipuzkoa, Escainos);
   new_line(2);
   escribir_escainos(Escainos);
   skip_line;
   
   --CASO 3
   Put_Line("=============================================================");
   new_line(1);
      --- Ahora vamos a modificar L_P_V_Bizkaia tal que haya 6 partidos, con los mismos votos
   L_P_V_Bizkaia.Num_Partidos:= 6;
   L_P_V_Bizkaia.Tabla_Partidos(1) := ("         PNV/EA", 30000);
   L_P_V_Bizkaia.Tabla_Partidos(2) := ("       PSE-PSOE", 30000);
   L_P_V_Bizkaia.Tabla_Partidos(3) := ("             PP", 30000);
   L_P_V_Bizkaia.Tabla_Partidos(4) := ("           EHAK", 30000);
   L_P_V_Bizkaia.Tabla_Partidos(5) := ("          EB-IU", 30000);
   L_P_V_Bizkaia.Tabla_Partidos(6) := ("         ARALAR", 30000);
   --- Ahora vamos a modificar L_P_V_Araba tal que haya 6 partidos, con los mismos votos
   L_P_V_Araba.Num_Partidos:= 6;
   L_P_V_Araba.Tabla_Partidos(1) := ("             PP", 30000);
   L_P_V_Araba.Tabla_Partidos(2) := ("         PNV/EA", 30000);
   L_P_V_Araba.Tabla_Partidos(3) := ("       PSE-PSOE", 30000);
   L_P_V_Araba.Tabla_Partidos(4) := ("           EHAK", 30000);
   L_P_V_Araba.Tabla_Partidos(5) := ("          EB-IU", 30000);
   L_P_V_Araba.Tabla_Partidos(6) := ("         ARALAR", 30000);
   --- Ahora vamos a modificar L_P_V_Gipuzkoa tal que haya 6 partidos, con los mismos votos
   L_P_V_Gipuzkoa.Num_Partidos:= 6;
   L_P_V_Gipuzkoa.Tabla_Partidos(1) := ("       PSE-PSOE", 30000);
   L_P_V_Gipuzkoa.Tabla_Partidos(2) := ("           EHAK", 30000);
   L_P_V_Gipuzkoa.Tabla_Partidos(3) := ("             PP", 30000);
   L_P_V_Gipuzkoa.Tabla_Partidos(4) := ("         PNV/EA", 30000);
   L_P_V_Gipuzkoa.Tabla_Partidos(5) := ("          EB-IU", 30000);
   L_P_V_Gipuzkoa.Tabla_Partidos(6) := ("         ARALAR", 30000);

   put_line("Los votos iniciales son: ");
   escribir_lista_partidos_votos(L_P_V_Bizkaia);
   escribir_lista_partidos_votos(L_P_V_Araba);
   escribir_lista_partidos_votos(L_P_V_Gipuzkoa);

   put_line("El resultado final deberia ser   ");

   put_line("         PNV/EA  13");
   put_line("       PSE-PSOE  13");
   put_line("             PP  13");
   put_line("           EHAK  12");
   put_line("          EB-IU  12");
   put_line("         ARALAR  12");
   new_line(2);
 
   put_line("El resultado final segun vuestro programa es   ");
   calcular_escainos(L_P_V_Bizkaia, L_P_V_Araba, L_P_V_Gipuzkoa, Escainos);
   new_line(2);
   escribir_escainos(Escainos);
   skip_line;
   
   --CASO 4
   Put_Line("=============================================================");
   new_line(1);
      --- Ahora vamos a modificar L_P_V_Bizkaia tal que haya 6 partidos, pero ARALAR no cumple los minimos
   L_P_V_Bizkaia.Num_Partidos:= 6;
   L_P_V_Bizkaia.Tabla_Partidos(1) := ("         PNV/EA", 264774);
   L_P_V_Bizkaia.Tabla_Partidos(2) := ("       PSE-PSOE", 151347);
   L_P_V_Bizkaia.Tabla_Partidos(3) := ("             PP", 113867);
   L_P_V_Bizkaia.Tabla_Partidos(4) := ("           EHAK",  65431);
   L_P_V_Bizkaia.Tabla_Partidos(5) := ("          EB-IU",  36258);
   L_P_V_Bizkaia.Tabla_Partidos(6) := ("         ARALAR",  2);
   --- Ahora vamos a modificar L_P_V_Araba tal que haya 6 partidos, pero ARALAR no cumple los minimos
   L_P_V_Araba.Num_Partidos:= 6;
   L_P_V_Araba.Tabla_Partidos(1) := ("         PNV/EA", 51601);
   L_P_V_Araba.Tabla_Partidos(2) := ("             PP", 43765);
   L_P_V_Araba.Tabla_Partidos(3) := ("       PSE-PSOE", 43765);
   L_P_V_Araba.Tabla_Partidos(4) := ("           EHAK",  14180);
   L_P_V_Araba.Tabla_Partidos(5) := ("          EB-IU",  8395);
   L_P_V_Araba.Tabla_Partidos(6) := ("         ARALAR",  2);
   --- Ahora vamos a modificar L_P_V_Gipuzkoa tal que haya 6 partidos, pero ARALAR no cumple los minimos
   L_P_V_Gipuzkoa.Num_Partidos:= 6;
   L_P_V_Gipuzkoa.Tabla_Partidos(1) := ("         PNV/EA", 147498);
   L_P_V_Gipuzkoa.Tabla_Partidos(2) := ("           EHAK", 78088);
   L_P_V_Gipuzkoa.Tabla_Partidos(3) := ("             PP", 70577);
   L_P_V_Gipuzkoa.Tabla_Partidos(4) := ("       PSE-PSOE",  51163);
   L_P_V_Gipuzkoa.Tabla_Partidos(5) := ("          EB-IU",  20278);
   L_P_V_Gipuzkoa.Tabla_Partidos(6) := ("         ARALAR",  2);

   put_line("Los votos iniciales son: ");
   escribir_lista_partidos_votos(L_P_V_Bizkaia);
   escribir_lista_partidos_votos(L_P_V_Araba);
   escribir_lista_partidos_votos(L_P_V_Gipuzkoa);

   put_line("El resultado final deberia ser   ");

   put_line("         PNV/EA  30");
   put_line("           EHAK   9");
   put_line("             PP  17");
   put_line("       PSE-PSOE  16");
   put_line("          EB-IU   3");
   new_line(2);
 
   put_line("El resultado final segun vuestro programa es   ");
   calcular_escainos(L_P_V_Bizkaia, L_P_V_Araba, L_P_V_Gipuzkoa, Escainos);
   new_line(2);
   escribir_escainos(Escainos);
   skip_line;
   
   --CASO 5
   Put_Line("=============================================================");
   new_line(1);
      --- Ahora vamos a modificar L_P_V_Bizkaia tal que haya 1 partido, pero diferente al ganador en el resto de provincias
   L_P_V_Bizkaia.Num_Partidos:= 1;
  L_P_V_Bizkaia.Tabla_Partidos(1) := ("       PSE-PSOE",  51163);

   --- Ahora vamos a modificar L_P_V_Araba tal que haya 1 partido, pero diferente al ganador en el resto de provincias
   L_P_V_Araba.Num_Partidos:= 1;
   L_P_V_Araba.Tabla_Partidos(1) := ("         PNV/EA", 51601);
   --- Ahora vamos a modificar L_P_V_Gipuzkoa tal que haya 1 partido, pero diferente al ganador en el resto de provincias
   L_P_V_Gipuzkoa.Num_Partidos:= 1;
   L_P_V_Gipuzkoa.Tabla_Partidos(1) := ("         ARALAR",  20439);

   put_line("Los votos iniciales son: ");
   escribir_lista_partidos_votos(L_P_V_Bizkaia);
   escribir_lista_partidos_votos(L_P_V_Araba);
   escribir_lista_partidos_votos(L_P_V_Gipuzkoa);

   put_line("El resultado final deberia ser   ");

   put_line("         PNV/EA  25");
   put_line("       PSE-PSOE  25");
   put_line("          ARALAR   25");
   new_line(2);
 
   put_line("El resultado final segun vuestro programa es   ");
   calcular_escainos(L_P_V_Bizkaia, L_P_V_Araba, L_P_V_Gipuzkoa, Escainos);
   new_line(2);
   escribir_escainos(Escainos);
   skip_line;

      --CASO 6
   Put_Line("=============================================================");
   new_line(1);
      --- Ahora vamos a modificar L_P_V_Bizkaia tal que haya todos los habitantes estaban de vacaciones y no votaron
   L_P_V_Bizkaia.Num_Partidos:= 0;

   --- Ahora vamos a modificar L_P_V_Araba tal que haya 6 partidos
   L_P_V_Araba.Num_Partidos:= 6;
   L_P_V_Araba.Tabla_Partidos(1) := ("         PNV/EA", 51601);
   L_P_V_Araba.Tabla_Partidos(2) := ("             PP", 43765);
   L_P_V_Araba.Tabla_Partidos(3) := ("       PSE-PSOE", 43765);
   L_P_V_Araba.Tabla_Partidos(4) := ("           EHAK",  14180);
   L_P_V_Araba.Tabla_Partidos(5) := ("          EB-IU",  8395);
   L_P_V_Araba.Tabla_Partidos(6) := ("         ARALAR",  2541);
   --- Ahora vamos a modificar L_P_V_Gipuzkoa tal que haya 6 partidos
   L_P_V_Gipuzkoa.Num_Partidos:= 6;
   L_P_V_Gipuzkoa.Tabla_Partidos(1) := ("         PNV/EA", 147498);
   L_P_V_Gipuzkoa.Tabla_Partidos(2) := ("           EHAK", 78088);
   L_P_V_Gipuzkoa.Tabla_Partidos(3) := ("             PP", 70577);
   L_P_V_Gipuzkoa.Tabla_Partidos(4) := ("       PSE-PSOE",  51163);
   L_P_V_Gipuzkoa.Tabla_Partidos(5) := ("          EB-IU",  20278);
   L_P_V_Gipuzkoa.Tabla_Partidos(6) := ("         ARALAR",  15273);

   put_line("Los votos iniciales son: ");
   escribir_lista_partidos_votos(L_P_V_Bizkaia);
   escribir_lista_partidos_votos(L_P_V_Araba);
   escribir_lista_partidos_votos(L_P_V_Gipuzkoa);

   put_line("El resultado final deberia ser   ");

   put_line("         PNV/EA  18");
   put_line("           EHAK   7");
   put_line("             PP  12");
   put_line("       PSE-PSOE  10");
   put_line("          EB-IU   2");
   put_line("         ARALAR   1");
   new_line(2);
 
   put_line("El resultado final segun vuestro programa es   ");
   calcular_escainos(L_P_V_Bizkaia, L_P_V_Araba, L_P_V_Gipuzkoa, Escainos);
   new_line(2);
   escribir_escainos(Escainos);
   skip_line;
   
         --CASO 7
   Put_Line("=============================================================");
   new_line(1);
      --- Ahora vamos a modificar L_P_V_Bizkaia tal que haya todos los habitantes estaban de vacaciones y no votaron
   L_P_V_Bizkaia.Num_Partidos:= 0;

   --- Ahora vamos a modificar L_P_V_Araba tal que haya todos los habitantes estaban de vacaciones y no votaron
   L_P_V_Araba.Num_Partidos:= 0;
   
   --- Ahora vamos a modificar L_P_V_Gipuzkoa tal que haya todos los habitantes estaban de vacaciones menos 1
   L_P_V_Gipuzkoa.Num_Partidos:= 1;
   L_P_V_Gipuzkoa.Tabla_Partidos(1) := ("         PNV/EA", 1);

   put_line("Los votos iniciales son: ");
   escribir_lista_partidos_votos(L_P_V_Bizkaia);
   escribir_lista_partidos_votos(L_P_V_Araba);
   escribir_lista_partidos_votos(L_P_V_Gipuzkoa);

   put_line("El resultado final deberia ser   ");
   
   put_line("         PNV/EA  25");

   new_line(2);
 
   put_line("El resultado final segun vuestro programa es   ");
   calcular_escainos(L_P_V_Bizkaia, L_P_V_Araba, L_P_V_Gipuzkoa, Escainos);
   new_line(2);
   escribir_escainos(Escainos);
   skip_line;
   
    --CASO 8
   Put_Line("=============================================================");
   new_line(1);
      --- Ahora vamos a modificar L_P_V_Bizkaia tal que haya 3
   L_P_V_Bizkaia.Num_Partidos:= 3;
   L_P_V_Bizkaia.Tabla_Partidos(1) := ("         PNV/EA", 34534);
   L_P_V_Bizkaia.Tabla_Partidos(2) := ("       PSE-PSOE", 26365);
   L_P_V_Bizkaia.Tabla_Partidos(3) := ("             PP", 35235);
   --- Ahora vamos a modificar L_P_V_Araba tal que haya 4
   L_P_V_Araba.Num_Partidos:= 4;
   L_P_V_Araba.Tabla_Partidos(1) := ("             PP", 33874);
   L_P_V_Araba.Tabla_Partidos(2) := ("         PNV/EA", 85742);
   L_P_V_Araba.Tabla_Partidos(3) := ("          EB-IU", 54235);
   L_P_V_Araba.Tabla_Partidos(4) := ("         ARALAR", 33333);
   --- Ahora vamos a modificar L_P_V_Gipuzkoa tal que haya 4
   L_P_V_Gipuzkoa.Num_Partidos:= 4;
   L_P_V_Gipuzkoa.Tabla_Partidos(1) := ("             PP", 48524);
   L_P_V_Gipuzkoa.Tabla_Partidos(2) := ("         PNV/EA", 47834);
   L_P_V_Gipuzkoa.Tabla_Partidos(3) := ("          EB-IU", 10834);
   L_P_V_Gipuzkoa.Tabla_Partidos(4) := ("         ARALAR", 74832);

   put_line("Los votos iniciales son: ");
   escribir_lista_partidos_votos(L_P_V_Bizkaia);
   escribir_lista_partidos_votos(L_P_V_Araba);
   escribir_lista_partidos_votos(L_P_V_Gipuzkoa);

   put_line("El resultado final deberia ser   ");

   put_line("         PNV/EA  27");
   put_line("       PSE-PSOE  7");
   put_line("             PP  20");
   put_line("          EB-IU  7");
   put_line("         ARALAR  14");
   new_line(2);
 
   put_line("El resultado final segun vuestro programa es   ");
   calcular_escainos(L_P_V_Bizkaia, L_P_V_Araba, L_P_V_Gipuzkoa, Escainos);
   new_line(2);
   escribir_escainos(Escainos);
   skip_line;
   
end prueba_calcular_escainos ;
