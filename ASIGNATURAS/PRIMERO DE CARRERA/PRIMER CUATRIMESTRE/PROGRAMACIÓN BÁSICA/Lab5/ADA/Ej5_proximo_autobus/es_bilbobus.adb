function es_bilbobus(codigo_de_autobus:in Integer) return Boolean is
   primer_digito:Integer:=codigo_de_autobus;
   bilbobus:Boolean:=False;
begin
   primer_digito:=codigo_de_autobus/10000;
   if primer_digito=1 then
      bilbobus:=True;
   end if;
   return bilbobus;
end es_bilbobus;
