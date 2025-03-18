use EmployeeDB

create table Employee(
Id int not null,
name varchar(max),
mobilenum bigint,
emailid varchar(max),
dob date,
license varchar(50),
passport varchar(50)
)

select * from Employee

insert into Employee(Id, name, mobilenum, emailid, dob, license, passport)
values (101, 'Abi', 4235223456, 'abc@gmail.com', '1995-12-24', 'Lic102', 'psp32q');

insert into Employee(Id, name, mobilenum, emailid, dob, license, passport)
values (102, 'Pri', 4235223457, 'def@gmail.com', '1995-10-24', 'Lic103', 'psp32r');

insert into Employee(Id, name, mobilenum, emailid, dob, license, passport)
values (103, 'Navi', 4235223458, 'ghi@gmail.com', '1995-10-10', 'Lic103', 'psp32s');

insert into Employee(Id, name, mobilenum, emailid, dob, license, passport)
values (104, 'Nithya', 4235223459, 'jkl@gmail.com', '1995-03-21', 'Lic104', 'psp32t');

select * from Employee

alter table Employee 
alter column ID int NOT NULL;

alter table Employee 
add constraint PK_Employee primary key (ID);

select * from Employee

update Employee set name='Theo', mobilenum=6789543234, license='adf33', passport='padaew23', emailid='aca@gmail.com'
where id=101

select * from Employee

select e.Id as Employee_ID,
e.name as Employee_name,
e.mobilenum as Employee_mobilenumber,
e.emailid as Employee_emailid,
e.dob as Employee_dob,
e.license as Employee_license,
e.passport as Employee_passport
from Employee e

delete from Employee where id=104

select * from Employee