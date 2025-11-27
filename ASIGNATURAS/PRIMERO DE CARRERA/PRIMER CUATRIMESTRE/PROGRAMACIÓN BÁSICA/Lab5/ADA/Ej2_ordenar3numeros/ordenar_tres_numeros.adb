with ADA.Text_IO, ADA.Integer_Text_IO;
use ADA.Text_IO, ADA.Integer_Text_IO;
with ordenar_dos_numeros;
procedure ordenar_tres_numeros(n1,n2,n3: in out integer) is
---entrada: 3 numeros
    --Pre: no seran iguales entre si
---salida: 3 numeros
   ---Post: estaran ordenados de mayor a menor
begin
    ordenar_dos_numeros(n1,n2);
    ordenar_dos_numeros(n2,n3);
    ordenar_dos_numeros(n1,n2);
end ordenar_tres_numeros;
