with def_datos; use def_datos;
with esta;

procedure eliminar_repetidos (Lista_Original:in Lista_De_Enteros;Lista_Resultado:out Lista_De_Enteros) is 
   -- Precondicion: 
   -- Postcondicion: Lista_Resultado contiene los elementos de Lista_Original pero sin repetidos.
   
begin
   if Lista_Original.Cuantos/=0 then
      Lista_Resultado.Numeros(1):=Lista_Original.Numeros(1);
      Lista_Resultado.Cuantos:=1;
      for Ind in 2..Lista_Original.Cuantos loop
         if esta(Lista_Original.Numeros(Ind),Lista_Resultado)=False then
            Lista_Resultado.Cuantos:=Lista_Resultado.Cuantos+1;
            Lista_Resultado.Numeros(Lista_Resultado.Cuantos):=Lista_Original.Numeros(Ind);
         end if;
      end loop;
   else
      Lista_Resultado.Cuantos:=0;
   end if;
end eliminar_repetidos;

