----creating the entire table
CREATE TABLE Cartable(
CarID int NOT NULL,
CarModel varchar(30) NOT NULL,
Color varchar(10)
);
GO

----Inserting the data to the table
INSERT Cartable(CarID,CarModel,Color)
    VALUES(401 ,'TES','Black')
INSERT Cartable(CarID,CarModel,Color)
      VALUES(402,'ESP','RED')
INSERT Cartable(CarID,CarModel,Color)
      ValUES(403,'WSC','Blue')
INSERT Cartable(CarID,CarModel,Color)
      ValUES(404,'xyz','White')
GO

ALTER TABLE Cartable
ADD CONSTRAINT PK_Cartable PRIMARY KEY(CarID)
GO

SELECT * FROM Cartable
GO