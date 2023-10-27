----Creating a table
CREATE TABLE car (
    carID int NOT NULL ,
    carmodel varchar  NOT NULL,
    color varcharNOT NULL ,
);
GO

----Reading the table
select*from dbo.car

------INserting the data to the table
  insert into car(carID,carmodel,color) values(123,'s','r');
  insert into car(carID,carmodel,color) values(321,'a','b');
  insert into car(carID,carmodel,color) values(213,'d','g');
GO


alter table car
add constraint pk_car primary key(carid)