with Ada.Integer_Text_IO,Ada.Text_IO;
use Ada.Integer_Text_IO,Ada.Text_IO;
with decimal_a_binario;

procedure prueba_decimal_a_binario is

numDec,numBin:integer;


begin
    put_line("Primera prueba: 1");
    put("Tu programa deberia devolver 1");
    new_line;
    numDec:=1;
    numBin:=decimal_a_binario(numDec);
	put("y devuelve: "); put(decimal_a_binario(numDec));
	new_line;
    put("Pulsa intro para continuar");
    skip_Line;
    new_line;
    

    put_line("Segunda prueba: 2");
    put("Tu programa deberia devolver 10");
    new_line;
    numDec:=2;
    numBin:=decimal_a_binario(numDec);
	put("y devuelve: "); put(decimal_a_binario(numDec));
	new_line;
    put("Pulsa intro para continuar");
    skip_Line;
    new_line;

    put_line("Tercera prueba: 8");
    put("Tu programa deberia devolver 1000");
    new_line;
    numDec:=8;---rellena la llamada
    numBin:=decimal_a_binario(numDec);
    put("y devuelve: "); put(decimal_a_binario(numDec));
	new_line;
    put("Pulsa intro para continuar");
    skip_Line;
    new_line;

    put_line("Cuarta prueba: 9");
    put("Tu programa deberia devolver 1001");
    new_line;
    numDec:=9;---rellena la llamada
    numBin:=decimal_a_binario(numDec);
    put("y devuelve: "); put(decimal_a_binario(numDec));
	new_line;
    put("Pulsa intro para continuar");
    skip_Line;
   new_line;
   
    put_line("Quinta prueba: 0");
    put("Tu programa deberia devolver 0");
    new_line;
    numDec:=0;---rellena la llamada
    numBin:=decimal_a_binario(numDec);
    put("y devuelve: "); put(decimal_a_binario(numDec));
	new_line;
    put("Pulsa intro para continuar");
    skip_Line;
    new_line;

   put_line("Sexta prueba: 31");
    put("Tu programa deberia devolver 11111");
    new_line;
    numDec:=31;---rellena la llamada
    numBin:=decimal_a_binario(numDec);
    put("y devuelve: "); put(decimal_a_binario(numDec));
	new_line;
    put("Pulsa intro para continuar");
    skip_Line;
    new_line;
   
end prueba_decimal_a_binario;
