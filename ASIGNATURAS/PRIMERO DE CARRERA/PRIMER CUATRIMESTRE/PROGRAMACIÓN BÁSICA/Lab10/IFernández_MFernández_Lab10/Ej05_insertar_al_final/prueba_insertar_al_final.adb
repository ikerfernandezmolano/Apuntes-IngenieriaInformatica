with Ada.Text_Io, datos;
with crear_lista_vacia, escribir, Insertar_al_Final;
use Ada.Text_Io, datos;

procedure prueba_insertar_al_final is 

   Lis : Lista; -- variable del programa principal   

   procedure pedir_return is 
   begin
      put_line("pulsa return para continuar ");
      skip_line;
   end pedir_return;
   
begin -- programa principal
   -- Casos de prueba:
   --   1. Lista vacia. 
   --   2. Lista no vacia. 
 
   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(Lis);
   put_line("Caso de prueba 1: Lista vacia ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   insertar_al_final(Lis, 4);
   put_line("Ahora deberia escribir <4>: ");
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_final(Lis, 4);
   put_line("Caso de prueba 2.1: Lista no vacia ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   insertar_al_final(Lis, 2);
   put_line("Ahora deberia escribir <4, 2>: ");
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_final(Lis, 4);
   insertar_al_final(Lis, 6);
   put_line("Caso de prueba 2.2: Lista no vacia ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   insertar_al_final(Lis, 2);
   put_line("Ahora deberia escribir <4, 6, 2>: ");
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   put_line("Se acabo la prueba. Agur ");
   
end prueba_insertar_al_final;


