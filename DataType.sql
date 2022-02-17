--String datatype 
--DATATYPE
--CHAR(n)       (Description)Fixed width character string,(max size)8000 characters,(storage)defined width
--VARCHAR(n)    (Description)Variable width character string,(max size)8000 characters,(storage)2 bytes + number of chars
--VARCHAR(max)  (Descripion)Variable width character string,(max size)1,073,741,824 characters,(storage) 2 bytes + number of chars
--TEXT          (Description)Variable width character string,(max size)2GB of text data,(storage) 4bytes + numbers of chars
--NCHAR         (Description)Fixed width Unicode string,(max size)4000 characters,(storage)Defined width x 2
--NVARCHAR      (Description)Variable width unicode string,(storage)4000characters
--NVARCHAR(MAX) (Description) variable width unicode string,(storage) 536,870,912
--NTEXT         (description) Variable width unicode string, (stroage) 2GB of text data
--BINARY        (description) Fixed width binary string,(stroage) 8000 bytes
--VARBINARY     (description)variable width binary string,,(stroage) 8000 bytes
--VARBINARY(MAX)(description) variable width binary strion, (stroage) 2gb
--IMAGE         (description) variable width binary string
-- CREATE TABLE StringDataTypeTable (
--     FirstName char(4000),
--     SecondName VARCHAR(4000),
--     ThridName VARCHAR(max),
--     FourthName TEXT,
--     FivthName nchar(255),
--     SixthName NVARCHAR(4000),
--     SeventhName NVARCHAR(max),
--     EigthName NTEXT,
--     NinthName BINARY(255),
--     TenthName VARBINARY(255),
--     lEVELTHName VARBINARY(MAX),
--     TWETHName IMAGE
--     );
    
-- SELECT * FROM StringDataTypeTable
-- DROP TABLE StringDataTypeTable

--NUMERIC datatype
--EXACT NUMBERICS
--Datatype      Description
--BIT           It's single bit integer that can take values of 0,1 or null
--TINYINT       It's single Byte integer we can store values from 0 to 255 (Minval:0, Maxval:255), (Storage Size) 1 Bytes
--SMALLINT      It's 16 bit integer we can store values from -2^15(-32,768) to 2^15 - 1(32,767), (Storage Size) 2 Bytes
--INT           It's 32 bit integer we can store values from (-2,147,483,648) to (2,147,483,647), (Storage Size) 4 Bytes
--BIGINT        It's Allows whole numbers between -9,223,372,036,854,775,808 and 9,223,372,036,854,775,807,(Storage Size) 8 Bytes
--DECIMAL(P,S)  Fixed precision and scale numbers.(storage size) 5-17 Bytes.
--              Allows numbers from -10^38+1 to 10^38-1.
--              The p paramter indicates the maximum total number of digits that can be stored(both to the left and to the right
--              of the decimal point). p must be a value from 1 to 38. default is 18.
--              The s parameter indicates the maximum number of digits stored to the right of the decimal point. s must be a value from 0 to p. 
--              Default value is 0.
--NUMERIC(P,S)  Fixed precision and scale numbers.(storage size) 5-17 Bytes.
--              Allows numbers from -10^38+1 to 10^38-1.
--              The p paramter indicates the maximum total number of digits that can be stored(both to the left and to the right
--              of the decimal point). p must be a value from 1 to 38. default is 18.
--              The s parameter indicates the maximum number of digits stored to the right of the decimal point. s must be a value from 0 to p. 
--              Default value is 0.
--SMALLMONEY    Monetary data from -214,748.3648 to 214,748.3647, (Stroage Size) 4 Bytes
--MONEY         Monetary data from 922,337,203,685,477.5808 to 922,337,203,685,477.5807, (stroage size) 8 Bytes

--APPROXIMATE NUMERICS
--FLOAT(N)      Floating precision number data from -1.79E + 308 to 1.79E + 308. (Storage size) 4 or 8 bytes
--              THEN n parameter indicates whether the field should hold 4 or 8 bytes. float(24) holds a 4-byte field and float(53) holds an 8-byte field. 
--              DEFAULT value of n is 53.
--REAL          Floating precision number data from -3.40E + 38 to 3.40E + 38, (Stroage size) 4 Bytes
-- CREATE TABLE NumbericDataTypeTable (
--     BITS     BIT, 
--     TINY     TINYINT,
--     SMALL    SMALLINT,
--     INTEGE   INT,
--     BIG      BIGINT,
--     DECIMALS DECIMAL(5,2),
--     NUMERICS NUMERIC(5,2),
--     SAMLLM   SMALLMONEY,
--     MONEYS   MONEY
-- );

