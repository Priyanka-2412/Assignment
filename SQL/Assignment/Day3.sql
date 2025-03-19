Use EmployeeDB

---JOINS---
--FETCH RECORDS FROM SKILL
select * from Skill
--FETCH RECORDS FROM SKILL
select * from Trainee



--INNER JOIN 
select * from Skill
select * from Trainee
select * from Skill
inner join
Trainee
on Skill.ID = Trainee.Skill



--OUTER LEFT JOIN
select * from Skill
select * from Trainee
select * from Skill
left join 
Trainee
on Skill.ID = Trainee.Skill



--RIGHT OUTER JOIN
select * from Skill
select * from Trainee
select * from Skill
right join 
Trainee
on Skill.ID = Trainee.Skill



--WITH ALICE NAME
select s.Name as Course , t.Name as Trainee
from Skill as s
right join
Trainee as t
on s.ID = t.Skill

where s.ID is not null --not null values



--FULL OUTER JOIN
select s.Name as Course, t.Name as Trainee
from Skill as s
full join
Trainee as t
on s.ID=t.Skill --Compare values from both table based on PK & FK
where s.Name is not null and t.Name is not null 



--DISPLAYING COUNT OF TRAINEE
select s.Name as Course, Count(t.Name) as TraineeCount
from Skill as s
inner join 
Trainee as t
on s.ID = t.Skill
group by s.ID,s.Name
order by TraineeCount desc;

--------
create table Trainer(
ID int identity(1100,1) primary key not null,
Name varchar(50) null
)

insert into Trainer values
('Garima'),
('Neethu'),
('Reema'),
('Prithi');

select * from Trainer

alter table Skill add Trainer_ID int null constraint FK_Tr foreign key references Trainer(ID)

update Skill set Trainer_ID=1108 where ID=203
update Skill set Trainer_ID=1109 where ID=201
update Skill set Trainer_ID=1110 where ID=202
update Skill set Trainer_ID=1111 where ID=205
update Skill set Trainer_ID=1109 where ID=204

select * from Skill
select * from Trainer
select * from Trainee



--3 TABLE JOIN
select 
tr.Name as Trainer_Name,
sk.Name as Course,
tn.Name as Trainee

from Trainer as tr
inner join 
Skill as sk
on tr.ID=sk.Trainer_ID
inner join 
Trainee as tn
on sk.ID=tn.Skill



--CROSS JOIN
create table Shapes
(
ID int identity,
name varchar(50)
)

create table Color
(
ID int identity,
color varchar(50)
)

insert into Shapes values('Circle'),('Square'),('Rectangle'),('Triangle')
select * from Shapes

insert into Color values('Red'),('Green'),('Blue')
select * from Color

--
select s.name,c.color from Shapes as s
cross join
color as c

where s.ID=c.ID



--SELF JOIN
select * from Trainee
select * from Trainer
select tr.Name as Trainer, tn.Name as Trainee
from Trainee as tr
join 
Trainee as tn
on tr.ID = tn.Trainer_ID



--STRING FUNCTION
select upper('trainee') as TraineeInUpper
select lower('TRAINEE') as TraineeInLower
select len('Trainee') as Length
select concat('Priyanka','','Krishnamoorthy') as FullName
select reverse('Priyanka') as ReverseName
select replace('Priyanka Vinu','Vinu','Anu') as ReplacedValue

--MATH FUNCTIONS
select power(2,2)
select abs(25)
select sqrt(7)
select pi()

--DATE FUNCTION
select sysdatetime()
select getdate()
select sysdatetimeoffset()
select isdate('2003-12-12')
select month('2025-03-19')
select day('2025-03-20')
select year('2025-03-20')