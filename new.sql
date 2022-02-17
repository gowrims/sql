-- --see all database in mssql
SELECT name, database_id, create_date FROM sys.databases;  
GO
-- --SELECT * FROM sys.databases;
-- --see all tables in the database
-- -- SELECT TABLE_NAME
-- -- FROM INFORMATION_SCHEMA.TABLES

--CREATE DATABASE
--CREATE DATABASE TestDB;

--use database
--USE TestDB
-------------------------------------------------------
--ALTER DATABAE
--ALTER DATABASE TestDB MODIFY NAME = NewTestDB;

--SQL SP_RENAMEDB Statement
--In SQL, we have another way to change the name of database i.e, by using SP_RENAMEDB statement. 
--Following is the syntax using EXEC sp_renamedb statement to change or rename a SQL database.
--EXEC sp_renamedb'olddbname', 'newdbname'

-- SQL Drop Database Syntax
-- Following is the syntax to drop or delete the existing database in SQL using the DROP DATABASE statement.
-- DROP DATABASE databasename
------------------------------------------------------- 

--CREATE TABLE Tname1 (Emp_Number INT, Name VARCHAR(10));

-- INSERT INTO Tname1 (Emp_Number, Name) VALUES(1,'Gowri');
-- INSERT INTO Tname1 (Emp_Number, Name) VALUES(2,'shankar');

-- SELECT * FROM Tname1;

-- -- --------------------------------------------------------
-- -- USE Northwind

-- -- SELECT TABLE_NAME
-- -- FROM INFORMATION_SCHEMA.TABLES

-- -- SELECT * FROM [Order Details]
-- -- ---------------------------------------------------------
-- -- USE pubs

-- -- SELECT TABLE_NAME 
-- -- FROM INFORMATION_SCHEMA.TABLES

-- -- SELECT * FROM authors
-- ---------------------------------------------------------
-- -- SELECT * FROM employees;

-- --  --concatenating
-- --  SELECT LastName + ' , ' + FirstName FROM Employees;

-- --  --concatenating (with column name)
-- --  SELECT LastName + ' , ' + FirstName AS [ FULL NAME ]
-- --  FROM Employees;
-- --------------------------------------------------------
-- -- CREATE TABLE wifi (wifi_id int, wifi_speed int, wifi_latency int);

-- -- INSERT INTO wifi (wifi_id,wifi_speed,wifi_latency) VALUES (001,20,20);
-- -- INSERT INTO wifi (wifi_id,wifi_speed,wifi_latency) VALUES (002,30,100);
-- -- INSERT INTO wifi (wifi_id,wifi_speed,wifi_latency) VALUES (003,50,200);

-- -- SELECT * FROM wifi;
-- --------------------------------------------------------
-- USE Northwind

-- SELECT TABLE_NAME
-- FROM INFORMATION_SCHEMA.TABLES

-- -- SELECT * FROM Employees
-- -- SELECT * FROM Categories
-- -- SELECT * FROM Customers
-- -- SELECT * FROM Shippers
-- -- SELECT * FROM Suppliers
-- -- SELECT * FROM Orders
-- -- SELECT * FROM Products
-- -- SELECT * FROM [Order Details]
-- -- SELECT * FROM [Customer and Suppliers by City]
-- -- SELECT * FROM [Order Subtotals]
-- -- SELECT * FROM Suppliers

-- -- The SQL UNION Operator
-- -- The UNION operator is used to combine the result-set of two or more SELECT statements.

-- -- Every SELECT statement within UNION must have the same number of columns
-- -- The columns must also have similar data types
-- -- The columns in every SELECT statement must also be in the same order
-- -- UNION Syntax
-- -- SELECT column_name(s) FROM table1
-- -- UNION
-- -- SELECT column_name(s) FROM table2;
-- -- --UNION EXAMPLE
-- -- SELECT City FROM Customers 
-- -- UNION
-- -- SELECT City FROM  Suppliers 


