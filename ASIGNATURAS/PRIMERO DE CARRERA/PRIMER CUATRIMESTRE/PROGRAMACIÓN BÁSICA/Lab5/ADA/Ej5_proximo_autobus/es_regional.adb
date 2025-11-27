function es_regional(codigo_de_autobus:in Integer) return Boolean is
   primeros_digitos:Integer:=codigo_de_autobus;
   regional:Boolean:=False;
begin
   primeros_digitos:=codigo_de_autobus/1000;
   if primeros_digitos=48 then
      regional:=True;
   end if;
   return regional;
end es_regional;
