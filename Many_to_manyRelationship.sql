postgres=# create table StuPranil(s_no int primary key ,name varchar(20),s_class varchar(10),s_address varchar(30));
CREATE TABLE
postgres=# insert into StuPranil(s_no,name,s_class,s_address) values(12,'Pranil Takawane','FYBCA','Pune'),(2,'Sujit Kargal','SYBCA','Wagoli'),(3,'Nandini Shelar' ,'TYBCA', 'Mumbai'),(4,'Pritam Pokale','TYBCA','Wagoli'),(5,'Rushikesh Saykar','SYBCA','Pune');
INSERT 0 5
postgres=# create table TeacherBJS(t_no int primary key, t_name varchar(20), qulification varchar(15), experience int );
CREATE TABLE
postgres=# insert into TeacherBJS(t_no,t_name, qulification,experience) values( 21,'Gauri Shinde','MCA',3),(34,'Suverna Patil','PHD',7),(90,'Manvatkar SiINSERT 0 5
INSERT 0 5
create table subject1(techer_id int references TeacherBJS(t_no), student_id int references StuPranil(s_no),subject varchar(60),CONSTRAINT S_T_table primary key(techer_id,student_id));
CREATE TABLE
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



postgres=#  select * from TeacherBJS;
 t_no |      t_name      | qulification | experience 
------+------------------+--------------+------------
   21 | Gauri Shinde     | MCA          |          3
   34 | Suverna Patil    | PHD          |          7
   90 | Manvatkar Sir    | PDH          |         10
  100 | Tejashree Shinde | MCA          |          4
  190 | Priti Lokhande   | MSC          |          3
(5 rows)



postgres=#  select * from subject1;
 s_id | techer_id | student_id | subject 
------+-----------+------------+---------
(0 rows)
