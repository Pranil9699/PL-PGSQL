create or replace function multip_addition(int, int, out int ,out int) as
'
declare
a alias for $1;
b alias for $2;
c int :=0;
d int :=0;
massage text;
begin
--addition
raise notice ''The Addition is '';
c:=a+b;
raise notice ''%'',c;
--multi
raise notice ''The multiplication is '';
d:=a*b;
raise notice ''%'',d;
end;
'language'plpgsql';
