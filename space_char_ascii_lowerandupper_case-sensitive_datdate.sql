--using space
--(display result as text)
--space(integer_expression)
select firstname + space(15-len(firstname)) + lastname as nameincolums from dbo.employees;

--char
--char(integer_expression)
select char(71) + char(13) + char(79) + char(13) + char(87) + char(13) + char(82) + char(13) + char(73) as character_with_carriage_return;

--ascii
--ascii(character_expression)
select ascii('G') as ascii_G,ascii('g') as ascii_g

--lower and upper
--lower(character_expression)
--upper(character_expression)
select upper(firstname) as firstname, lower(lastname) as lastname from dbo.employees;

--case-insensitive filtering
select companyname from dbo.customers where CHARINDEX(upper('THE'),UPPER(companyname))>0;

--(The most efficient way to perform sensitive or case-sensitive searches is to specify 
--a collation for the query)
--case-sensitive
select companyname from dbo.customers where companyname 
like '%the%' collate sql_latin1_general_cp1_cs_as

--case-insensitive
select companyname from dbo.customers where companyname 
like '%the%' collate sql_latin1_general_cp1_ci_ai

--ltrim and rtrim
--ltrim(character_expression)
--rtrim(character_expression)
select ltrim(rtrim(' hello ')) + 'there' as trimmed;

--getdate
select getdate() as rightnow;

--month,day,year
select month(getdate()) as thismonth,day(getdate()) as thisday,year(getdate()) as thisyear;

--datepart
select datepart(dy,getdate()) as dayofyear,
	   datepart(dd,getdate()) as daynum,
	   datepart(ww,getdate()) as weeknum,
	   datepart(dw,getdate()) as weekday,
	   datepart(hh,getdate()) as hour,
	   datepart(mi,getdate()) as minute,
	   datepart(ss,getdate()) as secounds

--datename and datepart
select datename(qq,getdate()) as quarter,
	   datename(mm,getdate()) as month,
	   datename(dw,getdate()) as weekday,
	   datename(hh,getdate()) as hour,
	   datename(mi,getdate()) as minute,
	   datename(ss,getdate()) as secounds

--dateadd
select dateadd(yy,2,getdate()) as addyear,
		dateadd(mm,2,getdate()) as addmonth,
		dateadd(dd,2,getdate()) as addday

--datediff
select orderdate,RequiredDate,shippeddate,
		datediff(dd,orderdate,RequiredDate) as leadtime,
		datediff(dd,orderdate,shippeddate) as daystoship,
		datediff(dd,shippeddate,RequiredDate)as dayearly
from dbo.orders

--last day of month
declare @date datetime
set @date ='2020-10-11';
select dateadd(dd,-day(dateadd(m,1,@date)),dateadd(m,1,@date)) as lastdayofmonth