-- -- --ORDER BY
-- -- SELECT OrderID, ProductID FROM [Order Details]
-- -- ORDER BY ProductID DESC

-- -- --CROSS JOIN
-- -- SELECT * FROM [Order Details] CROSS JOIN Employees;

-- -- --INNER JOIN
-- -- SELECT [Order Details].[OrderID] , [Order Subtotals].OrderID
-- -- FROM [Order Details] INNER JOIN [Order Subtotals]
-- -- ON [Order Details].[OrderID] = [Order Subtotals].[OrderID];

-- -- --LEFT JOIN
-- -- SELECT Customers.Country , [Customer and Suppliers by City].City
-- -- FROM Customers LEFT JOIN [Customer and Suppliers by City]
-- -- ON Customers.CompanyName = [Customer and Suppliers by City].[CompanyName]

-- -- --RIGHT JOIN
-- -- SELECT Customers.ContactName , [Customer and Suppliers by City].Relationship
-- -- FROM Customers RIGHT JOIN [Customer and Suppliers by City]
-- -- ON Customers.CompanyName = [Customer and Suppliers by City].CompanyName

-- -- --FULL JOIN
-- -- SELECT [Order Details].[OrderID],[Order Details Extended].[ProductID]
-- -- FROM [Order Details Extended] FULL JOIN [Order Details]
-- -- ON [Order Details].OrderID = [Order Details Extended].OrderID

-- --WHAT IS SELECT
-- -- THE SELECT STATEMENT IS USED TO SELECT DATA FROM A DATABASE.
-- -- THE DATA RETURNED IS STORED IN A RESULT TABLE, CALLED THE RESULT-SET.
-- --------------SELECT SYNTAX
-- --SELECT column1, column2... FROM table_name;

-- --WHAT IS WHERE 
-- -- THE WHERE CLAUSE IS USE TO FILITER RECORDS.
-- -- IT IS USED TO EXTRACT ONLY THOSE RECORDS THAT FULFILL A SPECIFIED CONDITION.
-- --------------WHERE SYNTAX
-- -- SELECT COLUMN1,COLUMN2... FROM TABLE_NAME WHERE CONDITION;

-- --WHAT IS ORDER BY
-- -- THE ORDER BY KEYWORD IS USED TO SORT THE RESULT-SET IN ASCENDING OR DESCENDING ORDER.
-- -- THE ORDER BY KEYWORD SORTS THE RECORDS IN ASCENDING ORDER BY DEFAULT.
-- -- TO SORT THE RECORDS IN DESCENDING ORDER, USE THE DESC KEYWORD.
-- -------------ORDER BY SYNTAX
-- -- SELECT COLUMN1, COLUMN2.. FROM TABLE_NAME ORDER BY COLUMN1, COLUMN2,... ASC|DESC

-- --WHAT IS GROUP BY
-- -- THE GROUP BY STATEMENT GROUPS ROWS THAT HAVE THE SAME VALUES INTO SUMMARY ROWS,
-- -- LIKE "FIND THE NUMBER OF CUSTOMERS IN EACH COUNTRY".
-- -- THE GROUP BY STATEMENT IS OFTEN USED WITH AGGREGATE 
-- --FUNCTIONS(COUNT(), MAX(), MIN(), SUM(), AVG()) 
-- -- TO GROUP THE RESULT-SET BY ONE OR MORE COLUMNS.
-- -------------GROUP BY SYNTAX
-- -- SELECT COLUMN_NAME(S) FROM TABLE_NAME WHERE CONDITION
-- -- GROUP BY COLUMN_NAME(S) ORDER BY COLUMN_NAME(S)
-- --GROUP BY EXAMPLE
-- SELECT COUNT(CustomerID) AS CountryCount ,Country FROM Customers
-- GROUP BY Country ORDER BY CountryCount DESC

