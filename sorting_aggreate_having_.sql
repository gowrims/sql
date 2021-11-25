--SORTING
--order by
select lastname,city from dbo.Employees order by city

--sorting in descending order
select lastname,city from dbo.Employees order by city desc

--sorting on multiple columns (asc optional)
select lastname,city from dbo.employees order by city desc, lastname asc

--sorting expression 
select lastname from dbo.Employees order by len(lastname)

--aggregate function
count--counts the no of rows in an aggreate query
count_big--same as count,but return a bigint datatype(huge database)
sum--adds(sums) up the column values
avg--average of the column value 
min--returns the lowest column value in an aggreate query (can be applied to any database) like string, datetime, int,..etc)
max--returns the largest column value in an aggreate query.

--counting rows
select * from dbo.Employees
select count(*) from dbo.employees
select count(LastName) from dbo.employees
select count(Region) from dbo.employees

--counting values in a column
--count(*)is efficient??
select count(*) as numemployees, count(region) as numregion from dbo.employees

--counting with where
select count(*) as numemployeesseattle from dbo.employees where city='seattle'

--grouping results
--need no of employees from each city
--given an error
select city,count(*) as numemployees from dbo.employees

--using grouping
--every field that you have in the select list, that is not part of the aggreate function
--needs to be in the group by clause.
select city,count(*) as numemployees from dbo.Employees group by city

--order by with group by
select city,count(*) as numemployees from dbo.employees group by city order by count(*) desc,city

--use alias in order by clause
select city,count(*) as numemployees from dbo.employees group by city order by numemployees desc,city

--having
select city,count(*) as numemployess from dbo.employees group by city Having count(*) > 1 order by numemployess desc, city

--exolanation
--aggreate functions are applied on groups.
--the where clause filters the rows before aggreation could be applied.
--having clause ways for aggreation to be completed before filtering the result set.

--alias in having
--this clause an error, because you can't use an alias in the having.
select city, count(*) as numemployees from dbo.employees group by city having numemployees > 1 order by numemployees desc, city

--but this work
select city, count(*) as numemployees from dbo.employees group by city having count(*)> 1 order by numemployees desc, city

--limiting the results(just the output-after the entire processing is complete)
--top
select top 3 city,count(*) as numemployees from dbo.employees group by city order by count(*) desc

--top with ties 
select top 3 with ties city,count(*) as numemployees from dbo.employees group by city order by count(*) desc

--top with percent
select top 45 percent with ties city,count(*) as numemployees from dbo.employees group by city order by count(*) desc