---Creating the table 
CREATE TABLE dbo.Products(
ProductID int PRIMARY KEY NOT NULL,
ProductName varchar(25) NOT NULL,
Price money NULL,
ProductDescription varchar(max) NULL)
GO
--Inserting data in table
INSERT dbo.Products(ProductID, ProductName,Price,ProductDescription) 
VALUES(1,'Clamp',12.48,'Workbench clamp')
GO
--2nd way to insert the data in the table using only value
INSERT dbo.Products
VALUES(2,'TIRE Bar',NULL,'Tool for changing tires')
GO
--updating or changing the data values in the table
UPDATE dbo.Products
SET ProductName='Flat Head Screwdriver'
WHERE ProductID=2
GO
--Reading all the data from table
SELECT ProductID,ProductName,ProductDescription
FROM Products
Where ProductName='Clamp';
GO
----Craeting the functions()
------Implementing the concatination function
Select CONCAT('Hello' ,'MySql')As result
Select CONCAT(26,'-',09,'-',2023)
Select CONCAT('Good', NULL ,'Evening')-----Concatenation with null values
----Using Replace Function
Select REPLACE('abhibhav','bhav','naya')
GO
-----Using Reverse function
Select ProductName ,REVERSE(ProductName) AS Reverse 
From dbo.Products

----Datetime functions
SELECT SYSDATETIME()AS RESULT1
,SYSDATETIMEOFFSET()AS RESULT2
,SYSUTCDATETIME() AS RESULT3
,CURRENT_TIMESTAMP AS RESULT4
,GETDATE() AS RESULT5
,GETUTCDATE() AS RESULT6;
---Conversions functions
Select CAST(11.9626 AS INT)AS RES1,
  CAST(-11.9626 AS INT)AS RES2,
  CAST(11.9626 AS NUMERIC)AS RES3,
  CAST(-11.9626 AS NUMERIC)AS RES4;
----Convert function
SELECT CONVERT(date,SYSDATETIME())
,CONVERT(date,SYSDATETIMEOFFSET())
,CONVERT(date,SYSUTCDATETIME())
,CONVERT(date,CURRENT_TIMESTAMP)
,CONVERT(date,GETDATE())
,CONVERT(date,GETUTCDATE());
GO
---Parse function
Select PARSE('Tuesday,26 September 2023' AS datetime2 USING 'en-US')AS Result;
GO
---Try convert--
Set dateformat dmy;
SELECT TRY_CONVERT(datetime2,'26-09-2023')AS Result;
GO
--Power function---
Declare @var1 Float;
Declare @var2 Float;
SET @var1=5;
SET @var2=3.5;
Select POWER(@var1,5) AS RES1 ,POWER(@var2,3.5) AS RES2;
---Round function
Select Round(143.9994,3),Round(143.9995,3);
GO
----Ceiling--
Select CEILING($168.20),CEILING($-168.25),CEILING($0.0);
GO
----Floor---
Select FLOOR(100.21),FLOOR(-100.21),FLOOR($100.21);
GO
---Exponential ---
Declare @var Float
Declare @result varchar(200)
Set @var=12
Select 'The Exponential of the variable is:'+CONVERT(varchar,EXP(@var))AS Output;
GO
----To view the databases
Select name ,database_id,create_date
FROM sys.databases;
Go
----Creating a schema
Create Schema cycle;
Go
---Adding table to the schema
Create table cycle.size(cycleID int,width dec(10,2));
Go

