with ADA.Text_IO; use ADA.Text_IO;
with numero_de_digitos, es_bilbobus, es_bizkaibus,
     es_regional, es_nacional, es_internacional;

function tipo_de_autobus(codigo_de_autobus:in Integer) return Integer is
   n_dig,tipo:Integer;
   bilbobus,bizkaibus,regional,nacional,internacional:Boolean:=False;
begin
   n_dig:=numero_de_digitos(codigo_de_autobus);
   if n_dig=5 then
      bilbobus:=es_bilbobus(codigo_de_autobus);
      if bilbobus=False then
         bizkaibus:=es_bizkaibus(codigo_de_autobus);
         if bizkaibus=False then
            regional:=es_regional(codigo_de_autobus);
            if regional=False then
               tipo:=6;
            else
               tipo:=3;
            end if;
         else
            tipo:=2;
         end if;
      else
         tipo:=1;
      end if;
   elsif n_dig=3 or n_dig=4 then
      nacional:=es_nacional(codigo_de_autobus,n_dig);
      if nacional=False then
         tipo:=6;
      else
         tipo:=4;
      end if;
   elsif n_dig=6 then
      internacional:=es_internacional(codigo_de_autobus);
      if internacional=False then
         tipo:=6;
      else
         tipo:=5;
      end if;
   else
      tipo:=6;
   end if;
return tipo;
end tipo_de_autobus;
