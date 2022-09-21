create trigger limitcontact
before insert on emp
for each row execute procedure fun1();

-- the Function to the Trigger 
create or replace function fun1() returns trigger as
'
declare

begin 
if length(new.contactno) != 10
then
raise notice '' this contact is not valid '';
return null;
end if;
return new;
end;
'language'plpgsql';
create trigger limitcontact
after insert on emp
for each row execute procedure fun1();

-- the Function to the Trigger 
create or replace function fun1() returns trigger as
'
declare

begin 
if length(new.contactno) != 10
then
raise exception '' this contact is not valid '';
end if;
return new;
end;
'language'plpgsql';


-- new 
create or replace function contactcheck()returns trigger as  
' 
declare
 begin 
 if length(new.contact)!=10 then 
raise execption '' Not valid contact '';
 end if;
return new; 
end; 
'language'plpgsql';
