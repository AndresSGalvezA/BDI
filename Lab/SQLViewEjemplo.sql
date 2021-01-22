create view EmpleadosContratados as
select E.HireDate, E.JobTitle, P.FirstName, P.LastName
from HumanResources.Employee E
	inner join Person.Person P on E.BusinessEntityID = P.BusinessEntityID

select *
from EmpleadosContratados