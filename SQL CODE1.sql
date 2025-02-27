create database sql_concepts;
use sql_concepts;

show databases;
create table dept_tab(
deptno varchar(5),
dname varchar(50),
mgr_id varchar(10),
location_id varchar(10),
constraint pk_dept_tab primary key (deptno));
select * from dept_tab;



create table emp_tab(
empno varchar(5),
name varchar(50) not null,
job varchar(50),
manager varchar(10),
hiredate date,
salary varchar(20),
commission varchar(10),
deptno varchar(5),
constraint pk_emp_tab primary key (empno),
constraint fk_emp_tab foreign key(deptno) references dept_tab(deptno));

create table country_tab(
country_id varchar(5),
country_name varchar(50),
constraint pk_country_tab primary key(country_id));

create table states_tab(
state_id varchar(10),
state_name varchar(50),
country_id varchar(5),
constraint pk_states_tab primary key(state_id),
constraint fk_states_tab foreign key(country_id) references country_tab(country_id));

show tables;
desc states_tab;

insert into dept_tab values(30,'purchasing',114,1700);
insert into dept_tab values(40,'Human Resources',203,2400);
insert into dept_tab values(70,'public relations',204,2700);
insert into dept_tab values(80,'sales',145,2500);
insert into dept_tab values(90,'Executives',100,1700);
insert into dept_tab values(100,'Finance',108,1700);
insert into dept_tab values(110,'accounting',205,1700);

insert into dept_tab values(120,'Treasury',Null,1700);
insert into dept_tab values(130,'corporate tax',null,1700);
insert into dept_tab values(140,'control and credit',null,1700);
insert into dept_tab values(150,'shareholder services',null,1700);

select*from dept_tab;
select count(*) from dept_tab;
insert into emp_tab values(7000,'King','president',null, to_date('17-11-2005','dd-mm-yyyy'),5000,null,40);
INSERT INTO emp_tab VALUES (7002, 'clark', 'manager', NULL, STR_TO_DATE('2-11-2006', '%d-%m-%Y'), 2450, NULL, 40);
INSERT INTO emp_tab VALUES (7003, 'jones', 'manager', NULL, STR_TO_DATE('2-11-2006', '%d-%m-%Y'), 2450, NULL, 40);
INSERT INTO emp_tab VALUES (7004, 'scott', 'analyst', NULL, STR_TO_DATE('2-11-2007', '%d-%m-%Y'), 3000, NULL, 70);
INSERT INTO emp_tab VALUES (7005, 'ford', 'analyst', NULL, STR_TO_DATE('2-11-2007', '%d-%m-%Y'), 3000, NULL, 30);
INSERT INTO emp_tab VALUES (7006, 'miller', 'programmar', NULL, STR_TO_DATE('2-11-2007', '%d-%m-%Y'), 4500, NULL, 30);
INSERT INTO emp_tab VALUES (7007, 'jones', 'manager', NULL, STR_TO_DATE('2-11-2006', '%d-%m-%Y'), 2450, NULL, 30);

select * from emp_tab;
insert into country_tab values (1,'USA');
insert into country_tab values (2,'India');
insert into country_tab values (3,'Canada');

select*from country_tab;

insert into states_tab values(1, 'California',1);
insert into states_tab values(2, 'Texas',1);
insert into states_tab values(3, 'Karnataka',2);

select*from states_tab;

select empno, 10*(salary+100) as "Updated Salary" from emp_tab;
select concat(name,'belongs to', deptno,'department number') as "employee department data"
from emp_tab;
select count(distinct deptno) from emp_tab;



select distinct deptno,name from emp_tab;


select empno, name,salary from emp_tab where salary>4200;
select empno, name,salary from emp_tab where name ='king';
select empno, name,salary from emp_tab where name ='king'and salary>4200;
select empno, name,salary from emp_tab where name <>'king';

select empno, name,salary from emp_tab where salary between 200 and 45000;
select empno, name,salary from emp_tab where salary not between 200 and 45000;
select empno,deptno,name,salary from emp_tab where deptno in (30,40);
select empno,deptno,name,salary from emp_tab where deptno not in (30,40);
select empno, name,salary from emp_tab where name in ('king','mike');
select empno, name,salary from emp_tab where name not in ('king','mike');

