--Mostrar todos los transportistas, donde se incluya la suma total de fletes
--realizados por órdenes, redondeado al número entero más cercano.
select S.CompanyName as Transportista,
O.ShipName as Órden, 
round(sum(O.Freight), 0) as Flete
from Orders O inner join Shippers S on (O.ShipVia = S.ShipperID)
group by O.ShipName, S.CompanyName 
