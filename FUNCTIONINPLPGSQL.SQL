postgres'#      return cnt;
postgres'#    end;
postgres'# ' 
postgres-# language 'plpgsql';
CREATE FUNCTION
postgres=# no_emp();
ERROR:  syntax error at or near "no_emp"
LINE 1: no_emp();
        ^
postgres=# select no_emp;
ERROR:  column "no_emp" does not exist
LINE 1: select no_emp;
               ^
postgres=# select no_emp();
 no_emp 
--------
      3
(1 row)

postgres=# ^Z
[2]+  Stopped                 psql
postgres@bca41-HP-Compaq-Elite-8300-SFF:~$ \q

Command 'q' not found, but can be installed with:

snap install q                       # version 1.6.3-1, or
apt  install python-q-text-as-data 
apt  install python3-q-text-as-data

See 'snap info q' for additional versions.

postgres@bca41-HP-Compaq-Elite-8300-SFF:~$ psql
psql (10.22 (Ubuntu 10.22-0ubuntu0.18.04.1))
Type "help" for help.

postgres=# \q
postgres@bca41-HP-Compaq-Elite-8300-SFF:~$ clear

postgres@bca41-HP-Compaq-Elite-8300-SFF:~$ sudo -i -u postgres
postgres is not in the sudoers file.  This incident will be reported.
postgres@bca41-HP-Compaq-Elite-8300-SFF:~$ psql
psql (10.22 (Ubuntu 10.22-0ubuntu0.18.04.1))
Type "help" for help.

postgres=# select * from emp2;
 eno | ename |  qua   |   jdate    
-----+-------+--------+------------
   1 | sam   | MCA    | 2000-12-21
   2 | smith | B.TECH | 2005-09-30
   3 | karan | B.TECH | 2005-05-28
   4 | sham  | M.TECH | 2018-01-10
   5 | ram   | M.TECH | 2018-02-14
(5 rows)

postgres=# select * from project;
 pno |  ptype   |    pname     | duration 
-----+----------+--------------+----------
   1 | apps     | ludo         |       12
   2 | web      | e-commers    |       10
   3 | ERP      | student_dbms |       15
   4 | html     | block        |        4
   5 | html css | web page     |       20
(5 rows)

postgres=# select * from emppro;
 pno | eno | start_date | no_of_hours_woerked 
-----+-----+------------+---------------------
   1 |   2 | 2009-01-21 |                  60
   3 |   4 | 2019-01-10 |                  70
   2 |   5 | 2018-01-01 |                  30
   4 |   2 | 2009-05-20 |                  18
   4 |   1 | 2011-11-05 |                  90
(5 rows)

postgres=# create or replace function no_emp() returns int as
postgres-# '
postgres'#    declare
postgres'#       cnt int;
postgres'#    begin
postgres'#       select into cnt count(eno) from emp2 where jdate < ''2006-01-01'';
postgres'#      return cnt;
postgres'#    end;
postgres'# ' 
postgres-# language 'plpgsql';
CREATE FUNCTION
postgres=# select no_emp();
 no_emp 
--------
      3
(1 row)

postgres=# create or replace function(eno int) returns int as'
postgres'#   declare
postgres'#      cnt int;
postgres'#   begin
postgres'#     select into cnt count(pno) from project as p,emppro as ep    
postgres'#     where p.pno=ep.pno 
postgres'#    ;
postgres'# reurn cnt;
postgres'#     
postgres'#   end;
postgres'# 'language 'plpgsql'
postgres-# ;
ERROR:  syntax error at or near "("
LINE 1: create or replace function(eno int) returns int as'
                                  ^
postgres=# create or replace function abc(eno int) returns int as'
postgres'#   declare
postgres'#      cnt int;
postgres'#   begin
postgres'#     select into cnt count(pno) from project as p,emppro as ep    
postgres'#     where p.pno=ep.pno;
postgres'# reurn cnt;
postgres'#     
postgres'#   end;
postgres'# 'language 'plpgsql';
ERROR:  syntax error at or near "reurn"
LINE 7: reurn cnt;
        ^
