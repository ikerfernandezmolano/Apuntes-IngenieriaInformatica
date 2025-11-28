with Ada.Text_Io, Ada.Integer_Text_Io, datos;
with crear_lista_vacia, insertar_al_comienzo, escribir, posicion_lista_ordenada;
use Ada.Text_Io, Ada.Integer_Text_Io, datos;

procedure prueba_posicion_lista_ordenada is 


   package Boolean_E_S is new Enumeration_Io(Boolean);
   use Boolean_E_S;
   -- esto sirve para leer y escribir valores de tipo Boolean


   Lis : Lista; -- variable del programa principal   
   
   Esta: Boolean;
   Pos: Natural;
   
   procedure pedir_return is 
   begin
      put_line("pulsa return para continuar ");
      skip_line;
   end pedir_return;

begin -- programa principal
   -- Casos de prueba:
   --   1. Lista vacia. Resultado: uno
   --   2. Lista no vacia. Lista de un elemento 
   --         2.1. El elemento buscado si esta
   --         2.2. El elemento buscado no esta. Se debe meter al comienzo
   --         2.3. El elemento buscado no esta. Se debe meter al final
   --   3. Lista no vacia. Varios elementos
   --         3.1. El buscado al comienzo
   --         3.2. El buscado en medio
   --         3.3. El buscado al final
   --         3.4. El buscado no esta. Se debe meter al comienzo
   --         3.5. El buscado no esta. Se debe meter en medio 
   --         3.6. El buscado no esta. Se debe meter al final
   
   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(Lis);
   put_line("Caso de prueba 1: Lista vacia ");
   put_line("Llamada a : posicion_lista_ordenada(Lis, 4, Esta, Pos)");
   put_line("Ahora deberia escribir que no esta, y en la posicion uno: ");
   posicion_lista_ordenada(Lis, 4, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 4);
   put_line("Caso de prueba 2.1: lista de un solo elemento. El elemento buscado si esta ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 4, Esta, Pos)");
   put_line("Ahora deberia escribir que si esta, y en la posicion uno: ");
   posicion_lista_ordenada(Lis, 4, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 4);
   put_line("Caso de prueba 2.2: lista de un solo elemento. El elemento buscado no esta ");
   put_line("Se debe insertar al comienzo ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 2, Esta, Pos)");
   put_line("Ahora deberia escribir que no esta, y en la posicion uno: ");
   posicion_lista_ordenada(Lis, 2, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 4);
   put_line("Caso de prueba 2.3: lista de un solo elemento. El elemento buscado no esta ");
   put_line("Se debe insertar al final ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 6, Esta, Pos)");
   put_line("Ahora deberia escribir que no esta, y en la posicion 2: ");
   posicion_lista_ordenada(Lis, 6, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 7);
   insertar_al_comienzo(Lis, 5);
   insertar_al_comienzo(Lis, 3);
   put_line("Caso de prueba 3.1: lista de varios elementos. El elemento buscado al comienzo ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 3, Esta, Pos)");
   put_line("Ahora deberia escribir que si esta, y en la posicion uno: ");
   posicion_lista_ordenada(Lis, 3, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 7);
   insertar_al_comienzo(Lis, 5);
   insertar_al_comienzo(Lis, 3);
   put_line("Caso de prueba 3.2: lista de varios elementos. El elemento buscado en medio ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 7, Esta, Pos)");
   put_line("Ahora deberia escribir que si esta, y en la posicion 3: ");
   posicion_lista_ordenada(Lis, 7, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 7);
   insertar_al_comienzo(Lis, 5);
   insertar_al_comienzo(Lis, 3);
   put_line("Caso de prueba 3.3: lista de varios elementos. El elemento buscado al final ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 9, Esta, Pos)");
   put_line("Ahora deberia escribir que si esta, y en la posicion 4: ");
   posicion_lista_ordenada(Lis, 9, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 7);
   insertar_al_comienzo(Lis, 5);
   insertar_al_comienzo(Lis, 3);
   put_line("Caso de prueba 3.4: lista de varios elementos. El elemento buscado no esta ");
   put_line("  Se debe insertar al comienzo ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 2, Esta, Pos)");
   put_line("Ahora deberia escribir que no esta, y en la posicion uno: ");
   posicion_lista_ordenada(Lis, 2, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 7);
   insertar_al_comienzo(Lis, 5);
   insertar_al_comienzo(Lis, 3);
   put_line("Caso de prueba 3.5: lista de varios elementos. El elemento buscado no esta ");
   put_line("  Se debe insertar en medio ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 6, Esta, Pos)");
   put_line("Ahora deberia escribir que no esta, y en la posicion 3: ");
   posicion_lista_ordenada(Lis, 6, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 7);
   insertar_al_comienzo(Lis, 5);
   insertar_al_comienzo(Lis, 3);
   put_line("Caso de prueba 3.6: lista de varios elementos. El elemento buscado no esta ");
   put_line("  Se debe insertar al final ");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Llamada a : posicion_lista_ordenada(Lis, 12, Esta, Pos)");
   put_line("Ahora deberia escribir que no esta, y en la posicion 5: ");
   posicion_lista_ordenada(Lis, 12, Esta, Pos);
   put("Esta: "); put(Esta); put(" Posicion: "); put(Pos);
   new_line;
   new_line;
   pedir_return;

   put_line("Se acabo la prueba. Agur ");

end prueba_posicion_lista_ordenada;


