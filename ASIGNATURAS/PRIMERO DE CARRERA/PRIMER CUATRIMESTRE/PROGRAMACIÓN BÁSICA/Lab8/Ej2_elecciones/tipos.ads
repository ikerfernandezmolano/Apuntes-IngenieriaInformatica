package tipos is

   -- Constantes

   Max_Num_Partidos : constant Integer := 10;  
   Num_Escainos     : constant Integer := 25;  

   -- Rangos
 
   subtype T_Rango_Partidos is Integer range 0..Max_Num_Partidos;
   subtype T_Nombre is String(1..15);

   -- Lista de partidos con sus votos (Lista_Partidos_Votos)

   type T_Info_Partido_Votos is record 
       Nombre : T_Nombre;  
       Votos  : Natural;  
   end record; 

   type T_Tabla_Partido is array (1 .. Max_Num_Partidos) of T_Info_Partido_Votos; 
 
   type T_Lista_Partidos_Votos is record 
       Num_Partidos   : T_Rango_Partidos;  
       Tabla_Partidos : T_Tabla_Partido;  
   end record; 

   -- Lista de partidos con sus escainos (T_Lista_Escainos)
 
   type T_Info_Partido_Escainos is record 
       Nombre : T_Nombre;  
       Escainos: Natural;  
   end record; 

   type T_Tabla_Escainos is array (1 .. Max_Num_Partidos) of T_Info_Partido_Escainos;

   type T_Lista_Escainos is record 
       Num_Partidos   : T_Rango_Partidos;  
       Tabla_Escainos : T_Tabla_Escainos;  
   end record; 

  
  -- Tipos para el reparto de escainos

   type T_Info_Cocientes is record 
       Cociente : Natural;  
       Es_Max   : Boolean := False; -- en el proceso de seleccion de maximos, permitira indicar si ese cociente es un maximo
   end record; 

   type T_Cocientes_Partido is array (1 .. Num_Escainos) of T_Info_Cocientes; 
   type T_Lista_Dhont is array (1 .. Max_Num_Partidos) of T_Cocientes_Partido; 

   type T_Tabla_Dhont is record 
       Num_Partidos : T_Rango_Partidos; --numero actual de partidos (numero de filas)   
       Tabla_Dhont  : T_Lista_Dhont;  
   end record; 

end tipos ;
