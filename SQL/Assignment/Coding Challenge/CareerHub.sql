--1. Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”. 
create Database CareerHub

--2. Creating tables for Companies, Jobs, Applicants and Applications.
--CREATING TABLE COMPANIES
create table Companies 
(
CompanyID int identity(111001,1) primary key,
CompanyName varchar(255) not null,
CompanyLocation varchar(255) not null
)

--CREATING TABLE JOBS
create table Jobs 
(
JobID int identity(101,1) primary key,
CompanyID int,
JobTitle varchar(255) not null,
JobDescription text,
JobLocation varchar(255) not null,
Salary decimal(10,2),
JobType varchar(50),
PostedDate datetime,
foreign key (CompanyID) references Companies(CompanyID)
)

--CREATING TABLE APPLICANTS
create table Applicants 
(
ApplicantID int identity(1,1) primary key,
FirstName varchar(100) not null,
LastName varchar(100) not null,
Email varchar(255) unique not null,
Phone varchar(15),
Resumes text
)

--CREATING TABLE APPLICATIONS
create table Applications 
(
ApplicationID int identity(2025031,1) primary key,
JobID int,
ApplicantID int,
ApplicationDate datetime default current_timestamp,
CoverLetter text,
foreign key (JobID) references Jobs(JobID),
foreign key (ApplicantID) references Applicants(ApplicantID)
)


--INSERTING VALUES INTO THE TABLE
insert into Companies (CompanyName, CompanyLocation) 
values ('TCS', 'Mumbai'),
('Infosys', 'Bangalore'),
('Wipro', 'Hyderabad'),
('HCL Technologies', 'Noida'),
('Tech Mahindra', 'Pune'),
('Cognizant', 'Chennai'),
('Accenture', 'Gurgaon'),
('Infosys', 'Bangalore'),
('Capgemini', 'Mumbai'),
('L&T Infotech', 'Kolkata')

insert into Jobs (CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) 
values (111001, 'Software Engineer', 'Developing web applications using Java', 'Mumbai', 800000.00, 'Full-Time', 10-03-2025),
(111002, 'Data Analyst', 'Analyzing business data and creating reports', 'Bangalore', 700000.00, 'Full-Time', 17-03-2025),
(111003, 'Backend Developer', 'Working with databases and APIs', 'Hyderabad', 900000.00, 'Full-Time', 01-03-2025),
(111004, 'System Administrator', 'Managing IT infrastructure', 'Noida', 750000.00, 'Full-Time', 21-03-2025),
(111005, 'Cyber Security Analyst', 'Ensuring security protocols and compliance', 'Pune', 950000.00, 'Full-Time', 11-03-2025),
(111006, 'Cloud Engineer', 'Deploying applications on cloud', 'Chennai', 1050000.00, 'Full-Time', 09-03-2025),
(111007, 'Front-End Developer', 'Designing and developing UI/UX', 'Gurgaon', 850000.00, 'Full-Time', 07-03-2025),
(111008, 'Machine Learning Engineer', 'Building AI models', 'Bangalore', 1200000.00, 'Full-Time', 24-03-2025),
(111009, 'DevOps Engineer', 'Automating CI/CD pipelines', 'Mumbai', 1100000.00, 'Full-Time', 19-03-2025),
(111010, 'Technical Support Engineer', 'Providing technical support to clients', 'Kolkata', 600000.00, 'Full-Time', 14-03-2025)

insert into Applicants (FirstName, LastName, Email, Phone, Resumes) 
values ('Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', 'Resume for Software Engineer'),
('Priya', 'Mehta', 'priya.mehta@gmail.com', '8765432109', 'Resume for Data Analyst'),
('Amit', 'Verma', 'amit.verma@gmail.com', '7654321098', 'Resume for Backend Developer'),
('Suresh', 'Reddy', 'suresh.reddy@gmail.com', '9543210987', 'Resume for System Administrator'),
('Anjali', 'Nair', 'anjali.nair@gmail.com', '8432109876', 'Resume for Cyber Security Analyst'),
('Vikram', 'Patel', 'vikram.patel@gmail.com', '9321098765', 'Resume for Cloud Engineer'),
('Kavya', 'Iyer', 'kavya.iyer@gmail.com', '7210987654', 'Resume for Front-End Developer'),
('Arun', 'Singh', 'arun.singh@gmail.com', '8109876543  ', 'Resume for Machine Learning Engineer'),
('Sneha', 'Kumar', 'sneha.kumar@gmail.com', '7098765432  ', 'Resume for DevOps Engineer'),
('Manoj', 'Das', 'manoj.das@gmail.com', '9987654321 ', 'Resume for Technical Support Engineer')

insert into Applications (JobID, ApplicantID, CoverLetter) 
values (101, 1, 'I am excited to apply for the Software Engineer role.'),
(102, 2, 'I have experience in data analysis and visualization.'),
(103, 3, 'Backend development has been my primary focus.'),
(104, 4, 'I have managed IT infrastructure for large organizations.'),
(105, 5, 'My expertise in cybersecurity aligns with your needs.'),
(106, 6, 'Cloud computing is my area of expertise.'),
(107, 7, 'I have a strong UI/UX design background.'),
(108, 8, 'I have built AI models using Python and TensorFlow.'),
(109, 9, 'My experience in CI/CD will help streamline deployment.'),
(110, 10, 'I have provided technical support for enterprise clients.')

--DISPLAYIN THE TABLE VALUES
select * from Companies
select * from Jobs
select * from Applicants
select * from Applications

--PERFORMING TASKS
--3. Define appropriate primary keys, foreign keys, and constraints.  
--4. Ensure the script handles potential errors, such as if the database or tables already exist. 

