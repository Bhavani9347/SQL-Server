create table manufacture(
manfid int NOT NULL,
manfname varchar(255),
location varchar(255)
);
GO


insert into manufacture(manfid,manfname,location) values(1,'xyz','kmm')
insert into manufacture(manfid,manfname,location) values(2,'yzx','hyd')
insert into manufacture(manfid,manfname,location) values(3,'uvw','vizag')
GO
select *from manufacture
go

alter table manufacture
add constraint pk_manufacture primary key(manfid);
go