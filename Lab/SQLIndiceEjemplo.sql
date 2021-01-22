create table persona
(
	id int primary key,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	genero varchar(50) not null,
	dpi int not null
)

insert into persona
values
(25, 'Julio', 'Peláez', 'M', 123456789),
(3, 'Andrea', 'Arriaza', 'F', 123456788),
(40, 'Andres', 'Gálvez', 'M', 123456787)

execute sp_helpindex persona

create nonclustered index ix_persona_nombre
	on persona (nombre asc)

select * from persona