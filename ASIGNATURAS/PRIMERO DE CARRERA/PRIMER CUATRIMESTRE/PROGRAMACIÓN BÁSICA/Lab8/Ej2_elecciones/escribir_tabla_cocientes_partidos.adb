with tipos; use tipos;
with Ada.Text_Io, Ada.Integer_Text_Io; use Ada.Text_Io, Ada.Integer_Text_Io;

procedure escribir_tabla_cocientes_partidos ( T_C_P : in  T_Cocientes_Partido) is 
 
 package Boolean_E_S is new Enumeration_Io(Boolean);
   use Boolean_E_S;
   -- esto sirve para leer y escribir valores de tipo Boolean  

   begin

     for I in 1 .. 8 loop
         put("cociente numero ");
         put(I);
         put(" :");  
         put(T_C_P(I).Cociente, width=>10);               
         put(" ");
         put("y su parte es_max valdra: ");
         put(T_C_P(I).Es_Max, width=>10); 
         new_line;
      end loop;
      new_line(2);
	  
end escribir_tabla_cocientes_partidos;
