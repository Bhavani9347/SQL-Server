----USING FORMAT-----INn format:d,D[d -means the date format only in number][D-the data will displayed in the words format]
----syntax:FORMAT(value,format [,culture])
DECLARE @d DATE ='9/29/2023';
SELECT FORMAT(@d ,'d','en-US')'US English',
FORMAT(@d,'d','en-gb')'British English',
FORMAT(@d,'d','de-de')'German',
FORMAT(@d,'d','zh-cn')'Chinese Simplified(PRC)';
SELECT FORMAT(@d ,'D','en-US')'US English',
FORMAT(@d,'D','en-gb')'British English',
FORMAT(@d,'D','de-de')'German',
FORMAT(@d,'D','zh-cn')'Chinese Simplified(PRC)';
GO


-----Formating numeric values using formats
DECLARE @d DATE =GETDATE();
SELECT FORMAT(@d ,'dd/M/yyyy','en-US')AS 'DATE',
       FORMAT(0987654321,'####-####-##')AS 'Custom Number';
Result:


SELECT TOP(5) CurrencyRateID,EndOfDayRate,
     FORMAT(EndOfDayRate,'N','en-us') AS 'Numeric Format',
	 FORMAT(EndOfDayRate,'G','en-us') AS 'Generic Format',
	 FORMAT(EndOfDayRate,'C','en-us') AS 'Currency Format'
FROM Sales.CurrencyRate
ORDER BY CurrencyRateID;

----format current time
SELECT FORMAT(SYSDATETIME(),N'hh:mm tt');
SELECT FORMAT(SYSDATETIME(),N'hh:mm t');
----Error Handling
CREATE PROCEDURE usp_GetErrorInfo
AS
SELECT ERROR_NUMBER() AS ErrorNumber,
       ERROR_SEVERITY() AS ErrorSeverity,
	   ERROR_STATE() AS ErrorState,
	   ERROR_PROCEDURE() AS ErrorProcedure,
	   ERROR_LINE() AS Errorline,
	   ERROR_MESSAGE() AS Errormessage;
GO
BEGIN TRY
 SELECT 1/0;
END TRY
 BEGIN CATCH
   EXECUTE usp_GetErrorInfo;
 END CATCH;

 
 ---Using try and catch in transaction
 BEGIN TRANSACTION
 BEGIN TRY
   DELETE FROM Production.Product WHERE ProductID=980;
 END TRY 
 BEGIN CATCH
   SELECT ERROR_NUMBER() AS Errornumber,
          ERROR_LINE() AS Errorline,
		  ERROR_MESSAGE() AS Errormessage,
		  ERROR_PROCEDURE()AS Errorprocedure,
		  ERROR_SEVERITY() AS Errorseverity,
		  ERROR_STATE() AS Errorstate;

		  IF @@TRANCOUNT >0
		     ROLLBACK TRANSACTION;
  END CATCH;
    
	IF @@TRANCOUNT >0
	   COMMIT TRANSACTION;
	GO

  throw 12345667, 'the error is at line',4; 

------RAISE ERRORS
DECLARE @StringVariable NVARCHAR(30);
SET @StringVariable =N'<\<%5.6s>>';

RAISERROR (@StringVariable,10,1,N'zyxvuw');
GO

CREATE TRIGGER reminder2
ON SALES.Customer
AFTER INSERT ,UPDATE 
AS RAISERROR('Notify Customer Relations',16,10);
GO


SELECT *  FROM Sales.Customer

UPDATE Sales.Customer SET PersonID=3 WHERE CustomerID=53;


UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;