-- --WHAT IS HAVING
-- -- THE HAVING CLAUSE WAS ADDED TO SQL BECAUSE THE WHERE KEYWORD CANNOT BE USED WITH 
-- -- AGGREGATE FUNCTIONS.
-- -- --------------HAVING SYNTAX
-- -- SELECT COLUMN_NAME(S) FROM TABLE_NAME WHRE CONDITION 
-- --GROUP BY COLUMN_NAME(S) HAVING CONDITION ORDER BY COLUMN_NAME(S);
-- --HAVING EXAMPLE
-- SELECT COUNT(CustomerID) AS CountryCount ,Country FROM Customers
-- GROUP BY Country 
-- HAVING COUNT(CustomerID) > 5
-- ORDER BY CountryCount DESC; 

-- -- The SQL EXISTS Operator
-- -- The EXISTS operator is used to test for the existence of any record in a subquery.

-- -- The EXISTS operator returns TRUE if the subquery returns one or more records.

-- -- EXISTS Syntax
-- -- SELECT column_name(s)
-- -- FROM table_name
-- -- WHERE EXISTS
-- -- (SELECT column_name FROM table_name WHERE condition);
-- --EXISTS EXAMPLE
-- SELECT CompanyName FROM Suppliers
-- WHERE EXISTS (SELECT ProductName FROM Products 
-- WHERE Products.SupplierID = Suppliers.supplierID);

-- -- The SQL ANY and ALL Operators
-- -- The ANY and ALL operators allow you to perform a comparison 
-- -- between a single column value and a range of other values.
-- -- ANY Syntax
-- -- SELECT column_name(s) FROM table_name WHERE column_name operator ANY
-- --   (SELECT column_name FROM table_name WHERE condition);
-- -- SQL ANY Examples
-- -- The following SQL statement lists the ProductName if it finds ANY records 
-- -- in the OrderDetails table has Quantity equal to 10 (this will return 
-- -- TRUE because the Quantity column has some values of 10):
-- SELECT ProductName FROM Products WHERE ProductID = ANY
--   (SELECT ProductID FROM [Order Details] WHERE Quantity = 10);

-- -- The following SQL statement lists the ProductName if it finds ANY
-- -- records in the OrderDetails table has Quantity larger than 99 
-- -- (this will return TRUE because the Quantity column has some values
-- -- larger than 99):
-- SELECT ProductName FROM Products WHERE ProductID = ANY
--   (SELECT ProductID FROM [Order Details] WHERE Quantity > 99);

-- -- The following SQL statement lists the ProductName if it finds ANY
-- -- records in the OrderDetails table has Quantity larger than 1000 
-- -- (this will return FALSE because the Quantity column has no values 
-- -- larger than 1000):
-- SELECT ProductName FROM Products WHERE ProductID = ANY
--   (SELECT ProductID FROM [Order Details] WHERE Quantity > 1000);

-- -- The SQL ALL Operator
-- -- The ALL operator:
-- -- returns a boolean value as a result
-- -- returns TRUE if ALL of the subquery values meet the condition
-- -- is used with SELECT, WHERE and HAVING statements
-- -- ALL means that the condition will be true only if the operation is true for all values in the range. 

-- -- ALL Syntax With SELECT
-- -- SELECT ALL column_name(s) FROM table_name WHERE condition;

-- -- SQL ALL Examples
-- -- The following SQL statement lists ALL the product names:
-- -- SELECT ALL ProductName FROM Products WHERE TRUE;

-- -- The following SQL statement lists the ProductName if ALL the 
-- -- records in the OrderDetails table has Quantity equal to 10. 
-- -- This will of course return FALSE because the Quantity column 
-- -- has many different values (not only the value of 10):
-- SELECT ProductName FROM Products WHERE ProductID = ALL
--   (SELECT ProductID FROM [Order Details] WHERE Quantity = 10);

-- -- The SQL SELECT INTO Statement
-- -- The SELECT INTO statement copies data from one table into a new table.

-- -- SELECT INTO Syntax
-- -- Copy all columns into a new table:
-- -- SELECT * INTO newtable [IN externaldb] FROM oldtable
-- -- WHERE condition;

