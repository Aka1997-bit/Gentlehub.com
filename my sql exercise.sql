create database Gabriel;
use gabriel;
create table staff(id int,firstname text,lastname text,age int,department text,hire_date date,salary int);
select * from staff;
insert into staff values(101,"Oge","Akachukwu",23,"Admin","2002-02-19",900000);
insert into staff values(102,"William","Oge",20,"HR","2012-04-05",500000);
insert into staff values(103,"Ezinne","favour",22,"Reception","2018-02-01",300000);
insert into staff values(104,"Samuel","Agbom",30,"Admin","2002-01-05",800000);
insert into staff values(105,"kenneth","Makuochi",15,"IT","2007-09-08",200000);
select * from staff;
create table firm(id int,emp_name text,age int,job_id text,hire_date date,salary float);
select * from firm;
insert into firm values(01,"Ogechukwu",23,"Admin","2004-02-14",90000);
insert into firm values(02,"WilliOge",20,"HR","2010-04-04",50000);
insert into firm values(03,"Ezinfavo",22,"Reception","2019-04-03",30000);
insert into firm values(04,"SamAgbo",30,"Admin","2007-01-05",80000);
insert into firm values(05,"kenMakuochi",15,"IT","2007-09-08",200000);
select * from firm;
select max(salary) from staff where salary <500000;
select firstname,lastname,salary from staff where salary <500000;
select firstname,lastname,department from staff where department ="IT";
select avg(salary) as "average salary" from staff;
select firstname,lastname,salary from staff where lastname ="Akachukwu" and salary =900000;
DROP TABLE STAFF;
SELECT * FROM STAFF;
create table staff(id int,firstname text,lastname text,age int,department text,hire_date date,salary int,gender text);
select * from staff;
SELECT ID,FIRSTNAME,LASTNAME,SALARY FROM STAFF ORDER BY SALARY DESC LIMIT 3;
SELECT ID,FIRSTNAME,LASTNAME,SALARY FROM STAFF ORDER BY SALARY DESC LIMIT 2 OFFSET 1;
SELECT DEPARTMENT,SUM(SALARY) FROM STAFF GROUP BY DEPARTMENT;
select department,sum(salary) from staff group by department having sum(salary) >600000;
select id,firstname,lastname, department from staff group by department;
alter table staff add column gender varchar (5);
select * from staff;
select firstname from staff where firstname like "%th";
select lastname from staff where lastname like "%chi";
rename table staff to Stakeholders;
select * from Stakeholders;
drop table firm;
set sql_safe_updates=0;
update firm set salary=100000 where id=01;
select * from firm;
rollback;
select * from firm;
alter table firm ADD COLUMN GENDER VARCHAR(5);
SELECT * FROM FIRM;
use gabriel;
create table skul(student_ID int, student_name text, age int, class text, department text);
select * from skul;
insert into skul values(01, "Abigail Jane", 20, "SS 1", "Arts"),(02, "Micheal Moses", 21, "SS 2", "Commercial"),
(03, "Samson Obi", 23, "SS 3","science"),(04, "Chibby Oke", 22, "SS 1", "Arts"),(05, "Sam Son",24,"SS 3","science");
select * from skul;
create table Dept(student_name text, street text, city text);
select * from Dept;
insert into Dept values("Abigail Jane", "5, ajose street", "Basorun"),
("Micheal moses","3, Abimbo street", "Iwo"),("Sam Son","2, Akorede street", "dugbe"),
("Samson obi", "1, Akim street", "Amolokun"),("Chibby Oke","7, Falana street","Agodi");
select * from Dept;
create table Grades(student_ID int, subject_name text, score int, grade text, remark text);
drop table Grades;
select * from Grades;
insert into Grades values(1,"Mathematics", 70, "A","excellent"),(2,"Mathematics", 50, "D","pass"),
(3,"Mathematics", 75, "A","excellent"),(4,"Mathematics", 55, "C","pass"),(5,"Mathematics", 60, "B2","very Good");
select * from Grades;
#display students with their class,age,department,street,and city
select s.student_ID,s.student_name,s.age,s.class,s.department,d.street,d.city from skul s 
inner join dept d on s.student_name=d.student_name;
#display students with their subjects,score,grades and remarks
select s.student_ID,s.student_name,g.subject_name,g.score,g.grade,g.remark from skul s 
inner join Grades g on s.student_ID=g.student_ID;
#display students with all their details
select s.student_ID,s.student_name,s.age,s.class,s.department,d.street,d.city,
g.subject_name,g.score,g.grade,g.remark from skul s 
inner join dept d on s.student_name=d.student_name 
inner join Grades g on s.student_ID=g.student_ID;
#retrieve students and their departments having score greater than 50
select s.student_id,s.student_name,s.department,g.subject_name,g.score from skul s
inner join grades g on s.student_id=g.student_id where subject_name="mathematics"
having score >50;
#retrieve student with the highest score and the department
select s.student_id,s.student_name,s.department,g.score from skul s inner join 
grades g on s.student_id=g.student_id where subject_name ="mathematics" order by score desc limit 1;
select s.student_id,s.student_name,s.department,g.score from skul s inner join 
grades g on s.student_id=g.student_id where subject_name ="mathematics" order by score desc limit 1 offset 1;
select s.student_id,s.student_name,s.department,g.score from skul s inner join 
grades g on s.student_id=g.student_id where subject_name ="mathematics" order by score desc limit 1 offset 2;
select s.student_id,s.student_name,s.department,g.score from skul s inner join 
grades g on s.student_id=g.student_id where subject_name ="mathematics" order by score desc limit 1 offset 3;
select s.student_id,s.student_name,s.department,g.score from skul s inner join 
grades g on s.student_id=g.student_id where subject_name ="mathematics" order by score desc limit 1 offset 4;
select s.student_id,s.student_name,s.department,g.score from skul s inner join 
grades g on s.student_id=g.student_id where subject_name ="mathematics" order by score desc limit 4 offset 1;
select s.student_id,s.student_name,d.city from skul s inner join dept d 
on s.student_name=d.student_name where city="dugbe";
select s.student_id,s.student_name,d.street from skul s inner join dept d
on s.student_name=d.student_name where street="7, Falana street";
set sql_safe_updates=0;
update grades set score=80 where student_id=3;
select * from grades;
set autocommit=0;
Delete from grades where student_id=3;
select * from grades;
rollback;
select * from grades;
select * from skul s right join dept d on s.student_name=d.student_name;
select * from skul s left join dept d on s.student_name=d.student_name;

