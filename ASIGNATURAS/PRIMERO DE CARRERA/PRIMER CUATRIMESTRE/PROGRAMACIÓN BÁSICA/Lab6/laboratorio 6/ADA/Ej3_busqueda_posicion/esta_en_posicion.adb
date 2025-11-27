with vectores;
use vectores;

function esta_en_posicion (n:in Integer; V:in Vector_De_Enteros ) return Integer is
   -- pre: V contiene al menos un elemento (V'Last >= 1)
   -- los elementos no siguen ningun orden. el elemento que se busca no tiene por que estar en el vector V
   -- post: devolvera la posicion en la que se encuentre el elemento, y si no estuviese devolvera -1
   esta:Boolean;
   Numero,cont:Integer;
begin
   esta:=False;
   cont:=1;
   loop
      Numero:=V(cont);
      cont:=cont+1;
      if n=Numero then
         cont:=cont-1;
         esta:=True;
      end if;
   exit when esta or cont> V'Last;
   end loop;
   if esta=False then
      cont:=-1;
   end if;
return cont;
end esta_en_posicion;

