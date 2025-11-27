with ADA.Text_IO, ADA.Integer_Text_IO;
use ADA.Text_IO, ADA.Integer_Text_IO;

function decimal_a_binario (n: in integer) return Integer is
   --- Entrada: 1 numero
   --- pre: el numero entero es >= 0
   --- Salida: 1 numero
   --- post: el resultado ser el numero binario equivalente al numero de entrada
   nDec_aux:Integer;
   cont:Integer:=0;
   resto:Integer:=0;
begin
   nDec_aux:=n;
   loop exit when nDec_aux=1 or nDec_aux=0; 
      resto:=resto+nDec_aux rem 2*10**cont;
      nDec_aux:=nDec_aux/2;
      cont:=cont+1;
   end loop;
   if nDec_aux=1 then
      resto:=resto+nDec_aux*10**cont;
   else
      resto:=0;
   end if;
   return resto;
end decimal_a_binario;
