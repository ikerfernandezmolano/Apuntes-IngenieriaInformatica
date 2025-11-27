with datos; use datos;
function balanceado (C : in Cadena) return Boolean is
   C_aux:Cadena;
   balanceado:Boolean:=True;
   encontrada_pareja:Boolean;
   X:Integer;
   Ind:Integer:=1;
begin
   C_aux.Long:=0;
   while Ind<=C.Long and balanceado loop
      if C.Caracteres(Ind)='{' or C.Caracteres(Ind)='}' or C.Caracteres(Ind)='(' or C.Caracteres(Ind)=')' then
         C_aux.Long:=C_aux.Long+1;
         C_aux.Caracteres(C_aux.Long):=C.Caracteres(Ind);
         encontrada_pareja:=False;
         X:=C_aux.Long-1;
         while not encontrada_pareja and X>0 and balanceado loop
            if C_aux.Caracteres(C_aux.Long)='}' and C_aux.Caracteres(X)='{' then
               C_aux.Long:=C_aux.Long-2;
               encontrada_pareja:=True;
            elsif C_aux.Caracteres(C_aux.Long)='{' and C_aux.Caracteres(X)='}' then
               C_aux.Long:=C_aux.Long-2;
               encontrada_pareja:=True;
            elsif C_aux.Caracteres(C_aux.Long)=')' and C_aux.Caracteres(X)='(' then
               C_aux.Long:=C_aux.Long-2;
               encontrada_pareja:=True;
            elsif C_aux.Caracteres(C_aux.Long)='(' and C_aux.Caracteres(X)=')' then
               C_aux.Long:=C_aux.Long-2;
               encontrada_pareja:=True;
            elsif C_aux.Caracteres(C_aux.Long)=')' and X=1 and C_aux.Caracteres(X)/='(' then
               balanceado:=False;
            elsif C_aux.Caracteres(C_aux.Long)='}' and X=1 and C_aux.Caracteres(X)/='{' then
               balanceado:=False;
            else
               X:=X-1;
            end if;
         end loop;
      end if;
      Ind:=Ind+1;
   end loop;
   if C_aux.Long/=0 then
      balanceado:=False;
   end if;
   return balanceado;
end balanceado;