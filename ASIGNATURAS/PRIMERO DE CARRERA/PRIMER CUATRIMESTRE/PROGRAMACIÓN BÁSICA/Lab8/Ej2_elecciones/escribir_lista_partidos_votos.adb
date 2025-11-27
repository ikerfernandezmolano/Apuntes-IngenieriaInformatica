with tipos; use tipos;
with Ada.Text_Io, Ada.Integer_Text_Io; use Ada.Text_Io, Ada.Integer_Text_Io;

procedure escribir_lista_partidos_votos ( L_P_V : in  T_Lista_Partidos_Votos ) is 

   begin
          
      for I in 1 .. L_P_V.Num_Partidos loop
           put("El partido ");
           put(L_P_V.Tabla_partidos(I).Nombre);
           put(" tiene ");
           put(L_P_V.Tabla_Partidos(I).Votos, width=>10);               
           put(" votos"); 
           new_line;
      end loop;
      new_line(2);
	  
end escribir_lista_partidos_votos;