-- 5. Count the number of applications received for each job listing
select J.JobTitle, count(A.ApplicationID) as ApplicationCount
from Jobs as J
left join Applications as A on J.JobID = A.JobID
group by J.JobTitle

-- 6. Retrieve job listings within a specified salary range
select J.JobTitle, C.CompanyName, J.JobLocation, J.Salary
from Jobs as J
inner join Companies as C on J.CompanyID = C.CompanyID
where J.Salary between 600000 and 900000

-- 7. Retrieve job application history for a specific applicant
select J.JobTitle, C.CompanyName, A.ApplicationDate
from Applications A
inner join Jobs as J on A.JobID = J.JobID
inner join Companies as C on J.CompanyID = C.CompanyID
where A.ApplicantID = 3

-- 8. Calculate the average salary offered, excluding zero salaries
select avg(J.Salary) as AverageSalary
from Jobs as J
where J.Salary > 0

-- 9. Identify the company that has posted the most job listings
select top 1 C.CompanyName, count(J.JobID) as JobCount
from Jobs as J
inner join Companies as C on J.CompanyID = C.CompanyID
group by C.CompanyName
order by JobCount desc

-- 10. Find applicants who applied to companies in 'CityX' and have at least 3 years of experience
select A.ApplicantID, A.FirstName, A.LastName, A.Email, A.Phone
from Applicants as A
inner join Applications as AP on A.ApplicantID = AP.ApplicantID
inner join Jobs as J ON AP.JobID = J.JobID
inner join Companies C ON J.CompanyID = C.CompanyID
where C.CompanyLocation = 'Gurgaon' AND A.Experience >= 3

-- 11. Retrieve distinct job titles with salaries between $6,00,000 and $8,00,000
select J.JobTitle
from Jobs J
where J.Salary between 600000 and 800000

-- 12. Find jobs that have not received any applications
if exists (
    select 1 from Jobs as J
    left join Applications as A on J.JobID = A.JobID
    where A.ApplicationID is null
)
    select J.JobTitle
    from Jobs J
    left join Applications A ON J.JobID = A.JobID
    where A.ApplicationID is null
else
    print 'All jobs have received applications.'

-- 13. Retrieve a list of job applicants along with the companies they have applied to and the positions they have applied for.
select A.ApplicantID, A.FirstName, A.LastName, C.CompanyName, J.JobTitle
from Applications as AP
inner join Applicants as A on Ap.ApplicantID = A.ApplicantID
inner join Jobs as J on AP.JobID = J.JobID
inner join Companies as C on J.CompanyID = C.CompanyID

-- 14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.
select C.CompanyID, C.CompanyName, count(J.JobID) as JobCount
from Companies as C
left join Jobs as J on C.CompanyID = J.CompanyID
group by C.CompanyID, C.CompanyName

-- 15. List all applicants along with the companies and positions they have applied for, including those who have not applied.
select A.ApplicantID, A.FirstName, A.LastName, C.CompanyName, J.JobTitle
from Applicants A
left join Applications as AP on A.ApplicantID = AP.ApplicantID
left join Jobs as J on AP.JobID = J.JobID
left join Companies as C on J.CompanyID = C.CompanyID

-- 16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.
select C.CompanyID, C.CompanyName, J.Salary
from Jobs as J
inner join Companies as C on J.CompanyID = C.CompanyID
where J.Salary > (select avg(Salary) from Jobs)

-- 17. Display a list of applicants with their names and string of their city and state.
alter table Applicants add ApplicantsLocation varchar(50) not null default 0
select * from Applicants

update Applicants SET ApplicantsLocation = 'Mumbai, Maharashtra' where ApplicantID = 1
update Applicants set ApplicantsLocation = 'Delhi, Delhi' where ApplicantID=2
update Applicants set ApplicantsLocation = 'Bangalore, Karnataka' where ApplicantID=3
update Applicants set ApplicantsLocation = 'Hyderabad, Telangana' where ApplicantID=4
update Applicants set ApplicantsLocation = 'Chennai, Tamil Nadu' where ApplicantID=5
update Applicants set ApplicantsLocation = 'Kolkata, West Bengal' where ApplicantID=6
update Applicants set ApplicantsLocation = 'Pune, Maharashtra' where ApplicantID=7
update Applicants set ApplicantsLocation = 'Ahmedabad, Gujarat' where ApplicantID=8
update Applicants set ApplicantsLocation = 'Jaipur, Rajasthan' where ApplicantID=9
update Applicants set ApplicantsLocation = 'Chandigarh, Chandigarh' where ApplicantID=10
select * from Applicants

select AP.ApplicantID, AP.FirstName, AP.LastName, AP.ApplicantsLocation from Applicants as AP

-- 18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.
select JobID, JobTitle, CompanyID
from Jobs
where JobTitle like '%Developer%' or JobTitle like '%Engineer%'

-- 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.
select A.ApplicantID, A.FirstName, A.LastName, J.JobID, J.JobTitle
from Applicants A
full join Applications AP on A.ApplicantID = AP.ApplicantID
full join Jobs J on AP.JobID = J.JobID

-- 20. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience.
alter table Applicants add Experience int not null default 0
select * from Applicants

update Applicants set Experience = 3 where ApplicantID in (1,7,9)
update Applicants set Experience = 1 where ApplicantID in (2,3,4,8)
update Applicants set Experience = 2 where ApplicantID in (5,6,10)
select * from Applicants

select A.ApplicantID, A.FirstName, A.LastName, C.CompanyID, C.CompanyName
from Applicants as A
cross join Companies C
where C.CompanyLocation = 'Chennai' and A.Experience > 2
