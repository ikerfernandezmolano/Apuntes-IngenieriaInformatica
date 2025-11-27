with tipos; use tipos;
with Ada.Text_Io; use Ada.Text_Io;
with escribir_lista_partidos_votos, escribir_tabla_Dhont, distribuir_votos;

procedure prueba_distribuir_votos is 
      
   L_P_V_Original: T_Lista_Partidos_Votos; 
   T_Dhont       : T_Tabla_Dhont;

begin
   -- caso1
   -- rellenamos la tabla de partidos en este caso con un solo partido
   L_P_V_Original.Num_Partidos:=1;
   L_P_V_Original.Tabla_Partidos(1) := ("       partido1", 80141);
   
   -- imprimimos los mensajes correspondientes y la tabla de partidos
   put_line("Caso 1. -> La tabla de partidos tiene solo un partido. ");
   new_line;
   put_line("Y la informacion sobre ese partido en la tabla de partidos es: ");
   escribir_lista_partidos_votos(L_P_V_Original);
   new_line;
   
   -- Imprimimos lo que tiene la tabla Dhont que se genera ejecutando distribuir_votos
   -- Y comprobamos que la informacion de L_P_V_Original se ha pasado correctamente a T_Dhont
   put_line("Asi pues, la tabla Dhont deberia de tener informacion sobre un solo partido. ");
   new_line;
   distribuir_votos (L_P_V_Original, T_Dhont);
   put("Y segun vuestro programa la lista de Dhont en este punto contiene: ");
   new_line;
   escribir_tabla_Dhont(L_P_V_Original,T_Dhont, 1); -- necesitaremos L_P_V_Original porque es aqui 
                                                    -- donde se guarda el nombre de los partidos
   new_line(4);
   
   -- caso2
   -- Ahora vamos a modificar L_P_V_original tal que haya 5 partidos 
   L_P_V_Original.Num_Partidos:=5;
   L_P_V_Original.Tabla_Partidos(1) := ("       partido1", 130141);
   L_P_V_Original.Tabla_Partidos(2) := ("       partido2", 128103);
   L_P_V_Original.Tabla_Partidos(3) := ("       partido3", 100241);
   L_P_V_Original.Tabla_Partidos(4) := ("       partido4", 100050);
   L_P_V_Original.Tabla_Partidos(5) := ("       partido5",  90200);
   
   ---Y probamos con la nueva informacion:
   put_line("Caso 2. -> La tabla de partidos tiene informacion sobre 5 partidos. ");
   new_line;
   put_line("Y la informacion sobre ese partido en la tabla de partidos es: ");
   escribir_lista_partidos_votos(L_P_V_Original);

   put_line("Asi pues, la tabla Dhont deberia de tener informacion sobre 5 partidos. ");
   new_line(2);
   distribuir_votos (L_P_V_Original, T_Dhont);
   put("Segun vuestro programa la lista de Dhont en este punto contiene: ");
   new_line;
   escribir_tabla_Dhont(L_P_V_Original,T_Dhont, 1); -- necesitaremos L_P_V_Original porque es aqui 
                                                    -- donde se guarda el nombre de los partidos
end prueba_distribuir_votos;