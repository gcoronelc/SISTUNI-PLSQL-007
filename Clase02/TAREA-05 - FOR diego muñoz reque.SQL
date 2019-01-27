CREATE OR REPLACE FUNCTION sumatoria(a NUMBER, b number) 
return number
is
v_suma number;
begin
v_suma:=0;
for n in a .. b loop
v_suma:=v_suma+n;
end loop;
return v_suma;
end;
/


select sumatoria(1,4) from dual