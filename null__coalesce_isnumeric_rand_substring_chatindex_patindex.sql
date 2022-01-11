--working with nulls
--often we need to work with nulls
--aggreate functions ignore null value
--many default behaviors will change if null values are involved 
--equality with null(=) will give inconsistent results based on ansi_nulls property
--when ansi_nulls is on (defualt),equality operater(=) desen't give true or false but null as output
--when ansi_null is off,equality operater(=) will give true or false as output
--lot of side effects for changing that setting.
---------------------------------------------------------------
--This Returns no rows unless you run.
--Set ansi_nulls off
--(it is on by defaults)
----------------------------------------------------------------
use Northwind;
select companyname,city from dbo.suppliers where region=null;

select * from suppliers;

--change setting
set ansi_nulls off;
--now run last query again
--restore ansi_nulls setting 
set ansi_nulls on;
--but this works reliably
-------------------------------------------------------------------
select companyname,city from dbo.suppliers where region is null;
-------------------------------------------------------------------
--using isnull to replace null values with other string
-------------------------------------------------------------------
--do not confuse with is null operator which is use to check null values.
select companyname,city isnull (region,'***') as region from dbo.suppliers;
-------------------------------------------------------------------
--using nullif to convert null values
-------------------------------------------------------------------
--the converse of is null is nullif,it replaces actual values with nulls.
--useful to eliminate values from aggregation function to make it accurate
--view the unitsinstock data
select unitsinstock from dbo.products;
--serveral products are out of inventory
select avg(nullif(unitsinstock,0)) from dbo.products;
--this will produce different output than usual because nullif returns null when it encounters 0.
--instead of actual one which uncludes 0 in avg function 
select avg(unitsinstock) from dbo.products;
--------------------------------------------------------------------
--using coalesce to find
--the first non-null value
--in a series of expressions
--syntax
--coalesce (expression1, expression2, [,....n])
select coalesce(3+null,2*null,5*2,7);
select companyname,region,country,city+','+ coalesce (region,country) as location from dbo.suppliers;
--------------------------------------------------------------------
--using isnumeric
select postalcode, isnumeric(postalcode) from dbo.Customers;
--sone non-numeric bharacters will pass
select isnumeric('123e4'),isnumeric('123d4'),cast('123e4' as float),cast('123d4' as float);
--------------------------------------------------------------------
--using rand()
--with an automatic random seed.
--different numbers every time.
--execute multiple times.
select rand(),rand(),rand();

--with a fixed seed.
--the same seres every time.
--execute multiple times.
select rand(456),rand(),rand();
------------------------------------------------------------------
--using round
--syntax
--round(expression,length[,function])
select unitprice,
		round(unitprice,0) as roundeddollars,round(unitprice,0,1) as truncateddollars,
		round(unitprice,1) as totenofcents,round(unitprice,-1) as totenofdollars
from dbo.products;
--combing rand and round
declare @minid int ,@maxid int
set @minid=(select min(employeeid) from dbo.employees)
set @maxid=(select max(employeeid) from dbo.employees)

select employeeid as luckyid,lastname as luckyname 
from dbo.employees where employeeid=round(@minid+(rand()*(@maxid-@minid)),0);
----------------------------------------------------------------------
--using replace
--syntax
--replace (string_expression,string_pattern,string_replacement)
select quantityperunit,replace(quantityperunit,'12','twelve') as twelve from dbo.products;
------------------------------------------------------------------------
--using stuff
--syntax
--stuff(expr1,start,length,expr2)
select stuff('123456',3,2,'xxxx');
-----------------------------------------------------------------------
--using len,left,right
--syntax
--len(string_expression)
--left(string_expression,integer_numbers)
--right(string_expression,interger_numbers)
select productname,
left(productname,len(productname) -3) as lefty,
right(productname,len(productname) -3) as righty
from dbo.Products;
-----------------------------------------------------------------
--using substring
--syntax
--substring(value_expression,start_expression,length_expression)
select substring(firstname,1,1)+'.'+lastname from dbo.employees;
-----------------------------------------------------------------
--using charid
--syntax
--charindex(expression1,expression2[,start_location])
select homephone,CHARINDEX(')',homephone) as startpos from dbo.employees;

select homephone,left(homephone,charindex(')',homephone)) as areacode,
substring(homephone,charindex(')',homephone)+2,len(homephone)-charindex(')',homephone)+1)
as number from dbo.employees;

select productname as tofuproducts from dbo.products where charindex('tofu',productname)>0;
--------------------------------------------------------------------
--using patindex
--patindex('%pattern%',expression)
--patindex supports willcards
select productname,quantityperunit from dbo.products where patindex('24 - %g pkgs.',quantityperunit)>0;
select productname,quantityperunit from dbo.products where patindex('24 - __g pkgs.',quantityperunit)>0;

--using bracketed values
select postalcode from dbo.customers where patindex('%[^0-9]%',postalcode)=0;

--patindex can be used with text,ntext and image colums
select categoryname,description,patindex('%sweet%',description) as sweetfoundation from dbo.Categories
where patindex('%sweet%',Description)>0;