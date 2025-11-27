with datos; use datos;

procedure insertar_al_final (L:in out Lista;Num:in Integer)is 
   -- pre:
   -- post: se ha insertado Num al final de L
   Nuevo:Lista:=null;
   Actual:Lista:=L;
begin
   Nuevo:=new Nodo;
   Nuevo.Info:=Num;
   if L/=null then
      loop exit when Actual.Sig=null;
         Actual:=Actual.Sig;
      end loop;
      Actual.Sig:=Nuevo;
   else
      L:=Nuevo;
   end if;
end insertar_al_final;

