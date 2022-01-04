--join 
create table customers(cid int primary key,cname varchar(50),cphone varchar(50));
create table orderss(oid int primary key,cid int,product varchar(50),quantity int);
insert into customers values(1,'gowri','12345');
insert into customers values(2,'gowri1','12345');
insert into customers values(3,'gowri2','12345');
insert into customers values(4,'gowri3','12345');
insert into customers values(5,'gowri4','12345');
select * from customers;
insert into orderss values(1,1,'pencil','100');
insert into orderss values(2,1,'pen','100');
insert into orderss values(3,1,'keyborad','100');
insert into orderss values(4,2,'mouse','100');
insert into orderss values(5,2,'moniter','100');
insert into orderss values(6,3,'mick','100');
insert into orderss values(7,3,'bell','100');
insert into orderss values(8,3,'ball','100');

insert into orderss values(9,6,'rocket','100');
insert into orderss values(10,7,'raja','100');
select * from orderss;

--cross join
select * from customers c cross join orderss o

--cross join differently
select * from customers,orderss

--cross join with condition (a inner join)
select * from customers c cross join orderss o where c.cid=o.cid

--a simple inner join 
select * from customers join orderss on customers.cid=orderss.cid

--another way for inner join without join keyword
select * from customers,orderss where customers.cid=orderss.cid

--another way for inner join
select * from customers c inner join orderss o on c.cid=o.cid

--show only selective columns using a join
select c.cid as custId,c.cname as Name,c.cphone as phone,o.oid as orderId,o.product as Product,o.quantity as quanity 
from customers c join orderss o on c.cid=o.cid  

--left join
select c.cid as custId,c.cname as Name,c.cphone as phone,o.oid as orderId,o.product as Product,o.quantity as quanity 
from customers c left join orderss o on c.cid=o.cid  

--right join
select c.cid as custId,c.cname as Name,c.cphone as phone,o.oid as orderId,o.product as Product,o.quantity as quanity 
from customers c right join orderss o on c.cid=o.cid  

--right join (change the table name)
select c.cid as custId,c.cname as Name,c.cphone as phone,o.oid as orderId,o.product as Product,o.quantity as quanity 
from orderss o right join customers c on c.cid=o.cid  

--full join
select c.cid as custId,c.cname as Name,c.cphone as phone,o.oid as orderId,o.product as Product,o.quantity as quanity 
from customers c full join orderss o on c.cid=o.cid  

--full join useful for admin (customers who have placed no orders)
select c.cid as custId,c.cname as Name,c.cphone as phone,o.oid as orderId,o.product as Product,o.quantity as quanity 
from customers c full join orderss o on c.cid=o.cid where o.oid is null

--full join useful for admin (orders having no customer details)
select c.cid as custId,c.cname as Name,c.cphone as phone,o.oid as orderId,o.product as Product,o.quantity as quanity 
from customers c full join orderss o on c.cid=o.cid where c.cid is null