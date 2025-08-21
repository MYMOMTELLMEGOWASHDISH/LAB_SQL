-- แสดงชื่อประเภทสินค้า ชื่อสินค้า ราคาสินค้า
Select CategoryName, ProductName, UnitPrice
from products as p, Categories as c
where p.CategoryID = c.CategoryID

Select CategoryName,ProductName,UnitPrice
from Products as p JOIN Categories as c
on p.CategoryID = c.CategoryID

Select CompanyName, OrderID
From Orders, Shippers
where Shippers.ShipperID = Orders.Shipvia

Select CompanyName, OrderID
From Orders JOIN Shippers
ON Shippers.ShipperID = Orders.Shipvia

-- ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเทศ
Select p.ProductID,p.ProductName,s.CompanyName,s.country
from Products p JOIN Suppliers s on p.SupplierID = s.SupplierID

Select p.ProductID, p.ProductName, s.CompanyName, s.Country
from Products P, Suppliers s where p.supplierID = s.SupplierID

-- ต้องการรหัสพนักงาน ชื่อพนักงาน รหัสใบสั่งซื้อที่เกี่ยวข้อง เรียงตามลำดับรหัสพนักงาน
select e.EmployeeID, FirstName, OrderID
from Employees as e join orders as o on e.EmployeeID = o.EmployeeID
order by EmployeeID
-- ต้องการรหัสสินค้า เมือง และประเทศของบริษัทผู้จำหน่าย
select productID, ProductName, City, Country
from Products p join Suppliers s on p.SupplierID = s.SupplierID
-- ต้องการชื่อบริษัทขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
select companyName, count(OrderID)
from shippers as s join orders as o on o.ShipVia = s.ShipperID
group by CompanyName
-- ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
select p.ProductID,p.ProductName, sum(quantity) as จำนวนที่ขายได้ทั้งหมด
from Products as p join [Order Details] as od on p.ProductID = od.ProductID
group by p.ProductID,p.ProductName order by 1

select o.OrderID เลขใบสั่งซื้อ, c.companyName ลูกค้า, e.FirstName พนักงาน, o.shipaddress ส่งไปที่
from Orders o, Customers c, Employees e
where o.CustomerID=c.CustomerID and o.EmployeeID = e.EmployeeID

select o.orderID เลขใบสั่งซื้อ, c.companyName ลูกค้า, e.firstName พนักงาน ,o.shipaddress ส่งไปที่
from orders o join customers c on o.customerID= c.CustomerID join Employees e on o.employeeID=e.EmployeeID
order by 1

-- ต้องการ รหัสะนักงาน ชื่อพนักงาน จำนวนใบสั่งซื้อที่เกี่ยวข้อง ผลรวมของค่าขนส่งในปี 1998
select e.employeeID, FirstName, count(*) as [จำนวน order],sum(freight) as [sum of freight]
from Employees e join orders o on e.EmployeeID = o.EmployeeID 
where year(orderdate) = 1998
group by e.EmployeeID, FirstName

--ต้องการชื่อสินค้าที่ nancy ขายได้ทั้งหมดเรียงตามลำดับสินค้า
select distinct p.ProductName, p.ProductID
from Employees e 
join orders o on e.employeeID = o.employeeID 
join [Order Details] od on o.OrderID = od.OrderID 
join Products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy'
order by ProductID

--  ต้องการชื่อบริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
Select distinct s.Country
from customers c join orders o on c.CustomerID = o.CustomerID
join [Order Details] od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
join Suppliers s on s. SupplierID = p.SupplierID
where c.CompanyName = 'Around the horn'
-- บริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าใด
select p.ProductID ,p.ProductName,sum(Quantity) as [sum of quantity]
from customers c join orders o on c.CustomerID = o.CustomerID
join [Order Details] od on o.OrderID = od.OrderID
join products p on od.ProductID = p.ProductID
join Suppliers s on p.SupplierID = s.SupplierID
where c.CompanyName = 'Around the Horn'
group by p.ProductID ,p.ProductName
order by 1
-- ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้น
select o.OrderID, e.FirstName, sum((od.Quantity* od.UnitPrice * (1-od.discount))) as totalcash
from orders o join employees e on o.EmployeeID = e.EmployeeID
join [Order Details] od on o.OrderID = od.OrderID
group by o.OrderID, e.FirstName
order by 1
