with ADA.Text_IO; use ADA.Text_IO;
function es_capicua (n: in integer) return boolean is
   -- pre: n >= 1
   -- post: el resultado True si n es capicua y False si no
    
   Resto_Digitos,cont:Integer:=0; 
   capicua:Boolean:=False;
   N_Inverso,digito:Integer;
begin
  digito:=n;
  if n>9 then
   loop  
      Resto_Digitos:=Resto_Digitos*10+(digito rem 10);
      digito:=digito/10;
      exit when digito=0;
   end loop;
   N_Inverso:=Resto_Digitos;
  else                        
      N_Inverso:=n;
  end if;
  if N_Inverso=n then 
     capicua:=True;
  end if;
return capicua;
end es_capicua;
