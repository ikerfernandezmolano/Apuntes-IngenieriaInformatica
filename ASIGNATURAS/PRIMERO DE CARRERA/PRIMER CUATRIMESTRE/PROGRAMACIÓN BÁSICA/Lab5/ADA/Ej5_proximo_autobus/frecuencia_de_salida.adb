function frecuencia_de_salida(tipo_de_autobus:in Integer;tipo_de_dia:in Character) return Integer is
   minutos:Integer;
begin
   if tipo_de_dia='L' and tipo_de_autobus/=6 and tipo_de_autobus/=3 then
      if tipo_de_autobus=1 then
         minutos:=10;
      elsif tipo_de_autobus=2 then
         minutos:=20;                
      elsif tipo_de_autobus=4 then
         minutos:=90;         
      else
         minutos:=480;     
      end if;
   elsif tipo_de_dia='F' and tipo_de_autobus/=6 and tipo_de_autobus/=3 then
      if tipo_de_autobus=1 then
         minutos:=15;         
      elsif tipo_de_autobus=2 then
         minutos:=30;         
      elsif tipo_de_autobus=4 then
         minutos:=240;         
      else
         minutos:=720;      
      end if;
   elsif tipo_de_dia='S' and tipo_de_autobus/=6 and tipo_de_autobus/=3 then
      if tipo_de_autobus=1 then
         minutos:=15;         
      elsif tipo_de_autobus=2 then
         minutos:=20;         
      elsif tipo_de_autobus=4 then
         minutos:=120;         
      else
         minutos:=480;      
      end if;
   elsif tipo_de_autobus=6 then
      minutos:=60;
   elsif tipo_de_autobus=3 then
      minutos:=30;
   else
      null;
   end if;
   return minutos;
end frecuencia_de_salida;
