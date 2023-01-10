/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     15/03/2021 16:41:31                          */
/*==============================================================*/

if exists (select 1
            from  sysobjects
           where  id = object_id('ClientesED')
            and   type = 'U')
   drop table ClientesED
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FaturasED')
            and   type = 'U')
   drop table FaturasED
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ItensFaturasED')
            and   type = 'U')
   drop table ItensFaturasED
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OpçõesEncomenda')
            and   type = 'U')
   drop table OpçõesEncomenda
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ProdutosED')
            and   type = 'U')
   drop table ProdutosED
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Provincias')
            and   type = 'U')
   drop table Provincias
go

/*==============================================================*/
/* Table: Provincias                                            */
/*==============================================================*/
create table Provincias (
   Codigo               char(2)              not null,
   Provincia            varchar(20)          not null,
   constraint PK_PROVINCIAS primary key nonclustered (Codigo)
)
go

/*==============================================================*/
/* Table: ClientesED                                            */
/*==============================================================*/
create table ClientesED (
   IDCliente            int   IDENTITY(1,1)  not null,
   Nome                 varchar(100)         not null,
   Endereço             varchar(50)          not null,
   Localidade           varchar(20)          not null,
   Provincia            char(2)              not null,
   CodigoPostal         char(8)              not null,
   constraint PK_CLIENTESED primary key nonclustered (IDCliente),
   constraint FK_CLIENTES_LOCALIZAD_PROVINCI foreign key (Provincia)
      references Provincias (Codigo)
)
go

/*==============================================================*/
/* Table: FaturasED                                             */
/*==============================================================*/
create table FaturasED (
   IDFaturas            int  IDENTITY(1,1)   not null,
   Cliente              int                  not null,
   DataFatura           datetime             not null,
   TotalProduto         money                not null,
   Imposto              money                not null,
   Transporte           money                not null,
   TotalFatura          money                not null,
   constraint PK_FATURASED primary key nonclustered (IDFaturas),
   constraint FK_FATURASE_FATURAR_CLIENTES foreign key (Cliente)
      references ClientesED (IDCliente)
)
go

/*==============================================================*/
/* Table: ProdutosED                                            */
/*==============================================================*/
create table ProdutosED (
   PCodigo              char(10)             not null,
   Designação           varchar(50)          not null,
   PreçoUnitario        money                not null,
   Quantidade           int                  not null,
   constraint PK_PRODUTOSED primary key nonclustered (PCodigo)
)
go

ALTER TABLE ProdutosED
 ADD CONSTRAINT DF_ProdutosED_Quantidade DEFAULT (0)
 FOR Quantidade
go 

/*==============================================================*/
/* Table: ItensFaturasED                                        */
/*==============================================================*/
create table ItensFaturasED (
   Faturas              int                  not null,
   Produto              char(10)             not null,
   PreçoUnitario        money                not null,
   Quantidade           int                  not null,
   TotalItem            money                not null,
   constraint FK_ITENSFAT_CONSTITUI_FATURASE foreign key (Faturas)
      references FaturasED (IDFaturas),
   constraint FK_ITENSFAT_REFERIR_PRODUTOS foreign key (Produto)
      references ProdutosED (PCodigo)
)
go

/*==============================================================*/
/* Table: OpçõesEncomenda                                       */
/*==============================================================*/
create table OpçõesEncomenda (
   TaxaImposto          decimal(18,4)        null,
   CustoTransportePrimeiroLivro money                null,
   CustoTransporteRestanteLivros money                null
)
go

