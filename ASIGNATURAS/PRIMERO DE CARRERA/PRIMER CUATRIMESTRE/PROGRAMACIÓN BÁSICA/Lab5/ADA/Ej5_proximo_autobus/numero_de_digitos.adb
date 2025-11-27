function numero_de_digitos(codigo_de_autobus:in Integer) return Integer is

   --- Entrada: Un codigo de autobus (Integer)
   --- Pre: el codigo de autobus es >=0
   --- Salida: un valor Integer
   --- Post: se devuelve el numero de digitos del codigo de autobus
   n_aux:Integer;
   n_digitos:Integer:=0;
begin
   n_aux:=codigo_de_autobus;
   loop exit when n_aux=0;
      n_aux:=n_aux/10;
      n_digitos:=n_digitos+1;
   end loop;
return n_digitos;
end numero_de_digitos;
