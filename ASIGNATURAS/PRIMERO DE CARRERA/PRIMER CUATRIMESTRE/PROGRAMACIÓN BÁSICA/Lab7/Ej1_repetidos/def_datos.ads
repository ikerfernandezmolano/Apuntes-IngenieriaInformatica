
package Def_Datos is

   Max_Elem : constant Integer := 1000;  
   
   type Vector_De_Enteros is array (1..Max_Elem) of Integer;
    
   type Lista_De_Enteros is record 
         Numeros: Vector_De_Enteros;  
         Cuantos: Integer;  
      end record; 

end Def_Datos;