postgres=# create or replace function abc(eno int) returns int as'
postgres'#   declare
postgres'#      cnt int;
postgres'#   begin
postgres'#     select into cnt count(pno) from project as p,emppro as ep    
postgres'#     where p.pno=ep.pno;
postgres'# return cnt;
postgres'#     
postgres'#   end;
postgres'# 'language 'plpgsql';
CREATE FUNCTION
postgres=# select abc(2);
ERROR:  column reference "pno" is ambiguous
LINE 1: select          count(pno) from project as p,emppro as ep   ...
                              ^
QUERY:  select          count(pno) from project as p,emppro as ep    
    where p.pno=ep.pno
CONTEXT:  PL/pgSQL function abc(integer) line 5 at SQL statement
postgres=# create or replace function abc(eno int) returns int as'
postgres'#   declare
postgres'#      cnt int;
postgres'#   begin
postgres'#     select into cnt count(pno) from project as p,emppro as ep,emp2 as e   
postgres'#     where p.pno=ep.pno and e.eno=ep.eno;
postgres'# return cnt;
postgres'#     
postgres'#   end;
postgres'# 'language 'plpgsql';
CREATE FUNCTION
postgres=# select abc(2);
ERROR:  column reference "pno" is ambiguous
LINE 1: select          count(pno) from project as p,emppro as ep,em...
                              ^
QUERY:  select          count(pno) from project as p,emppro as ep,emp2 as e   
    where p.pno=ep.pno and e.eno=ep.eno
CONTEXT:  PL/pgSQL function abc(integer) line 5 at SQL statement
postgres=# create or replace function abc(eno int) returns int as'
postgres'#   declare
postgres'#      cnt int;
postgres'#   begin
postgres'#     select into cnt count(pno) from project as p,emppro as ep,emp2 as e   
postgres'#     where p.pno=ep.pno and e.eno=ep.eno and eno=pno;
postgres'# return cnt;
postgres'#     
postgres'#   end;
postgres'# 'language 'plpgsql';
CREATE FUNCTION
postgres=# select abc(2);
ERROR:  column reference "pno" is ambiguous
LINE 1: select          count(pno) from project as p,emppro as ep,em...
                              ^
QUERY:  select          count(pno) from project as p,emppro as ep,emp2 as e   
    where p.pno=ep.pno and e.eno=ep.eno and eno=pno
CONTEXT:  PL/pgSQL function abc(integer) line 5 at SQL statement
postgres=# create or replace  function show( a int ) returns int as 
postgres-# '
postgres'# declare
postgres'# count int:=0;
postgres'# begin
postgres'# count := select count(emppro.pno) from Project,emp2,emppro where emppro.eno = a;
postgres'# RAISE NOTICE '' count is %'',count;
postgres'# return count;
postgres'# end;
postgres'# 'language'plpgsql';
ERROR:  syntax error at or near "select"
LINE 6: count := select count(emppro.pno) from Project,emp2,emppro w...
                 ^
postgres=# create or replace  function show( a int ) returns int as 
postgres-# '
postgres'# declare
postgres'# count int:=0;
postgres'# begin
postgres'# count := select INTO count(emppro.pno) from Project,emp2,emppro where emppro.eno = a;
postgres'# RAISE NOTICE '' count is %'',count;
postgres'# return count;
postgres'# end;
postgres'# 'language'plpgsql';
ERROR:  syntax error at or near "select"
LINE 6: count := select INTO count(emppro.pno) from Project,emp2,emp...
                 ^
postgres=# create or replace  function show( a int ) returns int as 
postgres-# '
postgres'# declare
postgres'# count int:=0;
postgres'# begin
postgres'# count := select count(emppro.pno) INTO pno from Project,emp2,emppro where emppro.eno = a;
postgres'# RAISE NOTICE '' count is %'',count;
postgres'# return count;
postgres'# end;
postgres'# 'language'plpgsql';
ERROR:  syntax error at or near "select"
LINE 6: count := select count(emppro.pno) INTO pno from Project,emp2...
                 ^
