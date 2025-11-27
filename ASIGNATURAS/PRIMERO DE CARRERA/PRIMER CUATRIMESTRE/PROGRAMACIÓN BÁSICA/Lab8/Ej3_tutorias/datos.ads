package datos is

   NA: constant Integer := 60; -- Numero maximo de alumnos
   subtype Rango_Alumnos is Integer range 1..NA;

   type T_DNIs is array (Rango_Alumnos) of Positive;

   type Info_dia is record
      Fecha: String(1..10);  -- en formato "aaaa/mm/dd"
      Cuantos_alumn: Natural;
      DNIs: T_DNIs;
   end record;

   NDL: constant Integer := 200; -- Numero maximo de dias laborables
   subtype Rango_dias_laborables is Integer range 1..NDL;

   type T_dias is array (Rango_Dias_laborables) of Info_dia;

   type Info_calendario is record
      Cuantos_Dias: Natural;
      Dias: T_dias;
   end record;

   type Info_tutorias is record
      DNI: Positive;
      Tutorias_Totales: Natural;
   end record;

   type T_tutorias is array(Rango_Alumnos) of Info_tutorias;

   type Lista_tutorias_alumnos is record
      Cuantas: Natural;
      Tutorias: T_tutorias;
   end record;

end datos;
