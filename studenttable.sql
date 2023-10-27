---Creating the student table
CREATE TABLE studenttable(
id int PRIMARY KEY NOT NULL,
studentname varchar(30) NOT NULL
);
GO 

----Inserting the data to the table
INSERT studenttable(id,studentname) VALUES(11 ,'bhavani')
INSERT studenttable(id,studentname) VALUES(12 ,'sowmya')
INSERT studenttable(id,studentname) VALUES(13,'naveen')
INSERT studenttable(id,studentname) VALUES(14,'romika')
GO 

-----Reading from the table
SELECT *FROM studenttable
GO

-----Creating table for subject table
CREATE TABLE sujecttable(
subid int PRIMARY KEY NOT NULL,
title varchar(30) NOT NULL
);

GO

----Inserting data to the subjecttable
INSERT sujecttable(subid,title) VALUES(4,'CyberForensics')
INSERT sujecttable(subid,title) VALUES(5,'Datastructure')
INSERT sujecttable(subid,title) VALUES(6,'DBMS')
GO

---Reading the subjecttable
SELECT *FROM sujecttable
GO

-----Creating Table for Examtable
CREATE TABLE examtable(
examid int PRIMARY KEY NOT NULL,
);
 
 Alter table examtable
 ADD id int NOT NULL;


alter table examtable
ADD subid int not null;



---Insert data to the examtable
INSERT examtable(examid,id,subid) VALUES (11,10,25);
INSERT examtable(examid,id,subid) VALUES (12,12,40);
INSERT examtable(examid,id,subid) VALUES (13,23,20);
INSERT examtable(examid,id,subid) VALUES (14,43,28);
GO 



SELECT *FROM examtable
GO


alter table examtable
add id int;

alter table examtable
add subid int;


------
ALTER TABLE examtable
ADD CONSTRAINT FK_studenttable FOREIGN KEY(id) REFERENCES studenttable(id)
GO

ALTER TABLE examtable
ADD CONSTRAINT FK_sujecttable FOREIGN KEY(subid) REFERENCES sujecttable(subid)
GO

select *from examtable
go
select *from studenttable
select *from sujecttable
-
---inner join
select examtable.examid,studenttable.id,studenttable.studentname, sujecttable.title from examtable
inner join studenttable on  examtable.id=studenttable.id
inner join sujecttable on examtable.subid=sujecttable.subid

----LEFT join
select examtable.examid,studenttable.id,sujecttable.subid from examtable
left join studenttable on examtable.id=studenttable.id
left join sujecttable on examtable.subid=sujecttable.subid


select *FROM examtable
select * from studenttable
select * from sujecttable

INSERT INTO examtable values(9999,22,33)
