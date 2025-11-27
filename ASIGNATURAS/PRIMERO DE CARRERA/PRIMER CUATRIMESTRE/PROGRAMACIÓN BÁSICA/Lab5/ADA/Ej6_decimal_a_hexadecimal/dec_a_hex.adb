with ADA.Text_IO; use ADA.Text_IO;
procedure dec_a_hex(n:in Integer)is
   digito:Integer;
begin
   if n>0 then
      dec_a_hex(n/16);
      if n rem 16=15 then
         put(" F");
      elsif n rem 16=14 then
         put(" E");
      elsif n rem 16=13 then
         put(" D");
      elsif n rem 16=12 then
         put(" C");
      elsif n rem 16=11 then
         put(" B");
      elsif n rem 16=10 then
         put(" A");
      elsif n rem 16<10 then
         digito:=n rem 16;
         put(digito'img&"");
      end if;
   end if;
end dec_a_hex;
