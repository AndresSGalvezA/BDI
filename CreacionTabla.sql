create table serie
(
	id_serie int NOT NULL,
	nombre varchar(50) NOT NULL,
	fecha date default getdate(),
	clasificacion varchar(100) NOT NULL
	constraint uc_serie unique (nombre),
	constraint pk_serie primary key (id_serie),
	constraint uc_fecha check (fecha >= '01/31/2020'),
	constraint uc_nombre_seg check (substring(nombre, 2, 1) = 'A'),
	
)

create table temporada
(
	id_temporada int,
	id_serie int,
	nombre varchar(50),
	constraint fk_otra foreign key (id_serie) references serie(id_serie)
)

INSERT INTO SERIE (id_serie, nombre, clasificacion)
VALUES
(5, 'PATITO', 'A')

SELECT *
from serie
where name = 'serie'

drop table serie

alter table serie
	add clasificacion varchar(100)