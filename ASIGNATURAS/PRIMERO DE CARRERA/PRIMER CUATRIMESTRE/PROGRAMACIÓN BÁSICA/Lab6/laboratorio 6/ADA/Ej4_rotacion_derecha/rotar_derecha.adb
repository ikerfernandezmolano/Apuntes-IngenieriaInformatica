with vectores; use vectores;

procedure rotar_derecha (V:in out  Vector_De_Enteros) is
   -- pre: El array esta lleno de informacion relevante
   -- post: se desplazaran todos los elementos hacia la derecha y el ultimo elemento
   --       pasara a ser el primero
num_aux,num:Integer; 
begin
   num:=V(V'Last);
   num_aux:=V(1);
   V(1):=num;
   for cont in 2..V'Last loop
      num:=V(cont);
      V(cont):=num_aux;
      num_aux:=num;
   end loop;
end rotar_derecha;