select empno,name,salary from emp_tab where name like '%i%';

select empno, ename,salary from emp_tab where deptno in (30,40) and salary>4200;
select empno, ename,salary from emp_tab where deptno in (30,40) or salary>4200;
select empno, ename,salary from emp_tab where deptno in (30,40) and salary>4200;

select empno,name,deptno,salary from emp_tab where (deptno=30 or deptno=40) and salary> 3000;

select empno,name,deptno,salary from emp_tab where deptno=30 or deptno=40 and salary> 3000;

select empno, name, deptno, salary from emp_tab order by salary desc;
select empno, name, deptno, salary from emp_tab order by name desc;
select empno, name, deptno, salary,hiredate from emp_tab order by hiredate desc;

select concat('hello','everyone!') as 'Message' from dual;
select substr('hello everyone!',7,5) as 'Substraction Message' from dual;
select length('hello everyone!') as 'Total Length' from dual;

select round(92.427,2)as 'round off value' from dual;
select truncate(92.427,1) as 'Truncated value' from dual;

create table states_tab2(
state_id varchar(10),
state_name varchar(50),
country_id varchar(5),
constraint pk_states_tab2 primary key(state_id),
constraint fk_states_tab2 foreign key(country_id) references country_tab(country_id));


create table emp_tab2(
empno varchar(5),
name varchar(50) not null,
job varchar(50),
manager varchar(10),
hiredate date,
salary varchar(20),
commission varchar(10),
deptno varchar(5),
constraint pk_emp_tab2 primary key (empno),
constraint fk_emp_tab2 foreign key(deptno) references dept_tab(deptno));

insert into states_tab2 select * from states_tab; -- this is called bulk copy
select * from states_tab2;

set sql_safe_updates = 0;
update emp_tab set salary = 6000 where empno = 7000;
commit;
select * from emp_tab;

update emp_tab2 set manager = (select manager from emp_tab where empno= 7003),
salary = (select salary from emp_tab where empno=7004) where empno = 7005;


update emp_tab set deptno = 100 where deptno = 30;

delete from states_tab where states_id in (3,4);
delete from country_tab where country_id = 1;
alter table states_tab2 drop column state_name;


rename table states_tab2 to states_tab3;
truncate table states_tab3;
drop table states_tab3;

alter table states_tab modify column states_name varchar (20) not null;

alter table country_tab modify column country_name varchar (20) not null;

select lpad(5000,8,'*')from dual;
select rpad(5000,8,'*')from dual;




select name,job,salary,
Case job when 'manager' then 1.20*salary
when 'analyst' then 1.15*salary
when 'clerk' then 1.10*salary
else salary
end "revised salary"
from emp_tab;

select sum(salary)from emp_tab;

select min(salary),max(salary) from emp_tab where deptno=30;
select count(*)from emp_tab;
select name from emp_tab where manager=7003;
select count(name) from emp_tab where manager = 7003;

select manager,max(salary)from emp_tab group by manager order by max(salary) desc;

select deptno, max(salary) from emp_tab group by deptno having max(salary)>=4000;
use sql_concepts;  

create database libraryDB; 
use libraryDB;

create table books(
bookID int primary key auto_increment,
title varchar(255) not null,
author varchar(255),
publicationyear int,
genre varchar(50),
availablecopies int);

insert into books values( null,'soma sins','som',2022,'comedy', 100);
insert into books values( null,'somu mama','somu',2024,'comedy', 120);

select * from books;

create user 'root1'@'localhost' identified by 'password';
grant select,update,delete, insert on libraryDB.books to 'root1'@'localhost';

select * from information_schema.user_privileges;
revoke delete on libraryDB.books from 'root1'@'localhost';
show grants for 'root1'@'localhost';


create table customer(
customer_id int not null auto_increment,
name varchar(255) not null,
email varchar(255) not null,
primary key(customer_id));

