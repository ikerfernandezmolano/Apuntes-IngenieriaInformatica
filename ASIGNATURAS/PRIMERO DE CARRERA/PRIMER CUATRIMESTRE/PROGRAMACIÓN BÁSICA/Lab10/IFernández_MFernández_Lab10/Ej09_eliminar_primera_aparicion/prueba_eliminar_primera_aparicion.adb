with Ada.Text_Io, datos;
with crear_lista_vacia, insertar_al_comienzo, escribir, eliminar_primera_aparicion;
use Ada.Text_Io, datos;

procedure prueba_eliminar_primera_aparicion is 

   Lis : Lista; -- variable del programa principal  

   procedure pedir_return is 
   begin
      put_line("pulsa return para continuar ");
      skip_line;
   end pedir_return;

begin -- programa principal
   -- Casos de prueba:
   --   1. Eliminar en la lista vacia. Resultado: lista vacia
   --   2. Eliminar en lista no vacia.
   --      2.1 Un elemento que no esta en la lista. Resultado: lista inicial
   --      2.2 Eliminar un elemento que si esta en la lista
   --           2.2.1 Lista de un solo elemento. Resultado: lista vacia
   --           2.2.2 Lista de mas de un elemento. Eliminar en el medio.
   --           2.2.3 Lista de mas de un elemento. Eliminar el ultimo.

   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(Lis);
   put_line("Caso de prueba 1: Eliminar en la lista vacia ");
   eliminar_primera_aparicion(Lis, 5);
   put_line("Ahora deberia escribir la lista vacia: ");
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 4);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 7);
   insertar_al_comienzo(Lis, 5);
   put_line("Caso de prueba 2.1: valor que no esta en la lista.");
   put_line("Llamada a: Eliminar_Primera_Aparicion(Lis, 8)");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   eliminar_primera_aparicion(Lis, 8);
   put_line("Ahora deberia escribir la lista <5, 7, 9, 4> ");
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 8);
   put_line("Caso de prueba 2.2.1: Valor que si esta en la lista. ");
   put_line("Lista de un solo elemento");
   put_line("Llamada a: Eliminar_Primera_Aparicion(Lis, 8)");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   eliminar_primera_aparicion(Lis, 8);
   put_line("Ahora deberia escribir la lista vacia: ");
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 8);
   insertar_al_comienzo(Lis, 10);
   insertar_al_comienzo(Lis, 12);
   put_line("Caso de prueba 2.2.2: Valor que si esta en la lista.");
   put_line("    Lista con mas de un elemento. Eliminar en medio.");
   put_line("Llamada a: Eliminar_Primera_Aparicion(Lis, 10)");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   eliminar_primera_aparicion(Lis, 10);
   put_line("Ahora deberia escribir la lista <12, 8> ");
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 12);
   insertar_al_comienzo(Lis, 10);
   insertar_al_comienzo(Lis, 8);
   put_line("Caso de prueba 2.2.3: Valor que si esta en la lista.");
   put_line("   Lista con mas de un elemento. Eliminar el ultimo.");
   put_line("Llamada a: Eliminar_Primera_Aparicion(Lis, 12)");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   eliminar_primera_aparicion(Lis, 12);
   put_line("Ahora deberia escribir la lista <8, 10> ");
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   put_line("Se acabo la prueba. Agur ");
   
end prueba_eliminar_primera_aparicion;
