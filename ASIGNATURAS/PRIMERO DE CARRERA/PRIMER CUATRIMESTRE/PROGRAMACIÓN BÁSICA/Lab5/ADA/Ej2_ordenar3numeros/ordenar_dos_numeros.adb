with ADA.Text_IO, ADA.Integer_Text_IO;
use ADA.Text_IO, ADA.Integer_Text_IO;
with intercambiar;
procedure ordenar_dos_numeros(n1,n2:in out Integer) is
begin
   if n1<n2 then
      intercambiar(n1,n2);
   end if;
    
end ordenar_dos_numeros;
