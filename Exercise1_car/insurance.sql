create database insurance;
use insurance;

create table person( 
	driver_id varchar(10),
    name varchar(20),
	address varchar(30),
	primary key(driver_id)
);

desc person;

create table car(
	reg_num varchar(10),
	model varchar(10),
	year int,
	primary key(reg_num)
);

desc car;

create table accident(
	report_num int,
	accident_date date,
	location varchar(20),
	primary key(report_num)
);

desc accident;

create table owns(
	driver_id varchar(10),
	reg_num varchar(10),
	primary key(driver_id,reg_num),
	foreign key(driver_id) references person(driver_id),
	foreign key(reg_num) references car(reg_num)
);

desc owns;

create table participated(
	driver_id varchar(10),
	reg_num varchar(10),
	report_num int,
	damage_amount int,
	primary key(driver_id,reg_num,report_num),
	foreign key(driver_id) references person(driver_id),
	foreign key(reg_num) references car(reg_num),
	foreign key(report_num) references accident(report_num)
);

desc participated;

insert into person values('A01','Raghu','Electronic City');
insert into person values('A02','Rishab','Orange County');
insert into person values('A03','Rufus','NR Colony');
insert into person values('A04','Jamal','Lawrence Park');
insert into person values('A05','Kevin','Rosedale');

commit;

select * from person;

insert into car values('KA031111','Accord',2005);
insert into car values('KA041122','MX-5',2019);
insert into car values('KA051133','Indica',2010);
insert into car values('KA061144','Prius',2015);
insert into car values('KA071155','Camry',2020);
commit;

select * from car;

insert into accident values(11,'2008-01-01','NR Road');
insert into accident values(12,'2008-02-02','Dalhousie Road');
insert into accident values(13,'2020-03-03','Henry Road');
insert into accident values(14,'2020-04-04','Beehive Road');
insert into accident values(15,'2020-05-05','Orange Street');
commit;

select * from accident;

insert into owns values ('A01','KA031111');
insert into owns values ('A02','KA041122');
insert into owns values ('A03','KA051133');
insert into owns values ('A04','KA061144');
insert into owns values ('A05','KA071155');
commit;

select * from owns;

insert into participated values ('A01','KA031111',11, 10000);
insert into participated values ('A02','KA041122',12, 20000);
insert into participated values ('A03','KA051133',13, 30000);
insert into participated values ('A04','KA061144',14, 40000);
insert into participated values ('A05','KA071155',15, 50000);
commit;
select * from participated;

update participated set damage_amount=25000 where report_num=12;
select * from participated;

insert into accident values(16,'2008-03-08','Domlur');
select*from accident;

select count(distinct driver_id) from accident, participated 
where accident.report_num = participated.report_num
and accident_date like '%08';

select count(report_num) from car, participated
where car.reg_num = participated.reg_num
and model = "indica"










