with datos; use datos;

procedure posicion_lista_ordenada (L:Lista;Num:Integer;Esta:out Boolean;Pos:out Natural)is 
   -- pre: L esta ordenada, con sus valores de menor a mayor
   -- post: Esta valdra true si Num pertenece a L y false si no
   --       Pos es la posicion de la primera aparicion de Num, 
   --       en caso de que Num pertenezca a L, y si no
   --       sera la posicion en que deberia colocarse Num
   Actual:Lista:=L;
begin
   Esta:=False;
   Pos:=1;
   if L/=null then
      loop exit when Num=Actual.Info or else Actual.Sig=null or else Actual.Info>Num;
         Actual:=Actual.Sig;
         Pos:=Pos+1;
      end loop;
      if Num=Actual.Info then
         Esta:=True;
      elsif Actual.Sig=null and Actual.Info<Num then
         pos:=pos+1;
      end if;
   end if;
end posicion_lista_ordenada;







