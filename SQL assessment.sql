-----NAME A.BHAVANI REDDY 
----EMPLOYEEID :1033311

-----Query 1---
--Reading and displaying -----

SELECT name,ListPrice FROM Production.Product
GO


---Query 2---

SELECT *FROM Sales.Customer
SELECT *FROM Person.Person
SELECT *FROM Person.EmailAddress
SELECT *FROM Person.Address
SELECT p1.FirstName,p1.LastName,ea.EmailAddress,ad.City INTO NewCustomerTable
FROM Person.Person p1
JOIN Person.EmailAddress ea ON p1.BusinessEntityID = ea.BusinessEntityID
JOIN Person.Address ad ON p1.BusinessEntityID = ad.AddressID
JOIN Sales.Customer c ON p1.BusinessEntityID = c.PersonID;

----Reading and displaying the name,email and city-----

select firstname, lastname,EmailAddress,City from NewCustomerTable where city='seattle';
GO


----QUERY 3----- 

SELECT * FROM Sales.SalesOrderDetail 
SELECT *FROM Production.Product
SELECT p.Name AS ProductName, SUM(sod.OrderQty * sod.UnitPrice) AS TotalSalesAmount
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE p.ProductID = 793
GROUP BY p.Name;
GO


----QUERY 4----------

SELECT * FROM HumanResources.Employee
SELECT *from Person.Person
SELECT p1.LastName AS LastName, p1.FirstName AS FirstName,e1.JobTitle
FROM HumanResources.Employee e1
JOIN Person.Person p1 ON e1.BusinessEntityID = p1.BusinessEntityID
ORDER BY e1.JobTitle ASC;
GO


-----QUERY 5--------

SELECT *from Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderDetail
SELECT *FROM Production.Product
SELECT p1.Name AS ProductName, Sod.OrderQty
FROM Sales.SalesOrderHeader Soh
JOIN Sales.SalesOrderDetail Sod ON Soh.SalesOrderID = Sod.SalesOrderID
JOIN Production.Product p1 ON Sod.ProductID = p1.ProductID
WHERE Soh.CustomerID = 29485;
GO

-----QUERY 6------

SELECT *FROM Sales.SalesOrderHeader ----order date
SELECT *FROM HumanResources.Employee
SELECT *FROM Purchasing.PurchaseOrderHeader----order date---
SELECT *FROM Person.Person----customer name--


Select soh.SalesOrderID AS OrderNumber,soh.OrderDate,person.firstname,person.lastname
From Sales.SalesOrderHeader soh 
Join person.person person on person.BusinessEntityID= soh.SalesPersonID
Where SalesPersonID = 276;
GO


-----QUERY 7-----

SELECT *from Sales.SalesOrderHeader
SELECT *FROM Person.Person
SELECT *FROM Person.EmailAddress

SELECT person.FirstName AS CustomerFirstName, person.LastName AS CustomerLastName, ead.EmailAddress AS CustomerEmailAddress
FROM Person.Person person
JOIN Person.EmailAddress ead ON person.BusinessEntityID = ead.BusinessEntityID
LEFT JOIN Sales.SalesOrderHeader soh ON person.BusinessEntityID = soh.CustomerID
WHERE soh.SalesOrderID IS NULL;
GO

-----Query 8-----

SELECT Production.ProductCategory.name AS CategoryName,
    AVG(Sales.SalesOrderDetail.OrderQty * Sales.SalesOrderDetail.UnitPrice) AS Averagesalesamount
FROM Production.ProductCategory
JOIN Production.ProductSubcategory ON Production.ProductCategory.ProductCategoryID = Production.ProductSubcategory.ProductCategoryID
JOIN Production.Product ON Production.ProductSubcategory.ProductSubcategoryID = Production.Product.ProductSubcategoryID
JOIN Sales.SalesOrderDetail ON Production.Product.ProductID = Sales.SalesOrderDetail.ProductID
GROUP BY Production.ProductCategory.name;
GO


----QUERY 9-----

SELECT *FROM Production.Product
SELECT *FROM Sales.SalesOrderDetail-----product name and total quality sold
---SELECT *FROM Production.TransactionHistoryArchive
----SELECT *FROM Production.TransactionHistory

SELECT TOP 10 person.Name AS ProductName,SUM(sod.OrderQty) AS TotalQuantitySold
FROM Production.Product person
JOIN Sales.SalesOrderDetail sod ON person.ProductID = sod.ProductID
GROUP BY person.Name
ORDER BY TotalQuantitySold DESC;
GO



----QUERY 10-------

SELECT * FROM Sales.SalesOrderHeader;
SELECT SalesOrderID, OrderDate, ShipDate 
FROM Sales.SalesOrderHeader
WHERE  
GO