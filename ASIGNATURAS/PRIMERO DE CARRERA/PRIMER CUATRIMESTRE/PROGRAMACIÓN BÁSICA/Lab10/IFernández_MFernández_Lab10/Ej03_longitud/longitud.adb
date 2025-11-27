with datos; use datos;

function longitud ( L : Lista ) return Natural is 
  -- pre: Tienes una lista con n elementos
  -- post: Devuelve n
   Elem:Natural:=0;
   Actual:Lista;
begin
   Actual:=L;
   if Actual/=null then 
      loop exit when Actual=null;   
         Actual:=Actual.Sig;
         Elem:=Elem+1;
      end loop;
   end if;
   return Elem;
end longitud;
