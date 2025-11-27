with vectores;
use vectores;

function esta_en_vector_ordenado (n:in Integer; V:in Vector_De_Enteros ) return Boolean is
   -- pre: V contiene al menos un elemento (V'Last >= 1)
   --      V esta ordenado ascendentemente:
   --              V(i) <= V(i+1),      1 <= i < V'last
   -- post: el resultado es True si N esta en V y False si no
   --       El algoritmo es eficiente aprovechando que V esta ordenado
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
   exit when esta or cont> V'Last or Numero>n;
   end loop;
return esta;
end esta_en_vector_ordenado;

