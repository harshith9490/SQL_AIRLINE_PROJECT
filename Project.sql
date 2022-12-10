show databases;
use <database name>;

# tip is like dont use the <> in the use command;

create table passengers(
     pid int primary key,
     pname varchar(20),
     age int,
     gender varchar(10)
     );
insert into passengers values(1,'ramu',19,'male');
insert into passengers values(2,'komali',10,'female');
insert into passengers values(3,'anand',29,'male');
insert into passengers values(4,'venkatesh',20,'male');
insert into passengers values(5,'dhanu',21,'male');
insert into passengers values(6,'murthy',22,'male');
select * from passengers;

create table price(
     flight_no int primary key,
     amount int);
insert into price values(5491,15000);
insert into price values(5492,75000);
insert into price values(5493,65000);
insert into price values(5494,35000);
insert into price values(5495,45000);
insert into price values(5496,25000);
select * from price;

create table reserves (
       pid int,
       flight_no int,
       primary key(pid,flight_no),
       foreign key(pid) references passengers(pid),
       foreign key(flight_no) references price(flight_no)
       );
insert into reserves values(1,5491);
insert into reserves values(2,5492);
insert into reserves values(3,5493);
insert into reserves values(4,5494);
insert into reserves values(5,5495);
insert into reserves values(6,5496);
select * from reserves;


create table paymentreceipt(
     reid int primary key,
     paymentmethod varchar(20)
     );
insert into paymentreceipt values(522,'credit card');
insert into paymentreceipt values(523,'phone pe');
insert into paymentreceipt values(527,'google pay');
insert into paymentreceipt values(529,'cash');
insert into paymentreceipt values(520,'amazonpe');
insert into paymentreceipt values(532,'net banking');
select * from paymentreceipt;
SET FOREIGN_KEY_CHECKS=0;
create table payments(
    pid int,
    reid int,
    primary key(pid,reid),
    foreign key(pid) references passenger(pid),
    foreign key(reid) references paymentreceipt(reid)
    );
insert into payments values(1,522);
insert into payments values(2,523);
insert into payments values(3,527);
insert into payments values(4,529);
insert into payments values(5,520);
insert into payments values(6,532);
select * from payments;

create table destination(
       sno int primary key,
       fromdestination varchar(20)
       );
insert into destination values(1,'vizag');
insert into destination values(2,'nellore');
insert into destination values(3,'chittor');
insert into destination values(4,'chennai');
insert into destination values(5,'kashmir');
insert into destination values(6,'bangalore');
select * from destination;


create table airport(
     aid int primary key,
     location varchar(10)
     );
insert into airport values(145,'vizag');
insert into airport values(149,'chittor');
insert into airport values(148,'rajhmundry');
insert into airport values(147,'hyderabad');
insert into airport values(146,'bangalore');
 select * from airport;
 
 
CREATE TABLE flightclass(
       flcid int primary key,
       flightclass varchar(20)
       );
INSERT into flightclass values(5491,'first class');
INSERT into flightclass values(5623,'business class');
INSERT into flightclass values(7686,'economy class');
INSERT into flightclass values(5602,'business class');
INSERT into flightclass values(5645,'first class');
INSERT into flightclass values(9668,'economy class');
select * from flightclass;

create table journeydate(
        pid int,
        flcid int,
        day varchar(20),
        primary key(pid,flcid),
        foreign key(pid) references passenger(pid),
        foreign key(flcid) references flightclass(flcid)
        );
insert into journeydate values(1,5491,'23/12/22');
insert into journeydate values(2,5623,'15/12/22');
insert into journeydate values(3,5602,'27/12/22');
insert into journeydate values(2,5645,'26/12/22');
insert into journeydate values(2,9668,'02/12/22');
insert into journeydate values(2,7686,'18/12/22');
select * from journeydate;


select pname from passengers where age>20;

select pname from passengers,journeydate where journeydate.pid=passengers.pid and journeydate.day=('23/12/22');

select * from passengers,reserves where passengers.pid=reserves.pid;

select payments from paymentreceipt,payments where payments.pid=5 and paymentreceipt.reid=payments.reid;

select avg(amount) from price;

select distinct count(reid) from paymentreceipt;

select min(age) from passengers;

select * from passengers cross join reserves;

select * from passengers natural join reserves;
