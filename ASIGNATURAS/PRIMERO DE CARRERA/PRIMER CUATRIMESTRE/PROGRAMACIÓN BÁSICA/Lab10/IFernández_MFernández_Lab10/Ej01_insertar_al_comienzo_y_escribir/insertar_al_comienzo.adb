with datos; use datos;

procedure insertar_al_comienzo (L   : in out Lista;Num : in     Integer ) is 
   -- pre:
   -- post: Se ha insertado Num al comienzo de L
   
   Nuevo : Lista:=null;  
begin
   Nuevo:=new Nodo;
   Nuevo.Info:=Num;
   Nuevo.Sig:=L;
   L:=Nuevo;
end insertar_al_comienzo;
