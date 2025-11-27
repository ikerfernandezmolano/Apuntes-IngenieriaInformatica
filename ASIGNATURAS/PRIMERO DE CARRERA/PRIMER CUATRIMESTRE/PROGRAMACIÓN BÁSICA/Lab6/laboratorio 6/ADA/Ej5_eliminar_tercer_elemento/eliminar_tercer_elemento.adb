with vectores; use vectores;

procedure eliminar_tercer_elemento (L:in out Lista_Enteros) is
   -- pre: los elementos de la lista no tienen por que estar ordenados
   -- post: si hay tres o mas elementos, el tercer elemento quedara eliminado
   --       y la lista no tiene por que mantener ningun orden particular (ni con
   --       respecto al orden que tenia inicialmente)
begin
   if L.Cont>=3 then
      L.Numeros(3):=L.Numeros(L.Cont);
      L.Cont:=L.Cont-1;
   end if;
end eliminar_tercer_elemento;