-- -- Copy only some columns into a new table:
-- -- SELECT column1, column2, column3, ... INTO newtable [IN externaldb]
-- -- FROM oldtable WHERE condition;
-- -- The new table will be created with the column-names and types as 
-- -- defined in the old table. You can create new column names using the AS clause.

-- -- SQL SELECT INTO Examples
-- -- The following SQL statement creates a backup copy of Customers:

-- -- SELECT * INTO CustomersBackup2017 FROM Customers;
-- --SELECT * FROM CustomersBackup2017

-- -- The following SQL statement uses the IN clause to copy the table into
-- -- a new table in another database:

-- -- SELECT * INTO CustomersBackup2017 IN 'Backup.mdb' FROM Customers;
-- -- --The following SQL statement copies only a few columns into a new table:
-- -- SELECT CustomerName, ContactName INTO CustomersBackup2017 FROM Customers;
-- -- --The following SQL statement copies only the German customers into a new table:
-- -- SELECT * INTO CustomersGermany FROM Customers WHERE Country = 'Germany';
-- -- --The following SQL statement copies data from more than one table into a new table:
-- -- SELECT Customers.CustomerName, Orders.OrderID INTO CustomersOrderBackup2017
-- -- FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
-- -- --Tip: SELECT INTO can also be used to create a new, empty table using the 
-- -- --schema of another. Just add a WHERE clause that causes the query to return no data:
-- -- SELECT * INTO newtable FROM oldtable WHERE 1 = 0;

