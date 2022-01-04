use Northwind
--1.find the second costliest product
select * from dbo.products;

select top 1 productname,unitprice from dbo.products where unitprice not in(select (max(unitprice)) from dbo.Products) order by unitprice desc;

-----------------------------------------------------------------------------------------------------------------------------------------------------
--2.list out all the customers and the count of the orders that they made
select * from customers;
select * from dbo.orders;

select o.customerid,c.contactname,count(o.CustomerID)as[orders they made] from dbo.orders o join Customers c on o.CustomerID=c.CustomerID 
group by o.customerid,c.ContactName order by [orders they made] desc

--------------------------------------------------------------------------------------------------------------------------------------------------------
--3.list out all the customers and the value of the orders that they made
select * from customers;
select * from orders

select c.CustomerID,sum(o.unitprice*o.quantity)as value from [Order Details] o join orders c on c.orderid=o.orderID group by c.CustomerID order by value desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
--4.find the customer with the highest number of orders
select * from dbo.orders

select top 2 customerid,count(customerid) as numeroforder from dbo.orders group by customerid order by count(customerid) desc

----------------------------------------------------------------------------------------------------------------------------------------------------------
--5.find the customer with second highest number of orders

select top 1 customerid,count(customerid) as numeroforder from dbo.orders group by customerid 
having count(distinct orderid) not in (select top 1 count(distinct orderid) as orders from orders
group by CustomerID order by orders desc) order by count(distinct orderid) desc 

-----------------------------------------------------------------------------------------------------------------------------------------------------------
--6.find the order with highest number of items
select * from dbo.[Order Details]

select orderid,sum(quantity) as items from [Order Details] group by orderid order by items desc 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--7.find the customer with the highest order value
select * from dbo.[Order Details]
select * from orders

select top 1 c.CustomerID,sum(o.unitprice*o.quantity)as value from [Order Details] o join orders c on c.orderid=o.orderID group by c.CustomerID order by value desc

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--8.find the supplier who supplies the highest number of prouducts
select * from dbo.products

select top 2 supplierid ,count(supplierid) as [number of supplier] from dbo.products  group by supplierid order by count(supplierid) desc

----------------------------------------------------------------------------------------------------------------------------------------------------------
--9.which category has the highest number of products
select * from dbo.products

select top 1 categoryid,count(categoryid) as numberofproducts from dbo.products  group by categoryid order by numberofproducts desc

------------------------------------------------------------------------------------------------------------------------------------------------------------
--10.which category is selling the highest?
select * from dbo.products;

select top 1 productname,categoryid,max(unitprice) as sellinghigest from dbo.products group by productname,categoryid order by sellinghigest desc 

-----------------------------------------------------------------------------------------------------------------------------------------------------------
--11.from which region do we have the highest number of customers
select * from dbo.customers;

select top 1 Region,count(region) as [number of customers]  from dbo.customers where region is not null group by region order by count(region) desc

-----------------------------------------------------------------------------------------------------------------------------------------------------------
--12 list all the regions and the count of customers from that region
select * from dbo.customers

select region,count(contactname) as [number of customers] from dbo.customers where region is not null group by region order by count(contactname) desc

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--13.list all the regions and the count of all suppliers from that region
select * from dbo.suppliers

select region,count(supplierid) as [number of suppliers] from dbo.suppliers group by region having region is not null order by count(supplierid) desc 

------------------------------------------------------------------------------------------------------------------------------------------------------------
--14.list out all orders that were delivered before the requested date?
select * from orders

select orderid,orderdate,requireddate,ShippedDate,datediff(dd,RequiredDate,ShippedDate)as [delivered before day] from dbo.orders 

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--15.which customer received the highest discount?
select * from [Order Details]
select * from Orders

select o.customerid,sum((od.unitprice*od.quantity)-od.discount) as highestdiscount from [Order Details] od 
join orders o on o.OrderID=od.OrderID group by CustomerID order by highestdiscount desc

-----------------------------------------------------------------------------------------------------------------------------------
--16.which order contains the highest quantity for a single product?
select * from [Order Details]

select top 1 orderid,max(quantity) as [higest quantity] from [Order Details] group by OrderID order by [higest quantity] desc

------------------------------------------------------------------------------------------------------------------------------------
--17.list out all orders with total cost higher than average total cost.
select * from [Order Details]
select * from Products

