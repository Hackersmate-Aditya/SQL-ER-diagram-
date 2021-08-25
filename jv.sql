create database store;
create table customers(id int not null,name varchar(15),age int not null,address char(30),occupation char(20),primary key(id));
insert into customers values(1,'Aditya',21,'Indore','ASE'),(2,'Devyani',21,'Pune','ASE'),(3,'Neel',25,'Mumbai','Marketing'),(4,'Pooja',23,'Bangalore','I.T'),(5,'Sapna',24,'Chennai','Digital'),(6,'Namrata',26,'Delhi','H.R');
create table oreder(OID int not null,date datetime,C_id int references customers(id),amount decimal(16,3),primary key(OID));
create table employees(empid int not null,empname varchar(20),m_id int ,primary key(empid));
insert into employees values(101,'Aditya',102),(102,'Devyani',105),(103,'Neel',102),(104,'Pooja',102),(105,'Sapna',null),(106,'Namrata',107);
insert into oreder values(101,'2021-08-20 14:20:00',3,1200.22),(102,'2021-08-21 11:20:00',4,600.00),(103,'2021-08-20 05:40:00',1,700.99),(104,'2021-08-22 15:20:30',3,800.66),(105,'2021-08-10 19:20:20',1,900.00),(106,'2021-08-20 09:20:00',4,1230.99);
select id,name,amount,date
from customers
inner join oreder
on customers.id=oreder.c_id;


select id,name,amount,date
from customers
left join oreder
on customers.id=oreder.c_id;

select id,name,amount,date
from customers
right join oreder
on customers.id=oreder.c_id;
insert into oreder values(107,'2021-08-20 12:20:00',11,110.22)
select id,name,amount,date
from customers
right join oreder
on customers.id=oreder.c_id;



select id,name,amount,date
from customers
full join oreder
on customers.id=oreder.c_id;



select id,name,amount,date
from customers
left join oreder
on customers.id=oreder.c_id
union all
select id,name,amount,date
from customers
right join oreder
on customers.id=oreder.c_id;





select E.empname as employee, M.empname as manager
from employees E
join employees M
on E.m_id=M.empid;


select * from customers
where id in
(select distinct c_id
from oreder
where amount>900); 


delete from customers
where id in
(select c_id 
from oreder
where date like '2021-08-21%');


select * from customers where
exists(select c_id from oreder
where oreder.C_id=customers.id);


create view customer_view
as
select name,id,amount,date
from customers
inner join oreder
on customers.id=oreder.C_id;

select * from customer_view;

