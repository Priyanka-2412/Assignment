--TASK2

--1. LIST OF ALL CUSTOMERS
select *from Users


--2. LIST OF ALL ORDERS FOR A SPECIFIC CUSTOMER:
--IN DIFFERENT TABLE
select * from Courier where UserID = 1
select * from Courier where UserID = 17
select * from Courier where UserID = 9
--WITHIN SAME TABLE
select * from Courier 
where UserID in (1, 17, 9)

--3. LIST OF ALL COURIERS
select * from Courier

--4. LIST OF ALL PACKAGES FOR SPECIFIC ORDER
--COURIERID=975324680
select * from Courier where CourierID = 975324680
select * from CourierServices where CourierID = 975324680
select * from Payment where CourierID = 975324680
--COURIERID=975324680
select * from Courier where CourierID = 975324697
select * from CourierServices where CourierID = 975324697
select * from Payment where CourierID = 975324697

--5. LIST OF ALL DELIVERIES FOR A SPECIFIC ORDER
select * from Courier where TrackingNumber = 'TRK975324690'
select * from Courier where TrackingNumber = 'TRK975324687'

--6. LIST OF ALL UNDELIVERED PACKAGES
select * from Courier where CourierStatus='Pending'

--7. LIST OF ALL PACKAGES THAT ARESCHEDULED FOR DELIVERY TODAY
select * from Courier where CourierStatus='Delivered'

--8. LIST OF ALL PACKAGES WITH A SPECIFIC STATUS
select * from Courier where CourierStatus='In Transit'
select * from Courier where CourierStatus='Shipped'

--9. CALCULATE THE TOTAL NUMBER OF PACKAGES FOR EACH COURIER
select CourierID, count(*) as TotalPackages
from Courier
group by CourierID;

--10. FIND THE AVERAGE DELIVERY TIME FOR EACH COURIER

--11. LIST OF ALL PACKAGES WITH A SPECIFIC WEIGHT RANGE
select * from Courier where Weights<=2.00
select * from Courier where Weights>=2.00
select * from Courier where Weights>=2.00 and Weights<=3.00

--12. RETRIEVE EMPLOYEE WHOSE NAMES CONTAIN 'NEHA PATEL'
select * from Employee where Names='Neha Patel'

--13. RETRIEVE ALL COURIER RECORDS WITH PAYMENTS GREATER THAN "200"
select * from Payment where Amount>=200
select * from Payment where Amount<=200
