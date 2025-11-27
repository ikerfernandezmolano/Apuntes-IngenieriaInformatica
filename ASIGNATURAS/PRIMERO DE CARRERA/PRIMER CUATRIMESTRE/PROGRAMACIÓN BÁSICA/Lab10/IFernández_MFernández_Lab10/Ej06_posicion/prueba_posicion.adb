with Ada.Text_Io, Ada.Integer_Text_Io, datos;
with crear_lista_vacia, insertar_al_comienzo, escribir, posicion;
use Ada.Text_Io, Ada.Integer_Text_Io, datos;

procedure prueba_posicion is 

   Lis : Lista; -- variable del programa principal   
   
   procedure pedir_return is 
   begin
      put_line("pulsa return para continuar ");
      skip_line;
   end pedir_return;

begin -- programa principal
   -- Casos de prueba:
   --   1. Lista vacia. Resultado: cero
   --   2. Lista no vacia. Lista de un elemento 
   --         2.1. El elemento buscado si esta
   --         2.2. El elemento buscado no esta
   --   3. Lista no vacia. Varios elementos
   --         3.1. El buscado al comienzo
   --         3.2. El buscado en medio
   --         3.3. El buscado al final
   --         3.4. El buscado no esta
   
   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(Lis);
   put_line("Caso de prueba 1: Lista vacia ");
   put_line("Llamada a : Posicion(Lis, 4)");
   put_line("Ahora deberia escribir cero: ");
   put(posicion(Lis, 4));
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 4);
   put_line("Caso de prueba 2.1: lista de un solo elemento. El elemento buscado si esta ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : Posicion(Lis, 4)");
   put_line("Ahora deberia escribir 1: ");
   put(posicion(Lis, 4));
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 4);
   put_line("Caso de prueba 2.2: lista de un solo elemento. El elemento buscado no esta ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : Posicion(Lis, 6)");
   put_line("Ahora deberia escribir cero: ");
   put(posicion(Lis, 6));
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 10);
   insertar_al_comienzo(Lis, 5);
   insertar_al_comienzo(Lis, 8);
   insertar_al_comienzo(Lis, 12);
   put_line("Caso de prueba 3.1: lista de varios elementos. El elemento buscado esta al comienzo");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : Posicion(Lis, 12)");
   put_line("Ahora deberia escribir 1: ");
   put(posicion(Lis, 12));
   new_line;
   new_line;
   pedir_return;

   put_line("Caso de prueba 3.2: lista de varios elementos. El elemento buscado esta en medio");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : Posicion(Lis, 5)");
   put_line("Ahora deberia escribir 3: ");
   put(posicion(Lis, 5));
   new_line;
   new_line;
   pedir_return;

   put_line("Caso de prueba 3.3: lista de varios elementos. El elemento buscado esta al final");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : Posicion(Lis, 10)");
   put_line("Ahora deberia escribir 4: ");
   put(posicion(Lis, 10));
   new_line;
   new_line;
   pedir_return;

   put_line("Caso de prueba 3.4: lista de varios elementos. El elemento buscado no esta ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : Posicion(Lis, 20)");
   put_line("Ahora deberia escribir cero: ");
   put(posicion(Lis, 20));
   new_line;
   new_line;
   pedir_return;

   put_line("Se acabo la prueba. Agur ");
   
end prueba_posicion;