postgres=# create or replace  function show( a int ) returns int as 
postgres-# '
postgres'# declare
postgres'# count int:=0;
postgres'# begin
postgres'# count := select count(*) INTO pno from Project,emp2,emppro where emppro.eno = a;
postgres'# RAISE NOTICE '' count is %'',count;
postgres'# return count;
postgres'# end;
postgres'# 'language'plpgsql';
ERROR:  syntax error at or near "select"
LINE 6: count := select count(*) INTO pno from Project,emp2,emppro w...
                 ^
postgres=# create or replace  function show( a int ) returns int as 
postgres-# '
postgres'# declare
postgres'# count int:=0;
postgres'# begin
postgres'# count := 'select count(*) INTO pno from Project,emp2,emppro where emppro.eno = a';
postgres'# RAISE NOTICE '' count is %'',count;
postgres'# return count;
postgres'# end;
postgres'# 'language'plpgsql';
ERROR:  syntax error at or near "select"
LINE 6: count := 'select count(*) INTO pno from Project,emp2,emppro ...
                  ^
postgres=# create or replace  function show( a int ) returns int as 
postgres-# '
postgres'# declare
postgres'# count int;
postgres'# begin
postgres'# select count(*) INTO count from Project,emp2,emppro where emppro.eno = a;
postgres'# RAISE NOTICE '' count is %'',count;
postgres'# return count;
postgres'# end;
postgres'# 'language'plpgsql';
CREATE FUNCTION
postgres=# select show(5);
NOTICE:   count is 25
 show 
------
   25
(1 row)

postgres=# create or replace  function show( a int ) returns int as 
postgres-# '
postgres'# declare
postgres'# count int;
postgres'# begin
postgres'# select count(emppro.pno) INTO count from Project,emp2,emppro where emppro.eno = a;
postgres'# RAISE NOTICE '' count is %'',count;
postgres'# return count;
postgres'# end;
postgres'# 'language'plpgsql';
CREATE FUNCTION
postgres=# select show(5);
NOTICE:   count is 25
 show 
------
   25
(1 row)

postgres=# select * from emppro;
 pno | eno | start_date | no_of_hours_woerked 
-----+-----+------------+---------------------
   1 |   2 | 2009-01-21 |                  60
   3 |   4 | 2019-01-10 |                  70
   2 |   5 | 2018-01-01 |                  30
   4 |   2 | 2009-05-20 |                  18
   4 |   1 | 2011-11-05 |                  90
(5 rows)

postgres=# select * from emp2;
 eno | ename |  qua   |   jdate    
-----+-------+--------+------------
   1 | sam   | MCA    | 2000-12-21
   2 | smith | B.TECH | 2005-09-30
   3 | karan | B.TECH | 2005-05-28
   4 | sham  | M.TECH | 2018-01-10
   5 | ram   | M.TECH | 2018-02-14
(5 rows)

postgres=# select * from project;
 pno |  ptype   |    pname     | duration 
-----+----------+--------------+----------
   1 | apps     | ludo         |       12
   2 | web      | e-commers    |       10
   3 | ERP      | student_dbms |       15
   4 | html     | block        |        4
   5 | html css | web page     |       20
(5 rows)

postgres=# create or replace  function show( a int ) returns int as 
postgres-# '
postgres'# declare
postgres'# count int;
postgres'# begin
postgres'# select count(emppro.pno) INTO count from emppro where emppro.eno = a;
postgres'# RAISE NOTICE '' count is %'',count;
postgres'# return count;
postgres'# end;
postgres'# 'language'plpgsql';
CREATE FUNCTION
postgres=# select show(5);
NOTICE:   count is 1
 show 
------
    1
(1 row)

postgres=# ^C
postgres=# 

