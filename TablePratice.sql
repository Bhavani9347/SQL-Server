----creating the table)
CREATE TABLE TablePratice(EmployeeID int,EmployeeName varchar(50),EmployeeLocation varchar(50),EmployeeRole varchar(50));
GO

----Reading the table without distinct
SELECT *FROM TablePratice
GO

----INSERTING VALUES INTO THE TABLE
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(101,'Bhavani','hyderabad','ASE');
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(102,'Romika','chennai','Developer');
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(103,'Naveen','Banglore','	DataAnalyst');
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(104,'Sowmya','Pune','JavaDeveloper');
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(105,'Shashank','chennai','BusinessAnalyst');
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(106,'Sampath','Noida','Tester');
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(102,'Balu','Mumbai','Analyst');
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(106,'Sampath','Noida','Tester');
INSERT INTO TablePratice(EmployeeID,EmployeeName,EmployeeLocation,EmployeeRole)
           VALUES(107,'Priyanka','Hyderabad','ITNetwork');

GO  
---Droping the entire table
DROP Table TablePratice;
Go

DELETE FROM TablePratice
WHERE EmployeeGender='F'
GO

----Inserting the Distinct into the table inorder to avoid the dupliacte values 
SELECT DISTINCT EmployeeID,EmployeeName FROM TablePratice;

----ADDING WHERE CLAUSE----
SELECT *FROM TablePratice
WHERE (EmployeeID <= 105)
GO

---Applying AND and OR to where clause
SELECT EmployeeID,EmployeeName, EmployeeLocation FROM TablePratice
WHERE EmployeeID=101 AND EmployeeName LIKE 'B%' AND EmployeeLocation='hyderabad';
Go

SELECT EmployeeID,EmployeeName, EmployeeLocation FROM TablePratice
WHERE  EmployeeID=101 AND (EmployeeName LIKE 'B%' OR EmployeeLocation='VIZAG');
Go

SELECT EmployeeID,EmployeeName, EmployeeLocation FROM TablePratice
WHERE EmployeeID=101 OR  EmployeeLocation='VIZAG';
Go

ALTER TABLE TablePratice
ADD EmployeeGender varchar;
GO

UPDATE TablePratice
SET EmployeeGender='F'
WHERE EmployeeID <=107;
GO

SELECT *FROM TablePratice;


-----ADDING Group-by --
SELECT COUNT(EmployeeGender) AS Countgender
FROM TablePratice WHERE EmployeeID<=107
GROUP BY EmployeeGender
GO

SELECT SUM(EmployeeID) AS TOTAL from tablepratice where employeeid<=107 group by employeeid
go

----Having clause ---
SELECT Count(Employeerole) AS Output from tablepratice where employeeid<=107 OR employeeid=100 group by employeerole
having count(employeerole) <107
go

-----orderby ---
SELECT Employeename,employeeid from tablepratice
order by Employeename ASC ,employeeid ASC
go