select orderid,sum(unitprice*quantity) as [total cost] from [Order Details] group by OrderID 
having(sum(unitprice*quantity))>(select sum(unitprice*quantity)/count(distinct orderid) as avgordervalue from [Order Details])

----------------------------------------------------------------------------------------------------------------------------------------------
--18.list out all products with discounts higher than average discount offered.
select * from dbo.[Order Details] 
select * from dbo.Products

select productid,discount from [Order Details] group by productid,discount 
having discount > (select sum(discount)/count(discount) from [Order Details]) order by ProductID,discount desc

-------------------------------------------------------------------------------------------------------------------------------------------------
--19.find out the product with the highest discount?
select * from dbo.Products
select * from [Order Details]

select productid,discount from [Order Details] group by ProductID,Discount having discount=(select max(discount) from [Order Details]) order by Discount

--------------------------------------------------------------------------------------------------------------------------------------------------
--20.find the order with the highest total cost?
select * from [Order Details]

select top 1 orderid,sum(unitprice*quantity)as [total cost] from [Order Details] group by OrderID

--------------------------------------------------------------------------------------------------------------------------------------------------
--21.find out the product that sells the highest?
select * from [Order Details]

select top 1 productid,sum(quantity) as sellhighest from [Order Details] group by ProductID order by sellhighest desc

---------------------------------------------------------------------------------------------------------------------------------------------------
--22.find the order(s) that took the most time to deliver?
select * from Orders

select top 1 orderid,RequiredDate,shippeddate,datediff(dd,RequiredDate,shippeddate) as [took the most time to deliver] from dbo.orders where ShippedDate is not null 
order by [took the most time to deliver] asc

-------------------------------------------------------------------------------------------------------------------------------------------------
--23.find the order(s) that took the least time to deliver?
select * from dbo.Orders

select top 1 orderid,RequiredDate,shippeddate,datediff(dd,RequiredDate,shippeddate) as [took the least time to deliver] from dbo.orders where ShippedDate is not null
order by [took the least time to deliver] desc

-------------------------------------------------------------------------------------------------------------------------------------------------
--24.find the supplier who supplied for the highest purchase value?
select * from Products
select * from [Order Details]

select top 1 p.supplierid,sum(o.unitprice*o.quantity) as [purchase value] from [Order Details] o join Products p on o.ProductID=p.ProductID 
group by o.ProductID,p.SupplierID,p.ProductName order by [purchase value] desc

---------------------------------------------------------------------------------------------------------------------------------------------------
--25.find the top three orders with the highest value?
select * from dbo.[Order Details]
select * from dbo.Products

select top 3 orderid,sum(unitprice*quantity) as highestvalue from [Order Details] group by OrderID order by highestvalue desc

-----------------------------------------------------------------------------------------------------------------------------------------------------
--General sql questions
--1.assume a table containing two columns A and B with integer values. if NULL value is present in 
--column A replace it with the value in B and change B value to 30 if only A value is NULL
create table number1(A int,B int);


--2.count the number of records/rows in a table and if null value is present in any of the columns then
--count that row twice.


--3.Assume a table with two columns A and B with integer values.write query to list out the maximum of 
--A & B as output for each record.
create table number2(A int,B int);
select * from number2;
insert into number2 values(1,11);
insert into number2 values(2,12);
insert into number2 values(3,13);
insert into number2 values(4,14);
insert into number2 values(5,15);
insert into number2 values(6,16);
insert into number2 values(7,17);
insert into number2 values(8,18);
insert into number2 values(9,19);
insert into number2 values(10,20);

select max(A)as [max a],max(B) as [max b] from number2 

--4.list out all customers whose name contains "s" as the third letter.Don't use like operator.
select * from Customers 
select contactname,CHARINDEX('s',contactname) as [count of name] from dbo.Customers where CHARINDEX('s',contactname)=3

--5.Assume a table with two columns A and B with integer values. write query to list out those 
--records where A or B contains a NULL value.
create table number(A int,B int);
select * from number;
insert into number values(1,2);
insert into number values(null,2);
insert into number values(1,2);
insert into number values(1,null);
insert into number values(1,2);
insert into number values(null,2);
insert into number values(1,2);
insert into number values(1,null);
insert into number values(1,2);
insert into number values(null,2);

select A,B from number where A is null 