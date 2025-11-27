function es_primo (n: in integer) return boolean is 
--Especificación
--Entrada: Un número entero n
--Pre: n >=1
--Salida: un booleano
--Post: valor_salida1 será true si n es primo y false si n no es primo

   posible_Divisor:Integer;
   primo:boolean;

begin
    Primo:=True;
    posible_divisor:=2;
    loop exit when  primo=false or posible_divisor>n/2;                
      if n rem posible_divisor/=0 then
         posible_divisor:=posible_Divisor+1;
      else
         primo:=false;
      end if;
   end loop;
   return primo;
end es_primo;
