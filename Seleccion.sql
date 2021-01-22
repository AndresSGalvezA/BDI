select * --Proyección
from sales.Customer
--where TerritoryID is not null --Selección
where PersonID is null

select *
from sales.Customer
where (PersonID is null and (StoreID in (644, 930))) or (TerritoryID = 5) --El in funciona como or, 644 or 930

select *
from Sales.SalesOrderHeader A
	, Sales.SalesPerson B
where year(OrderDate) = 2011
--where year(orderDate) in (2011)
--where SUBSTRING(convert(varchar, orderDate), 0, 5) = '2011'
--where OrderDate >= '2011/01/01' and OrderDate <= '2011/12/31'
--where OrderDate between '2011/01/01' and '2011/12/31'
--where datepart(year from OrderDate) = 2011