-- INSERT INTO NumbericDataTypeTable 
-- (BITS,TINY,SMALL,INTEGE,BIG,DECIMALS,NUMERICS,SAMLLM,MONEYS) 
-- VALUES (1,255,32759,100,200,112.00,123.12,$3148.29,$3148.29)

-- SELECT * FROM NumbericDataTypeTable

-- DROP TABLE NumbericDataTypeTable

--DateAndTimeDatatype
--DataType  Description
--DATETIME          From january 1, 1753 to December 31, 9999 with an accuracy of 3.33 milliseconds, (storage size) 8 Bytes
--DATETIME2         From January 1, 0001 to December 31, 9999 with an accuracy of 100 nanoseconds, (storage size) 6 - 8 Bytes
--SMALLDATETIME    From January 1, 1900 to june 6, 2079 with an accuracy of 1 miute, (storage size) 4 Bytes
--DATE              Store a date only. From January 1, 0001 to December 31, 9999,(storage size) 3 Bytes
--time              Store a time only to an accuracy of 100 nanoseconds,(storage size) 3-5 Bytes,
--datetiemoffset    The same as datetime2 with the addition of a time zone offset, (storage size) 8 - 10 Bytes
--timestamp         Stores a unique number that ges updated every time a row gets created or modified.
--                  The timestamp value is based upon an iternal clock and does not correspond to real time.
--                  Each table may have only one timestamp variable.
CREATE TABLE DateAndTimeTable(
    one DATETIME,
    TWO DATETIME2,
    THREE SMALLDATETIME,
    FOUR DATE,
    FIVE TIME,
    SIX DATETIMEOFFSET,
);

INSERT INTO DateAndTimeTable
(one,TWO,THREE,FOUR, FIVE, SIX)
VALUES(SYSDATETIME(),
SYSDATETIME(),
CURRENT_TIMESTAMP,
GETDATE(),
CONVERT(time,SYSDATETIME()),
SYSDATETIMEOFFSET())

SELECT * FROM DateAndTimeTable

DROP TABLE DateAndTimeTable;
--Get the Current System Date and Time
SELECT SYSDATETIME()  
    ,SYSDATETIMEOFFSET()  
    ,SYSUTCDATETIME()  
    ,CURRENT_TIMESTAMP  
    ,GETDATE()  
    ,GETUTCDATE();  
/* Returned:  
SYSDATETIME()      2007-04-30 13:10:02.0474381  
SYSDATETIMEOFFSET()2007-04-30 13:10:02.0474381 -07:00  
SYSUTCDATETIME()   2007-04-30 20:10:02.0474381  
CURRENT_TIMESTAMP  2007-04-30 13:10:02.047  
GETDATE()          2007-04-30 13:10:02.047  
GETUTCDATE()       2007-04-30 20:10:02.047  
*/
--Get the Current System Date
SELECT CONVERT (DATE, SYSDATETIME())  
    ,CONVERT (DATE, SYSDATETIMEOFFSET())  
    ,CONVERT (DATE, SYSUTCDATETIME())  
    ,CONVERT (DATE, CURRENT_TIMESTAMP)  
    ,CONVERT (DATE, GETDATE())  
    ,CONVERT (DATE, GETUTCDATE());  
  
/* Returned   
SYSDATETIME()      2007-05-03  
SYSDATETIMEOFFSET()2007-05-03  
SYSUTCDATETIME()   2007-05-04  
CURRENT_TIMESTAMP  2007-05-03  
GETDATE()          2007-05-03  
GETUTCDATE()       2007-05-04  
*/  
--Get the Current System Time
SELECT CONVERT (TIME, SYSDATETIME())  
    ,CONVERT (TIME, SYSDATETIMEOFFSET())  
    ,CONVERT (TIME, SYSUTCDATETIME())  
    ,CONVERT (TIME, CURRENT_TIMESTAMP)  
    ,CONVERT (TIME, GETDATE())  
    ,CONVERT (TIME, GETUTCDATE());  
  
/* Returned  
SYSDATETIME()      13:18:45.3490361  
SYSDATETIMEOFFSET()13:18:45.3490361  
SYSUTCDATETIME()   20:18:45.3490361  
CURRENT_TIMESTAMP  13:18:45.3470000  
GETDATE()          13:18:45.3470000  
GETUTCDATE()       20:18:45.3470000  
*/  
SELECT CURRENT_TIMESTAMP;