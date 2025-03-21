--TASK5
--49. FIND COURIERS THAT HAVE A WEIGHT GREATER THAN THE AVERAGE WEIGHT OF ALL COURIERS
select C.CourierID, C.SenderName, C.Weights from Courier as C
where Weights > (select avg(Weights) from Courier)

--50. FIND THE NAMES OF ALL EMPLOYEES WHO HAVE A SALARY GREATER THAN THE AVERAGE SALARY
select E.EmployeeID, E.Names, E.Salary from Employee as E
where Salary > (select avg(Salary) from Employee)

--51. FIND THE TOTAL COST OF ALL COURIER SERVICES WHERE THE COST IS LESS THAN THE MAXIMUM COST
select sum(Cost) as TotalCost from CourierServices
where Cost<(select max(Cost) from CourierServices)

--52. FIND ALL COURIERS THAT HAVE BEEN PAID FOR
select C.CourierID, C.SenderName, C.CourierStatus, C.TrackingNumber 
from Courier as c
where exists (select * from Payment as P where C.CourierID = P.CourierID)

--53. FIND THE LOCATION WHERE THE MAXIMUM AMOUNT WAS MADE
select P.LocationId, P.Amount from Payment as P
where Amount = (select max(Amount) from Payment as P)

--54. FIND ALL COURIERS WHOSE WEIGHT IS GREATER THAN THE WEIGHT OF ALL COURIERS SENT BY A SPECIFIC SENDER
select CourierID, Weights
from Courier
where Weights = (select max(Weights) from Courier)
