create or replace function fetch_and_move() returns int as
'
declare

c1 cursor for select * from Student;
r1 record;
count int :=0;

begin
 
open c1;
-- for fetching the Cursor in the Table there are same position "1.first 2.last 3.prior 4.next 5.absolute[position] 6.relative[Position]"

-- for fetch the First record 
fetch first from c1 into r1;
raise notice '' The First Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;  

-- for fetch the Last record 
fetch last from c1 into r1;
raise notice '' The Last Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;

-- for fetch the last -3 record 
fetch absolute 3 from c1 into r1 ;
raise notice '' The last - 3 Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;

-- for fetch the before record of current position
fetch prior from c1 into r1;
raise notice '' The (last-3)-1 Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;

-- for fetch the after record of current position 
fetch next from c1 into r1;
raise notice '' The (last-3) Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;

-- for fetch the reletive position record in the table
fetch relative 3 from c1 into r1 ;
raise notice '' The (last-3)+3 record Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;

-- for moving the Cursor in the Table there are same position " 1.first 2.last 3.prior 4.next 5.absolute [ position ] 6. relative [ Position ]"

-- for move the first postion record 
move first from c1 ;
fetch next from c1 into r1 ;
raise notice '' The first next position Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;

move last from c1;
fetch prior from c1 into r1 ;
raise notice '' The last before position Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;

move absolute 2 from c1;
fetch next from c1 into r1;
raise notice '' The 3 position ROW IS = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count:=count+1;

move relative -1 from c1;
fetch prior from c1 into r1;
raise notice '' The 1 position Row is = % % % % '',r1.id,r1.name,r1.address,r1.marks;
count := count+1;

raise notice ''The Total Count of the fetching record are % '',count; 
close c1;

return count;

end;
'language'plpgsql';
