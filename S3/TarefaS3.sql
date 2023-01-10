/*------------------------------------------------------------------*/
/*				18509 GABRIEL CONSTANTINO RAPERGER					*/
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
/*				18509 GABRIEL CONSTANTINO RAPERGER					*/
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
/*				18509 GABRIEL CONSTANTINO RAPERGER					*/
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/*	ELIMINAÇÃO DE TABELAS (DROP TABLE) SE EXISTIREM (IF OBJECT_ID)	*/
/*------------------------------------------------------------------*/
Use BDbEdi

IF OBJECT_ID('Descrição_Encomendas','table') IS NOT NULL
   DROP TABLE Descrição_Encomendas
IF OBJECT_ID('Encomendas','table') IS NOT NULL
   DROP TABLE Encomendas
IF OBJECT_ID('Empregados','table') IS NOT NULL
   DROP TABLE Empregados
IF OBJECT_ID('Clientes','table') IS NOT NULL
   DROP TABLE Clientes
IF OBJECT_ID('CódigosPostais','table') IS NOT NULL
   DROP TABLE CódigosPostais
IF OBJECT_ID('Países','table') IS NOT NULL
   DROP TABLE Países
IF OBJECT_ID('TipoClientes','table') IS NOT NULL
   DROP TABLE TipoClientes
IF OBJECT_ID('Produtos','table') IS NOT NULL
   DROP TABLE Produtos
IF OBJECT_ID('MétodosEnvio','table') IS NOT NULL
   DROP TABLE MétodosEnvio

/*---------------------------------------------------------*/
/*			CRIAÇÃO DE TABELAS (CREATE TABLE)              */
/*---------------------------------------------------------*/


CREATE TABLE MétodosEnvio(
	IDMétodoEnvio int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	MétodoEnvio varchar(10) NOT NULL
)

CREATE TABLE Produtos(
	IDProduto		int		PRIMARY KEY		IDENTITY(1,1) NOT NULL,
	Designação		varchar(20)		NOT NULL,
	QuantidadeStock		int			NOT NULL,
	QuantidadeAlerta		smallint			NOT NULL,
	PreçoUnitario		smallmoney		NOT NULL
)

CREATE TABLE TipoClientes(
	IDTipoCliente		int	 IDENTITY(1,1) CONSTRAINT PK_TipoClientes	PRIMARY KEY	 NOT NULL,
	TipoCliente		char(1)		NOT NULL,
	LimiteInferiorVendasAnuais		money
)

CREATE TABLE Países(
	IDPais		int		PRIMARY KEY		IDENTITY(1,1) NOT NULL,
	País		varchar(30)				NOT NULL,
	LínguaOficial		varchar(30),
	NúmeroHabitantes	int,
	IVA			tinyint		NOT NULL,
	IRC			tinyint		NOT NULL,
	IndicativoInternacional		varchar(6)
)

CREATE TABLE CódigosPostais(
	CódigoPostal		varchar(8) PRIMARY KEY NOT NULL,
	Localidade			varchar(50)		NOT NULL
)

CREATE TABLE Clientes(
	IDCliente	int		PRIMARY KEY		IDENTITY(1,1) NOT NULL,
	Nome		varchar(50) NOT NULL,
	TipoCliente		int		NOT NULL
	CONSTRAINT FK_Clientes_TipoClientes REFERENCES TipoClientes(IDTipoCliente),
	Endereço		varchar(60)		NOT NULL,
	CódigoPostal	varchar(8)		NOT NULL
	CONSTRAINT FK_Clientes_CódigosPostais REFERENCES CódigosPostais(CódigoPostal),
	País		int			NOT NULL
	CONSTRAINT FK_Clientes_Países REFERENCES Países(IDPais),
	Telefone	varchar(12),
	Fax			varchar(12),
	Email		varchar(30),
	[URL]		varchar(30)
	
)
CREATE TABLE Empregados(
	IDEmpregado		int		PRIMARY KEY		IDENTITY(1,1) NOT NULL,
	Nome		varchar(50)			NOT NULL,
	Endereço	varchar(60)			NOT NULL,
	CódigoPostal		varchar(8)		NOT NULL
	CONSTRAINT FK_Empregados_CódigosPostais REFERENCES CódigosPostais(CódigoPostal),
	País		int			NOT NULL
	CONSTRAINT FK_Empregados_Países REFERENCES Países(IDPais),
	Telefone	varchar(12),
	Extensão	smallint,
	Email		varchar(40),
)

CREATE TABLE Encomendas(
	NúmeroEncomenda		int		IDENTITY(1,1) NOT NULL,
	AnoEncomenda		smallint	NOT NULL	default		year(getdate()),
	DataEncomenda		datetime	NOT NULL	default		getdate(),
	DataEnvio			datetime	NOT NULL,
	Estado		char	NOT NULL	default	'P' check(Estado in('P', 'D')),
	Cliente		int		NOT NULL
	CONSTRAINT FK_Encomendas_Clientes REFERENCES Clientes(IDCliente),
	Empregado	int		NOT NULL
	CONSTRAINT FK_Encomendas_Empregados REFERENCES Empregados(IDEmpregado),
	MétodoEnvio	int		NOT NULL
	CONSTRAINT FK_Encomendas_MétodosEnvio REFERENCES MétodosEnvio(IDMétodoEnvio),
	CONSTRAINT PK_Encomendas PRIMARY KEY (NúmeroEncomenda, AnoEncomenda)
	
)

CREATE TABLE Descrição_Encomendas(
	NúmeroEncomenda		int		NOT NULL,
	AnoEncomenda	smallint	NOT NULL,
	IDProduto		int		NOT NULL
	CONSTRAINT FK_Descrição_Encomendas_Produtos REFERENCES Produtos(IDProduto),
	Quantidade		smallint	NOT NULL,
	Preço			smallmoney	NOT NULL,
	Desconto		tinyint		NOT	NULL default 0,
	PRIMARY KEY(NúmeroEncomenda, AnoEncomenda, IDProduto)
)

ALTER TABLE Descrição_Encomendas
	ADD CONSTRAINT FK_Descrição_Encomendas_Encomendas FOREIGN KEY(NúmeroEncomenda, AnoEncomenda) 
	REFERENCES Encomendas(NúmeroEncomenda,AnoEncomenda);

ALTER TABLE Empregados
ADD BI varchar(30)  UNIQUE NOT NULL;

ALTER TABLE Clientes
	DROP CONSTRAINT FK_Clientes_TipoClientes;

ALTER TABLE TipoClientes
	DROP CONSTRAINT PK_TipoClientes;

ALTER TABLE TipoClientes
	DROP COLUMN IDTipoCliente;

ALTER TABLE TipoClientes
	ADD CONSTRAINT PK_TipoClientes PRIMARY KEY(TipoCliente);

ALTER TABLE Clientes
	ALTER COLUMN TipoCliente char(1) NOT NULL;

ALTER TABLE Clientes
	ADD CONSTRAINT FK_Clientes_TipoClientes FOREIGN KEY (TipoCliente) REFERENCES TipoClientes(TipoCliente);
