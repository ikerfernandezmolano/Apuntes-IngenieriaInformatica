with ADA.Text_IO; use ADA.Text_IO;
with datos2; use datos2;
function es_palindromo_recursivo(C:in Cadena;inicio,final:in Integer) return Boolean is
palindromo:Boolean;
begin
   palindromo:=True;
   if inicio<=final then
      if C.Caracteres(inicio)=C.Caracteres(final) then
         palindromo:=es_palindromo_recursivo(C,inicio+1,final-1);
      elsif C.Caracteres(inicio)=' ' then
         palindromo:=es_palindromo_recursivo(C,inicio+1,final);
      elsif C.Caracteres(final)=' ' then
         palindromo:=es_palindromo_recursivo(C,inicio,final-1);
      elsif C.Caracteres(inicio)/=C.Caracteres(final) then
         palindromo:=False;
      end if;
   end if;
   return palindromo;

end es_palindromo_recursivo;