-- -- The SQL CASE Statement
-- -- The CASE statement goes through conditions and returns a value when the first condition is met (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.

-- --If there is no ELSE part and no conditions are true, it returns NULL.

-- -- CASE Syntax
-- -- CASE
-- --     WHEN condition1 THEN result1
-- --     WHEN condition2 THEN result2
-- --     WHEN conditionN THEN resultN
-- --     ELSE result
-- -- END;

-- -- SQL CASE Examples
-- -- The following SQL goes through conditions and returns a value when the first condition is met:

-- --Example
-- SELECT OrderID, Quantity,
-- CASE
--     WHEN Quantity > 30 THEN 'The quantity is greater than 30'
--     WHEN Quantity = 30 THEN 'The quantity is 30'
--     ELSE 'The quantity is under 30'
-- END AS QuantityText
-- FROM [Order Details];

-- -- The following SQL will order the customers by City. However, 
-- -- if City is NULL, then order by Country:

-- --Example
-- SELECT CustomerID, City, Country FROM Customers ORDER BY
-- (CASE WHEN City IS NULL THEN Country ELSE City END);

-- --SQL IFNULL(), ISNULL(), COALESCE(), and NVL() Functions
-- --The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL:

-- -- SELECT ProductName, UnitPrice * (UnitsInStock + 
-- -- ISNULL(UnitsOnOrder, 0)) FROM Products;

-- -- SQL Stored Procedures for SQL Server
-- -- What is a Stored Procedure?
-- -- A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

-- -- So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

-- -- You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

-- -- Stored Procedure Syntax
-- -- CREATE PROCEDURE procedure_name
-- -- AS
-- -- sql_statement
-- -- GO;

-- -- Execute a Stored Procedure
-- -- EXEC procedure_name;

-- -- Stored Procedure Example
-- -- CREATE PROCEDURE SelectAllCustomers
-- -- AS
-- -- SELECT * FROM Customers
-- -- GO;

-- -- EXEC SelectAllCustomers;

-- -- --Stored Procedure With One Parameter

-- -- --Example
-- -- CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
-- -- AS
-- -- SELECT * FROM Customers WHERE City = @City
-- -- GO;
-- -- -- Execute the stored procedure above as follows:

-- -- --Example
-- -- EXEC SelectAllCustomers @City = 'London';

-- -- The SQL CREATE DATABASE Statement
-- -- The CREATE DATABASE statement is used to create a new SQL database.

-- -- Syntax
-- -- CREATE DATABASE databasename;

-- -- The SQL DROP DATABASE Statement
-- -- The DROP DATABASE statement is used to drop an existing SQL database.

-- -- Syntax
-- -- DROP DATABASE databasename;

-- -- The SQL BACKUP DATABASE Statement
-- -- The BACKUP DATABASE statement is used in SQL Server to create a full back up of an existing SQL database.

-- -- Syntax
-- -- BACKUP DATABASE databasename
-- -- TO DISK = 'filepath';

-- -- The SQL BACKUP WITH DIFFERENTIAL Statement
-- -- A differential back up only backs up the parts of the database that have changed since the last full database backup.

-- -- Syntax
-- -- BACKUP DATABASE databasename
-- -- TO DISK = 'filepath'
-- -- WITH DIFFERENTIAL;

-- -- BACKUP DATABASE Example
-- -- The following SQL statement creates a full back up of the existing database "testDB" to the D disk:

-- -- Example
-- -- BACKUP DATABASE testDB
-- -- TO DISK = 'D:\backups\testDB.bak';

-- -- The SQL DROP TABLE Statement
-- -- The DROP TABLE statement is used to drop an existing table in a database.

-- -- Syntax
-- -- DROP TABLE table_name;
-- -- Note: Be careful before dropping a table. Deleting a table will result in loss of complete information stored in the table!

-- -- SQL DROP TABLE Example
-- -- The following SQL statement drops the existing table "Shippers":

-- -- Example
-- -- DROP TABLE Shippers;
-- -- SQL TRUNCATE TABLE
-- -- The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.

-- -- Syntax
-- -- TRUNCATE TABLE table_name;

-- -- SQL ALTER TABLE Statement
-- -- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

-- -- The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

-- -- ALTER TABLE - ADD Column
-- -- To add a column in a table, use the following syntax:

-- -- ALTER TABLE table_name
-- -- ADD column_name datatype;
-- -- The following SQL adds an "Email" column to the "Customers" table:

-- -- Example
-- -- ALTER TABLE Customers ADD Email varchar(255);
-- -- SELECT * FROM Customers

-- -- ALTER TABLE - DROP COLUMN
-- -- To delete a column in a table, use the following syntax (notice that some database systems don't allow deleting a column):

-- -- ALTER TABLE table_name
-- -- DROP COLUMN column_name;
-- -- The following SQL deletes the "Email" column from the "Customers" table:

-- -- Example
-- -- ALTER TABLE Customers DROP COLUMN Email;
-- -- SELECT * FROM Customers

-- -- ALTER TABLE - ALTER/MODIFY COLUMN
-- -- To change the data type of a column in a table, use the following syntax:

-- -- ALTER TABLE table_name
-- -- ALTER COLUMN column_name datatype;

-- -- SQL constraints are used to specify rules for data in a table.

-- -- SQL Create Constraints
-- -- Constraints can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.

-- -- Syntax
-- -- CREATE TABLE table_name (
-- --     column1 datatype constraint,
-- --     column2 datatype constraint,
-- --     column3 datatype constraint,
-- --     ....
-- -- );
-- -- SQL Constraints
-- -- SQL constraints are used to specify rules for the data in a table.

-- -- Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted.

-- -- Constraints can be column level or table level. Column level constraints apply to a column, and table level constraints apply to the whole table.

-- -- The following constraints are commonly used in SQL:

-- -- NOT NULL - Ensures that a column cannot have a NULL value
-- -- UNIQUE - Ensures that all values in a column are different
-- -- PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
-- -- FOREIGN KEY - Prevents actions that would destroy links between tables
-- -- CHECK - Ensures that the values in a column satisfies a specific condition
-- -- DEFAULT - Sets a default value for a column if no value is specified
-- -- CREATE INDEX - Used to create and retrieve data from the database very quickly

-- -- SQL NOT NULL Constraint
-- -- By default, a column can hold NULL values.

-- -- The NOT NULL constraint enforces a column to NOT accept NULL values.

-- -- This enforces a field to always contain a value, which means that you cannot insert a new record, or update a record without adding a value to this field.

-- -- SQL NOT NULL on CREATE TABLE
-- -- The following SQL ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL values when the "Persons" table is created:

-- -- Example
-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255) NOT NULL,
-- --     Age int
-- -- );
-- -- SQL NOT NULL on ALTER TABLE
-- -- To create a NOT NULL constraint on the "Age" column when the "Persons" table is already created, use the following SQL:

-- -- ALTER TABLE Persons
-- -- MODIFY Age int NOT NULL;

-- -- SQL UNIQUE Constraint
-- -- The UNIQUE constraint ensures that all values in a column are different.

-- -- Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.

-- -- A PRIMARY KEY constraint automatically has a UNIQUE constraint.

-- -- However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

-- -- SQL UNIQUE Constraint on CREATE TABLE
-- -- The following SQL creates a UNIQUE constraint on the "ID" column when the "Persons" table is created:

-- -- SQL Server / Oracle / MS Access:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL UNIQUE,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int
-- -- );
-- -- MySQL:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int,
-- --     UNIQUE (ID)
-- -- );
-- -- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int,
-- --     CONSTRAINT UC_Person UNIQUE (ID,LastName)
-- -- );
-- -- SQL UNIQUE Constraint on ALTER TABLE
-- -- To create a UNIQUE constraint on the "ID" column when the table is already created, use the following SQL:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- ADD UNIQUE (ID);
-- -- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);
-- -- DROP a UNIQUE Constraint
-- -- To drop a UNIQUE constraint, use the following SQL:

-- -- MySQL:

-- -- ALTER TABLE Persons
-- -- DROP INDEX UC_Person;
-- -- SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- DROP CONSTRAINT UC_Person;

-- -- SQL PRIMARY KEY Constraint
-- -- The PRIMARY KEY constraint uniquely identifies each record in a table.

-- -- Primary keys must contain UNIQUE values, and cannot contain NULL values.

-- -- A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).

-- -- SQL PRIMARY KEY on CREATE TABLE
-- -- The following SQL creates a PRIMARY KEY on the "ID" column when the "Persons" table is created:

-- -- MySQL:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int,
-- --     PRIMARY KEY (ID)
-- -- );
-- -- SQL Server / Oracle / MS Access:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL PRIMARY KEY,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int
-- -- );
-- -- To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int,
-- --     CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
-- -- );
-- -- Note: In the example above there is only ONE PRIMARY KEY (PK_Person). However, the VALUE of the primary key is made up of TWO COLUMNS (ID + LastName).
-- -- SQL PRIMARY KEY on ALTER TABLE
-- -- To create a PRIMARY KEY constraint on the "ID" column when the table is already created, use the following SQL:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- ADD PRIMARY KEY (ID);
-- -- To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
-- -- Note: If you use ALTER TABLE to add a primary key, the primary key column(s) must have been declared to not contain NULL values (when the table was first created).

-- -- DROP a PRIMARY KEY Constraint
-- -- To drop a PRIMARY KEY constraint, use the following SQL:

-- -- MySQL:

-- -- ALTER TABLE Persons
-- -- DROP PRIMARY KEY;
-- -- SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- DROP CONSTRAINT PK_Person;

-- -- SQL FOREIGN KEY Constraint
-- -- The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.

-- -- A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.

-- -- SQL FOREIGN KEY on CREATE TABLE
-- -- The following SQL creates a FOREIGN KEY on the "PersonID" column when the "Orders" table is created:

-- -- MySQL:

-- -- CREATE TABLE Orders (
-- --     OrderID int NOT NULL,
-- --     OrderNumber int NOT NULL,
-- --     PersonID int,
-- --     PRIMARY KEY (OrderID),
-- --     FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
-- -- );
-- -- SQL Server / Oracle / MS Access:

-- -- CREATE TABLE Orders (
-- --     OrderID int NOT NULL PRIMARY KEY,
-- --     OrderNumber int NOT NULL,
-- --     PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
-- -- );
-- -- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- CREATE TABLE Orders (
-- --     OrderID int NOT NULL,
-- --     OrderNumber int NOT NULL,
-- --     PersonID int,
-- --     PRIMARY KEY (OrderID),
-- --     CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
-- --     REFERENCES Persons(PersonID)
-- -- );
-- -- SQL FOREIGN KEY on ALTER TABLE
-- -- To create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created, use the following SQL:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Orders
-- -- ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
-- -- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Orders
-- -- ADD CONSTRAINT FK_PersonOrder
-- -- FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
-- -- DROP a FOREIGN KEY Constraint
-- -- To drop a FOREIGN KEY constraint, use the following SQL:

-- -- MySQL:

-- -- ALTER TABLE Orders
-- -- DROP FOREIGN KEY FK_PersonOrder;
-- -- SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Orders
-- -- DROP CONSTRAINT FK_PersonOrder;

-- -- SQL CHECK Constraint
-- -- The CHECK constraint is used to limit the value range that can be placed in a column.

-- -- If you define a CHECK constraint on a column it will allow only certain values for this column.

-- -- If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.

-- -- SQL CHECK on CREATE TABLE
-- -- The following SQL creates a CHECK constraint on the "Age" column when the "Persons" table is created. The CHECK constraint ensures that the age of a person must be 18, or older:

-- -- MySQL:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int,
-- --     CHECK (Age>=18)
-- -- );
-- -- SQL Server / Oracle / MS Access:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int CHECK (Age>=18)
-- -- );
-- -- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- CREATE TABLE Persons (
-- --     ID int NOT NULL,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int,
-- --     City varchar(255),
-- --     CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
-- -- );
-- -- SQL CHECK on ALTER TABLE
-- -- To create a CHECK constraint on the "Age" column when the table is already created, use the following SQL:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- ADD CHECK (Age>=18);
-- -- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

-- -- MySQL / SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');
-- -- DROP a CHECK Constraint
-- -- To drop a CHECK constraint, use the following SQL:

-- -- SQL Server / Oracle / MS Access:

-- -- ALTER TABLE Persons
-- -- DROP CONSTRAINT CHK_PersonAge;
-- -- MySQL:

-- -- ALTER TABLE Persons
-- -- DROP CHECK CHK_PersonAge;

-- -- AUTO INCREMENT Field
-- -- Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

-- -- Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

-- -- Syntax for SQL Server
-- -- The following SQL statement defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:

-- -- CREATE TABLE Persons (
-- --     Personid int IDENTITY(1,1) PRIMARY KEY,
-- --     LastName varchar(255) NOT NULL,
-- --     FirstName varchar(255),
-- --     Age int
-- -- );
-- -- The MS SQL Server uses the IDENTITY keyword to perform an auto-increment feature.

-- -- In the example above, the starting value for IDENTITY is 1, and it will increment by 1 for each new record.

-- -- Tip: To specify that the "Personid" column should start at value 10 and increment by 5, change it to IDENTITY(10,5).

-- -- To insert a new record into the "Persons" table, we will NOT have to specify a value for the "Personid" column (a unique value will be added automatically):

-- -- INSERT INTO Persons (FirstName,LastName)
-- -- VALUES ('Lars','Monsen');
-- -- The SQL statement above would insert a new record into the "Persons" table. The "Personid" column would be assigned a unique value. The "FirstName" column would be set to "Lars" and the "LastName" column would be set to "Monsen".

-- -- SQL Dates
-- -- The most difficult part when working with dates is to be sure that the format of the date you are trying to insert, matches the format of the date column in the database.

-- -- As long as your data contains only the date portion, your queries will work as expected. However, if a time portion is involved, it gets more complicated.

-- -- SQL Server comes with the following data types for storing a date or a date/time value in the database:

