---Creating a Table 
Create TABLE dbo.Producttasktables
(
ProductID int NOt NULL,
ProductTitle varchar(30) NOT NULL,
ProductPrice Money NOT NULL,
ProductDescription varchar(200) NOT NULL,
manufacturedate datetime2 NOT NULL,
CONSTRAINT PK_Producttasktables PRIMARY KEY NONCLUSTERED(ProductID)
);
GO
----Inserting the data to the table 1strow
INSERT into Producttasktables
(ProductID,ProductTitle,ProductPrice,ProductDescription,manufacturedate)
   Values(100,'FaceCream',1000,'Used For skin-care','2023-06-20')
GO
---Inserting the data to the table 2ndrow
INSERT Producttasktables
(ProductID,ProductTitle,ProductPrice,ProductDescription,manufacturedate)
     Values(101,'FaceMask',500,'For the clear skin','2023-07-04')
GO
---Inserting the data to the table 3rdrow
INSERT Producttasktables
(ProductID,ProductTitle,ProductPrice,ProductDescription,manufacturedate)
     Values(103,'FacePack',500,'For the Make-up','2023-05-04')
GO
---Inserting the data to the table 4throw
INSERT Producttasktables
(ProductID,ProductTitle,ProductPrice,ProductDescription,manufacturedate)
     Values(104,'Facewash',500,'Clears the skin from acnes','2023-05-09')
GO
---Inserting the data to the table 5throw
INSERT Producttasktables
(ProductID,ProductTitle,ProductPrice,ProductDescription,manufacturedate)
     Values(105,'Primer',500,'Basic step for the make-up','2023-03-04')
GO


--Reading the data for the displaying table with content
SELECT *FROM Producttasktables
GO



----Foreign key---
CREATE TABLE ProductCategories(
ID int NOT NULL,
Type varchar(20) NOT NULL,
Avaiablestores varchar(20) NOT NULL
);
----ALTER TABLE
ALTER TABLE ProductCategories
ADD CONSTRAINT PK_ID PRIMARY KEY(ID)
GO
----INserting the data to the productcategories table
Insert ProductCategories
values(100,'mamaearth','Hyderabad')
GO
Insert ProductCategories
values(101,'Citaphil','Chennai')
GO
Insert ProductCategories
values(102,'Dazler','Banglore')
GO
Insert ProductCategories
values(103,'Panthanjali','PANINDIA')
GO
Insert ProductCategories
values(104,'Organic','Andhra Pradhesh')
GO
Insert ProductCategories
values(105,'Lakme','PANINDIA')
GO
Insert ProductCategories
values(105,'Eterna','Hyderabad')
GO



ALTER TABLE Producttasktables
ADD CONSTRAINT PK_Producttasktables PRIMARY KEY(ProductID);

ALTER TABLE ProductCategories
ADD CONSTRAINT FK_Producttasktables Foreign KEY (ProductID) REFERENCES Producttasktables(ProductID);

