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
