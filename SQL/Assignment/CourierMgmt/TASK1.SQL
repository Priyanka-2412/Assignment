--TASK1
create Database CourierMgmtSys
use CourierMgmtSys

--CREATING TABLES
create table Users 
(
UserID int identity(1,1) primary key not null,
Names varchar(255) not null,
Email varchar(255) unique not null,
Passwords varchar(255) not null,
ContactNumber varchar(20) unique not null,
UserAddress text
)

create table Courier(
CourierID int identity(975324680,1) primary key not null,
UserID int not null,
SenderName varchar(255) not null,
SenderAddress text not null,
ReceiverName varchar(255) not null,
ReceiverAddress text not null,
Weights decimal(5,2) not null,
CourierStatus varchar(50) not null,
TrackingNumber varchar(20) unique not null,
DeliveryDate date not null,
foreign key (UserID) references Users(UserID)
)

create table CourierServices(
ServiceID int identity(192837,1) primary key not null,
CourierID int not null,
ServiceName varchar(100) not null,
Cost decimal(8,2) not null,
foreign key (CourierID) references Courier(CourierID)
)

create table Locations(
LocationID int identity(6300230,1) primary key not null,
LocationName varchar(100) not null,
Address text not null
)

create table Employee(
EmployeeID int identity(2025020,1) primary key not null,
Names varchar(255) not null,
Email varchar(255) unique not null,
ContactNumber varchar(20) not null,
Roles varchar(50) not null,
Salary decimal(10,2) not null,
LocationID int not null,
foreign key (LocationID) references Locations(LocationID)
)

create table Payment(
PaymentID int identity(101010,1) primary key not null,  
CourierID int not null,  
LocationId int not null,  
Amount decimal(10, 2) not null,  
PaymentDate date not null,  
foreign key (CourierID) references Courier(CourierID),  
foreign key (LocationID) references Locations(LocationID)
)


--INSERTING VALUES INTO USERS TABLE
insert into Users (Names, Email, Passwords, ContactNumber, UserAddress)
values('Priyanka Sharma', 'priyanka.sharma@email.com', 'P@ssw0rd123', '9876543210', 'Bangalore, India'),
('Rahul Verma', 'rahul.verma@email.com', 'SecureP@ss01', '9876543211', 'Delhi, India'),
('Ananya Rao', 'ananya.rao@email.com', 'Ananya@Pass', '9876543212', 'Mumbai, India'),
('Karthik Reddy', 'karthik.reddy@email.com', 'Karthik@99', '9876543213', 'Hyderabad, India'),
('Simran Kaur', 'simran.kaur@email.com', 'Simran$987', '9876543214', 'Chandigarh, India'),
('Vikram Singh', 'vikram.singh@email.com', 'VikramPass##', '9876543215', 'Pune, India'),
('Neha Gupta', 'neha.gupta@email.com', 'Neha@456', '9876543216', 'Kolkata, India'),
('Amit Tiwari', 'amit.tiwari@email.com', 'AmitPass987', '9876543217', 'Lucknow, India'),
('Pooja Desai', 'pooja.desai@email.com', 'Pooja@123', '9876543218', 'Surat, India'),
('Ravi Kumar', 'ravi.kumar@email.com', 'RaviPass@55', '9876543219', 'Chennai, India')


--INSERTING VALUES INTO COURIER TABLE
insert into Courier (UserID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weights, CourierStatus, TrackingNumber, DeliveryDate) 
values(1, 'Priyanka Sharma', 'Bangalore', 'Rahul Verma', 'Delhi', 2.50, 'In Transit', 'TRK975324680', '2025-03-27'),
(2, 'Rahul Verma', 'Delhi', 'Ananya Rao', 'Mumbai', 3.00, 'Delivered', 'TRK975324681', '2025-03-23'),
(3, 'Ananya Rao', 'Mumbai', 'Karthik Reddy', 'Hyderabad', 1.75, 'Shipped', 'TRK975324682', '2025-03-24'),
(4, 'Karthik Reddy', 'Hyderabad', 'Simran Kaur', 'Chandigarh', 2.10, 'Pending', 'TRK975324683', '2025-03-26'),
(5, 'Simran Kaur', 'Chandigarh', 'Vikram Singh', 'Pune', 3.25, 'Delivered', 'TRK975324684', '2025-03-14'),
(6, 'Vikram Singh', 'Pune', 'Neha Gupta', 'Kolkata', 2.00, 'In Transit', 'TRK975324685', '2025-03-30'),
(7, 'Neha Gupta', 'Kolkata', 'Amit Tiwari', 'Lucknow', 1.80, 'Shipped', 'TRK975324686', '2025-03-25'),
(8, 'Amit Tiwari', 'Lucknow', 'Pooja Desai', 'Surat', 2.45, 'Pending', 'TRK975324687', '2025-03-30'),
(9, 'Pooja Desai', 'Surat', 'Ravi Kumar', 'Chennai', 2.90, 'Delivered', 'TRK975324688', '2025-03-19'),
(10, 'Ravi Kumar', 'Chennai', 'Rhea Kapoor', 'Jaipur', 3.10, 'Shipped', 'TRK975324689', '2025-03-22')


