with Ada.Text_Io; use Ada.Text_Io;
with def_datos; use def_datos;
with eliminar_repetidos, escribir_lista;

procedure prueba_eliminar_repetidos is 

   V1, V2 : Lista_De_Enteros;  

begin

   put_line("Primera prueba: eliminar_repetidos(1,2,3,4,5,6,7,8,9,10)");
   V1.Numeros := (1,2,3,4,5,6,7,8,9,10, OTHERS => 0);
   V1.Cuantos := 10;
   escribir_lista(V1);
   new_line;
   put_line("Despues de eliminar repetidos:");
   eliminar_repetidos(V1, V2);
   escribir_lista(V2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;

   put_line("Segunda prueba: eliminar_repetidos(1,1,1,1,1,1,1,1,1,1)");
   V1.Numeros := (1,1,1,1,1,1,1,1,1,1, OTHERS => 0);
   V1.Cuantos := 10;
   escribir_lista(V1);
   new_line;
   put_line("Despues de eliminar repetidos:");
   eliminar_repetidos(V1, V2);
   escribir_lista(V2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;

   put_line("Tercera prueba: eliminar_repetidos(1,3,1,3,1,3,1,3,1,1)");
   V1.Numeros := (1,3,1,3,1,3,1,3,1,1, OTHERS => 0);
   V1.Cuantos := 10;
   escribir_lista(V1);
   new_line;
   put_line("Despues de eliminar repetidos:");
   eliminar_repetidos(V1, V2);
   escribir_lista(V2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   
   put_line("Cuarta prueba: eliminar_repetidos(1,1,1,2,3,3,3,2,3,2)");
   V1.Numeros := (1,1,1,2,3,3,3,2,3,2, OTHERS => 0);
   V1.Cuantos := 10;
   escribir_lista(V1);
   new_line;
   put_line("Despues de eliminar repetidos:");
   eliminar_repetidos(V1, V2);
   escribir_lista(V2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   
   put_line("Quinta prueba: eliminar_repetidos(1,1,1,2,3,3,3,2,3,2,4,4,5,6,1)");
   V1.Numeros := (1,1,1,2,3,3,3,2,3,2,4,4,5,6,1, OTHERS => 0);
   V1.Cuantos := 15;
   escribir_lista(V1);
   new_line;
   put_line("Despues de eliminar repetidos:");
   eliminar_repetidos(V1, V2);
   escribir_lista(V2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   
   put_line("Sexta prueba: eliminar_repetidos(1)");
   V1.Numeros := (1, OTHERS => 0);
   V1.Cuantos := 1;
   escribir_lista(V1);
   new_line;
   put_line("Despues de eliminar repetidos:");
   eliminar_repetidos(V1, V2);
   escribir_lista(V2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   
   put_line("Septima prueba: eliminar_repetidos()");
   V1.Numeros := (OTHERS => 0);
   V1.Cuantos := 0;
   escribir_lista(V1);
   new_line;
   put_line("Despues de eliminar repetidos:");
   eliminar_repetidos(V1, V2);
   escribir_lista(V2);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   
end prueba_eliminar_repetidos;
