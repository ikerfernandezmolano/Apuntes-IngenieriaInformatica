with ADA.Text_IO; use ADA.Text_IO;
with O_o_mayor;
procedure prueba_dec_a_hex is
begin
   put("Caso 1: Para el número decimal 0, su hexadecimal es 0. (PULSA ENTER)");
   skip_line;
   put("El programa devuelve: ");
   O_o_mayor(0);
   skip_line;

   put("Caso 2: Para el número decimal 1, su hexadecimal es 1. (PULSA ENTER)");
   skip_line;
   put("El programa devuelve: ");
   O_o_mayor(1);
   skip_line;

   put("Caso 3: Para el número decimal 10, su hexadecimal es A. (PULSA ENTER)");
   skip_line;
   put("El programa devuelve: ");
   O_o_mayor(10);
   skip_line;

   put("Caso 4: Para el número decimal 15, su hexadecimal es F. (PULSA ENTER)");
   skip_line;
   put("El programa devuelve: ");
   O_o_mayor(15);
   skip_line;

   put("Caso 5: Para el número decimal 16, su hexadecimal es 10. (PULSA ENTER)");
   skip_line;
   put("El programa devuelve: ");
   O_o_mayor(16);
   skip_line;

   put("Caso 6: Para el número decimal 62, su hexadecimal es 3E. (PULSA ENTER)");
   skip_line;
   put("El programa devuelve: ");
   O_o_mayor(62);
   skip_line;

   put("Caso 7: Para el número decimal 100, su hexadecimal es 64. (PULSA ENTER)");
   skip_line;
   put("El programa devuelve: ");
   O_o_mayor(100);
   skip_line;

   put("Caso 8: Para el número decimal 9174, su hexadecimal es 23D6. (PULSA ENTER)");
   skip_line;
   put("El programa devuelve: ");
   O_o_mayor(9174);
   skip_line;
end prueba_dec_a_hex;
