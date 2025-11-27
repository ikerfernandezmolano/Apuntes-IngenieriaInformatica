function es_nacional(codigo_de_autobus,n_dig:in Integer) return Boolean is
   primeros_digitos:Integer:=codigo_de_autobus;
   nacional:Boolean:=False;
begin
   if n_dig=3 then
      primeros_digitos:=codigo_de_autobus/10;
      if primeros_digitos/=48 then
         nacional:=True;
      end if;
   else
       primeros_digitos:=codigo_de_autobus/100;
       if primeros_digitos/=48 then
       nacional:=True;
      end if;
   end if;
   return nacional;
   end es_nacional;
