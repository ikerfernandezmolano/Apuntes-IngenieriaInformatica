with def_datos; use def_datos;

function esta (N:in Integer;L:in Lista_De_Enteros)return Boolean is 
   -- Precondicion: 
   -- Postcondicion: el resultado es True si N se encuentra en L y False si no.
   Repetido:Boolean:=False;
   X:Integer:=1;
begin
   while not Repetido and X<=L.Cuantos loop
      if N=L.Numeros(X) then
         Repetido:=True;
      else
         X:=X+1;
      end if;
  end loop;
  return Repetido; 
end esta;

