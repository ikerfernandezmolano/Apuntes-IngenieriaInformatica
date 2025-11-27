with vectores; use vectores;
with escribir_lista;

procedure insertar_elemento_en_pos (N:in Integer;Pos:In Integer;L:in out Lista_Enteros) is
   -- pre: la posicion de insercion sera menor o igual
   --      que el numero de elementos que contenga la lista +1
   -- post: el elemento quedara insertado en la posicion de insercion
   --       y el resto de los elementos quedaran desplazados hacia la derecha 
begin
   for cont in reverse Pos..L.Cont loop
       L.Numeros(cont+1):=L.Numeros(cont);
   end loop;
   L.Numeros(Pos):=N;
   L.Cont:=L.Cont+1;
end insertar_elemento_en_pos;
