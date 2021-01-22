--Mostrar la cantidad de ventas y monto total, por cada tipo de tarjeta de crédito y ciudad
--donde se entregó el pedido, tomando en cuenta solamente las ventas que excedan los $10,000.
select CC.CardType as [Tipo de tarjeta], OH.TotalDue as [Monto total], A.City as Ciudad, count(*) as [Cantidad de ventas]
from Sales.CreditCard CC
	inner join Sales.SalesOrderHeader OH on (CC.CreditCardID = OH.CreditCardID)
	inner join Person.Address A on (A.AddressID = OH.ShipToAddressID)
where OH.TotalDue > 10000
group by CC.CardType, OH.TotalDue, A.City 