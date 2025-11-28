with datos; use datos;

function interseccion (L1,L2:in Lista) return Lista is 
   -- pre: L1 no tiene elementos repetidos.
   --      L2 no tiene elementos repetidos.
   -- post: la lista que se devuelve contiene los elementos que estan en L1 y L2,
   --       es decir, la interseccion de L1 y L2
   L3:Lista;
   Actual1:Lista:=L1;
   Actual2:Lista:=L2;
   Nuevo : Lista:=null;
begin
   
   if L1/=null and L2/=null then
      loop exit when Actual1=null;
         loop exit when Actual2=null;
            if Actual1.Info=Actual2.Info then
               Nuevo:=new Nodo;
               Nuevo.Info:=Actual1.Info;
               Nuevo.Sig:=L3;
               L3:=Nuevo;
            end if;
            Actual2:=Actual2.Sig;
         end loop;
         Actual1:=Actual1.Sig;
         Actual2:=L2;
      end loop;
   end if;
   return L3;
end interseccion;
