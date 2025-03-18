use EmployeeDB

create table Trainee
(
ID int identity(100,1) primary key not null,
Name varchar(50),
Skill varchar(50),
)

insert into Trainee values('Priyanka','Python,SQL')

select * from Trainee

delete from Trainee where ID=101

select * from Trainee

insert into Trainee values('Naveen','Python,SQL')

select * from Trainee

drop table Trainee

--Set 2 primary keys

create table TraineeSkills
(
TraineeID int identity(100,1) not null,
Trainee_Name varchar(50),
SkillID int not null,
Trainee_Skill varchar(50),
constraint PK_TSID primary key (TraineeID,SkillID)
)

select * from TraineeSkills

--Parent & child table with primary & forieng key
--Parent
create table Skill(
ID int identity(200,1) primary key not null,
Name varchar(50)
)

--Child
create table Trainee(
ID int identity(100,1) primary key not null,
Name varchar(50),
Skill int not null,
constraint FK_Skill foreign key(Skill) references Skill(ID)
)

insert into Skill values('C#'),('C++'),('Java'),('Python'),('AI'),('Data Science')
select * from Skill
 
insert into Trainee values('Priyanka',200),
('Naveen',201),
('Nithya',202),
('Theo',203)

select * from Skill
select * from Trainee

--cannot delete bcoz they are interlinked 
delete from Skill where ID=200

--so delete the record first from trainee and then go with skill
delete from Trainee where Skill=200
select * from Trainee

delete from Skill where ID=200
select * from Skill

update Skill set Name='C#' where id =201
select * from Skill

--Sorting records
select * from Employee order by ID desc

select * from Employee order by name asc

--Select record with ID 101 n 103
select * from Employee where ID in (101,103)

select * from Employee where ID between 101 and 103

select * from Employee where ID=101 or ID=107

select * from Employee where ID is not null

select * from Employee where name like 'N%'

select * from Employee where name like 'N%i'

select * from Employee where name like '_r%'

select * from Employee where name like '%v_'

--
select * from Employee
select * from Employee order by name desc offset 0 row
fetch next 2 rows only

--Aggregate Function
select count(ID) as No_Of_Employees from Employee

alter table Employee add salary bigint null
select * from Employee

update Employee set salary=25000 where ID=101
update Employee set salary=28000 where ID=102
update Employee set salary=30000 where ID=103

select * from Employee

--Min & max
select min(salary) as Minimum_salary from Employee
select max(salary) as Maximum_salary from Employee

--Avg
select avg(salary) as Average_salary from Employee

--Sum
select sum(salary) as Total_salary from Employee

--Grouping
select * from Employee

select name, license from Employee group by license,name

--count of employee using same license
select count(name) as No_of_Employees, license from Employee group by license

select * from Employee
where name like 'N%' 
and salary >= 25000
