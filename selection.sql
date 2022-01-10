--selection demo
--general format for naming a database object
--server.database.schema.object
--To refer to employees table in northwind database

select * from Employess;
select * from Northwind.dbo.Employees;

--dont specify server name for local system ..use it in a netwerk

use Northwind;
GO

--difference between go and ;
--; is used for terminating a sql statement | separator
--go is used to Terminate or close a sql batch(ALL declared local variables will retain their values with in a batch)

select Firstname, Lastname from dbo.Employees;
select * from dbo.Employees;

--concatenating 
select Lastname+','+ Firstname from dbo.Employees;

--aliasing column names
select Lastname+','+ Firstname AS [full name] from dbo.Employees;

--as is optional
select Lastname+','+ Firstname fullname from dbo.Employees;

--another aliasing option
select fullname=Lastname+','+ Firstname from dbo.Employees;

--this is deprecated
select 'fullname' = Lastname+','+ Firstname from dbo.Employees;

--select and select distinct
select title from dbo.Employees;
select distinct title from dbo.Employees;

--where
select CompanyName,city from dbo.customers where city='paris';

--like and wildcard characters
select CompanyName from dbo.customers where CompanyName like 'S%';

select CompanyName from dbo.customers where CompanyName like '%S';

select CompanyName from dbo.customers where CompanyName like '%S%';

--matching single characters
select customerid from dbo.customers where customerid like 'B___P';

--matching from a list
select customerid from dbo.customers where customerid like 'FRAN[RK]';

--SPECIFY A RANGE
select customerid from dbo.customers where customerid like 'FRAN[A-S]';

--NOT containing
select customerid from dbo.customers where customerid like 'FRAN[^R]';

--Between
select lastname,firstname,postalcode from dbo.employees where postalcode between '98103' and '98999';

--Testing for null;
select lastname,firstname,region from dbo.employees where region = null;

--three level logic(true,false,null)
select lastname,firstname,region from dbo.employees where region is null;

--and requires both conditions to be true 
select lastname,city,postalcode from dbo.employees where city='LONDON' and postalcode like 'S%';

--or only requires one condition to be tre
select lastname,city,postalcode from dbo.employees where city='seattle' or postalcode like '9%';

--not negates the expression 
select lastname,city,postalcode from dbo.employees where city not like 'seattle';

--operator precedence not,and,or
select lastname,firstname,city from dbo.employees where lastname like '%S' and city not like 'seattle';

select lastname,firstname,city from dbo.employees where (lastname like 'S%') and (city not like 'seattle');

--in clause
--one way to do it
select customerid,country from dbo.customers where country='france' or country='spain';

select customerid,country from dbo.customers where country like 'U%'

--using-in-to match in list of elements
select customerid,country from dbo.customers where country in ('france','spain');

--nested sub query
select customerid,country from dbo.customers
where country in (select distinct country from dbo.customers where country like 'U%');

select customerid from dbo.customers where customerid not in (select distinct customerid from dbo.orders);