with Ada.Text_Io, Ada.Integer_Text_Io, datos;
with crear_lista_vacia, escribir, insertar_valor_en_pos,insertar_al_comienzo;
use Ada.Text_Io, Ada.Integer_Text_Io, datos;

procedure prueba_insertar_valor_en_pos is
   Lis: Lista;
   --Pre:
   --Post:Se imprime en pantalla el vector con el número colocado en la posición que corresponde.
   procedure pedir_return is
   begin
      put_line("pulsa return para continuar ");
      skip_line;
   end pedir_return;
begin
   put_line("Programa de prueba: ");
   put_line("*********");

   crear_lista_vacia(Lis);
   put_line("Caso de prueba 1: Insertar en lista vacia ");
   escribir(Lis);
   put_line("Llamada a : insertar_valor_en_pos(Lis, 4,1)");
   insertar_valor_en_pos(Lis, 4, 1);
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis,5);
   put_line("Caso de prueba 2: Insertar al comienzo de una lista con un elemento ");
   escribir(Lis);
   put_line("Llamada a : insertar_valor_en_pos(Lis, 4,1)");
   insertar_valor_en_pos(Lis, 4, 1);
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis,5);
   put_line("Caso de prueba 3: Insertar al final de una lista con un elemento ");
   escribir(Lis);
   put_line("Llamada a : insertar_valor_en_pos(Lis, 4,2)");
   insertar_valor_en_pos(Lis, 4, 2);
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis,5);
   insertar_al_comienzo(Lis,6);
   insertar_al_comienzo(Lis,7);
   put_line("Caso de prueba 4: Insertar al principio de una lista con varios elementos ");
   escribir(Lis);
   put_line("Llamada a : insertar_valor_en_pos(Lis, 4,1)");
   insertar_valor_en_pos(Lis, 4, 1);
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis,5);
   insertar_al_comienzo(Lis,6);
   insertar_al_comienzo(Lis,7);
   put_line("Caso de prueba 5: Insertar en medio de una lista con varios elementos ");
   escribir(Lis);
   put_line("Llamada a : insertar_valor_en_pos(Lis, 4,2)");
   insertar_valor_en_pos(Lis, 4, 2);
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   crear_lista_vacia(Lis);
   insertar_al_comienzo(Lis,5);
   insertar_al_comienzo(Lis,6);
   insertar_al_comienzo(Lis,7);
   put_line("Caso de prueba 6: Insertar en final de una lista con varios elementos ");
   escribir(Lis);
   put_line("Llamada a : insertar_valor_en_pos(Lis, 4,3)");
   insertar_valor_en_pos(Lis, 4, 4);
   escribir(Lis);
   new_line;
   new_line;
   pedir_return;

   put_line("Se acabo la prueba. Agur ");

end prueba_insertar_valor_en_pos;
