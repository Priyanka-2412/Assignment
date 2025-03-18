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