INSERT INTO customer (name, email) VALUES ('swaraj', 'swarajbs1234@gmail.com');
INSERT INTO customer (name, email) VALUES ('krithik', 'krithik@gmail.com');

start transaction;
update customer set name ="ABC XYZ"
where customer_id = 1;
commit;

set autocommit = 0;
update customer set name  = "ABC PQR"
where customer_id = 1;
rollback;


select * from customer;


create table orders(
order_id int not null auto_increment,
customer_id int null,
quantity int not null,
primary key(order_id),
foreign key(customer_id) references customer(customer_id));

INSERT INTO orders (customer_id, quantity) VALUES (1, 10);
INSERT INTO orders (customer_id, quantity) VALUES (2, 5);
INSERT INTO orders (customer_id, quantity) VALUES (NULL, 3);


create view customer_orders as 
select distinct order_id,quantity from
orders where customer_id = 1;

select * from customer_orders;

create table strangethings(
id int primary key,
character_name varchar(255),
last_seen date,
next_appearance date,
location varchar(255));

INSERT INTO strangethings (id, character_name, last_seen, next_appearance, location)
VALUES (1, 'Eleven', '2023-12-25', '2024-07-04', 'Hawkins');

INSERT INTO strangethings (id, character_name, last_seen, next_appearance, location)
VALUES (2, 'Mike Wheeler', '2023-12-25', '2024-07-04', 'Hawkins');

INSERT INTO strangethings (id, character_name, last_seen, next_appearance, location)
VALUES (3, 'Dustin Henderson', '2023-12-25', '2024-07-04', 'Hawkins');

INSERT INTO strangethings (id, character_name, last_seen, next_appearance, location)
VALUES (4, 'Lucas Sinclair', '2023-12-25', '2024-07-04', 'Hawkins');

INSERT INTO strangethings (id, character_name, last_seen, next_appearance, location)
VALUES (5, 'Will Byers', '2023-12-25', '2024-07-04', 'Hawkins');
select * from strangethings;


select character_name, datediff(next_appearance, last_seen) as days_until_next_appearance from strangethings;
select character_name, dayofweek(next_appearance) as day_of_week from strangethings;
select character_name, dayname(next_appearance) as day_of_week from strangethings;
select character_name, dayofmonth(next_appearance) as day_of_month from strangethings;
select character_name, dayofyear(next_appearance),
if(dayofyear(nextappearance) = '1', 'Happy New Year!',
'just another  day....') as message from strangerthings;

select character_name, adddate(next_appearance, interval 1 day) as next_appearance_tomorrow from strangethings;



create table employees(
id varchar(36) primary key,
name varchar(255),
email varchar(255),
password varchar(255),
salary decimal(10.2),
job_experiance int);

INSERT INTO employees (id, name, email, password, salary, job_experiance)
VALUES ('1', 'John Doe', 'john.doe@example.com', 'password123', 50000.00, 5);

INSERT INTO employees (id, name, email, password, salary, job_experiance)
VALUES ('2', 'Jane Smith', 'jane.smith@example.com', 'securepassword', 60000.00, 8);

INSERT INTO employees (id, name, email, password, salary, job_experiance)
VALUES ('3', 'David Johnson', 'david.johnson@example.com', 'mypassword', 45000.00, 3);


DELIMITER //
create trigger adjust_salary_before_insert
before insert on employees
for each row
begin
	if new.job_experiance>5 then
		set new.salary = new.salary*1.20;
	else
		set new.salary = new.salary*1.10;
end if;
end;
delimiter ;

INSERT INTO employees (id, name, email, password, salary, job_experiance)
VALUES ('4', 'Nancy Wheeler', 'nancy.wheeler@example.com', 'password456', 40000.00, 6);

select * from employees;



DELIMITER //
CREATE TRIGGER prevent_employee_deletion
before delete on employees
for each row
begin 
	signal sqlstate '45000'
    set message_text = 'deletion of employee record is not allowed';
end;
delimiter ;

DELETE FROM employees WHERE id = '1';

show databases;
use sql_concepts;
show tables;



