-- sub query within from clause
select pname,pprice from (select * from product) as t

--sub query within where clause with logical operators
select pname,pprice from product where pprice >=(select avg(pprice) from product) 

select t.pname,t.pprice from (select * from product) as t

select pname,pprice from product where pprice In(select avg(pprice) from product group by pname)

select avg(pprice) as AvgPrice ,pname from product group by pname

--sub query to find out average price of product and search minimum price
select avg(pprice) from product group by pname
select pname,pprice from product where pprice >All(select avg(pprice) from product group by pname)
select * from product

--join query to find out average price of product and search minimum price
select avg(pprice) from product group by pname
select p1.pname,p1.pprice from product as p1
join
product as p
on p.pid =p1.pid
where p.pprice >= All(select avg(pprice) from product group by pname)
select * from product


select pname,pprice from product where pprice <= Any(select avg(pprice) from product group by pname)


select pname,pprice from product where pprice <= All(select avg(pprice) from product group by pname)


--corelated sub queries
select * from product
select * from ProductOrders

select  p.pid,p.pname,
(select count(ProductID) from ProductOrders where ProductID= p.pid group by ProductID )  as Total_Order
from product as p

--using join
select p.pid, p.pname, count(o.ProductID)as Total_Order
from product as p
inner join 
ProductOrders as o
on p.pid=o.ProductID
group by p.pname,p.pid


-- sub Query to retrieve records from child table - doesn't work bcoz ite returns multiple rows
select pid, pname,pprice,(select OrderDate from ProductOrders where ProductID=p.pid) from product as p