with tipos; use tipos;
with Ada.Text_Io; use Ada.Text_Io;
with escribir_lista_partidos_votos, escribir_tabla_Dhont, distribuir_votos;
with calcular_todos_cocientes, asignar_maximos;

procedure prueba_asignar_maximos is 
   
   L_P_V_Original : T_Lista_Partidos_Votos; 
   T_Dhont:T_Tabla_Dhont ;

begin

   -- caso 1
   L_P_V_Original.Num_Partidos:=1;
   L_P_V_Original.Tabla_Partidos(1) := ("       partido1", 80141); 
   
   put_line("Caso 1. -> La tabla de partidos tiene informacion sobre 1 partido. ");
   
   distribuir_votos (L_P_V_Original,T_Dhont); -- asi se genera una tabla de Dhont
   calcular_todos_cocientes(T_Dhont); 
   asignar_maximos(T_Dhont); 
   escribir_tabla_Dhont(L_P_V_Original,T_Dhont,8); --necesitaremos L_P_V_Original porque es aqui 
                                                   -- donde se guarda el nombre de los partidos
   new_line(4);
   put_line("pulsa return para continuar");
   skip_line;
   
   --caso2
   --- Ahora vamos a modificar L_P_V_original tal que haya 5 partidos 
   L_P_V_Original.Num_Partidos:=5;
   L_P_V_Original.Tabla_Partidos(1) := ("       partido1", 140141);
   L_P_V_Original.Tabla_Partidos(2) := ("       partido2", 128103);
   L_P_V_Original.Tabla_Partidos(3) := ("       partido3", 100241);
   L_P_V_Original.Tabla_Partidos(4) := ("       partido4",  60050);
   L_P_V_Original.Tabla_Partidos(5) := ("       partido5",  30200);

   put_line("Caso 2. -> La tabla de partidos tiene informacion sobre 5 partidos. ");
   new_line;
   put_line("Y la informacion sobre ese partido en la tabla de partidos es: ");
   escribir_lista_partidos_votos(L_P_V_Original);

   put_line("Asi pues, la tabla Dhont deberia de tener informacion sobre 5 partidos. ");
   new_line(2);
   distribuir_votos (L_P_V_Original,T_Dhont); -- asi se genera una tabla de Dhont
   calcular_todos_cocientes(T_Dhont);
   asignar_maximos(T_Dhont); 
   escribir_tabla_Dhont(L_P_V_Original,T_Dhont,8); --necesitaremos L_P_V_Original porque es aqui 
                                                   -- donde se guarda el nombre de los partidos
end prueba_asignar_maximos;