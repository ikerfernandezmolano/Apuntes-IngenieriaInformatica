function es_internacional(codigo_de_autobus:in Integer) return Boolean is
   primer_digito:Integer:=codigo_de_autobus;
   internacional:Boolean:=False;
begin
   primer_digito:=codigo_de_autobus/10000;
   if primer_digito=34 then
      internacional:=True;
   end if;
   return internacional;
end es_internacional;
