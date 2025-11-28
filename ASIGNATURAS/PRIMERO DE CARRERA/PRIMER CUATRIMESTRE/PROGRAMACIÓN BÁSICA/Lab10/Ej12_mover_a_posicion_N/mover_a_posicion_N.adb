with datos; use datos;

procedure mover_a_posicion_N (L:in out Lista;N:in Integer) is 
   -- pre: Se da una lista con M elementos y un numero N, tal que 1<=N<=M
   -- post: Se devuelve la lista, con los elementos a partir del elemento en la posicion N, colocados al principio de la lista, en el mismo orden
   --      en el que estaban, seguido de los numeros antecesores al elemento en posicion N.
   InicioL:Lista:=L;
   Actual:Lista:=L;
   Anterior:Lista;
begin
   if L/=null and then L.Sig/=null and then N/=1 then
      for Ind in 1..N-1 loop
         Anterior:=Actual;
         Actual:=Actual.Sig;
      end loop;
      Anterior.Sig:=null;
      L:=Actual;
      loop exit when Actual.Sig=null;
         Actual:=Actual.Sig;
      end loop;
      Actual.Sig:=InicioL;
   end if;
end mover_a_posicion_N;
