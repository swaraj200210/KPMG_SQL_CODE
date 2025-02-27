create database hplus;
use hplus;

create table hplus.employeeRecords(
empid int not null,
name varchar(20) not null,
role varchar(20) default null,
city varchar(25),
country varchar(25),
primary key(empid));

DELIMITER //;
create procedure hplus.insertEmployeeRecord(
IN in_id int,
IN in_name varchar(20),
IN in_role varchar(20),
IN in_city varchar(20),
IN in_country varchar(20),
out out_result varchar(25))
begin
	insert into hplus.employeeRecords(empid,name,role,city,country) values
    (in_id,in_name,in_role,in_city,in_country);
    commit;
    set out_result := 'TRUE';
end;
drop procedure hplus.insertEmployeeRecord;
select*from hplus.employeeRecords;