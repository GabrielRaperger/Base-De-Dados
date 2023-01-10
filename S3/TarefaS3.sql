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
/*	ELIMINA��O DE TABELAS (DROP TABLE) SE EXISTIREM (IF OBJECT_ID)	*/
/*------------------------------------------------------------------*/
Use BDbEdi

IF OBJECT_ID('Descri��o_Encomendas','table') IS NOT NULL
   DROP TABLE Descri��o_Encomendas
IF OBJECT_ID('Encomendas','table') IS NOT NULL
   DROP TABLE Encomendas
IF OBJECT_ID('Empregados','table') IS NOT NULL
   DROP TABLE Empregados
IF OBJECT_ID('Clientes','table') IS NOT NULL
   DROP TABLE Clientes
IF OBJECT_ID('C�digosPostais','table') IS NOT NULL
   DROP TABLE C�digosPostais
IF OBJECT_ID('Pa�ses','table') IS NOT NULL
   DROP TABLE Pa�ses
IF OBJECT_ID('TipoClientes','table') IS NOT NULL
   DROP TABLE TipoClientes
IF OBJECT_ID('Produtos','table') IS NOT NULL
   DROP TABLE Produtos
IF OBJECT_ID('M�todosEnvio','table') IS NOT NULL
   DROP TABLE M�todosEnvio

/*---------------------------------------------------------*/
/*			CRIA��O DE TABELAS (CREATE TABLE)              */
/*---------------------------------------------------------*/


CREATE TABLE M�todosEnvio(
	IDM�todoEnvio int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	M�todoEnvio varchar(10) NOT NULL
)

CREATE TABLE Produtos(
	IDProduto		int		PRIMARY KEY		IDENTITY(1,1) NOT NULL,
	Designa��o		varchar(20)		NOT NULL,
	QuantidadeStock		int			NOT NULL,
	QuantidadeAlerta		smallint			NOT NULL,
	Pre�oUnitario		smallmoney		NOT NULL
)

CREATE TABLE TipoClientes(
	IDTipoCliente		int	 IDENTITY(1,1) CONSTRAINT PK_TipoClientes	PRIMARY KEY	 NOT NULL,
	TipoCliente		char(1)		NOT NULL,
	LimiteInferiorVendasAnuais		money
)

CREATE TABLE Pa�ses(
	IDPais		int		PRIMARY KEY		IDENTITY(1,1) NOT NULL,
	Pa�s		varchar(30)				NOT NULL,
	L�nguaOficial		varchar(30),
	N�meroHabitantes	int,
	IVA			tinyint		NOT NULL,
	IRC			tinyint		NOT NULL,
	IndicativoInternacional		varchar(6)
)

CREATE TABLE C�digosPostais(
	C�digoPostal		varchar(8) PRIMARY KEY NOT NULL,
	Localidade			varchar(50)		NOT NULL
)

CREATE TABLE Clientes(
	IDCliente	int		PRIMARY KEY		IDENTITY(1,1) NOT NULL,
	Nome		varchar(50) NOT NULL,
	TipoCliente		int		NOT NULL
	CONSTRAINT FK_Clientes_TipoClientes REFERENCES TipoClientes(IDTipoCliente),
	Endere�o		varchar(60)		NOT NULL,
	C�digoPostal	varchar(8)		NOT NULL
	CONSTRAINT FK_Clientes_C�digosPostais REFERENCES C�digosPostais(C�digoPostal),
	Pa�s		int			NOT NULL
	CONSTRAINT FK_Clientes_Pa�ses REFERENCES Pa�ses(IDPais),
	Telefone	varchar(12),
	Fax			varchar(12),
	Email		varchar(30),
	[URL]		varchar(30)
	
)
CREATE TABLE Empregados(
	IDEmpregado		int		PRIMARY KEY		IDENTITY(1,1) NOT NULL,
	Nome		varchar(50)			NOT NULL,
	Endere�o	varchar(60)			NOT NULL,
	C�digoPostal		varchar(8)		NOT NULL
	CONSTRAINT FK_Empregados_C�digosPostais REFERENCES C�digosPostais(C�digoPostal),
	Pa�s		int			NOT NULL
	CONSTRAINT FK_Empregados_Pa�ses REFERENCES Pa�ses(IDPais),
	Telefone	varchar(12),
	Extens�o	smallint,
	Email		varchar(40),
)

CREATE TABLE Encomendas(
	N�meroEncomenda		int		IDENTITY(1,1) NOT NULL,
	AnoEncomenda		smallint	NOT NULL	default		year(getdate()),
	DataEncomenda		datetime	NOT NULL	default		getdate(),
	DataEnvio			datetime	NOT NULL,
	Estado		char	NOT NULL	default	'P' check(Estado in('P', 'D')),
	Cliente		int		NOT NULL
	CONSTRAINT FK_Encomendas_Clientes REFERENCES Clientes(IDCliente),
	Empregado	int		NOT NULL
	CONSTRAINT FK_Encomendas_Empregados REFERENCES Empregados(IDEmpregado),
	M�todoEnvio	int		NOT NULL
	CONSTRAINT FK_Encomendas_M�todosEnvio REFERENCES M�todosEnvio(IDM�todoEnvio),
	CONSTRAINT PK_Encomendas PRIMARY KEY (N�meroEncomenda, AnoEncomenda)
	
)

CREATE TABLE Descri��o_Encomendas(
	N�meroEncomenda		int		NOT NULL,
	AnoEncomenda	smallint	NOT NULL,
	IDProduto		int		NOT NULL
	CONSTRAINT FK_Descri��o_Encomendas_Produtos REFERENCES Produtos(IDProduto),
	Quantidade		smallint	NOT NULL,
	Pre�o			smallmoney	NOT NULL,
	Desconto		tinyint		NOT	NULL default 0,
	PRIMARY KEY(N�meroEncomenda, AnoEncomenda, IDProduto)
)

ALTER TABLE Descri��o_Encomendas
	ADD CONSTRAINT FK_Descri��o_Encomendas_Encomendas FOREIGN KEY(N�meroEncomenda, AnoEncomenda) 
	REFERENCES Encomendas(N�meroEncomenda,AnoEncomenda);

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
