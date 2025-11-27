with matrices; use matrices;
procedure calcular_maximo (M:in Matriz_De_Enteros; N:out Integer;Pos_F:out Integer;Pos_C:out Integer) is
N_Aux:Integer;
begin
   N:=M(1,1);
   Pos_F:=M'First(1);
   Pos_C:=M'First(2);
   for Fila in M'First(1)..M'Last(1) loop
      for Columna in M'First(2)..M'Last(2) loop
         N_Aux:=M(Fila,Columna);
         if N<N_Aux then
            N:=N_Aux;
            Pos_F:=Fila;
            Pos_C:=Columna;
         end if;
      end loop;
   end loop;
end calcular_maximo;

