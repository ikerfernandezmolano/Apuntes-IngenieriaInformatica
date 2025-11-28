with Ada.Text_Io, datos;
with crear_lista_vacia, escribir, insertar_al_comienzo, mover_a_posicion_N;
use Ada.Text_Io, datos;

procedure prueba_mover_a_posicion_N is 

   L:Lista; 

   procedure pedir_return is 
   begin
      put_line("pulsa return para continuar ");
      skip_line;
   end pedir_return;
   
begin -- programa principal
   -- Casos de prueba:
   --   1. Lista vacia
   --   2. Lista de un elemento
   --   3. Lista de dos elementos y se mueve a partir del ultimo
   --   4. Lista de dos elementos y se mueve a partir del primero
   --   5. Lista de varios y se mueve a partir del primero
   --   6. Lista de varios y se mueve a partir del ultimo
   --   7. Lista de varios y se mueve a partir del medio
   
   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(L);
   put_line("Caso de prueba 1: Lista vacia ");
   put_line("La lista inicial contiene ");
   escribir(L);
   put_line("Ahora deberia escribir la lista vacia: ");
   mover_a_posicion_N(L,1);
   escribir(L);
   new_line;
   new_line;
   pedir_return;
   
   crear_lista_vacia(L);
   insertar_al_comienzo(L,3);
   put_line("Caso de prueba 2: Lista de un elemento ");
   put_line("La lista inicial contiene ");
   escribir(L);
   put_line("Ahora deberia escribir la <3>: ");
   mover_a_posicion_N(L,1);
   escribir(L);
   new_line;
   new_line;
   pedir_return;
   
   crear_lista_vacia(L);
   insertar_al_comienzo(L,2);
   insertar_al_comienzo(L,3);
   put_line("Caso de prueba 3: Lista de dos elementos, que se mueve el segundo ");
   put_line("La lista inicial contiene ");
   escribir(L);
   put_line("Ahora deberia escribir la <2 3>: ");
   mover_a_posicion_N(L,2);
   escribir(L);
   new_line;
   new_line;
   pedir_return;
   
   crear_lista_vacia(L);
   insertar_al_comienzo(L,2);
   insertar_al_comienzo(L,3);
   put_line("Caso de prueba 4: Lista de dos elementos, que se mueve a partir del primero ");
   put_line("La lista inicial contiene ");
   escribir(L);
   put_line("Ahora deberia escribir la <3 2>: ");
   mover_a_posicion_N(L,1);
   escribir(L);
   new_line;
   new_line;
   pedir_return;
   
   crear_lista_vacia(L);
   insertar_al_comienzo(L,2);
   insertar_al_comienzo(L,3);
   insertar_al_comienzo(L,4);
   insertar_al_comienzo(L,5);
   put_line("Caso de prueba 5: Lista de varios elementos, que se mueve a partir del primero ");
   put_line("La lista inicial contiene ");
   escribir(L);
   put_line("Ahora deberia escribir la <5 4 3 2>: ");
   mover_a_posicion_N(L,1);
   escribir(L);
   new_line;
   new_line;
   pedir_return;
   
   crear_lista_vacia(L);
   insertar_al_comienzo(L,2);
   insertar_al_comienzo(L,3);
   insertar_al_comienzo(L,4);
   insertar_al_comienzo(L,5);
   insertar_al_comienzo(L,6);
   put_line("Caso de prueba 6: Lista de varios elementos, que se mueve el ultimo ");
   put_line("La lista inicial contiene ");
   escribir(L);
   put_line("Ahora deberia escribir la <2 6 5 4 3>: ");
   mover_a_posicion_N(L,5);
   escribir(L);
   new_line;
   new_line;
   pedir_return;
   
   crear_lista_vacia(L);
   insertar_al_comienzo(L,2);
   insertar_al_comienzo(L,3);
   insertar_al_comienzo(L,4);
   insertar_al_comienzo(L,5);
   insertar_al_comienzo(L,6);
   put_line("Caso de prueba 7: Lista de varios elementos, que se mueve a partir del medio ");
   put_line("La lista inicial contiene ");
   escribir(L);
   put_line("Ahora deberia escribir la <4 3 2 6 5>: ");
   mover_a_posicion_N(L,3);
   escribir(L);
   new_line;
   new_line;
   pedir_return;

 
   put_line("Se acabo la prueba. Agur ");

end prueba_mover_a_posicion_N;


