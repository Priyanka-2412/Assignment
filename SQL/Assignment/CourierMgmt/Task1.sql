create database CourierManagement
use CourierManagement

--TASK1
--CREATING TABLES
create table Users 
(
UserID int identity(1,1) primary key not null,
Names varchar(255) not null,
Email varchar(255) unique not null,
Passwords varchar(255) not null,
ContactNumber varchar(20) unique not null,
UserAddress text
);

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
);

create table CourierServices(
ServiceID int identity(192837,1) primary key not null,
CourierID int not null,
ServiceName varchar(100) not null,
Cost decimal(8,2) not null,
foreign key (CourierID) references Courier(CourierID)
);

create table Locations(
LocationID int identity(6300230,1) primary key not null,
LocationName varchar(100) not null,
Address text not null
);

create table Employee(
EmployeeID int identity(2025020,1) primary key not null,
Names varchar(255) not null,
Email varchar(255) unique not null,
ContactNumber varchar(20) not null,
Roles varchar(50) not null,
Salary decimal(10,2) not null,
LocationID int not null,
foreign key (LocationID) references Locations(LocationID)
);

create table Payment(
PaymentID int identity(101010,1) primary key not null,  
CourierID int not null,  
LocationId int not null,  
Amount decimal(10, 2) not null,  
PaymentDate date not null,  
foreign key (CourierID) references Courier(CourierID),  
foreign key (LocationID) references Locations(LocationID)
);

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
('Ravi Kumar', 'ravi.kumar@email.com', 'RaviPass@55', '9876543219', 'Chennai, India'),
('Rhea Kapoor', 'rhea.kapoor@email.com', 'Rhea123!', '9876543220', 'Jaipur, India'),
('Arjun Malhotra', 'arjun.malhotra@email.com', 'Arjun@456', '9876543221', 'Indore, India'),
('Sonali Joshi', 'sonali.joshi@email.com', 'SonaliPass$', '9876543222', 'Nagpur, India'),
('Aditya Sharma', 'aditya.sharma@email.com', 'Adi@Sharma', '9876543223', 'Ahmedabad, India'),
('Tanya Mehta', 'tanya.mehta@email.com', 'Tanya@99', '9876543224', 'Visakhapatnam, India'),
('Rohan Iyer', 'rohan.iyer@email.com', 'Rohan@Iyer1', '9876543225', 'Bhopal, India'),
('Swati Nair', 'swati.nair@email.com', 'SwatiPass@2', '9876543226', 'Thane, India'),
('Yash Patel', 'yash.patel@email.com', 'Yash@Patel99', '9876543227', 'Ludhiana, India'),
('Harsh Vardhan', 'harsh.vardhan@email.com', 'HarshPass$', '9876543228', 'Kanpur, India'),
('Ishita Saxena', 'ishita.saxena@email.com', 'Ishita123@', '9876543229', 'Coimbatore, India');

--INSERTING VALUES INTO COURIER TABLE
insert into Courier (UserID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weights, CourierStatus, TrackingNumber, DeliveryDate) 
values(1, 'Priyanka Sharma', 'Bangalore', 'Rahul Verma', 'Delhi', 2.50, 'In Transit', 'TRK975324680', '2025-03-20'),
(2, 'Rahul Verma', 'Delhi', 'Ananya Rao', 'Mumbai', 3.00, 'Delivered', 'TRK975324681', '2025-03-15'),
(3, 'Ananya Rao', 'Mumbai', 'Karthik Reddy', 'Hyderabad', 1.75, 'Shipped', 'TRK975324682', '2025-03-18'),
(4, 'Karthik Reddy', 'Hyderabad', 'Simran Kaur', 'Chandigarh', 2.10, 'Pending', 'TRK975324683', '2025-03-22'),
(5, 'Simran Kaur', 'Chandigarh', 'Vikram Singh', 'Pune', 3.25, 'Delivered', 'TRK975324684', '2025-03-10'),
(6, 'Vikram Singh', 'Pune', 'Neha Gupta', 'Kolkata', 2.00, 'In Transit', 'TRK975324685', '2025-03-21'),
(7, 'Neha Gupta', 'Kolkata', 'Amit Tiwari', 'Lucknow', 1.80, 'Shipped', 'TRK975324686', '2025-03-19'),
(8, 'Amit Tiwari', 'Lucknow', 'Pooja Desai', 'Surat', 2.45, 'Pending', 'TRK975324687', '2025-03-23'),
(9, 'Pooja Desai', 'Surat', 'Ravi Kumar', 'Chennai', 2.90, 'Delivered', 'TRK975324688', '2025-03-14'),
(10, 'Ravi Kumar', 'Chennai', 'Rhea Kapoor', 'Jaipur', 3.10, 'Shipped', 'TRK975324689', '2025-03-17'),
(11, 'Rhea Kapoor', 'Jaipur', 'Arjun Malhotra', 'Indore', 1.95, 'Pending', 'TRK975324690', '2025-03-24'),
(12, 'Arjun Malhotra', 'Indore', 'Sonali Joshi', 'Nagpur', 2.30, 'In Transit', 'TRK975324691', '2025-03-25'),
(13, 'Sonali Joshi', 'Nagpur', 'Aditya Sharma', 'Ahmedabad', 2.80, 'Delivered', 'TRK975324692', '2025-03-12'),
(14, 'Aditya Sharma', 'Ahmedabad', 'Tanya Mehta', 'Visakhapatnam', 3.50, 'Shipped', 'TRK975324693', '2025-03-20'),
(15, 'Tanya Mehta', 'Visakhapatnam', 'Rohan Iyer', 'Bhopal', 1.70, 'Pending', 'TRK975324694', '2025-03-27'),
(16, 'Rohan Iyer', 'Bhopal', 'Swati Nair', 'Thane', 3.00, 'Delivered', 'TRK975324695', '2025-03-13'),
(17, 'Swati Nair', 'Thane', 'Yash Patel', 'Ludhiana', 2.20, 'In Transit', 'TRK975324696', '2025-03-28'),
(18, 'Yash Patel', 'Ludhiana', 'Harsh Vardhan', 'Kanpur', 2.75, 'Shipped', 'TRK975324697', '2025-03-21'),
(19, 'Harsh Vardhan', 'Kanpur', 'Ishita Saxena', 'Coimbatore', 3.10, 'Pending', 'TRK975324698', '2025-03-26'),
(20, 'Ishita Saxena', 'Coimbatore', 'Priyanka Sharma', 'Bangalore', 2.40, 'Delivered', 'TRK975324699', '2025-03-11');

