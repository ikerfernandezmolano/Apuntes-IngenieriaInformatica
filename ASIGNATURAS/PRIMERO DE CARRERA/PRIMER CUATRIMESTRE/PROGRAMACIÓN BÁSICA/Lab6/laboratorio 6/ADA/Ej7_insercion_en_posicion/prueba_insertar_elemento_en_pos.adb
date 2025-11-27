with Ada.Text_Io; use Ada.Text_Io;
with vectores; use vectores;
with escribir_lista, insertar_elemento_en_pos;

procedure prueba_insertar_elemento_en_pos is 
   -- este programa hace llamadas al subprograma insertar_elemento_en_pos
   -- para comprobar si su funcionamiento es correcto

Lista1: Lista_Enteros;
pos,num: integer;

begin
   
   -- ningun elemento y la posicion de insercion sera 1
   
   pos:=1;
   num:=2;
   Lista1.Cont := 0;
   put_line("Caso 1: lista con 0 elementos: ");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista1);
   new_line;
   put_line(" deberia anadir el 2 en la primera posicion y la lista resultado es: ");
   insertar_elemento_en_pos(num,pos,Lista1);
   escribir_lista(Lista1);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   -- lista con varios elementos, y anadir al comienzo
   
   pos:=1;
   num:=2;
   Lista1.Numeros(1) := 3; Lista1.Numeros(2) := 1; Lista1.Numeros(3) := 4;
   Lista1.Numeros(4) := 8; Lista1.Numeros(5) := 6;
   Lista1.Cont := 5;
   put_line("Caso 2: anadir al comienzo en lista de varios elementos: (3 1 4 8 6)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista1);
   put_line(" al insertar el 2 al comienzo el resultado deberia de ser 2 3 1 4 8 6 y la lista resultado es: ");
   insertar_elemento_en_pos(num,pos,Lista1);
   escribir_lista(Lista1);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   -- lista con varios elementos, y anadir al final
  
   Lista1.Numeros(1) := 3; Lista1.Numeros(2) := 1; Lista1.Numeros(3) := 4;
   Lista1.Numeros(4) := 8; Lista1.Numeros(5) := 6;
   Lista1.Cont := 5;
   pos:=Lista1.Cont+1;
   num:=2;
   put_line("Caso 3: anadir el 2 al final en lista de varios elementos: (3 1 4 8 6)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista1);
   put_line(" al insertar el 2 al final el resultado deberia de ser 3 1 4 8 6 2 y la lista resultado es: ");
   insertar_elemento_en_pos(num,pos,Lista1);
   escribir_lista(Lista1);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);
   
   -- lista con varios elementos, y anadir en la mitad
  
   Lista1.Numeros(1) := 3; Lista1.Numeros(2) := 1; Lista1.Numeros(3) := 4;
   Lista1.Numeros(4) := 8; Lista1.Numeros(5) := 6;
   Lista1.Cont := 5;
   pos:=3;
   num:=2;
   put_line("Caso 4: anadir el 2 en mitad de la lista de varios elementos: (3 1 4 8 6)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista1);
   put_line(" al insertar el 2 en la mitad el resultado deberia de ser 3 1 2 4 8 6 y la lista resultado es: ");
   insertar_elemento_en_pos(num,pos,Lista1);
   escribir_lista(Lista1);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);
   
   -- lista con 9 elementos, y anadir al principio
  
   Lista1.Numeros(1) := 3; Lista1.Numeros(2) := 1; Lista1.Numeros(3) := 4;
   Lista1.Numeros(4) := 8; Lista1.Numeros(5) := 6; Lista1.Numeros(6) := 3; Lista1.Numeros(7) := 1; Lista1.Numeros(8) := 4;
   Lista1.Numeros(9) := 8;
   Lista1.Cont := 9;
   pos:=1;
   num:=2;
   put_line("Caso 5: anadir el 2 al principio de la lista de varios elementos: (3 1 4 8 6 3 1 4 8)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista1);
   put_line(" al insertar el 2 al principio el resultado deberia de ser 2 3 1 4 8 6 3 1 4 8 y la lista resultado es: ");
   insertar_elemento_en_pos(num,pos,Lista1);
   escribir_lista(Lista1);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);
   
   -- lista con 9 elementos, y anadir al final
  
   Lista1.Numeros(1) := 3; Lista1.Numeros(2) := 1; Lista1.Numeros(3) := 4;
   Lista1.Numeros(4) := 8; Lista1.Numeros(5) := 6; Lista1.Numeros(6) := 3; Lista1.Numeros(7) := 1; Lista1.Numeros(8) := 4;
   Lista1.Numeros(9) := 8;
   Lista1.Cont := 9;
   pos:=Lista1.Cont+1;
   num:=2;
   put_line("Caso 6: anadir el 2 al final de la lista de varios elementos: (3 1 4 8 6 3 1 4 8)");
   put_line(" la lista inicial es: ");
   escribir_lista(Lista1);
   put_line(" al insertar el 2 al final el resultado deberia de ser 3 1 4 8 6 3 1 4 8 2 y la lista resultado es: ");
   insertar_elemento_en_pos(num,pos,Lista1);
   escribir_lista(Lista1);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);
   
   
end prueba_insertar_elemento_en_pos;


