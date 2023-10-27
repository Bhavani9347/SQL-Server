---Creating storedprocedure for the table humanresources.shift
CREATE PROCEDURE humanresources @ShiftID tinyint
AS
SELECT *FROM HumanResources.Shift
WHERE ShiftID =@ShiftID
GO

---EXECUTING THE STORED procedure 
EXEC humanresources @ShiftID= 2;


---Creating storedprocedure for the table Sales.Customer
CREATE PROCEDURE datatable @CustomerID int, @PersonID int
AS
SELECT * FROM Sales.Customer
WHERE CustomerID=@CustomerID OR PersonID=@PersonID
GO
----EXEC---
EXEC datatable @CustomerID=12,@PersonID=56;


-----CREATING VIEWS
CREATE VIEW Creditview AS
SELECT BusinessEntityID,CreditCardID 
FROM Sales.PersonCreditCard
WHERE (BusinessEntityID <300)

SELECT * FROM Creditview


 SELECT *FROM Sales.PersonCreditCard





 -----creating sub-query
 SELECT LoginID
 FROM HumanResources.Employee
 WHERE BusinessEntityID in (
     SELECT BusinessEntityID
	 FROM Person.BusinessEntityAddress
	 WHERE (BusinessEntityID<20));

SELECT *FROM Person.BusinessEntityAddress