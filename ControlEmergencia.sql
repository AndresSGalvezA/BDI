/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     3/05/2020 22:39:35                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CIUDAD') and o.name = 'FK_CIUDAD_REFERENCE_PAIS')
alter table CIUDAD
   drop constraint FK_CIUDAD_REFERENCE_PAIS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DIAGNOSTICO') and o.name = 'FK_DIAGNOST_REFERENCE_PERSONA')
alter table DIAGNOSTICO
   drop constraint FK_DIAGNOST_REFERENCE_PERSONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DIAGNOSTICO') and o.name = 'FK_DIAGNOST_REFERENCE_ESCANER')
alter table DIAGNOSTICO
   drop constraint FK_DIAGNOST_REFERENCE_ESCANER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESCANER') and o.name = 'FK_ESCANER_REFERENCE_ZONA')
alter table ESCANER
   drop constraint FK_ESCANER_REFERENCE_ZONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MUNICIPIO') and o.name = 'FK_MUNICIPI_REFERENCE_DEPARTAM')
alter table MUNICIPIO
   drop constraint FK_MUNICIPI_REFERENCE_DEPARTAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PAIS') and o.name = 'FK_PAIS_REFERENCE_CONTINEN')
alter table PAIS
   drop constraint FK_PAIS_REFERENCE_CONTINEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PERSONA') and o.name = 'FK_PERSONA_REFERENCE_ZONA')
alter table PERSONA
   drop constraint FK_PERSONA_REFERENCE_ZONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIAJE') and o.name = 'FK_VIAJE_REFERENCE_PERSONA')
alter table VIAJE
   drop constraint FK_VIAJE_REFERENCE_PERSONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIAJE') and o.name = 'FK_VIAJE_REFERENCE_CIUDAD')
alter table VIAJE
   drop constraint FK_VIAJE_REFERENCE_CIUDAD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ZONA') and o.name = 'FK_ZONA_REFERENCE_MUNICIPI')
alter table ZONA
   drop constraint FK_ZONA_REFERENCE_MUNICIPI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CIUDAD')
            and   type = 'U')
   drop table CIUDAD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONTINENTE')
            and   type = 'U')
   drop table CONTINENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DEPARTAMENTO')
            and   type = 'U')
   drop table DEPARTAMENTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DIAGNOSTICO')
            and   type = 'U')
   drop table DIAGNOSTICO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESCANER')
            and   type = 'U')
   drop table ESCANER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MUNICIPIO')
            and   type = 'U')
   drop table MUNICIPIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PAIS')
            and   type = 'U')
   drop table PAIS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PERSONA')
            and   type = 'U')
   drop table PERSONA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VIAJE')
            and   type = 'U')
   drop table VIAJE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ZONA')
            and   type = 'U')
   drop table ZONA
go

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   NOMBRECIUDAD         varchar(50)          not null,
   NOMBREPAIS           varchar(50)          not null,
   constraint PK_CIUDAD primary key (NOMBRECIUDAD, NOMBREPAIS)
)
go

/*==============================================================*/
/* Table: CONTINENTE                                            */
/*==============================================================*/
create table CONTINENTE (
   NOMBRECONTINENTE     varchar(10)          not null,
   constraint PK_CONTINENTE primary key (NOMBRECONTINENTE)
)
go

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   NOMBREDEPTO          varchar(50)          not null,
   constraint PK_DEPARTAMENTO primary key (NOMBREDEPTO)
)
go

/*==============================================================*/
/* Table: DIAGNOSTICO                                           */
/*==============================================================*/
create table DIAGNOSTICO (
   IDDIAGNOSTICO        int                  not null,
   CUI                  varchar(13)          null,
   IDESCANER            int                  null,
   FECHA                date                 null,
   TIEMPO               time                 null,
   PORTADOR             tinyint              null,
   ASINTOMATICO         tinyint              null,
   constraint PK_DIAGNOSTICO primary key (IDDIAGNOSTICO)
)
go

