----Creating table
CREATE TABLE Productiontable(
pid int NOT NULL
);
GO 

ALTER TABLE Productiontable
ALTER COLUMN pid int NOT NULL

---Inserting the data into the table
INSERT Productiontable(pid) VALUES(5)
INSERT Productiontable(pid) VALUES(6)
INSERT Productiontable(pid) VALUES(7)


ALTER TABLE Productiontable
ADD CONSTRAINT PK_Productiontable PRIMARY KEY(pid);

ALTER TABLE Productiontable
ADD manfid int;

ALTER TABLE Productiontable
ADD CarID int;

ALTER TABLE Productiontable
ADD CONSTRAINT FK_Manfacturetable FOREIGN KEY(manfid) REFERENCES Manfacturetable(manfid)
GO 

ALTER TABLE Productiontable
ADD CONSTRAINT FK_Cartable FOREIGN KEY(CarID) REFERENCES Cartable(CarID)
GO

SELECT *FROM Productiontable