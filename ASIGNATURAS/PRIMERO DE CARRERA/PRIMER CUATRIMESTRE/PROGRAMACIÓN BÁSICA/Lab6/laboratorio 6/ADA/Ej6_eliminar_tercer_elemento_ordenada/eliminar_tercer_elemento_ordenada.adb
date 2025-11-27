with vectores; use vectores;

procedure eliminar_tercer_elemento_ordenada (L:in out Lista_Enteros) is
begin
   if L.Cont>2 then
      for cont in 4..L.Cont loop
         L.Numeros(cont-1):=L.Numeros(cont);
      end loop;
      L.Cont:=L.Cont-1;
   end if;
end eliminar_tercer_elemento_ordenada;

