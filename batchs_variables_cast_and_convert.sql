--batchs
--create a table and a view
--this cause an error
use tempdb;
create table dbo.test (id int not null,testname varchar(50) not null);
create view dbo.vmtest as select testname from dbo.test;
select * from dbo.vmtest;

--creating multiple dependent objects requires a go separator.
use tempdb;
create table dbo.test1 (id int not null,testname varchar(50) not null);
go
create view dbo.vmtest1 as select testname from dbo.test;
go

--using variables
use northwind;
declare @local char(13);
set @local ='local phone'; 
--(OR)--
select @local ='local phone';
select @local as value;
select lastname,firstname,@local+homephone as phone from dbo.employees order by lastname,firstname;
go

--single statement declaration and initialization in 2008
declare @local char(13) = 'local phone';
select @local ='local phone';
select @local as value;
select lastname,firstname,@local+homephone as phone from dbo.employees order by lastname,firstname;

--compound operators in 2008
declare @i int=5
set @i += 1	--increment
select @i as addequals
set @i -= 3 --decrement
select @i as subtractequals
set @i *= 10 --multiplication
select @i as multiply
set @i /= 2 --division
select @i as divisionequals
set @i %= 4 --modulus
select @i as modulus
set @i &= 5 --bitwise and
select @i as bitwiseand
set @i ^= 13 --bitwise exclusive or
select @i as bitwise_excluse_or
set @i |= 5 --bitwise or
select @i as bitwise_or

--using cast and convert
--TSQL  is strictly typed.
--so it requires explicit casting or conversion when incompatible type are used
--syntax
--cast(expression as data_type[(length)]
--convert(data_type[(length)],expression,[style])
--this will give you an error
declare @msg varchar(20);
select @msg = 'the result is:' + (2+2);
print @msg;

--fix the problem using cast or convert
declare @msg1 varchar(20);
select @msg1 = 'the result is:' + cast((2+2) as varchar(1));
print @msg1;

declare @msg2 varchar(20);
select @msg2 = 'the result is:' + convert(varchar(1),(2+2));
print @msg2;
-----------------------------------------------------------------------
--when sql server evaluates an expression that includes multiple datatypes it picks one datatype
--for the result and attempts to convert each part of the expression to that one resulting type.
--the type that sql seerver picks is the one with the highest
--type precedence
--data type precedence
--user_defined data types(highest)
--sql_variant
--xml
--datetimeoffset
--datetime
--smalldatetime
--date
--time
--float
--real
--decimal
--money
--smallmoney
--bigint
--int 
--smallint 
--tinyint
--bit
--ntext
--text
--image
--timestamp
--uniqueidentifier
--nvarchar
--nchar
--varchar
--char
--varbinary
--binary(lowest)

--see what happens
declare @msg4 varchar(20);
select @msg4 = '1' + (2+2);
print @msg4;

--sql server does have same limited support for converting database(implicit conversions)
----------------------------------------------------------------------
--using convert with style
--MSsql getdate() returns current system date and time in standard internal format
select getdate();
--style 1 formats date in short date format yy
--add 100 style to get yyyy format...can add to any style to get yyyy instead yyyy.
--try subtracting 100 to get yy instead of yyyy.
select convert(varchar(20),getdate(),1) as '1-mm/dd/yy US with yy'
select convert(varchar(20),getdate(),100) as '100-mon dd yyyy hh:mmAm(orPm)default'
select convert(varchar(20),getdate(),101) as '101-mm/dd/yy US'
select convert(varchar(20),getdate(),102) as '102-yyyy.m.dd ansi'
select convert(varchar(20),getdate(),103) as '103-dd/mm/yyyy british/french'
select convert(varchar(20),getdate(),104) as '104-dd.mm.yyyy german'
select convert(varchar(20),getdate(),105) as '105-dd-mm-yy italian'
select convert(varchar(20),getdate(),106) as '106-dd mon yyyy'
select convert(varchar(20),getdate(),107) as '107-mon dd,yyyy'
select convert(varchar(20),getdate(),108) as '108-hh:mm:ss'
select convert(varchar(20),getdate(),109) as '109-mon dd yyyy hh:mm:ss:mmmAM(orPM) default+milliseconds'
select convert(varchar(20),getdate(),110) as '110-mm-dd-yyyy US'
select convert(varchar(20),getdate(),111) as '111-yyyy/mm/dd japan'
select convert(varchar(20),getdate(),112) as '112-yyyymmdd ISO'
select convert(varchar(20),getdate(),113) as '113-dd mon yyyy hh:mm:ss:mmm'
select convert(varchar(20),getdate(),114) as '114-hh:mm:ss:mm(24hrs)'
select convert(varchar(20),getdate(),120) as '120-yyyy-mm-dd hh:mm:ss(24hrs)'
select convert(varchar(20),getdate(),121) as '121-yyyy-mm-dd hh:mm:ss:mmm'
select convert(varchar(20),getdate(),126) as '126-yyyy-mm-ddThh:mm:ss.mmm'

--using STR to convert and format
--syntax
--STR(float-expression[,length[,decimal]])
use northwind;
select unitprice, str(unitprice,6,1) as formated
from dbo.products
order by unitprice desc;
