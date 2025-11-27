with vectores;
use vectores;

function esta_en_vector (n:in Integer; V:in Vector_De_Enteros ) return Boolean is
   -- pre: el vector V contiene al menos un elemento (V'Last >= 1)
   -- los elementos no siguen ningun orden
   -- post: el resultado es True si el valor N esta en V y False si no
   esta:Boolean;
   Numero,cont:Integer;
begin
   esta:=False;
   cont:=1;
   loop
      Numero:=V(cont);
      cont:=cont+1;
      if n=Numero then
         esta:=True;
      end if;
   exit when esta or cont> V'Last;
   end loop;
return esta;
end esta_en_vector;

