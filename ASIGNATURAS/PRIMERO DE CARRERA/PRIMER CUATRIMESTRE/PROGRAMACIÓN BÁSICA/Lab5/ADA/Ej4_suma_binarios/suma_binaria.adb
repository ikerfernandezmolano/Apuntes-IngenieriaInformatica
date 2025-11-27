function suma_binaria(binario1,binario2: in integer) return integer is
  sumaBin,resto1,resto2,llevada,peso,bin1,bin2,cont:integer;
begin
   bin1:=binario1;
   bin2:=binario2;
   llevada:=0;
   cont:=0;
   sumaBin:=0;
    loop exit when bin1=0 and bin2=0;
      resto1:=bin1 rem 10;
      bin1:=bin1/10;
      resto2:=bin2 rem 10;
      bin2:=bin2/10;
      peso:=resto1+resto2+llevada;
      if peso=2 then
         llevada:=1;
         peso:=0;
      elsif peso=3 then
         llevada:=1;
         peso:=1;
      else
         null;
      end if;
      sumaBin:=sumaBin+peso*10**cont;
      cont:=cont+1;
   end loop;
   if llevada=1 then
      sumaBin:=sumaBin+llevada*10**cont;
   end if;
return(sumaBin); 
end suma_binaria;
