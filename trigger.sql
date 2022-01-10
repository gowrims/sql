create database gowri;
use gowri;

create table students (studid int primary key,stuname varchar(50),status varchar(50))

insert into students values(1,'gowri','active')
insert into students values(2,'gowri','active')
insert into students values(3,'gowri','active')
insert into students values(4,'gowri','active')

select * from students

delete from students where studid=2

select * from deleted

--DML Trigger Demo--
--Default Template--
create/alter trigger Triggername on Tablename for/instead of delete/insert/update
as
begin
--statement--
end

--after trigger--
--don't allow delete instead view contents of deleted table--
CREATE TRIGGER trg_students_delete on students for delete
as 
begin
select * from deleted
rollback transaction
end

--don't allow deletion of multiple entries--
alter trigger trg_students_delete on students for delete
as 
begin
if(select count(*) from deleted)>1
begin
raiserror('cannot delete multiple entries',1,1)
rollback transaction
end
end

--to drop trigger of existing--
drop trigger trg_students_delete

--Instead of trigger--
--an instead of trigger to change status to discountinued
create trigger trg_students on students instead of delete 
as 
begin
update students set status = 'discountinued'
end

drop trigger trg_students

delete from students where studid=2

select * from students

truncate table students

--correct update trigger using deleted table--
create trigger trg_students_insteadofdelete on students instead of delete
as
begin
update students set status = 'discountinued' from deleted join students on deleted.studid = students.studid
end

--DDL triggers--
--template--
create/alter trigger triggername on database/server for drop_table
( create or alter on table,procedue,trigger..)
as
begin
--statement--
end

--no instead of trigger in ddl--
create trigger trg_ddl_blockdrop on database for drop_table
as 
begin
raiserror('you cannot drop tables',1,1)
rollback transaction
end

create table emp(empid int)

drop table emp

create table logevents(logid int identity(1,1) primary key,logevent xml)

select * from logevents

create trigger trg_logevent on database for create_table
as 
begin
declare @action xml
set @action=Eventdata()
insert into logevents values(@action)
end

create table emp1(empid int)

create table stud1(studid int, studname varchar(50))

select * from logevents

--for all database level ddl statemetns--
alter trigger trg_logevents on database for ddl_database_level_events
as
begin
declare @action xml
set @action = EVENTDATA()
insert into logevents values(@action)
end

create table demo(did int)

select * from logevents

drop trigger trg_ddl_blockdrop on database

drop table demo

select * from logevents






