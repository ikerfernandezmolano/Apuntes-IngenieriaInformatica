with Ada.Text_IO, Ada.Integer_Text_IO, datos;
use Ada.Text_IO, Ada.Integer_Text_IO, datos;

procedure escribir ( L : in Lista ) is 
   -- pre:  Tienes una lista con datos o no, porque puede estar vacía.
   -- post: Se imprime en pantalla los valores de la lista.
   Actual : Lista;  
begin
   new_line(2);
   put("El contenido de la lista es: ");
   new_line;
   put("< ");
   Actual:=L;
   loop exit when Actual=null;
      put(Actual.Info);
      Actual:=Actual.Sig;
   end loop;
   put("          >");
   new_line;
end escribir;
