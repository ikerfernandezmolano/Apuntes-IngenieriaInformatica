with Ada.Text_Io, datos;
with crear_lista_vacia, escribir, insertar_al_comienzo, interseccion;
use Ada.Text_Io, datos;

procedure prueba_interseccion is 

   Lis1, Lis2 : Lista; -- variables del programa principal   

   procedure pedir_return is 
   begin
      put_line("pulsa return para continuar ");
      skip_line;
   end pedir_return;
   
begin -- programa principal
   -- Casos de prueba:
   --   1. Dos listas vacias. 
   --   2. Una lista vacia y la otra no. 
   --   3. Listas de un solo elemento que es comun. 
   --   4. Listas de un solo elemento que es distinto. 
   --   5. Listas de varios elementos. 
   --           5.1. Listas de varios elementos. Elementos comunes
   --           5.2. Listas de varios elementos. Elementos disjuntos
   
   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(Lis1);
   crear_lista_vacia(Lis2);
   put_line("Caso de prueba 1: Listas vacias ");
   put_line("Las listas iniciales contienen ");
   escribir(Lis1);
   escribir(Lis2);
   put_line("Ahora deberia escribir la lista vacia: ");
   escribir(Interseccion(Lis1, Lis2));
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis1);
   crear_lista_vacia(Lis2);
   insertar_al_comienzo(Lis1, 3);
   insertar_al_comienzo(Lis1, 5);
   put_line("Caso de prueba 2: Una lista vacia y la otra no. ");
   put_line("Las listas iniciales contienen ");
   escribir(Lis1);
   escribir(Lis2);
   put_line("Ahora deberia escribir la lista vacia: ");
   escribir(Interseccion(Lis1, Lis2));
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis1);
   crear_lista_vacia(Lis2);
   insertar_al_comienzo(Lis1, 3);
   insertar_al_comienzo(Lis2, 3);
   put_line("Caso de prueba 3: Listas de un solo elemento que es comun. ");
   put_line("Las listas iniciales contienen ");
   escribir(Lis1);
   escribir(Lis2);
   put_line("Ahora deberia escribir la lista <3> ");
   escribir(Interseccion(Lis1, Lis2));
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis1);
   crear_lista_vacia(Lis2);
   insertar_al_comienzo(Lis1, 3);
   insertar_al_comienzo(Lis2, 5);
   put_line("Caso de prueba 4: Listas de un solo elemento que es distinto. ");
   put_line("Las listas iniciales contienen ");
   escribir(Lis1);
   escribir(Lis2);
   put_line("Ahora deberia escribir la lista <> ");
   escribir(Interseccion(Lis1, Lis2));
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis1);
   crear_lista_vacia(Lis2);
   insertar_al_comienzo(Lis1, 3);
   insertar_al_comienzo(Lis1, 5);
   insertar_al_comienzo(Lis1, 7);
   insertar_al_comienzo(Lis1, 9);
   insertar_al_comienzo(Lis2, 5);
   insertar_al_comienzo(Lis2, 9);
   put_line("Caso de prueba 5.1: Listas de varios elementos. Elementos comunes. ");
   put_line("Las listas iniciales contienen ");
   escribir(Lis1);
   escribir(Lis2);
   put_line("Ahora deberia escribir la lista <9, 5> ");
   escribir(Interseccion(Lis1, Lis2));
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis1);
   crear_lista_vacia(Lis2);
   insertar_al_comienzo(Lis1, 3);
   insertar_al_comienzo(Lis1, 5);
   insertar_al_comienzo(Lis1, 7);
   insertar_al_comienzo(Lis1, 9);
   insertar_al_comienzo(Lis2, 11);
   insertar_al_comienzo(Lis2, 13);
   put_line("Caso de prueba 5.2: Listas de varios elementos. Elementos disjuntos. ");
   put_line("Las listas iniciales contienen ");
   escribir(Lis1);
   escribir(Lis2);
   put_line("Ahora deberia escribir la lista <> ");
   escribir(Interseccion(Lis1, Lis2));
   new_line;
   new_line;
   pedir_return;

   put_line("Se acabo la prueba. Agur ");

end prueba_interseccion;


