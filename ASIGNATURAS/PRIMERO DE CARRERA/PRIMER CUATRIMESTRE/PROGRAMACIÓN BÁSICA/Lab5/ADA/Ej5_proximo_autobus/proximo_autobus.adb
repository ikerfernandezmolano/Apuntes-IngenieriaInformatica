with tipo_de_autobus,frecuencia_de_salida;
function proximo_autobus(codigo_de_autobus,hora_actual,minutos_actuales:in Integer;tipo_de_dia:in Character) return Integer is
   tipo_de_bus,frec,hora,tiempo,pasado,minutos_que_faltan:Integer;
begin
   tipo_de_bus:=tipo_de_autobus(codigo_de_autobus);
   frec:=frecuencia_de_salida(tipo_de_bus, tipo_de_dia);
   hora:=hora_actual*60;
   tiempo:=hora+minutos_actuales;
   pasado:=tiempo rem frec;
   if pasado=0 then
      minutos_que_faltan:=0;
   else
      minutos_que_faltan:=frec-pasado;
   end if;
return minutos_que_faltan;
end proximo_autobus;
