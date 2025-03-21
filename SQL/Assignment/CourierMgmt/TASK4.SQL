--TASK4
--23. RETRIEVE PAYMENTS WITH COURIER INFORMATION
select * from Payment as P
inner join Courier as C
on P.CourierID = C.CourierID

--24. RETRIEVE PAYMENTS WITH LOCATION INFORMATION
select * from Payment as P
inner join Locations as L
on P.LocationId = L.LocationID

--25. RETRIEVE PAYMENTS WITH COURIER AND LOCATION INFORMATION
select * from Payment as P
inner join Courier as C
on P.CourierID = C.CourierID
inner join Locations as L
on P.LocationId = L.LocationID

--26. LIST ALL PAYMENTS WITH COURIER DETAILS
select * from Payment as P
left join Courier as C 
on P.CourierID = C.CourierID

--27. TOTAL PAYMENTS RECEIVED FOR EACH COURIER
select C.CourierID, C.SenderName, C.ReceiverName, sum(P.Amount) as TotalPayments
from Payment P
right join Courier C on P.CourierID = C.CourierID
group by C.CourierID, C.SenderName, C.ReceiverName

--28. LIST OF PAYMENTS MADE ON A SPECIFIC DATE
select * from Payment where PaymentDate = '2025-03-10'
select * from Payment where PaymentDate = '2025-03-19'

--29. GET COURIER INFORMATION FOR EACH PAYMENT 
select P.PaymentID, P.Amount, P.PaymentDate, 
C.CourierID, C.Weights, C.CourierStatus, C.TrackingNumber, C.DeliveryDate
from Payment as P
inner join Courier as C 
on P.CourierID = C.CourierID

--30. GET PAYMENT DETAILS WITH LOCATION
select * from Payment as P
inner join Locations as L
on P.LocationId=L.LocationID

--31. CALCULATING TOTAL PAYMENTS FOR EACH COURIER
select C.CourierID, sum(P.Amount) as TotalPayments  
from Payment as P
inner join Courier as C
on P.CourierID=C.CourierID
group by C.CourierID

--32. LIST PAYMENTS WITHIN A DATE RANGE
select CourierID, PaymentID, PaymentDate  
from Payment  
where PaymentDate between '2025-03-10' and '2025-03-20'  
order by PaymentDate

--33. RETRIEVE A LIST OF ALL USERS AND THEIR CORRESPONDING COURIER RECORDS, INCLUDING CASES WHERE THERE ARE NO MATCHES ON EITHER SIDE
select U.UserID, U.Names, C.CourierID, C.TrackingNumber, C.CourierStatus
from Users U
full outer join Courier C 
on U.UserID = C.UserID

--34. RETRIEVE A LIST OF ALL COURIERS AND THEIR CORRESPONDING COURIER RECORDS, INCLUDING CASES WHERE THERE ARE NO MATCHES ON EITHER SIDE
select C.CourierID, C.TrackingNumber, CS.ServiceID, CS.ServiceName, CS.Cost
from Courier C
full outer join CourierServices CS on C.CourierID = CS.CourierID

--35. RETRIEVE A LIST OF ALL EMPLOYEES AND THEIR CORRESPONDING COURIER RECORDS, INCLUDING CASES WHERE THERE ARE NO MATCHES ON EITHER SIDE
select E.*, P.PaymentID, P.Amount, P.PaymentDate 
from Employee E
full outer join Payment P on E.LocationID = P.LocationID

--36. LIST ALL USERS AND ALL COURIER SERVICES, SHOWING ALL POSSIBLE COMBINATIONS
select * from Users as U
cross join CourierServices as CS

--37. LIST ALL EMPLOYEES AND ALL LOCATIONS, SHOWING ALL POSSIBLE COMBINATIONS
select * from Employee as E
cross join Locations as L

--38. RETRIEVE A LIST OF COURIER AND THEIR CORRESPONDING SENDER INFORMATION(IF AVAILABLE)
select C.CourierID, C.SenderName, C.SenderAddress, U.UserID, U.UserAddress
from Courier as C
left join Users as U 
on C.UserID = U.UserID

--39. RETRIEVE A LIST OF COURIER AND THEIR CORRESPONDING RECEIVER INFORMATION(IF AVAILABLE)
select C.CourierID, C.ReceiverName, C.ReceiverAddress, U.UserID, U.UserAddress
from Courier as C
left join Users as U
on C.UserID = U.UserID

--40. RETRIEVE A LIST OF COURIERS ALONG WITH THE COURIER SERVICE DETAILS(IF AVAILABLE)
select C.*, CS.ServiceName, CS.Cost
from Courier C
left join CourierServices CS 
on C.CourierID = CS.CourierID

--41. RETRIEVE A LIST OF EMPLOYEES AND THE NUMBER OF COURIERS ASSIGNED TO EACH EMPLOYEE
select E.EmployeeID, E.Names, count(P.CourierID) as TotalCouriersAssigned
from Employee E
join Payment P on E.LocationID = P.LocationID
group by E.EmployeeID, E.Names

--42. RETRIEVE A LIST OF LOCATIONS AND THE TOTAL PAYMENT AMOUNT RECEIVED AT EACH LOCATION
select L.LocationID, L.LocationName, sum(P.Amount) as TotalPayments
from Locations L
inner join Payment P on L.LocationID = P.LocationID
group by L.LocationID, L.LocationName

--43. RETRIEVE ALL COURIERS SENT BY THE SAME SENDER(BASED ON SENDER)
if exists (select 1 from Courier group by SenderName having count(*) > 1)
select C.*
from Courier C
where C.SenderName IN (select SenderName from Courier group by SenderName having count(*) > 1)
else
print 'No couriers by same sender'

--44. LIST ALL EMPLOYEES WHO SHARE SAME ROLE
select E.EmployeeID, E.Roles 
from Employee as E
where E.Roles in ('Manager','Courier Staff','Delivery boy','Clerk','Supervisor')
order by E.Roles

--45. RETRIEVE ALL PAYMENTS MADE FOR COURIERS SENT FROM THE SAME LOCATION
select P.PaymentID, P.Amount, P.LocationId, L.LocationName
from Payment as P
join Locations as L
on P.LocationId=L.LocationId

--46. RETRIEVE ALL COURIERS SENT FROM THE SAME LOCATION.
if exists (
    select 1 
    from Courier C1
    inner join Courier C2 
    on cast(C1.SenderAddress as varchar(max)) = cast(C2.SenderAddress as varchar(max))
    where C1.CourierID <> C2.CourierID
)
    select C1.*
    from Courier C1
    inner join Courier C2 
    on cast(C1.SenderAddress as varchar(max)) = cast(C2.SenderAddress as varchar(max))
    where C1.CourierID <> C2.CourierID;
else
    print 'No couriers sent from the same location'

--47. LIST EMPLOYEES AND THE NUMBER OF COURIERS THEY HAVE DELIVERED
select E.EmployeeID, E.Names, count(C.CourierID) as DeliveredCouriers
from Employee E
inner join Locations L on E.LocationID = L.LocationID
inner join Payment P on L.LocationID = P.LocationID
inner join Courier C on P.CourierID = C.CourierID
where C.CourierStatus = 'Delivered'
group by E.EmployeeID, E.Names

--48. FIND COURIERS THAT WERE PAID AN AMOUNT GREATER THAN THE COST OF THEIR RESPECTIVE COURIER SERVICES 
select C.CourierID, CS.Cost, P.Amount
from Courier C
inner join CourierServices CS on C.CourierID = CS.CourierID
inner join Payment P on C.CourierID = P.CourierID
where P.Amount > CS.Cost