CREATE TABLE EMPLEADO
(
	ID_EMPLEADO INT IDENTITY(1,1) PRIMARY KEY,
	GENERO VARCHAR(1) NOT NULL,
	FECHA_NACIMIENTO DATE NOT NULL,
	NOMBRE VARCHAR(25) NOT NULL,
	APELLIDO VARCHAR(25) NOT NULL,
	HORA_ENTRADA TIME NOT NULL
	
)
ALTER TABLE EMPLEADO ADD CONSTRAINT UC_GENERO CHECK (GENERO = 'F' OR GENERO = 'M')
CREATE TABLE ADMINISTRATIVO 
(
	ID_EMPLEADO INT UNIQUE NOT NULL,
	DEPARTAMENTO VARCHAR(25) NOT NULL,
	JEFE INT NOT NULL
)
ALTER TABLE ADMINISTRATIVO ADD CONSTRAINT FK_ADMINISTRATIVO FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO)
ALTER TABLE ADMINISTRATIVO ADD CONSTRAINT PK_ADMIN PRIMARY KEY (ID_EMPLEADO)
CREATE TABLE DOCENTE
(
	ID_EMPLEADO INT UNIQUE NOT NULL,
	FACULTAD VARCHAR(25) NOT NULL,
	JEFE INT NOT NULL
)
ALTER TABLE DOCENTE ADD CONSTRAINT FK_DOCENTE FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO)
ALTER TABLE DOCENTE ADD CONSTRAINT PK_DOCENTE PRIMARY KEY (ID_EMPLEADO)
CREATE TABLE ASISTENCIA
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ID_EMPLEADO INT NOT NULL,
	HORA TIME NOT NULL,
	FECHA DATE NOT NULL
)
ALTER TABLE ASISTENCIA ADD CONSTRAINT FK_ASISTENCIA FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO)

