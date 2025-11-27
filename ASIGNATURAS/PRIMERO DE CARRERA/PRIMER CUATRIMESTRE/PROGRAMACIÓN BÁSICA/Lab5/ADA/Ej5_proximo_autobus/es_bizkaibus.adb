function es_bizkaibus(codigo_de_autobus:in Integer) return Boolean is
   primer_digito:Integer:=codigo_de_autobus;   bizkaibus:Boolean:=False;
begin
   primer_digito:=codigo_de_autobus/10000;
   if primer_digito=2 or primer_digito=3 then
      bizkaibus:=True;
   end if;
   return bizkaibus;
end es_bizkaibus;