--INSERTING VALUES INTO COURIERSERVICE TABLE
insert into CourierServices (CourierID, ServiceName, Cost)
values(975324680, 'Express Delivery',150.00),
(975324681, 'Standard Delivery', 100.00),
(975324682, 'Same-Day Delivery', 200.00),
(975324683, 'Express Delivery', 150.00),
(975324684, 'Standard Delivery', 100.00),
(975324685, 'Express Delivery', 150.00),
(975324686, 'Overnight Delivery', 250.00),
(975324687, 'Standard Delivery', 100.00),
(975324688, 'Express Delivery', 150.00),
(975324689, 'Same-Day Delivery', 200.00)


--INSERTING VALUES INTO LOCATION TABLE
insert into Locations (LocationName, Address) 
values('Bangalore Hub', 'Bangalore, Karnataka, India'),
('Delhi Hub', 'New Delhi, Delhi, India'),
('Mumbai Hub', 'Mumbai, Maharashtra, India'),
('Hyderabad Hub', 'Hyderabad, Telangana, India'),
('Pune Hub', 'Pune, Maharashtra, India'),
('Kolkata Hub', 'Kolkata, West Bengal, India'),
('Chennai Hub', 'Chennai, Tamil Nadu, India'),
('Ahmedabad Hub', 'Ahmedabad, Gujarat, India'),
('Jaipur Hub', 'Jaipur, Rajasthan, India'),
('Lucknow Hub', 'Lucknow, Uttar Pradesh, India')


--INSERTING VALUES INTO EMPLOYEE TABLE
insert into Employee (Names, Email, ContactNumber, Roles, Salary, LocationID) 
values('Manoj Kumar', 'manoj.kumar@email.com', '9988776601', 'Manager', 75000.00, 6300230),
('Suresh Raina', 'suresh.raina@email.com', '9988776602', 'Courier Staff', 45000.00, 6300231),
('Alok Sharma', 'alok.sharma@email.com', '9988776603', 'Delivery Boy', 30000.00, 6300232),
('Priya Menon', 'priya.menon@email.com', '9988776604', 'Supervisor', 60000.00, 6300233),
('Vikas Singh', 'vikas.singh@email.com', '9988776605', 'Clerk', 35000.00, 6300234),
('Anjali Desai', 'anjali.desai@email.com', '9988776606', 'Manager', 78000.00, 6300230),
('Rohan Mehta', 'rohan.mehta@email.com', '9988776607', 'Courier Staff', 46000.00, 6300231),
('Neha Patel', 'neha.patel@email.com', '9988776608', 'Delivery Boy', 31000.00, 6300232),
('Amitabh Jha', 'amitabh.jha@email.com', '9988776609', 'Supervisor', 62000.00, 6300233),
('Meera Iyer', 'meera.iyer@email.com', '9988776610', 'Clerk', 37000.00, 6300234)


--INSERTING VALUES INTO PAYMENT TABLE
insert into Payment (CourierID, LocationId, Amount, PaymentDate) 
values(975324680, 6300230, 150.00, '2025-03-20'),
(975324681, 6300231, 100.00, '2025-03-15'),
(975324682, 6300232, 200.00, '2025-03-18'),
(975324683, 6300233, 150.00, '2025-03-22'),
(975324684, 6300234, 100.00, '2025-03-10'),
(975324685, 6300230, 180.00, '2025-03-21'),
(975324686, 6300231, 300.00, '2025-03-19'),
(975324687, 6300232, 100.00, '2025-03-23'),
(975324688, 6300233, 150.00, '2025-03-14'),
(975324689, 6300234, 250.00, '2025-03-17')

select * from Users
select * from Courier
select * from CourierServices
select * from Locations
select * from Employee
select * from Payment
