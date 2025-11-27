with datos; use datos;

procedure eliminar_todas_las_apariciones (L:in out Lista;Num:in Integer)is 
   -- Pre: 
   -- Post: se han eliminado de L todas las apariciones de Num
   Actual:Lista:=L;
   Anterior:Lista:=L;
begin
   loop exit when Actual=null or else Actual.Info/=Num;
      L:=Actual.Sig; 
      Actual:=L;    
   end loop;
   loop exit when Actual=null;
      if Actual.Info=Num then
         if Anterior/=null then
            Anterior.Sig:=Actual.Sig;
         end if;
      else
         Anterior:=Actual;
      end if;
      Actual:=Actual.Sig;
   end loop;
end eliminar_todas_las_apariciones;
