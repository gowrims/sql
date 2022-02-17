--see all database in mssql
SELECT name, database_id, create_date FROM sys.databases;  
GO
--see all tables in the database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES

--CREATE DATABASE
CREATE DATABASE TestDB;

--use database
-- USE TestDB;

--CREATE TABLE Tname1 (Emp_Number INT, Name VARCHAR(10));

-- SELECT * FROM Tname1;

-- INSERT INTO Tname1 (Emp_Number, Name) VALUES(1,'Gowri');
-- INSERT INTO Tname1 (Emp_Number, Name) VALUES(2,'shankar');

--------------------------------------------------------
USE Northwind

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM [Order Details]
---------------------------------------------------------
USE pubs

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM authors
---------------------------------------------------------
-- SELECT * FROM employees;

--  --concatenating
--  SELECT LastName + ' , ' + FirstName FROM Employees;

--  --concatenating (with column name)
--  SELECT LastName + ' , ' + FirstName AS [ FULL NAME ]
--  FROM Employees;
--------------------------------------------------------
-- CREATE TABLE wifi (wifi_id int, wifi_speed int, wifi_latency int);

-- INSERT INTO wifi (wifi_id,wifi_speed,wifi_latency) VALUES (001,20,20);
-- INSERT INTO wifi (wifi_id,wifi_speed,wifi_latency) VALUES (002,30,100);
-- INSERT INTO wifi (wifi_id,wifi_speed,wifi_latency) VALUES (003,50,200);

-- SELECT * FROM wifi;
--------------------------------------------------------
USE Northwind

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM Employees
SELECT * FROM Categories
SELECT * FROM Customers
SELECT * FROM [Order Details]
SELECT * FROM [Customer and Suppliers by City]
SELECT * FROM [Order Subtotals]


--ORDER BY
SELECT OrderID, ProductID FROM [Order Details]
ORDER BY ProductID , OrderID DESC

--CROSS JOIN
SELECT * FROM [Order Details] CROSS JOIN Employees;

--INNER JOIN
SELECT [Order Details].[OrderID] , [Order Subtotals].OrderID
FROM [Order Details] INNER JOIN [Order Subtotals]
ON [Order Details].[OrderID] = [Order Subtotals].[OrderID];

--LEFT JOIN
SELECT Customers.Country , [Customer and Suppliers by City].City
FROM Customers LEFT JOIN [Customer and Suppliers by City]
ON Customers.CompanyName = [Customer and Suppliers by City].[CompanyName]

--RIGHT JOIN
SELECT Customers.ContactName , [Customer and Suppliers by City].Relationship
FROM Customers RIGHT JOIN [Customer and Suppliers by City]
ON Customers.CompanyName = [Customer and Suppliers by City].CompanyName

--FULL JOIN
SELECT [Order Details].[OrderID],[Order Details Extended].[ProductID]
FROM [Order Details Extended] FULL JOIN [Order Details]
ON [Order Details].OrderID = [Order Details Extended].OrderID

--WHAT IS SELECT
-- THE SELECT STATEMENT IS USED TO SELECT DATA FROM A DATABASE.
-- THE DATA RETURNED IS STORED IN A RESULT TABLE, CALLED THE RESULT-SET.
--------------SELECT SYNTAX
--SELECT column1, column2... FROM table_name;

--WHAT IS WHERE 
-- THE WHERE CLAUSE IS USE TO FILITER RECORDS.
-- IT IS USED TO EXTRACT ONLY THOSE RECORDS THAT FULFILL A SPECIFIED CONDITION.
--------------WHERE SYNTAX
-- SELECT COLUMN1,COLUMN2... FROM TABLE_NAME WHERE CONDITION;

--WHAT IS ORDER BY
-- THE ORDER BY KEYWORD IS USED TO SORT THE RESULT-SET IN ASCENDING OR DESCENDING ORDER.
-- THE ORDER BY KEYWORD SORTS THE RECORDS IN ASCENDING ORDER BY DEFAULT.
-- TO SORT THE RECORDS IN DESCENDING ORDER, USE THE DESC KEYWORD.
-------------ORDER BY SYNTAX
-- SELECT COLUMN1, COLUMN2.. FROM TABLE_NAME ORDER BY COLUMN1, COLUMN2,... ASC|DESC

