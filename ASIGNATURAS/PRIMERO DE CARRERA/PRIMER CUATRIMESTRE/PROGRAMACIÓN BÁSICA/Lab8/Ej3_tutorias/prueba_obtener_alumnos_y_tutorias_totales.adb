with Ada.Text_IO;
use Ada.Text_IO;
with datos, obtener_alumnos_y_tutorias_totales;
use datos;

procedure prueba_obtener_alumnos_y_tutorias_totales is
   -- este programa hace llamadas al subprograma obtener_alumnos_y_tutorias_totales
   -- para comprobar si su funcionamiento es correcto

   procedure imprimir_info_tutorias(L: in Lista_tutorias_alumnos) is
   begin
      new_line;
      for alumno in 1..L.Cuantas loop
         put(" * DNI " & L.Tutorias(alumno).DNI'image &" ha acudido " & L.Tutorias(alumno).Tutorias_Totales'image & " dias");
         new_line;
      end loop;
   end imprimir_info_tutorias;


   C: Info_Calendario;
   L: Lista_tutorias_alumnos;

begin

   C.Cuantos_Dias:= 5;

   C.Dias(1).Fecha:="2018/06/18";
   C.Dias(1).Cuantos_alumn:= 8;
   C.Dias(1).DNIs(1):= 11;
   C.Dias(1).DNIs(2):= 22;
   C.Dias(1).DNIs(3):= 33;
   C.Dias(1).DNIs(4):= 11;
   C.Dias(1).DNIs(5):= 22;
   C.Dias(1).DNIs(6):= 33;
   C.Dias(1).DNIs(7):= 44;
   C.Dias(1).DNIs(8):= 55;

   C.Dias(2).Fecha:="2018/06/19";
   C.Dias(2).Cuantos_alumn:= 3;
   C.Dias(2).DNIs(1):= 55;
   C.Dias(2).DNIs(2):= 22;
   C.Dias(2).DNIs(3):= 55;

   C.Dias(3).Fecha:="2018/06/20";
   C.Dias(3).Cuantos_alumn:= 0;

   C.Dias(4).Fecha:="2018/06/21";
   C.Dias(4).Cuantos_alumn:= 2;
   C.Dias(4).DNIs(1):= 22;
   C.Dias(4).DNIs(2):= 33;

   C.Dias(5).Fecha:="2018/06/22";
   C.Dias(5).Cuantos_alumn:= 5;
   C.Dias(5).DNIs(1):= 44;
   C.Dias(5).DNIs(2):= 33;
   C.Dias(5).DNIs(3):= 22;
   C.Dias(5).DNIs(4):= 44;
   C.Dias(5).DNIs(5):= 11;

   new_line;
   Put_Line("===============================");
   new_line;
   put_line("CASO DE PRUEBA 1 -- El resultado deberia ser el siguiente: ");
   put_line("(si bien en caso de empate el orden no importa)");
   new_line;
   put_line(" * DNI 22 ha acudido 4 dias");
   put_line(" * DNI 33 ha acudido 3 dias");
   put_line(" * DNI 55 ha acudido 2 dias");
   put_line(" * DNI 44 ha acudido 2 dias");
   put_line(" * DNI 11 ha acudido 2 dias");

   new_line;
   put_line("Y el resultado segun vuestro programa es:");
   obtener_alumnos_y_tutorias_totales(C,L);
   imprimir_info_tutorias(L);

   ------------------------------------------------------------

   C.Cuantos_Dias:= 5;

   C.Dias(1).Fecha:="2023/11/27";
   C.Dias(1).Cuantos_alumn:= 1;
   C.Dias(1).DNIs(1):= 22;

   C.Dias(2).Fecha:="2023/11/28";
   C.Dias(2).Cuantos_alumn:= 2;
   C.Dias(2).DNIs(1):= 22;
   C.Dias(2).DNIs(2):= 22;

   C.Dias(3).Fecha:="2023/11/29";
   C.Dias(3).Cuantos_alumn:= 1;
   C.Dias(3).DNIs(1):= 22;

   C.Dias(4).Fecha:="2023/11/30";
   C.Dias(4).Cuantos_alumn:= 1;
   C.Dias(4).DNIs(1):= 22;

   C.Dias(5).Fecha:="2023/12/01";
   C.Dias(5).Cuantos_alumn:= 2;
   C.Dias(5).DNIs(1):= 22;
   C.Dias(5).DNIs(2):= 22;

   new_line;
   Put_Line("===============================");
   new_line;
   put_line("CASO DE PRUEBA 2 -- El resultado deberia ser el siguiente: ");
   put_line("(si bien en caso de empate el orden no importa)");
   new_line;
   put_line(" * DNI 22 ha acudido 5 dias");

   new_line;
   put_line("Y el resultado segun vuestro programa es:");
   obtener_alumnos_y_tutorias_totales(C,L);
   imprimir_info_tutorias(L);

   ---------------------------------------------------------------------

   C.Cuantos_Dias:= 5;

   C.Dias(1).Fecha:="2023/06/18";
   C.Dias(1).Cuantos_alumn:= 7;
   C.Dias(1).DNIs(1):= 22;
   C.Dias(1).DNIs(2):= 33;
   C.Dias(1).DNIs(3):= 11;
   C.Dias(1).DNIs(4):= 22;
   C.Dias(1).DNIs(5):= 33;
   C.Dias(1).DNIs(6):= 44;
   C.Dias(1).DNIs(7):= 55;

   C.Dias(2).Fecha:="2023/06/19";
   C.Dias(2).Cuantos_alumn:= 3;
   C.Dias(2).DNIs(1):= 44;
   C.Dias(2).DNIs(2):= 22;
   C.Dias(2).DNIs(3):= 55;

   C.Dias(3).Fecha:="2023/06/20";
   C.Dias(3).Cuantos_alumn:= 2;
   C.Dias(3).DNIs(1):= 44;
   C.Dias(3).DNIs(2):= 55;

   C.Dias(4).Fecha:="2023/06/21";
   C.Dias(4).Cuantos_alumn:= 0;

   C.Dias(5).Fecha:="2023/06/22";
   C.Dias(5).Cuantos_alumn:= 0;

   new_line;
   Put_Line("===============================");
   new_line;
   put_line("CASO DE PRUEBA 3 -- El resultado deberia ser el siguiente: ");
   put_line("(si bien en caso de empate el orden no importa)");
   new_line;
   put_line(" * DNI 55 ha acudido 3 dias");
   put_line(" * DNI 44 ha acudido 3 dias");
   put_line(" * DNI 22 ha acudido 2 dias");
   put_line(" * DNI 33 ha acudido 1 dias");
   put_line(" * DNI 11 ha acudido 1 dias");

   new_line;
   put_line("Y el resultado segun vuestro programa es:");
   obtener_alumnos_y_tutorias_totales(C,L);
   imprimir_info_tutorias(L);

   ---------------------------------------------------------------

   C.Cuantos_Dias:= 5;

   C.Dias(1).Fecha:="2023/06/18";
   C.Dias(1).Cuantos_alumn:= 0;

   C.Dias(2).Fecha:="2023/06/19";
   C.Dias(2).Cuantos_alumn:= 0;

   C.Dias(3).Fecha:="2023/06/20";
   C.Dias(3).Cuantos_alumn:= 0;

   C.Dias(4).Fecha:="2023/06/21";
   C.Dias(4).Cuantos_alumn:= 0;

   C.Dias(5).Fecha:="2023/06/22";
   C.Dias(5).Cuantos_alumn:= 0;


   new_line;
   Put_Line("===============================");
   new_line;
   put_line("CASO DE PRUEBA 4 -- El resultado deberia ser el siguiente: ");
   put_line("(si bien en caso de empate el orden no importa)");
   new_line;

   new_line;
   put_line("Y el resultado segun vuestro programa es:");
   obtener_alumnos_y_tutorias_totales(C,L);
   imprimir_info_tutorias(L);

   ---------------------------------------------------------------

   C.Cuantos_Dias:= 5;

   C.Dias(1).Fecha:="2023/06/18";
   C.Dias(1).Cuantos_alumn:= 2;
   C.Dias(1).DNIs(1):= 44;
   C.Dias(1).DNIs(2):= 55;

   C.Dias(2).Fecha:="2023/06/19";
   C.Dias(2).Cuantos_alumn:= 2;
   C.Dias(2).DNIs(1):= 44;
   C.Dias(2).DNIs(2):= 55;

   C.Dias(3).Fecha:="2023/06/20";
   C.Dias(3).Cuantos_alumn:= 2;
   C.Dias(3).DNIs(1):= 44;
   C.Dias(3).DNIs(2):= 55;

   C.Dias(4).Fecha:="2023/06/21";
   C.Dias(4).Cuantos_alumn:= 2;
   C.Dias(4).DNIs(1):= 44;
   C.Dias(4).DNIs(2):= 55;

   C.Dias(5).Fecha:="2023/06/22";
   C.Dias(5).Cuantos_alumn:= 2;
   C.Dias(5).DNIs(1):= 44;
   C.Dias(5).DNIs(2):= 55;

   new_line;
   Put_Line("===============================");
   new_line;
   put_line("CASO DE PRUEBA 5 -- El resultado deberia ser el siguiente: ");
   put_line("(si bien en caso de empate el orden no importa)");
   new_line;
   put_line(" * DNI 55 ha acudido 5 dias");
   put_line(" * DNI 44 ha acudido 5 dias");

   new_line;
   put_line("Y el resultado segun vuestro programa es:");
   obtener_alumnos_y_tutorias_totales(C,L);
   imprimir_info_tutorias(L);

   ---------------------------------------------------------------

   C.Cuantos_Dias:= 5;

   C.Dias(1).Fecha:="2023/06/18";
   C.Dias(1).Cuantos_alumn:= 15;
   C.Dias(1).DNIs(1):= 44;
   C.Dias(1).DNIs(2):= 55;
   C.Dias(1).DNIs(3):= 44;
   C.Dias(1).DNIs(4):= 55;
   C.Dias(1).DNIs(5):= 44;
   C.Dias(1).DNIs(6):= 55;
   C.Dias(1).DNIs(7):= 44;
   C.Dias(1).DNIs(8):= 55;
   C.Dias(1).DNIs(9):= 44;
   C.Dias(1).DNIs(10):= 55;
   C.Dias(1).DNIs(11):= 44;
   C.Dias(1).DNIs(12):= 55;
   C.Dias(1).DNIs(13):= 44;
   C.Dias(1).DNIs(14):= 55;
   C.Dias(1).DNIs(15):= 44;

   C.Dias(2).Fecha:="2023/06/19";
   C.Dias(2).Cuantos_alumn:= 3;
   C.Dias(2).DNIs(1):= 44;
   C.Dias(2).DNIs(2):= 33;
   C.Dias(2).DNIs(3):= 55;

   C.Dias(3).Fecha:="2023/06/20";
   C.Dias(3).Cuantos_alumn:= 15;
   C.Dias(3).DNIs(1):= 44;
   C.Dias(3).DNIs(2):= 55;
   C.Dias(3).DNIs(3):= 44;
   C.Dias(3).DNIs(4):= 55;
   C.Dias(3).DNIs(5):= 44;
   C.Dias(3).DNIs(6):= 55;
   C.Dias(3).DNIs(7):= 44;
   C.Dias(3).DNIs(8):= 55;
   C.Dias(3).DNIs(9):= 44;
   C.Dias(3).DNIs(10):= 55;
   C.Dias(3).DNIs(11):= 44;
   C.Dias(3).DNIs(12):= 55;
   C.Dias(3).DNIs(13):= 44;
   C.Dias(3).DNIs(14):= 55;
   C.Dias(3).DNIs(15):= 44;

   C.Dias(4).Fecha:="2023/06/21";
   C.Dias(4).Cuantos_alumn:= 3;
   C.Dias(4).DNIs(1):= 44;
   C.Dias(4).DNIs(2):= 55;
   C.Dias(4).DNIs(3):= 33;

   C.Dias(5).Fecha:="2023/06/22";
   C.Dias(5).Cuantos_alumn:= 6;
   C.Dias(5).DNIs(1):= 44;
   C.Dias(5).DNIs(2):= 55;
   C.Dias(5).DNIs(3):= 44;
   C.Dias(5).DNIs(4):= 55;
   C.Dias(5).DNIs(5):= 33;
   C.Dias(5).DNIs(6):= 33;

   new_line;
   Put_Line("===============================");
   new_line;
   put_line("CASO DE PRUEBA 6 -- El resultado deberia ser el siguiente: ");
   put_line("(si bien en caso de empate el orden no importa)");
   new_line;
   put_line(" * DNI 55 ha acudido 5 dias");
   put_line(" * DNI 44 ha acudido 5 dias");
   put_line(" * DNI 33 ha acudido 3 dias");

   new_line;
   put_line("Y el resultado segun vuestro programa es:");
   obtener_alumnos_y_tutorias_totales(C,L);
   imprimir_info_tutorias(L);


end prueba_obtener_alumnos_y_tutorias_totales;
