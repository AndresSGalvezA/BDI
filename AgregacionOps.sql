--De agregación
--Conteo
--Suma
--Promedio
--Multiplicación/División
--Máximo/Mínimo

SELECT count(*)
FROM sales.SalesOrderDetail, Production.Document

select max(listPrice) as PrecioMax, min(listPrice) as PrecioMin, count (1) as Cantidad
from Production.Product 
where ProductID between 770 and 780 --Aplicando una selección.

select sum(weight)
from Production.Product 

select count(1)
from Sales.SalesOrderDetail V
		inner join Production.Product P on V.ProductID = P.ProductID 

select *
from Sales.SalesOrderDetail V
		inner join Production.Product P on V.ModifiedDate = P.ModifiedDate

select distinct ModifiedDate
from Production.Product 

update Production.Product 
set ModifiedDate = '31/05/2011'
where ProductID = 4

select sum(P.Weight)
from Sales.SalesOrderDetail V
		inner join Production.Product P on V.ProductID = P.ProductID

select distinct P.ModifiedDate
from Sales.SalesOrderDetail V
		inner join Production.Product P on V.ProductID = P.ProductID

select sum(weight) as sumaPeso, AVG(weight) promedioPeso
from sales.SalesOrderDetail V
		inner join Production.Product P on V.ProductID = P.ProductID 

select P.Name, count(1) as Cantidad
from sales. SalesOrderDetail V
		inner join Production.Product P on V.ProductID = P.ProductID 
group by P.Name 
--Todo lo que tenga en mi proyección que no sea una función de agregación,
--debe existir en la seccción de agrupación group by.

select P.Name, year(V.ModifiedDate), count(1) as Cantidad
from sales. SalesOrderDetail V
		inner join Production.Product P on V.ProductID = P.ProductID 
group by P.Name, year(V.ModifiedDate)
order by year(V.ModifiedDate) --Los campos del order no tienen que ser exctamente los mismos del grupo.
