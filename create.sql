create table employee(empid int primary key not null, empname varchar(50) not null, empage int)
insert into employee values(1,'gowri',23)
insert into employee values(2,'ram',23)
insert into employee values(3,'shankar',23)
select * from employee where empid=1

create table students(studid int identity(1,1) not null primary key, studname varchar(50), studage int)
insert into students values(1,'gowri',23)
insert into students values('gowri',24)
insert into students values('gowri',27)
select * from students

create table cust(cid int primary key not null, custname varchar(50) not null ,custphone varchar(50),custdob datetime)
insert into cust values(1,'gowri','123345','19960413')
insert into cust values(2,'ram',null,'19960919')
insert into cust values(3,'shankar','19980804')
insert into cust(cid,custname,custdob)values(4,'swetha','19960413')
select * from cust

create table studmark(studid int not null, examtype varchar(50) not null, examyear int not null, mark int, primary key (studid, examtype, examyear))
select * from studmark
--constraints:

 create table cars(carid varchar(50) not null primary key, carcolor varchar(50) not null default 'white', carprice int not null check(carprice>10000),
 regno varchar(50) not null unique)
 insert into cars values(1,'red',12000,'123')
 insert into cars (carid,carprice,regno) values(2,12000,'124')
 insert into cars values(3,'red',20000,'125')
select * from cars

update cars set carcolor='green' where carcolor='red'

update cars set carcolor='red' where carid=3

select * from cars where carid=2

delete from cars where carid=2

truncate table cars

drop table cars

create table emp(empid int , empname varchar(50))

select * from emp
--change empid type to varchar(50) from int
alter table emp alter column empid varchar(50)

--add a new column to the emp table emppage of type int
alter table emp add emppage int

--drop a column from the emp table empage
alter table emp drop column emppage

create table stud(studid int primary key, studname varchar(50))

--drop a constraint by name
alter table stud drop constraint PK__stud__E270950B2DAE6FAF

--create a constraint with name
create table cust1(custid int constraint my_pd01 primary key, custname varchar(50), age int constraint age_check check (age>18))
select * from cust1 
insert into cust1 values(2,'gowri',17)
--drop a custom created constraint by name
alter table cust1 drop constraint age_check 

--creating a table
create table customer(custid int primary key, cname varchar(50) not null, cphone varchar(50))

--with foreign key
create table orders(ordedid int primary key, cid int foreign key references customer(custid),quantity int)

--foreign key with name
create table order1(orederid int constraint my_pk02 primary key, cid int constraint my_fk_cust1_order foreign key references customer(custid))

create table mycust(custid int, cname varchar(50), constraint my_pk3 primary key (custid))

--primary key and foreign key with alter table commands
create table mycst(custid int not null, cname varchar(50))

alter table mycst add constraint my_pk4 primary key(custid)

create table myorder2(ordered int primary key,cid int, quantity int)

alter table myorder2 add constraint my_fk2 foreign key(cid) references mycst(custid)