--INSERTING VALUES INTO COURIERSERVICE TABLE
insert into CourierServices (CourierID, ServiceName, Cost)
values(975324680, 'Express Delivery', 150.00),
(975324681, 'Standard Delivery', 100.00),
(975324682, 'Same-Day Delivery', 200.00),
(975324683, 'Express Delivery', 180.00),
(975324684, 'Standard Delivery', 120.00),
(975324685, 'Express Delivery', 170.00),
(975324686, 'Overnight Delivery', 250.00),
(975324687, 'Standard Delivery', 130.00),
(975324688, 'Express Delivery', 160.00),
(975324689, 'Same-Day Delivery', 220.00),
(975324690, 'Standard Delivery', 140.00),
(975324691, 'Overnight Delivery', 260.00),
(975324692, 'Express Delivery', 155.00),
(975324693, 'Same-Day Delivery', 210.00),
(975324694, 'Economy Delivery', 90.00),
(975324695, 'Standard Delivery', 125.00),
(975324696, 'Overnight Delivery', 245.00),
(975324697, 'Express Delivery', 175.00),
(975324698, 'Same-Day Delivery', 215.00),
(975324699, 'Economy Delivery', 85.00);

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
('Lucknow Hub', 'Lucknow, Uttar Pradesh, India'),
('Surat Hub', 'Surat, Gujarat, India'),
('Chandigarh Hub', 'Chandigarh, India'),
('Bhopal Hub', 'Bhopal, Madhya Pradesh, India'),
('Indore Hub', 'Indore, Madhya Pradesh, India'),
('Nagpur Hub', 'Nagpur, Maharashtra, India'),
('Visakhapatnam Hub', 'Visakhapatnam, Andhra Pradesh, India'),
('Patna Hub', 'Patna, Bihar, India'),
('Coimbatore Hub', 'Coimbatore, Tamil Nadu, India'),
('Ludhiana Hub', 'Ludhiana, Punjab, India'),
('Kanpur Hub', 'Kanpur, Uttar Pradesh, India');

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
('Meera Iyer', 'meera.iyer@email.com', '9988776610', 'Clerk', 37000.00, 6300234),
('Rajesh Khanna', 'rajesh.khanna@email.com', '9988776611', 'Manager', 80000.00, 6300230),
('Divya Nair', 'divya.nair@email.com', '9988776612', 'Courier Staff', 47000.00, 6300231),
('Arun Saxena', 'arun.saxena@email.com', '9988776613', 'Delivery Boy', 32000.00, 6300232),
('Sunita Verma', 'sunita.verma@email.com', '9988776614', 'Supervisor', 63000.00, 6300233),
('Kunal Roy', 'kunal.roy@email.com', '9988776615', 'Clerk', 38000.00, 6300234),
('Pankaj Mishra', 'pankaj.mishra@email.com', '9988776616', 'Manager', 77000.00, 6300230),
('Shruti Joshi', 'shruti.joshi@email.com', '9988776617', 'Courier Staff', 48000.00, 6300231),
('Gaurav Tripathi', 'gaurav.tripathi@email.com', '9988776618', 'Delivery Boy', 33000.00, 6300232),
('Tanya Sharma', 'tanya.sharma@email.com', '9988776619', 'Supervisor', 64000.00, 6300233),
('Deepak Choudhary', 'deepak.choudhary@email.com', '9988776620', 'Clerk', 39000.00, 6300234);

--INSERTING VALUES INTO PAYMENT TABLE
insert into Payment (CourierID, LocationId, Amount, PaymentDate) 
values(975324680, 6300230, 150.00, '2025-03-20'),
(975324681, 6300231, 100.00, '2025-03-15'),
(975324682, 6300232, 200.00, '2025-03-18'),
(975324683, 6300233, 180.00, '2025-03-22'),
(975324684, 6300234, 120.00, '2025-03-10'),
(975324685, 6300230, 170.00, '2025-03-21'),
(975324686, 6300231, 250.00, '2025-03-19'),
(975324687, 6300232, 130.00, '2025-03-23'),
(975324688, 6300233, 160.00, '2025-03-14'),
(975324689, 6300234, 220.00, '2025-03-17'),
(975324690, 6300230, 190.00, '2025-03-24'),
(975324691, 6300231, 110.00, '2025-03-13'),
(975324692, 6300232, 140.00, '2025-03-25'),
(975324693, 6300233, 210.00, '2025-03-12'),
(975324694, 6300234, 125.00, '2025-03-26'),
(975324695, 6300230, 175.00, '2025-03-11'),
(975324696, 6300231, 195.00, '2025-03-27'),
(975324697, 6300232, 155.00, '2025-03-16'),
(975324698, 6300233, 230.00, '2025-03-28'),
(975324699, 6300234, 145.00, '2025-03-29');

--DISPLAYING THE TABLES CREATED 
select * from Users
select * from Courier
select * from CourierServices
select * from Locations
select * from Employee
select * from Payment
