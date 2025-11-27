with tipos; use tipos;
with Ada.Text_Io, Ada.Integer_Text_Io; use Ada.Text_Io, Ada.Integer_Text_Io;

procedure escribir_tabla_Dhont( L_P_V: T_Lista_Partidos_Votos; 
                                Tabla_Dhont : in   T_Tabla_Dhont;
 								Cuantas_Columnas: in integer          ) is 
								
   -- Pre:  L_P_V contiene informacion acerca del numero de partidos que hay
   --         y por cada partido de su nombre y el numero de votos obtenido (>3%)
   --       Tabla_Dhont contiene informacion acerca del mismo numero de partidos que L_P_V, 
   --         y la primera columna de la tabla_Dhont deberia coincidir 
   --         con la informacion contenida en L_P_V
   --       Cuantas_Columnas contendra el numero de columnas de la tabla Dhont que querremos escribir
   -- Post: Se imprimira por pantalla la informacion contenida en la tabla Dhont desde la primera columna
   --         hasta la columna Cuantas_Columnas
   
   package Boolean_E_S is new Enumeration_Io(Boolean); use Boolean_E_S;
   -- esto sirve para leer y escribir valores de tipo Boolean  

   begin
      
      new_line;
      put(" ----------------------------------------------------------------------------");
      new_line;
      for I in 1 .. Tabla_Dhont.Num_Partidos loop
         put("|");
         put(L_P_V.Tabla_Partidos(I).Nombre(4..15));
         put("|");

         for j in 1..Cuantas_Columnas loop   
            put(Tabla_Dhont.Tabla_Dhont(I)(J).Cociente, width=> 7);
            put("|");
         end loop;
         new_line;
         put("|");
         put("            ");
         put("|");
         for J in 1..Cuantas_Columnas loop
            if Tabla_Dhont.Tabla_Dhont(I)(J).Es_Max then
               put("   ");     
            else
               put("  ");
            end if;    
            put(Tabla_Dhont.Tabla_Dhont(I)(J).Es_Max);
            put("|");
         end loop;
         new_line;  
         put(" ----------------------------------------------------------------------------");
         new_line;
      end loop;
      new_line(2);
end escribir_tabla_Dhont;
