
DECLARE @EstadoCivil VARCHAR(2),
		@Genero VARCHAR(2),
		@ID INT,
		@Fecha DATETIME
SET @Fecha = GETDATE()

DECLARE C_Empleado CURSOR 
FOR SELECT MaritalStatus, Gender, BusinessEntityID FROM HumanResources.Employee

OPEN C_Empleado

FETCH C_Empleado INTO @EstadoCivil, @Genero, @ID
WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @Sueldo MONEY, @PayF INT
		SET @Sueldo = (SELECT Rate FROM HumanResources.EmployeePayHistory WHERE BusinessEntityID = @ID AND ModifiedDate = 
			(SELECT MAX(ModifiedDate) FROM HumanResources.EmployeePayHistory WHERE BusinessEntityID = @ID GROUP BY BusinessEntityID))
		SET @PayF = (SELECT PayFrequency FROM HumanResources.EmployeePayHistory WHERE BusinessEntityID = @ID AND ModifiedDate = 
			(SELECT MAX(ModifiedDate) FROM HumanResources.EmployeePayHistory WHERE BusinessEntityID = @ID GROUP BY BusinessEntityID))
		
		IF (@EstadoCivil = 'M' AND @Genero = 'F')
			BEGIN
				SET @Sueldo = @Sueldo + (@Sueldo * 0.1)
			END
		ELSE
			BEGIN
				SET @Sueldo = @Sueldo + (@Sueldo * 0.05)
			END

		INSERT INTO HumanResources.EmployeePayHistory VALUES (@ID, @Fecha, @Sueldo, @PayF, @Fecha)

		FETCH C_Empleado INTO @EstadoCivil, @Genero, @ID
	end
CLOSE C_Empleado
DEALLOCATE C_Empleado
