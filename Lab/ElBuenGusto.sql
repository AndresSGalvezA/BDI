/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2/04/2020 17:12:59                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AUTOMOVIL') and o.name = 'FK_AUTOMOVI_REFERENCE_CLIENTE')
alter table AUTOMOVIL
   drop constraint FK_AUTOMOVI_REFERENCE_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATERIAL_OPERACION') and o.name = 'FK_MATERIAL_REFERENCE_MATERIAL')
alter table MATERIAL_OPERACION
   drop constraint FK_MATERIAL_REFERENCE_MATERIAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATERIAL_OPERACION') and o.name = 'FK_MATERIAL_REFERENCE_OPERACIO')
alter table MATERIAL_OPERACION
   drop constraint FK_MATERIAL_REFERENCE_OPERACIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('REVISION') and o.name = 'FK_REVISION_REFERENCE_AUTOMOVI')
alter table REVISION
   drop constraint FK_REVISION_REFERENCE_AUTOMOVI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('REVISION_OPERACION') and o.name = 'FK_REVISION_REFERENCE_OPERACIO')
alter table REVISION_OPERACION
   drop constraint FK_REVISION_REFERENCE_OPERACIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('REVISION_OPERACION') and o.name = 'FK_REVISION_REFERENCE_REVISION')
alter table REVISION_OPERACION
   drop constraint FK_REVISION_REFERENCE_REVISION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUTOMOVIL')
            and   type = 'U')
   drop table AUTOMOVIL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATERIAL')
            and   type = 'U')
   drop table MATERIAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATERIAL_OPERACION')
            and   type = 'U')
   drop table MATERIAL_OPERACION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OPERACION')
            and   type = 'U')
   drop table OPERACION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REVISION')
            and   type = 'U')
   drop table REVISION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REVISION_OPERACION')
            and   type = 'U')
   drop table REVISION_OPERACION
go

/*==============================================================*/
/* Table: AUTOMOVIL                                             */
/*==============================================================*/
create table AUTOMOVIL (
   PLACA                varchar(6)           not null,
   DPI                  varchar(13)          null,
   MARCA                varchar(25)          null,
   MODELO               varchar(25)          null,
   PRECIO               money                null,
   FECHASALIDA          date                 null,
   constraint PK_AUTOMOVIL primary key (PLACA)
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   DPI                  varchar(13)          not null,
   TELEFONO             int                  null,
   constraint PK_CLIENTE primary key (DPI)
)
go

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL (
   IDMATERIAL           int                  not null,
   NOMBRE               varchar(25)          null,
   constraint PK_MATERIAL primary key (IDMATERIAL)
)
go

/*==============================================================*/
/* Table: MATERIAL_OPERACION                                    */
/*==============================================================*/
create table MATERIAL_OPERACION (
   IDOPERACION          int                  not null,
   IDMATERIAL           int                  not null,
   constraint PK_MATERIAL_OPERACION primary key (IDOPERACION, IDMATERIAL)
)
go

/*==============================================================*/
/* Table: OPERACION                                             */
/*==============================================================*/
create table OPERACION (
   IDOPERACION          int                  not null,
   DURACION             time                 null,
   constraint PK_OPERACION primary key (IDOPERACION)
)
go

/*==============================================================*/
/* Table: REVISION                                              */
/*==============================================================*/
create table REVISION (
   IDREVISION           int                  not null,
   PLACA                varchar(6)           null,
   DURACION             time                 null,
   FECHA                date                 null,
   constraint PK_REVISION primary key (IDREVISION)
)
go

/*==============================================================*/
/* Table: REVISION_OPERACION                                    */
/*==============================================================*/
create table REVISION_OPERACION (
   IDREVISION           int                  not null,
   IDOPERACION          int                  not null,
   constraint PK_REVISION_OPERACION primary key (IDREVISION, IDOPERACION)
)
go

alter table AUTOMOVIL
   add constraint FK_AUTOMOVI_REFERENCE_CLIENTE foreign key (DPI)
      references CLIENTE (DPI)
go

alter table MATERIAL_OPERACION
   add constraint FK_MATERIAL_REFERENCE_MATERIAL foreign key (IDMATERIAL)
      references MATERIAL (IDMATERIAL)
go

alter table MATERIAL_OPERACION
   add constraint FK_MATERIAL_REFERENCE_OPERACIO foreign key (IDOPERACION)
      references OPERACION (IDOPERACION)
go

alter table REVISION
   add constraint FK_REVISION_REFERENCE_AUTOMOVI foreign key (PLACA)
      references AUTOMOVIL (PLACA)
go

alter table REVISION_OPERACION
   add constraint FK_REVISION_REFERENCE_OPERACIO foreign key (IDOPERACION)
      references OPERACION (IDOPERACION)
go

alter table REVISION_OPERACION
   add constraint FK_REVISION_REFERENCE_REVISION foreign key (IDREVISION)
      references REVISION (IDREVISION)
go