select * from skul s right join dept d on s.student_name=d.student_name
union
select * from skul s left join dept d on s.student_name=d.student_name;
select * from skul s right join grades g on s.student_id=g.student_id;
select * from skul s left join grades g on s.student_id=g.student_id;

select * from skul s right join grades g on s.student_id=g.student_id
union
select * from skul s left join grades g on s.student_id=g.student_id;
select s.student_id,s.student_name,s.department,g.subject_name,g.score from skul s
inner join grades g on s.student_id=g.student_id where subject_name="mathematics"
group by department having score >49;

create database Dassy;
use Dassy;
select * from comrade;
select first_name,last_name,job_id from comrade where job_id in(select job_id from comrade where job_id="AD_VP");

create table pers(id int not null,personid int not null,firstname varchar(10),lastname varchar(10),primary key(personid));
insert into pers(id,personid,firstname,lastname)values(1,10,"oge","james"),(1,10,"oge","hannah"),(3,12,"jude","sanny");
alter table pers drop primary key;
select * from pers;
create table purch(orderid int not null,orderno int not null,personid int,primary key(orderid),constraint FK_perspurch foreign key
(personid) references pers(personid));
select * from purch;
insert into purch(orderid,orderno,personid)values(1,13,10),(2,15,11),(3,13,12);
alter table purch drop constraint FK_perspurch;
create table purchase(orderid int not null,orderno int not null,personid int,primary key(orderid),foreign key(personid)
references person(personid));

create database Tony;
use Tony;
create table Jason(id int,firstname text,lastname text,age int);
insert into Jason(id,firstname,lastname,age)values
(1,"Obi","Ade",20),(2,"Ade","Gab",22),(3,"Sun","Gin",25);
select * from Jason;
alter table Jason add column city varchar(20);
update Jason set city="classy" where id=1;
update Jason set city="dassy" where id=2;
update Jason set city="debris" where id=3;
select * from Result;
select *,
case
when percentage>=40 then "pass" else "fail"
end as Remark
from Result;
select * from performances;
select *,
case
when gpa>=3 then "second class"
else "third class"
end as Grade
from performances;
select *,
case
when major="Arts" then "yes" else "no"
end as department,
count(*) as number_of_arts_students from performances group by major order by department desc;

create database Northwind;
use Northwind;
create table customers(customerID int,customerName text,contactName text,Address text,city text,postalcode int,Country text);
drop table customers;
select * from customers;
insert into customers(customerID,customerName,ContactName,Address,City,Postalcode,Country)values
(1,"Alfreds Futterkiste","Maria Anders","57,Obere Str.","Berlin", 12209,"Germany"),
(2,"Ana Trujillo","Emparedados y helados","Ana Trujillo Avda. de la Constitución 2222","México D.F.",05021,"Mexico"),
(3,"Antonio Moreno Taquería","Antonio Moreno","Mataderos 2312","México D.F.",05023,"Mexico"),
(4,"Around the Horn","Thomas Hardy","120 Hanover Sq.","London",23111,"UK"),
(5,"Berglunds snabbköp","Christina Berglund","Berguvsvägen 8","Luleå",19582,"Sweden");
select * from customers;
select country from customers;
select distinct(country) from customers;
select count(distinct(country)) from customers;
select count(distinct country) "Number of Countries" from customers;
select * from customers where country="mexico";
select * from customers where customerID=1;
select * from customers where customerID=1 and city="germany";
select * from customers where not customerID=1 or city="germany";
select * from customers where not customerID=2;
select * from customers where country="Germany" and(city="Berlin" or city="Munchen");
select * from customers where not country="Germany" and not country="Mexico";
select * from customers order by country;
select * from customers order by country desc;
select * from customers order by country asc, customerName desc;