-- -- DATE - format YYYY-MM-DD
-- -- DATETIME - format: YYYY-MM-DD HH:MI:SS
-- -- SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
-- -- TIMESTAMP - format: a unique number
-- -- Note: The date types are chosen for a column when you create a new table in your database!

-- -- SQL CREATE VIEW Statement
-- -- In SQL, a view is a virtual table based on the result-set of an SQL statement.

-- -- A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

-- -- You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.

-- -- A view is created with the CREATE VIEW statement. 

-- -- CREATE VIEW Syntax
-- -- CREATE VIEW view_name AS
-- -- SELECT column1, column2, ...
-- -- FROM table_name
-- -- WHERE condition;
-- -- Note: A view always shows up-to-date data! The database engine recreates the view, every time a user queries it.

-- -- SQL CREATE VIEW Examples
-- -- The following SQL creates a view that shows all customers from Brazil:

-- -- Example
-- -- CREATE VIEW [Brazil Customers] AS
-- -- SELECT CustomerName, ContactName
-- -- FROM Customers
-- -- WHERE Country = 'Brazil';
-- -- We can query the view above as follows:

-- -- Example
-- -- SELECT * FROM [Brazil Customers];
-- -- The following SQL creates a view that selects every product in the "Products" table with a price higher than the average price:

-- -- Example
-- -- CREATE VIEW [Products Above Average Price] AS
-- -- SELECT ProductName, Price
-- -- FROM Products
-- -- WHERE Price > (SELECT AVG(Price) FROM Products);
-- -- We can query the view above as follows:

-- -- Example
-- -- SELECT * FROM [Products Above Average Price];
-- -- SQL Updating a View
-- -- A view can be updated with the CREATE OR REPLACE VIEW statement.

-- -- SQL CREATE OR REPLACE VIEW Syntax
-- -- CREATE OR REPLACE VIEW view_name AS
-- -- SELECT column1, column2, ...
-- -- FROM table_name
-- -- WHERE condition;
-- -- The following SQL adds the "City" column to the "Brazil Customers" view:

-- -- Example
-- -- CREATE OR REPLACE VIEW [Brazil Customers] AS
-- -- SELECT CustomerName, ContactName, City
-- -- FROM Customers
-- -- WHERE Country = 'Brazil';
-- -- SQL Dropping a View
-- -- A view is deleted with the DROP VIEW statement.

-- -- SQL DROP VIEW Syntax
-- -- DROP VIEW view_name;
-- -- The following SQL drops the "Brazil Customers" view:

-- -- Example
-- -- DROP VIEW [Brazil Customers];


 
-- --=======================================================================
-- -- CREATE DATABASE new;
-- -- USE new
-- -- GO

-- -- CREATE TABLE positing(s_no VARCHAR(5), positing_NAME VARCHAR(15))
-- -- INSERT INTO positing(s_no, positing_NAME)VALUES(1, 'manager');
-- -- INSERT INTO positing(s_no, positing_NAME)VALUES(2, 'ass_manger');
-- -- INSERT INTO positing(s_no, positing_NAME)VALUES(3, 'cfo');
-- -- INSERT INTO positing(s_no, positing_NAME)VALUES(4, 'mangaer');
-- -- INSERT INTO positing(s_no, positing_NAME)VALUES(5, 'ceo');
-- -- SELECT * FROM positing;

-- -- SELECT * FROM positing WHERE positing_NAME LIKE '%er';

-- -- DROP TABLE positing;

-- -- CREATE TABLE addition1(s_no VARCHAR(10), salary int);
-- -- INSERT INTO addition1(s_no, salary)VALUES(1, 10000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(2, 9000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(3, 8000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(4, 7000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(5, 6000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(6, 5000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(7, 4000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(8, 3000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(9, 2000);
-- -- INSERT INTO addition1(s_no, salary)VALUES(10, 1000);

-- -- SELECT * FROM addition1;

-- -- -- DROP TABLE addition1;

-- -- SELECT TOP 3 salary from addition1 ORDER BY salary
