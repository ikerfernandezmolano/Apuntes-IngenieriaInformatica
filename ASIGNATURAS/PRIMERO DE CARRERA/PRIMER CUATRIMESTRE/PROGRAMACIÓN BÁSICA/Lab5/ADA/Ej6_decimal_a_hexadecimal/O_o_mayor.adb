with ADA.Text_IO; use ADA.Text_IO;
with dec_a_hex;
procedure O_o_mayor(n:in Integer)is
begin
   if n=0 then
      put(" 0");
   elsif n>0 then
      dec_a_hex(n);
   end if;
end O_o_mayor;
