with Ada.Text_Io, Ada.Float_Text_Io, datos;
with crear_lista_vacia, insertar_al_comienzo, escribir, media;
use Ada.Text_Io, Ada.Float_Text_Io, datos;

procedure prueba_media is 


   Lis : Lista; -- variable del programa principal   

   procedure pedir_return is 
   begin
      put_line("Pulsa return para continuar ");
      skip_line;
   end pedir_return;

begin -- programa principal
   -- Casos de prueba:
   --   1. Lista vacia. Resultado: cero
   --   2. Lista no vacia. Lista de un elemento
   --   3. Lista no vacia. Varios elementos
   
   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(Lis);
   put_line("Caso de prueba 1: Lista vacia ");
   put_line("Ahora deberia escribir cero: ");
   put(media(Lis), exp => 0);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 4);
   put_line("Caso de prueba 2: lista de un solo elemento.");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Ahora deberia escribir 4.00: ");
   put(media(Lis), exp => 0);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis, 6);
   insertar_al_comienzo(Lis, 8);
   insertar_al_comienzo(Lis, 9);
   insertar_al_comienzo(Lis, 10);
   put_line("Caso de prueba 3: lista de varios elementos.");
   put_line("La lista inicial contiene ");
   escribir(Lis);
   put_line("Ahora deberia escribir 8.25: ");
   put(media(Lis), exp => 0);
   new_line;
   new_line;
   pedir_return;

   put_line("Se acabo la prueba. Agur ");
   
end prueba_media ;


