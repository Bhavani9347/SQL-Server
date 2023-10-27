USE AdventureWorks2022
GO

----Creating the view table
CREATE VIEW HumanResources.EmployeeHireDate
AS 
SELECT p.FirstName,
 p.LastName,
 e.HireDate FROM HumanResources.Employee AS e
 INNER JOIN Person.Person AS p
 ON e.BusinessEntityID=p.BusinessEntityID;
 GO

 -----Query the view
 SELECT FirstName,lastname,hiredate
 FROM HumanResources.EmployeeHireDate
 ORDER BY LastName;
 GO


 -----Creating an indexed view 
 ---Some of the options to set and support indexed views
 SET NUMERIC_ROUNDABORT OFF;
 SET ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS ON;

 ----Create view with SchemaBinding
 IF OBJECT_ID('Sales.vOrders','view') IS NOT NULL
  DROP VIEW Sales.vOrders;
  GO

  CREATE VIEW Sales.vOrders
  WITH SCHEMABINDING
  AS
    SELECT SUM(UnitPrice * OrderQty *(1.00 -UnitPriceDiscount)) AS Revenue,OrderDate,ProductID,COUNT_BIG(*) AS COUNT
	FROM Sales.SalesOrderDetail AS od,Sales.SalesOrderHeader AS o
	WHERE od.SalesOrderID=o.SalesOrderID
	Group BY OrderDate,ProductID;
	Go

	-----Create an index on the view
CREATE UNIQUE CLUSTERED INDEX IDX_V1 ON Sales.vOrders(OrderDate,ProductID);
GO


SELECT SUM(UnitPrice * OrderQty *(1.00 - UnitPriceDiscount)) AS Rev, OrderDate, ProductID
FROM Sales.SalesOrderDetail AS od
Join Sales.SalesOrderHeader AS o
ON od.SalesOrderID=o.SalesOrderID
AND o.OrderDate >=CONVERT(datetime,'08/04/2022',102)
WHERE od.ProductID BETWEEN 700 AND 800
GROUP BY OrderDate,ProductID
ORDER BY Rev DESC;
GO

SELECT OrderDate ,SUM(UnitPrice * OrderQty *(1.00-UnitPriceDiscount)) AS Rev
FROM Sales.SalesOrderDetail AS od
JOIN Sales.SalesOrderHeader AS o
 ON od.SalesOrderID=o.SalesOrderID
 AND o.OrderDate>=CONVERT(datetime,'25/12/2022',103)
 AND o.OrderDate < CONVERT(datetime,'12/04/2021',104)
 GROUP BY OrderDate
 ORDER BY OrderDate ASC;
GO

SELECT OrderDate,Revenue
FROM Sales.vOrders WITH (NOEXPAND)
WHERE OrderDate >=CONVERT(datetime,'25/12/2022',103)
   AND OrderDate < CONVERT(datetime,'12/04/2021',104)
ORDER BY OrderDate ASC;


