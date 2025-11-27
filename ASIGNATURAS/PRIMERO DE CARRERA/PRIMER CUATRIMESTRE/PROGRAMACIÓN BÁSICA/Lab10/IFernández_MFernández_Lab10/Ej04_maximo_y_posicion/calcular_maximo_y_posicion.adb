with datos; use datos;

procedure calcular_maximo_y_posicion (L:in Lista;Max,Pos_Max:out Integer)is 
   -- pre: 
   -- post: Max contendra el mayor valor de L y Pos_Max su posicion
   --       Si L es vacia entonces Pos_Max vale cero
   Actual:Lista:=L;
   Aux,Pos:Integer:=0;
begin
   Pos_Max:=0;
   Max:=0;
   if Actual/=null then
      loop exit when Actual=null;
         Aux:=Actual.Info;
         Actual:=Actual.Sig;
         Pos:=Pos+1;
         if Max<Aux then
            Max:=Aux;
            Pos_Max:=Pos;
         end if;
      end loop;
   end if;
end calcular_maximo_y_posicion;
