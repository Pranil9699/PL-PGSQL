
Exercises
SET A (Number of Slot – 1)
1) Student-Teacher Database
Consider the following Entities and their Relationships for Student-Teacher database.
Student (s_no int, s_name varchar (20), s_class varchar (10), s_addr varchar (30))
Teacher (t_no int, t_name varchar (20), qualification varchar (15), experience int)
Relationship between Student and Teacher is many to many with descriptive attribute subject.
Constraints: Primary Key,
s_class should not be null.

Solve the following Queries in PostgreSQL:
1. List the names of the teachers who are teaching to a student named “Avinash”.
2. List the names of the students to whom‘ ---------’ is teaching.
3. List the details of all teachers whose names start with the alphabet ‘T’.
4. List the names of teachers teaching subject ‘DBMS’.
5. Find the number of teachers having qualification as ‘Ph.D.’.
6. Find the number of students living in ‘Cidco’.
7. Find the details of maximum experienced teacher.
8. Find the names of student of class ‘SYBCA’ and living at ‘Kothrud’.
9. List name of students exactly contains 6 characters in it.
10. List the names of all teachers with their subjects along with the total number of students they are teaching.



postgres=# create table StuPranil(s_no int primary key ,name varchar(20),s_class varchar(10),s_address varchar(30));
CREATE TABLE
postgres=# insert into StuPranil(s_no,name,s_class,s_address) values(12,'Pranil Takawane','FYBCA','Pune'),(2,'Sujit Kargal','SYBCA','Wagoli'),(3,'Nandini Shelar' ,'TYBCA', 'Mumbai'),(4,'Pritam Pokale','TYBCA','Wagoli'),(5,'Rushikesh Saykar','SYBCA','Pune');
INSERT 0 5


postgres=# create table TeacherBJS(t_no int primary key, t_name varchar(20), qulification varchar(15), experience int );
CREATE TABLE
ostgres=# insert into TeacherBJS(t_no,t_name, qulification,experience) values( 21,'Gauri Shinde','MCA',3),(34,'Suverna Patil','PHD',7),(90,'Manvatkar Si','BCA',10),( 22,'Priti Shinde','MCA+BCA',4),(16,'Shardha Patil','PHD+MCA',7);
INSERT 0 5


create table subject1(techer_id int references TeacherBJS(t_no), student_id int references StuPranil(s_no),subject varchar(60),CONSTRAINT S_T_table primary key(techer_id,student_id));
CREATE TABLE
postgres=# insert into subject1(techer_id,student_id,subject) values(21,12,'CN'),(21,3,'C programming'),(34,2,'C advance'),(90,3,'JAVA'),(22,4,'Android java');
INSERT 0 5



postgres=# \d StuPranil;
                      Table "public.stupranil"
  Column   |         Type          | Collation | Nullable | Default 
-----------+-----------------------+-----------+----------+---------
 s_no      | integer               |           | not null | 
 name      | character varying(20) |           |          | 
 s_class   | character varying(10) |           |          | 
 s_address | character varying(30) |           |          | 
Indexes:
    "stupranil_pkey" PRIMARY KEY, btree (s_no)
Referenced by:
    TABLE "subject1" CONSTRAINT "subject1_student_id_fkey" FOREIGN KEY (student_id) REFERENCES stupranil(s_no)


postgres=# \d TeacherBJS;
                       Table "public.teacherbjs"
    Column    |         Type          | Collation | Nullable | Default 
--------------+-----------------------+-----------+----------+---------
 t_no         | integer               |           | not null | 
 t_name       | character varying(20) |           |          | 
 qulification | character varying(15) |           |          | 
 experience   | integer               |           |          | 
Indexes:
    "teacherbjs_pkey" PRIMARY KEY, btree (t_no)
Referenced by:
    TABLE "subject1" CONSTRAINT "subject1_techer_id_fkey" FOREIGN KEY (techer_id) REFERENCES teacherbjs(t_no)


postgres=# \d subject1;
                       Table "public.subject1"
   Column   |         Type          | Collation | Nullable | Default 
------------+-----------------------+-----------+----------+---------
 techer_id  | integer               |           | not null | 
 student_id | integer               |           | not null | 
 subject    | character varying(60) |           |          | 
Indexes:

"s_t_table" PRIMARY KEY, btree (techer_id, student_id)
Foreign-key constraints:
    "subject1_student_id_fkey" FOREIGN KEY (student_id) REFERENCES stupranil(s_no)
    "subject1_techer_id_fkey" FOREIGN KEY (techer_id) REFERENCES teacherbjs(t_no)
    
    
    
    postgres=#  select * from StuPranil;
 s_no |       name       | s_class | s_address 
------+------------------+---------+-----------
   12 | Pranil Takawane  | FYBCA   | Pune
    2 | Sujit Kargal     | SYBCA   | Wagoli
    3 | Nandini Shelar   | TYBCA   | Mumbai
    4 | Pritam Pokale    | TYBCA   | Wagoli
    5 | Rushikesh Saykar | SYBCA   | Pune
(5 rows)


postgres=# select *from TeacherBJS;
 t_no |    t_name     | qulification | experience 
------+---------------+--------------+------------
   21 | Gauri Shinde  | MCA          |          3
   34 | Suverna Patil | PHD          |          7
   90 | Manvatkar Si  | BCA          |         10
   22 | Priti Shinde  | MCA+BCA      |          4
   16 | Shardha Patil | PHD+MCA      |          7
(5 rows)


postgres=# select *from subject1;
 techer_id | student_id |    subject    
-----------+------------+---------------
        21 |         12 | CN
        21 |          3 | C programming
        34 |          2 | C advance
        90 |          3 | JAVA
        22 |          4 | Android java
(5 rows)

       QUE - ANS SLOVED
 Question 1. List the names of the teachers who are teaching to a student named “Pranil Takawane”.

 postgres=# select t_name from TeacherBJS where t_no = ( select techer_id from subject1 where student_id = (select s_no from StuPranil where name ='Pranil Takawane'));
    t_name    
--------------
 Gauri Shinde
(1 row)

Question 2. List the names of the students to whom‘ ---------’ is teaching.
postgres=# select name from StuPranil where s_no = ( select student_id from subject1 where subject='CN');
      name       
-----------------
 Pranil Takawane
(1 row)

Question 3. List the details of all teachers whose names start with the alphabet ‘M’.

postgres=# SELECT t_name FROM TeacherBJS
WHERE t_name LIKE 'M%';
    t_name    
--------------
 Manvatkar Si
(1 row)

Question 4. List the names of teachers teaching subject ‘DBMS’.

postgres=# select t_name from TeacherBJS where t_no = (select techer_id from subject1 where subject = 'DBMS');
    t_name     
---------------
 Shardha Patil
(1 row)

Quetion 5.  Find the number of teachers having qualification as ‘Ph.D.’.

postgres=# select count(t_no) from TeacherBJS where qulification='PHD';
 count 
-------
     1
(1 row)

