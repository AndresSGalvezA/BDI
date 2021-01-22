--Mostrar los nombres y apellidos de los empleados, combinando ambas columnas con
--formato: "apellido, nombre". Agregar la edad de cada empleado.
SELECT E.LastName + ', ' + E.FirstName AS Empleado, 
		cast(datediff(dd, E.BirthDate, GETDATE()) / 365.25 as int) as Edad
FROM Employees E
GROUP BY E.LastName + ', ' + E.FirstName, E.BirthDate
