with Ada.Text_Io, Ada.Integer_Text_Io, datos;
with crear_lista_vacia, insertar_al_comienzo, escribir, calcular_maximo_y_posicion;
use Ada.Text_Io, Ada.Integer_Text_Io, datos;


procedure prueba_calcular_maximo_y_posicion is 

   Lis : Lista; -- variable del programa principal   
   Maximo, Posicion: Integer;
   
   procedure pedir_return is 
   begin
      put_line("pulsa return para continuar ");
      skip_line;
   end pedir_return;

begin -- programa principal
   -- Casos de prueba:
   --   1. Lista vacia. Resultado: cero
   --   2. Lista no vacia. Lista de un elemento
   --   3. Lista no vacia. Varios elementos
   --         3.1. El maximo al comienzo
   --         3.2. El maximo en medio
   --         3.3. El maximo al final
   
   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(Lis);
   put_line("Caso de prueba 1: Lista vacia ");
   put_line("Ahora deberia escribir cero: ");
   calcular_maximo_y_posicion(Lis, Maximo, Posicion);
   put("Maximo: "); put(Maximo); put(" Posicion: "); put(Posicion);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 4);
   put_line("Caso de prueba 2: lista de un solo elemento.");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Ahora deberia escribir 4, 1: ");
   calcular_maximo_y_posicion(Lis, Maximo, Posicion);
   put("Maximo: "); put(Maximo); put(" Posicion: "); put(Posicion);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 6);
   insertar_al_comienzo(Lis, 8);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 10);
   put_line("Caso de prueba 3.1: lista de varios elementos. Maximo al comienzo");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Ahora deberia escribir 10, 1: ");
   calcular_maximo_y_posicion(Lis, Maximo, Posicion);
   put("Maximo: "); put(Maximo); put(" Posicion: "); put(Posicion);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 8);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 10);
   insertar_al_comienzo(Lis, 6);
   put_line("Caso de prueba 3.2: lista de varios elementos. Maximo en medio");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Ahora deberia escribir 10, 2: ");
   calcular_maximo_y_posicion(Lis, Maximo, Posicion);
   put("Maximo: "); put(Maximo); put(" Posicion: "); put(Posicion);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 10);
   insertar_al_comienzo(Lis, 6);
   insertar_al_comienzo(Lis, 8);
   insertar_al_comienzo(Lis, 9);
   put_line("Caso de prueba 3.3: lista de varios elementos. Maximo al final");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Ahora deberia escribir 10, 4: ");
   calcular_maximo_y_posicion(Lis, Maximo, Posicion);
   put("Maximo: "); put(Maximo); put(" Posicion: "); put(Posicion);
   new_line;
   new_line;
   pedir_return;

   put_line("Se acabo la prueba. Agur ");
   
end prueba_calcular_maximo_y_posicion;


