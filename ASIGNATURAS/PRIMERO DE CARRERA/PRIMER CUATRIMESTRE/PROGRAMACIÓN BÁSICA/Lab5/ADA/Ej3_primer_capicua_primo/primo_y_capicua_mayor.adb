with es_capicua,es_primo;
with Ada.Text_IO; use Ada.Text_IO;

function primo_y_capicua_mayor (n: in integer) return integer is
   -- pre: n >= 1
   -- post: el resultado es un valor n2 tal que n2 es el primer capicua y primo mayor que n
   x:Integer;
   primo_capymay:boolean;
begin
   x:=0;
   primo_capymay:=False;
   loop exit when primo_capymay;
      x:=x+1;
      if es_capicua(n+x) then
         if es_primo(n+x) then
            primo_capymay:=True;
         end if;
      end if;
   end loop;
   return n+x;
end primo_y_capicua_mayor;
