with datos, Ada.Text_Io;
use datos, Ada.Text_Io;

procedure eliminar_primera_aparicion (L:in out Lista;Num:in Integer)is 
   -- Pre: 
   -- Post: se ha eliminado de L la primera aparicion de Num
   --       en caso de que Num no estuviera en L se escribiria un mensaje
   Actual:Lista:=L;
   Anterior:Lista;
   enc:Boolean:=False;
begin
   if L/=null then
      loop exit when Actual=null or else enc;
         if Actual.Info=Num then
            enc:=True; 
         else 
           Anterior:=Actual;
           Actual:=Actual.Sig;
         end if;
      end loop;
      if enc and Anterior/=null then
         Anterior.Sig:=Actual.Sig;
      elsif Anterior=null then
         L:=Anterior;
      end if;
   end if;
   if not enc then
      put("No se ha encontrado el elemento en el vector.");
      new_line;
   end if;
end eliminar_primera_aparicion;
