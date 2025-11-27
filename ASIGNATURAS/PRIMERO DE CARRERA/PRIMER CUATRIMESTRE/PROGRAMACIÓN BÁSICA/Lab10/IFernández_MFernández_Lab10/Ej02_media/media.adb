with datos; use datos;

function media ( L : Lista ) return Float is 
   -- pre: Entra una lista con valores (Puede estar vacía)
   -- post: Devuelve la media de los valores dados
   Actual:Lista;
   Media,Elem:Float:=0.0;
   Sumatorio:Integer:=0;
   
begin
   Actual:=L;
   if Actual/=null then
      loop exit when Actual=null;
         Sumatorio:=Sumatorio+Actual.Info;
         Actual:=Actual.Sig;
         Elem:=Elem+1.0;
      end loop;
      Media:=float(Sumatorio)/Elem;
   end if;
   return Media;
end media;
