select OD.OrderQty as Cantidad, OD.ProductID as C�digo
from sales.SalesOrderDetail OD
order by OD.ProductID
