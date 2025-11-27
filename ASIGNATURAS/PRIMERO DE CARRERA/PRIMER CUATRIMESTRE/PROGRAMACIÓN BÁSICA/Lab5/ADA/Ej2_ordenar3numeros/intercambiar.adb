with ADA.Text_IO, ADA.Integer_Text_IO;
use ADA.Text_IO, ADA.Integer_Text_IO;

procedure intercambiar(num1,num2: in out integer) is
   aux: integer;
begin
   aux:=num1;
   num1:=num2;
   num2:=aux;
end intercambiar;
