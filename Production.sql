----Creating table for Production
create table production(
pid int NOT NULL );
GO
 
insert into production(pid) values(4);
insert into production(pid) values(5);
insert into production(pid) values(6);
GO
 

select *from production
GO

 
alter table production
add constraint pk_production primary key(pid);
GO
 

alter table production
add  manfid int;
GO
 

alter table production
add carid int;
GO
 

alter table production
add constraint fk_manufacture
foreign key(manfid) references manufacture(manfid);
go
 

alter table production
add constraint fk_car
foreign key(carid) references car(carid);
GO
