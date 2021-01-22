--Agrupación/Ordenamiento
--Group by
--Having

select ST.Name as País, s.Name as Tienda, COUNT(1) as Cantidad
from sales.Customer C
	inner join sales.SalesTerritory ST on (C.TerritoryID = ST.TerritoryID)
	inner join sales.Store S on (c.StoreID = s.BusinessEntityID)
group by ST.Name, s.Name
having count(1) = 1 --Selección (where) dentro de la agrupación.
Order by count(1) desc
--Todo atributo utilizado en la proyección (select) debe existir en mi clausula group by.