/*==============================================================*/
/* Table: ESCANER                                               */
/*==============================================================*/
create table ESCANER (
   IDESCANER            int                  not null,
   NUMEROZONA           int                  null,
   NOMBREMUNICIPIO      varchar(50)          null,
   constraint PK_ESCANER primary key (IDESCANER)
)
go

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
create table MUNICIPIO (
   NOMBREMUNICIPIO      varchar(50)          not null,
   NOMBREDEPTO          varchar(50)          null,
   constraint PK_MUNICIPIO primary key (NOMBREMUNICIPIO)
)
go

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   NOMBREPAIS           varchar(50)          not null,
   NOMBRECONTINENTE     varchar(10)          null,
   constraint PK_PAIS primary key (NOMBREPAIS)
)
go

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA (
   CUI                  varchar(13)          not null,
   NUMEROZONA           int                  null,
   NOMBREMUNICIPIO      varchar(50)          null,
   NOMBRE1              varchar(50)          null,
   NOMBRE2              varchar(50)          null,
   NOMBRE3              varchar(50)          null,
   APELLIDO1            varchar(50)          null,
   APELLIDO2            varchar(50)          null,
   PADRE                varchar(13)          null,
   MADRE                varchar(13)          null,
   FECHANACIMIENTO      date                 null,
   GENERO               varchar(1)           null,
   PASAPORTE            varchar(9)           null,
   constraint PK_PERSONA primary key (CUI)
)
go

/*==============================================================*/
/* Table: VIAJE                                                 */
/*==============================================================*/
create table VIAJE (
   IDVIAJE              int                  not null,
   CUI                  varchar(13)          null,
   NOMBRECIUDAD         varchar(50)          null,
   NOMBREPAIS           varchar(50)          null,
   MOTIVO               varchar(100)         null,
   FECHA                date                 null,
   constraint PK_VIAJE primary key (IDVIAJE)
)
go

/*==============================================================*/
/* Table: ZONA                                                  */
/*==============================================================*/
create table ZONA (
   NUMEROZONA           int                  not null,
   NOMBREMUNICIPIO      varchar(50)          not null,
   constraint PK_ZONA primary key (NUMEROZONA, NOMBREMUNICIPIO)
)
go

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_PAIS foreign key (NOMBREPAIS)
      references PAIS (NOMBREPAIS)
go

alter table DIAGNOSTICO
   add constraint FK_DIAGNOST_REFERENCE_PERSONA foreign key (CUI)
      references PERSONA (CUI)
go

alter table DIAGNOSTICO
   add constraint FK_DIAGNOST_REFERENCE_ESCANER foreign key (IDESCANER)
      references ESCANER (IDESCANER)
go

alter table ESCANER
   add constraint FK_ESCANER_REFERENCE_ZONA foreign key (NUMEROZONA, NOMBREMUNICIPIO)
      references ZONA (NUMEROZONA, NOMBREMUNICIPIO)
go

alter table MUNICIPIO
   add constraint FK_MUNICIPI_REFERENCE_DEPARTAM foreign key (NOMBREDEPTO)
      references DEPARTAMENTO (NOMBREDEPTO)
go

alter table PAIS
   add constraint FK_PAIS_REFERENCE_CONTINEN foreign key (NOMBRECONTINENTE)
      references CONTINENTE (NOMBRECONTINENTE)
go

alter table PERSONA
   add constraint FK_PERSONA_REFERENCE_ZONA foreign key (NUMEROZONA, NOMBREMUNICIPIO)
      references ZONA (NUMEROZONA, NOMBREMUNICIPIO)
go

alter table VIAJE
   add constraint FK_VIAJE_REFERENCE_PERSONA foreign key (CUI)
      references PERSONA (CUI)
go

alter table VIAJE
   add constraint FK_VIAJE_REFERENCE_CIUDAD foreign key (NOMBRECIUDAD, NOMBREPAIS)
      references CIUDAD (NOMBRECIUDAD, NOMBREPAIS)
go

alter table ZONA
   add constraint FK_ZONA_REFERENCE_MUNICIPI foreign key (NOMBREMUNICIPIO)
      references MUNICIPIO (NOMBREMUNICIPIO)
go

