with datos; use datos;

procedure insertar_valor_en_pos (L:in out Lista;Num:in Integer;Pos:in Integer) is 
   -- pre: Se dan dos valores Num que es entero y Pos>0 y Pos<=Numero de elementos+1
   -- post: Se ha insertado Num en la posición que indica Pos
   Nuevo:Lista;  
   Actual:Lista;
   Anterior:Lista;
begin
   Nuevo:=new Nodo;
   Nuevo.Info:=Num;
   Actual:=L;
   if L/=null then
      for i in 1..Pos-1 loop
         Anterior:=Actual;
         Actual:=Actual.Sig;
      end loop;
      if Anterior/=null then
         Nuevo.Sig:=Actual;
         Anterior.Sig:=Nuevo; 
      else
         Nuevo.Sig:=Actual;
         L:=Nuevo;
      end if;
   else
      L:=Nuevo;
   end if;
end insertar_valor_en_pos;
