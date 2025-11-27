with datos2; use datos2;
with es_palindromo_recursivo;

function es_palindromo (C : in Cadena) return Boolean is
-- pre: la cadena C solamente contiene letras en minuscula y/o espacios en blanco.
-- post: el resultado es true si C contiene un palindromo, y false si no
--       Los espacios en blanco NO se tienen en cuenta a la hora de decidir si la
--       cadena contiene o no un palindromo.
--       La funcion obtiene el resultado mediante una estrategia RECURSIVA.
inicio,final:Integer;
begin
   inicio:=1;
   final:=C.Long;
   return es_palindromo_recursivo(C,inicio,final);
end es_palindromo;
