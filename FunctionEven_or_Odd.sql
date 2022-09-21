create or replace function evenodd(int)returns text  as
'
declare
a alias for $1;
mas text;
massage text;
begin
if a % 2 =0 then 
mas:=''even Number'';
return mas;
end if;
mas:=''Odd Number'';
return mas;
end;
'language'plpgsql';
