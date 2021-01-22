select OD.OrderQty as Cantidad, OD.ProductID as Código
from sales.SalesOrderDetail OD
order by OD.ProductID
