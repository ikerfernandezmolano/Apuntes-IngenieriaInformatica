with datos; use datos;

function posicion (L:Lista;Num : Integer ) return Natural is 
   -- pre:  la lista L  no tiene elementos repetidos
   -- post: el resultado es la posicion de la primera aparicion de Num, 
   --       en el caso de que Num pertenezca a L; y cero en otro caso
   Actual:Lista:=L;
   Pos:Natural:=1;
   enc:Boolean:=False;
begin
   if L/=null then
      loop exit when Num=Actual.Info or Actual.Sig=null;
         Actual:=Actual.Sig;
         Pos:=Pos+1;
      end loop;
      if Num=Actual.Info then
         enc:=True;
      end if;
   end if;
   if not enc then
      pos:=0;
   end if;
   return pos;
end posicion;


