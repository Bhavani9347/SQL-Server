---creating the person table--
CREATE TABLE person (
Personid int PRIMARY KEY ,personname varchar(20))
go 

-----Inserting the values--
INSERT INTO person(Personid,personname) VALUES(1,'Prabhas')
INSERT INTO person(Personid,personname) VALUES(2,'Anushka')
INSERT INTO person(Personid,personname) Values(3,'Nivetha')
INSERT INTO person(Personid,personname) VALUES(4,'Keerthy')
GO

SELECT *FROM person

----Creating the subject table
CREATE TABLE Subject(Subjectid int PRIMARY KEY,Subname varchar(30))
GO

-----Inserting the values into the subject table
INSERT INTO Subject VALUES(11,'Data structures')
INSERT INTO Subject VALUES(12,'Javaprogramming')
INSERT INTO Subject VALUES(13,'oops')
INSERT INTO Subject VALUES(14,'Dbms')
INSERT INTO Subject VALUES(1,'Dbms')
INSERT INTO Subject VALUES(3,'Dbms')
GO

SELECT * FROM Subject

-----Creating the test table
CREATE TABLE Test (testid int PRIMARY KEY,personid int , subjectid int);
GO

----Inserting the values to the test table
INSERT INTO Test VALUES(41, 42,43)
INSERT INTO Test VALUES(44,4,14)
INSERT INTO Test Values(45,7,12)
INSERT INTO Test Values(46,2,14)
INSERT INTO Test Values(1,2,14)
INSERT INTO Test Values(2,2,14)
INSERT INTO Test Values(3,2,14)




GO



ALTER Table Test
ADD CONSTRAINT fk_person FOREIGN KEY(personid) REFERENCES person(personid)
GO

ALTER Table Test
ADD CONSTRAINT FK_Subject foreign key(subjectid) REFERENCES Subject(subjectid)
GO

----inner join
 SELECT person.Personid personname,Subname,testid from Test
 INNER JOIN person on Test.testid=person.Personid
 INNER JOIN Subject on Test.testid=Subject.Subjectid
 Go

 ---cross join
 SELECT personname,testid,test.personid from test
 CROSS JOIN person

 ---left join
 SELECT person.Personid personname,Subject.Subjectid,testid from Test
 LEFT JOIN person on Test.testid=person.Personid
 LEFT JOIN Subject on Test.testid=Subject.Subjectid
 Go

 ---right join
 SELECT person.Personid personname,Subject.Subjectid,testid from Test
 right JOIN person on Test.testid=person.Personid
 right JOIN Subject on Test.testid=Subject.Subjectid
 Go


SELECT *FROM person
SELECT * FROM Test


-----Creating a view table
Create VIEW [output]
AS SELECT person.personname,person.Personid FROM person
WHERE Personid <=107;
GO
SELECT *FROM output

-----Creating the stored Procedure
CREATE PROCEDURE selectalltestdetails AS
SELECT * FROM Test
Go
---Executing the above query instead of select we use exec in stored procedure
EXEC selectalltestdetails

----Creating a storedprocedure for a particular parameter
CREATE PROCEDURE result @Subjectid int AS
SELECT *FROM Subject 
WHERE Subjectid=@Subjectid
GO
EXEC result @Subjectid=1;


-----Creating a table-valued functions
CREATE FUNCTION outputs (@id int)
RETURNS TABLE AS RETURN(
SELECT Personid,personname from person
WHERE Personid=@id
);
GO
SELECT * FROM outputs(1);

-----Using format to display and set the dateandtime(getdate() or sysdatetime() to display the current time
SELECT FORMAT(SYSDATETIME(), 'dd/MMMM/yyy' ,'en-US')'US English'
GO

SELECT FORMAT(getdate(),N'hh:mm tt') AS CURRENTTIMEHOURSANDMINUTES
GO

---SCALAR value function[Which returns a single value in datatype format  that value may be integer,string,text 
CREATE FUNCTION multiplying(@num1 int,@num2 int)
returns int as
begin
return @num1 *@num2
end
SELECT dbo.multiplying(4,8) AS Output;
go


----Implementing the error handling
CREATE PROCEDURE errors AS 
SELECT ERROR_LINE() AS Errorline,ERROR_MESSAGE() AS errormessage,ERROR_NUMBER() as errornumber ,ERROR_PROCEDURE() AS errorprocedure,ERROR_SEVERITY() as errorseverity,ERROR_STATE() as errorstate  
BEGIN TRY
        SELECT 4/0
END TRY
BEGIN CATCH
           EXECUTE errors
END CATCH;
go

----Throw----
Throw 51000 ,'The error is diaplaying at line',4;

----Raise error--------
DECLARE @var nvarchar(30);
SET @var=N'<\<%9.4s>>';
RAISERROR(@var,12,4,N'errors');
go


-----Adding triggers into the table
CREATE trigger names ON person
AFTER insert AS
raiserror('error occurred',8,6); 
GO
---inserting the value into the trigger table
SELECT *from person
INSERT into person(Personid,personname) values(6,'kavya')
go

CREATE trigger names1 ON person
Instead of insert AS
raiserror('error occurred',8,6); 
GO
---inserting the value into the trigger table
SELECT *from person
INSERT into person(Personid,personname) values(6,'kavya')
go

---deleting the row in the trigger table with after type
create trigger names2 on Subject 
After delete AS raiserror('error is generated',6,6);
GO
 SELECT *FROM Subject
 delete from Subject
 Where Subjectid=1 AND Subname='Dbms'
 go

 ---deleting the row in the trigger table with instead of type
create trigger names2 on Subject 
instead of delete AS raiserror('error is generated',6,6);
GO

 SELECT *FROM Subject
 delete from Subject
 Where Subjectid=1 AND Subname='Dbms'
 go