--WHAT IS GROUP BY
-- THE GROUP BY STATEMENT GROUPS ROWS THAT HAVE THE SAME VALUES INTO SUMMARY ROWS,
-- LIKE "FIND THE NUMBER OF CUSTOMERS IN EACH COUNTRY".
-- THE GROUP BY STATEMENT IS OFTEN USED WITH AGGREGATE 
--FUNCTIONS(COUNT(), MAX(), MIN(), SUM(), AVG()) 
-- TO GROUP THE RESULT-SET BY ONE OR MORE COLUMNS.
-------------GROUP BY SYNTAX
-- SELECT COLUMN_NAME(S) FROM TABLE_NAME WHERE CONDITION
-- GROUP BY COLUMN_NAME(S) ORDER BY COLUMN_NAME(S)

--WHAT IS HAVING
-- THE HAVING CLAUSE WAS ADDED TO SQL BECAUSE THE WHERE KEYWORD CANNOT BE USED WITH 
-- AGGREGATE FUNCTIONS.
-- --------------HAVING SYNTAX
-- SELECT COLUMN_NAME(S) FROM TABLE_NAME WHRE CONDITION 
--GROUP BY COLUMN_NAME(S)
-- HAVING CONDITION ORDER BY COLUMN_NAME(S);

--FIND THE FIRST 5 CHARACTERS FROM A COLUMN
SELECT SUBSTRING(firstname,1,5) AS FirstName FROM Employees

--MASK A COLUMN SUCH THAT THE LAST FEW CHARACTERS ARE CONVERTED TO *

--FIND THE 3RD TO 6TH CHARACTER OF A COLUMN
SELECT SUBSTRING(FIRSTNAME,3,6) AS FirstName FROM Employees

--SORTING -- ORDER BY
SELECT Employees.LastName, Employees.City 
FROM Employees ORDER BY City

--SORTING --MULTIPLE COLUMN
SELECT Employees.LastName, Employees.City
FROM Employees ORDER BY City ASC, LastName ASC

--SORTING EXPRESSION
SELECT Employees.LastName , LEN(LastName) AS Length_of_The_Last_Name FROM Employees ORDER BY LEN(LastName)
--AGGREGATE FUNCTIONS
--COUNT,SUM,AVG,MIN,MIX

--COUNTING ROWS
SELECT COUNT(*) AS Number_of_Row  FROM Employees

SELECT COUNT(Employees.LastName) AS count_lastname FROM Employees

--count * is efficient
SELECT COUNT(*) AS NumEmployees , COUNT(Employees.Region) AS NumRegion
FROM Employees

--counting with where
SELECT COUNT(*) AS NumEmployees_seattle from Employees
WHERE City = 'seattle'

--GROUPING RESULT
--NUMBER OF EMPLOYEES FROM EACH CITY
SELECT Employees.City, COUNT(*) AS NumEmployees FROM Employees
GROUP BY Employees.City

--ORDER BY AND GROUP BY
SELECT Employees.City, COUNT(*) AS NumEmployees FROM Employees
GROUP BY Employees.City ORDER BY COUNT(*) DESC, City;

--having 
SELECT Employees.City, COUNT(*) AS NumEmployees from Employees
GROUP BY City  HAVING COUNT(*) > 1 ORDER BY NumEmployees DESC, City
--=======================================================================
CREATE DATABASE new;
USE new
GO

CREATE TABLE addition(one VARCHAR(10), two VARCHAR(10));
INSERT INTO addition(one, two)VALUES(1,2);
INSERT INTO addition(one, two)VALUES(2,3);
SELECT * FROM addition;

--SELECT DISTINCE SYNTAX -- this syntax also same for select 
SELECT DISTINCT one,two from addition;

--AND, OR ,NOT OPERATORS
--The WHERE clause can be combined with AND, OR and NOT operators.
SELECT one, two from addition where one = 1 AND two = 2;
SELECT one, two from addition where one = 1 OR two = 2;
SELECT one, two from addition where NOT one = 1;
