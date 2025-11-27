with Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO;
use Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO;
with proximo_autobus;

procedure prueba_proximo_autobus is
   -- Este programa sirve para probar el subprograma proximo_autobus
   -- con diversos casos de prueba

   codigo_bus, hora, minutos, resultado, esperado: Integer;
   tipo_dia: Character;

begin

   -- Caso de prueba 1 - el que se da en el enunciado.
   codigo_bus:= 10001;
   hora:= 13;
   minutos:=37;
   tipo_dia:='L';
   esperado:= 3;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 1: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
   put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");

   -- Caso de prueba 2 - el que se da en el enunciado pero en un dia festivo
   codigo_bus:= 10001;
   hora:= 13;
   minutos:=37;
   tipo_dia:='F';
   esperado:=8;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 2: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");

      -- Caso de prueba 3 - el que se da en el enunciado pero en un sabado
   codigo_bus:= 10001;
   hora:= 13;
   minutos:=37;
   tipo_dia:='S';
   esperado:=8;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 3: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");

      -- Caso de prueba 4 - el que se da en el enunciado pero faltando cero minutos
   codigo_bus:= 10001;
   hora:= 13;
   minutos:=40;
   tipo_dia:='L';
   esperado:= 0;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 4: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
   put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");

   -- Caso de prueba 5 - de bus tipo bizkaibus con primer digito 2 y dia laborable
   codigo_bus:= 20001;
   hora:= 12;
   minutos:=18;
   tipo_dia:='L';
   esperado:=2;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 5: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
   put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   El caso con primer digito 3 tendria el mismo resultado");
   new_line;
   put_line("#################################");
   
   -- Caso de prueba 6 - de bus tipo bizkaibus con primer digito 2 y sabado
   codigo_bus:= 20001;
   hora:= 23;
   minutos:=38;
   tipo_dia:='S';
   esperado:=2;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 6: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   El caso con primer digito 3 tendria el mismo resultado");
   new_line;
   put_line("#################################");
   
      -- Caso de prueba 7 - de bus tipo bizkaibus con primer digito 2 y dia festivo
   codigo_bus:= 20001;
   hora:= 15;
   minutos:=40;
   tipo_dia:='F';
   esperado:=20;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 7: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   El caso con primer digito 3 tendria el mismo resultado");
   new_line;
   put_line("#################################");

            -- Caso de prueba 8 - de bus tipo bizkaibus con primer digito 2, dia festivo y que falten 0 minutos
   codigo_bus:= 20001;
   hora:= 15;
   minutos:=30;
   tipo_dia:='F';
   esperado:=0;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 8: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   El caso con primer digito 3 tendria el mismo resultado");
   new_line;
   put_line("#################################");

            -- Caso de prueba 9 - de bus tipo regional y dia laboral
   codigo_bus:= 48001;
   hora:= 15;
   minutos:=19;
   tipo_dia:='L';
   esperado:=11;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 9: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 10 - de bus tipo regional y sabado
   codigo_bus:= 48001;
   hora:= 15;
   minutos:=19;
   tipo_dia:='F';
   esperado:=11;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 10: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 11 - de bus tipo regional y dia festivo
   codigo_bus:= 48001;
   hora:= 15;
   minutos:=19;
   tipo_dia:='F';
   esperado:=11;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 11: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 12 - de bus tipo regional, dia festivo y faltan 0 minutos
   codigo_bus:= 48001;
   hora:= 15;
   minutos:=30;
   tipo_dia:='F';
   esperado:=0;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 12: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   En los casos de dias laborables y sabados, tendria el mismo resultado");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 13 - de bus tipo nacional y dia laborable
   codigo_bus:= 731;
   hora:= 15;
   minutos:=10;
   tipo_dia:='L';
   esperado:=80;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 13: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   El caso de que el codigo del bus tuviese 4 digitos en vez de 3 tendria el mismo resultado");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 14 - de bus tipo nacional y sabado
   codigo_bus:= 731;
   hora:= 15;
   minutos:=19;
   tipo_dia:='S';
   esperado:=41;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 14: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   El caso de que el codigo del bus tuviese 4 digitos en vez de 3 tendria el mismo resultado");
   new_line;     
   put_line("#################################");
   
               -- Caso de prueba 15 - de bus tipo nacional y dia festivo
   codigo_bus:= 0731;
   hora:= 13;
   minutos:=20;
   tipo_dia:='F';
   esperado:=160;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 15: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   El caso de que el codigo del bus tuviese 3 digitos en vez de 4 tendria el mismo resultado");
   new_line;   
   put_line("#################################");
   
                  -- Caso de prueba 16 - de bus tipo nacional, dia laborable y faltan 0 minutos
   codigo_bus:= 731;
   hora:= 15;
   minutos:=00;
   tipo_dia:='F';
   esperado:=0;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 16: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   En los casos de dias festivos y sabados, tendria el mismo resultado");
   new_line;
   put_line("#################################");
   
                  -- Caso de prueba 17 - de bus tipo internacional y dia laborable
   codigo_bus:= 349045;
   hora:= 17;
   minutos:=00;
   tipo_dia:='L';
   esperado:=420;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 17: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 18 - de bus tipo internacional y sabado
   codigo_bus:= 349045;
   hora:= 9;
   minutos:=00;
   tipo_dia:='S';
   esperado:=420;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 18: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 19 - de bus tipo internacional y dia festivo
   codigo_bus:= 349045;
   hora:= 13;
   minutos:=30;
   tipo_dia:='F';
   esperado:=630;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 19: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
                  -- Caso de prueba 20 - de bus tipo internacional, dia laborable y faltan 0 minutos
   codigo_bus:= 349045;
   hora:= 12;
   minutos:=00;
   tipo_dia:='F';
   esperado:=0;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 20: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   En los casos de dias festivos y sabados, tendria el mismo resultado");
   new_line;
   put_line("#################################");
   
            -- Caso de prueba 21 - de bus tipo especial y dia laboral
   codigo_bus:= 73;
   hora:= 15;
   minutos:=19;
   tipo_dia:='L';
   esperado:=41;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 21: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 22 - de bus tipo especial y sabado
   codigo_bus:= 4801;
   hora:= 15;
   minutos:=19;
   tipo_dia:='S';
   esperado:=41;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 22: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
   
               -- Caso de prueba 23 - de bus tipo especial y dia festivo
   codigo_bus:= 481;
   hora:= 15;
   minutos:=19;
   tipo_dia:='F';
   esperado:=41;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 23: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("#################################");
   
                  -- Caso de prueba 24 - de bus tipo especial, dia festivo y faltan 0 minutos
   codigo_bus:= 73;
   hora:= 15;
   minutos:=00;
   tipo_dia:='F';
   esperado:=0;
   resultado:=proximo_autobus(codigo_bus, hora, minutos, tipo_dia);
   put_line("Caso 24: Son las " & hora'image & " y " & minutos'image & " horas de un dia " & tipo_dia'img);
    put_line("El proximo bus con codigo " & codigo_bus'img & " sale en " & esperado'img & " minutos");
   put_line("   Y segun tu programa sale en: " & resultado'img & " minutos");
   new_line;
   put_line("   En los casos de dias laborables y sabados, tendria el mismo resultado");
   new_line;
   put_line("#################################");

end prueba_proximo_autobus ;
