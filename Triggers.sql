----trigger type one After 
CREATE trigger name1 ON Purchasing.Vendor
AFTER INSERT,UPDATE,DELETE
AS RAISERROR( 'Error is occurred',16,6);
GO

Select *from Purchasing.Vendor
UPDATE Purchasing.Vendor SET Name='Abhinaya' where BusinessEntityID=1492;
----DELETE FROM Purchasing.Vendor WHERE Name='Abhinaya' AND CreditRating=1;
GO

---Trigger type two Instead of 
Create trigger example2 ON Sales.Currency
INSTEAD OF INSERT,UPDATE
as raiserror('Error has been occured',18,4);
Go

Select *from Sales.Currency
UPDATE Sales.Currency SET name='bhavani' where CurrencyCode='ALL';
go



---Trigger using insert dml command 
Create trigger name ON HumanResources.Department
After DELETE AS
raiserror('Error',1,2)
go

Select *from HumanResources.Department
DELETE FROM HumanResources.Department
WHERE DepartmentID=1 AND Name='Engineering'
GO
