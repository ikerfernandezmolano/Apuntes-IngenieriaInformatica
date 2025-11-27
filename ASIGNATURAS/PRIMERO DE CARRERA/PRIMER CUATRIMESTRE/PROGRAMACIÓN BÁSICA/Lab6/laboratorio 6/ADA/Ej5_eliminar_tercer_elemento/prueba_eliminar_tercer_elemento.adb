with Ada.Text_Io; use Ada.Text_Io;
with vectores; use vectores;
with eliminar_tercer_elemento, escribir_lista;

procedure prueba_eliminar_tercer_elemento is
   -- este programa hace llamadas al subprograma eliminar_tercer_elemento
   -- para comprobar si su funcionamiento es correcto

   Lista1, Lista2, Lista3, Lista4: Lista_Enteros;

begin

   Lista1.Numeros(1) := 1;
   Lista1.Numeros(2) := 2;
   Lista1.Numeros(3) := 3;
   Lista1.Numeros(4) := 4;
   Lista1.Cont := 4;
   put_line("Caso 1: lista de cuatro elementos: (1, 2, 3, 4)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista1);
   new_line;
   put_line(" el resultado deberia de ser 1 2 4  <--> SIN IMPORTAR EL ORDEN DE LOS ELEMENTOS");
   put_line("y la lista resultado es: ");
   eliminar_tercer_elemento(Lista1);
   escribir_lista(Lista1);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   Lista2.Numeros(1) := 1;
   Lista2.Numeros(2) := 2;
   Lista2.Cont := 2;
   put_line("Caso 2: lista de dos elementos: (1, 2)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista2);
   new_line;
   put_line(" no deberia de hacer nada, ya que el vector es < 3");
   put_line("y la lista resultado es: ");
   eliminar_tercer_elemento(Lista2);
   escribir_lista(Lista2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   Lista3.Numeros(1) := 1;
   Lista3.Numeros(2) := 2;
   Lista3.Numeros(3) := 3;
   Lista3.Numeros(4) := 4;
   Lista3.Numeros(5) := 5;
   Lista3.Numeros(6) := 6;
   Lista3.Numeros(7) := 7;
   Lista3.Numeros(8) := 8;
   Lista3.Numeros(9) := 9;
   Lista3.Numeros(10) := 10;
   Lista3.Cont := 10;
   put_line("Caso 3: lista de diez elementos: (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista3);
   new_line;
   put_line(" el resultado deberia de ser 1 2 10 4 5 6 7 8 9 <--> SIN IMPORTAR EL ORDEN DE LOS ELEMENTOS");
   put_line("y la lista resultado es: ");
   eliminar_tercer_elemento(Lista3);
   escribir_lista(Lista3);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   Lista4.Numeros(1) := 1;
   Lista4.Numeros(2) := 2;
   Lista4.Numeros(3) := 3;
   Lista4.Cont := 3;
   put_line("Caso 4: lista de tres elementos: (1, 2, 3)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista4);
   new_line;
   put_line(" el resultado deberia de ser 1 2 <--> SIN IMPORTAR EL ORDEN DE LOS ELEMENTOS");
   put_line("y la lista resultado es: ");
   eliminar_tercer_elemento(Lista4);
   escribir_lista(Lista4);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

end prueba_eliminar_tercer_elemento;

