with Ada.Text_Io, Ada.Integer_Text_Io; use Ada.Text_Io, Ada.Integer_Text_Io;
with matrices; use matrices;
with calcular_maximo;

procedure prueba_calcular_maximo is
   -- este programa hace llamadas al procedimiento calcular_maximo y es util
   -- para comprobar si su funcionamiento es correcto

   M1: Matriz_De_Enteros(1..4, 1..10);
   M2: Matriz_De_Enteros(1..2, 1..5);
   M3: Matriz_De_Enteros(1..5, 1..15);
maximo, posFila, posCol: integer;

begin
   M1 := ((1, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (7, 3, 5, 7, 9, 11, 13, 15, 17, 19));
   put_line("Caso 1: el maximo al final de la matriz");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (7, 3, 5, 7, 9, 11, 13, 15, 17, 19)), maximo, posFila, posCol))");
   put_line(" debe ser maximo=19 y fila=4 y columna=10 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   M1 := ((1, 3, 5, 7, 9, 11, 13, 15, 17, 199),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (7, 3, 5, 7, 9, 11, 13, 15, 17, 19));
           -- esto es lo mismo que hacer M1(1,1) := 1; ... M1(4, 10) := 19;
   put_line("Caso 2: el maximo al final de la primera fila");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9, 11, 13, 15, 17, 199)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (7, 3, 5, 7, 9, 11, 13, 15, 17, 19)), maximo, posFila, posCol))");
   put_line(" debe ser maximo=199 y fila=1 y columna=10 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   M1 := ((1, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 11, 13, 15, 17, 199),
          (7, 3, 5, 7, 9, 11, 13, 15, 17, 19));
           -- esto es lo mismo que hacer M1(1,1) := 1; ... M1(4, 10) := 19;
   put_line("Caso 3: el maximo al final de la tercera fila");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 11, 13, 15, 17, 199)");
   put_line("                 (7, 3, 5, 7, 9, 11, 13, 15, 17, 19)), maximo, posFila, posCol))");
   put_line(" debe ser maximo=199 y fila=3 y columna=10 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);


   M1 := ((1999, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 11, 13, 15, 17, 199),
          (7, 3, 5, 7, 9, 11, 13, 15, 17, 19));
           -- esto es lo mismo que hacer M1(1,1) := 1; ... M1(4, 10) := 19;
   put_line("Caso 4: el maximo al comienzo de la matriz");
   put_line(" Calcular_maximo((1999, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 11, 13, 15, 17, 199)");
   put_line("                 (7, 3, 5, 7, 9, 11, 13, 15, 17, 19)), maximo, posFila, posCol))");
   put_line(" debe ser maximo=1999 y fila=1 y columna=1 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);


   M1 := ((1, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 11, 13, 15, 17, 199),
          (799, 3, 5, 7, 9, 11, 13, 15, 17, 19));
           -- esto es lo mismo que hacer M1(1,1) := 1; ... M1(4, 10) := 19;
   put_line("Caso 5: el maximo al comienzo de la ultima fila");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 11, 13, 15, 17, 199)");
   put_line("                 (799, 3, 5, 7, 9, 11, 13, 15, 17, 19)), maximo, posFila, posCol))");
   put_line(" debe ser maximo=799 y fila=4 y columna=1 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);


   M1 := ((1, 3, 5, 7, 9, 1111, 13, 15, 17, 1),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 11, 13, 15, 17, 199),
          (7, 3, 5, 7, 9, 11, 13, 15, 17, 19));
           -- esto es lo mismo que hacer M1(1,1) := 1; ... M1(4, 10) := 19;
   put_line("Caso 6: el maximo en el medio de la primera fila");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9, 1111, 13, 15, 17, 1)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 11, 13, 15, 17, 199)");
   put_line("                 (7, 3, 5, 7, 9, 11, 13, 15, 17, 19)), maximo, posFila, posCol))");
   put_line(" debe ser maximo=1111 y fila=1 y columna=6 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);


   M1 := ((1, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 1111, 13, 15, 17, 199),
          (7, 3, 5, 7, 9, 11, 13, 15, 17, 19));
           -- esto es lo mismo que hacer M1(1,1) := 1; ... M1(4, 10) := 19;
   put_line("Caso 7: el maximo en el medio de una fila ni primera ni ultima");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 1111, 13, 15, 17, 199)");
   put_line("                 (7, 3, 5, 7, 9, 11, 13, 15, 17, 19)), maximo, posFila, posCol))");
   put_line(" debe ser maximo=1111 y fila=3 y columna=6 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   M1 := ((1, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 11, 13, 15, 17, 199),
          (7, 3, 5, 7, 9, 11, 1311, 15, 17, 19));
           -- esto es lo mismo que hacer M1(1,1) := 1; ... M1(4, 10) := 19;
   put_line("Caso 8: el maximo en el medio de la ultima fila");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 11, 13, 15, 17, 199)");
   put_line("                 (7, 3, 5, 7, 9, 11, 1311, 15, 17, 19)), maximo, posFila, posCol))");
   put_line(" debe ser maximo=1311 y fila=4 y columna=7 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   M1 := ((1, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (3, 3, 5, 7, 9, 11, 13, 15, 17, 1),
          (5, 3, 5, 7, 9, 11, 13, 15, 17, 199),
          (7, 3, 5, 7, 9, 11, 1311, 15, 17, 1311));
   put_line("Caso 9: el maximo repetido");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (3, 3, 5, 7, 9, 11, 13, 15, 17, 1)");
   put_line("                 (5, 3, 5, 7, 9, 11, 13, 15, 17, 199)");
   put_line("                 (7, 3, 5, 7, 9, 11, 1311, 15, 17, 1311), maximo, posFila, posCol))");
   put_line(" debe ser maximo=1311 y fila=4 y columna=7 y el resultado es ");
   calcular_maximo(M1, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   M2 := ((1, 3, 5, 7, 9),
          (3, 3, 10, 7, 9));
   put_line("Caso 10: el maximo en medio de la segunda fila y en una matriz 5x2");
   put_line(" Calcular_maximo((1, 3, 5, 7, 9)");
   put_line("                 (3, 3, 10, 7, 9), maximo, posFila, posCol))");
   put_line(" debe ser maximo=10 y fila=2 y columna=3 y el resultado es ");
   calcular_maximo(M2, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

   M3 := ((1, 3, 5, 7, 1, 3, 5, 7, 9, 11, 13, 15, 17, 1, 11),
          (3, 3, 10, 3, 3, 5, 7, 9, 11, 13, 15, 17, 1, 7, 9),
          (3, 10, 3, 3, 5, 7, 5, 77, 7, 11, 13, 11, 13, 15, 17),
          (7, 3, 5, 7, 9, 11, 13, 15, 17, 19,1, 3, 5, 7, 7),
          (42, 13, 5, 34, 8, 12, 9, 54, 12, 13, 33, 21, 24, 31, 11));
   put_line("Caso 11: el maximo esta en el centro de la matriz que es 15x5");
   put_line(" Calcular_maximo((1, 3, 5, 7, 1, 3, 5, 7, 9, 11, 13, 15, 17, 1, 11)");
   put_line("                 (3, 3, 10, 3, 3, 5, 7, 9, 11, 13, 15, 17, 1, 7, 9)");
   put_line("                 (3, 10, 3, 3, 5, 7, 5, 77, 7, 11, 13, 11, 13, 15, 17)");
   put_line("                 (7, 3, 5, 7, 9, 11, 13, 15, 17, 19,1, 3, 5, 7, 7)");
   put_line("                 (42, 13, 5, 34, 8, 12, 9, 54, 12, 13, 33, 21, 24, 31, 11), maximo, posFila, posCol))");
   put_line(" debe ser maximo=77 y fila=3 y columna=8 y el resultado es ");
   calcular_maximo(M3, maximo, posFila, posCol);
   put(maximo); put(posFila); put(posCol);
   new_line(3);
   put_line("Pulsa return para continuar");
   skip_line;
   new_line(3);

end prueba_calcular_maximo;

