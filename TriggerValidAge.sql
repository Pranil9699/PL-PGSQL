-- before insert 
create trigger valid_of_age
before insert on emp
for each row execute procedure validage(); 

create or replace function validage() returns trigger as 
' 
declare 
begin
if new.age<0 then
raise exception '' Age is not in negetive '';
elsif new.age>150 then
raise exception '' Age is not in  above 150 '';
end if;
return new;
end;
'language 'plpgsql';

/*

create or replace function validage() returns trigger as 
' 
declare 
begin
if new.age<0 then
raise notice'' Age is not in negetive '';
return null;
elsif new.age>150 then
raise exception '' Age is not in  above 150 '';
return null;
end if;
return new;
end;
'language 'plpgsql';

*/

--After insert
create trigger valid_of_age
after insert on emp
for each row execute procedure validage(); 

create or replace function validage() returns trigger as 
' 
declare 
begin
if new.age<0 then
raise exception '' Age is not in negetive '';
elsif new.age>150 then
raise exception '' Age is not in  above 150 '';
end if;
return new;
end;
'language 'plpgsql';
