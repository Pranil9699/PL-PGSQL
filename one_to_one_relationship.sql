create table shop(proid int primary key, proname text not null, proprice float(6) not null );
insert into shop(proid,proname,proprice) values(12,'Butter',50),(2,'Milk',100),(3,'Maggi',20),(4,'Sope',80),(5,'Phone',100); proid | proname | proprice 
select *from shop;
-------+---------+----------
    12 | Butter  |       50
     2 | Milk    |      100
     3 | Maggi   |       20
     4 | Sope    |       80
     5 | Phone   |      100
create table orderpro(oid int primary key, oname text not null, orderadd text  not null );
 alter table orderpro add column proid int references shop(proid);
insert into orderpro(oid,oname,orderadd,proid) values(1234,'Butter','Pune',12),(13234,'MILK12','Mumbai',3),(31234,'MAGGI2','Thane',4),(4457,'SOPESnatur','Gujrat',5),(52345,'RedmiPhone','Akola',2);
select *from Orderpro;

 oid  |   oname    | orderadd | proid 
-------+------------+----------+-------
  1234 | Butter     | Pune     |    12
 13234 | MILK12     | Mumbai   |     3
 31234 | MAGGI2     | Thane    |     4
  4457 | SOPESnatur | Gujrat   |     5
 52345 | RedmiPhone | Akola    |     2
(5 rows)
