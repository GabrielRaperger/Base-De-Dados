--USE Editora
IF OBJECT_ID('ItensFacturasED','U') IS NOT NULL
   DROP TABLE ItensFacturasED
IF OBJECT_ID('ProdutosED','U') IS NOT NULL
   DROP TABLE ProdutosED
IF OBJECT_ID('FacturasED','U') IS NOT NULL
   DROP TABLE FacturasED
IF OBJECT_ID('ClientesED','U') IS NOT NULL
   DROP TABLE ClientesED
IF OBJECT_ID('Prov�ncias','U') IS NOT NULL
   DROP TABLE Prov�ncias
IF OBJECT_ID('Op��esEncomenda','U') IS NOT NULL
   DROP TABLE Op��esEncomenda


CREATE TABLE Prov�ncias(	
	C�digo			char(2) 		NOT NULL 
	   CONSTRAINT PK_Prov�ncias PRIMARY KEY,
	Prov�ncia		varchar(20) 		NOT NULL)
 
CREATE TABLE ClientesED(
	IDCliente		int IDENTITY(1,1)	NOT NULL
	   CONSTRAINT PK_ClientesED PRIMARY KEY,
	Nome			varchar(100)		NOT NULL,
	Endere�o		varchar(50)		NOT NULL,
	Localidade		varchar(20)		NOT NULL,
	Prov�ncia		char(2)			NOT NULL
	   CONSTRAINT FK_ClientesED_Prov�ncias REFERENCES Prov�ncias(C�digo),
	C�digoPostal	char(8)				NOT NULL)

CREATE TABLE FacturasED(
	IDFactura		int IDENTITY(1,1)	NOT NULL   
	   CONSTRAINT PK_FacturasED PRIMARY KEY,
	Cliente			int			NOT NULL
	   CONSTRAINT FK_FacturasED_ClientesED REFERENCES ClientesED(IDCliente),
	DataFactura		datetime		NOT NULL,
	TotalProduto		money			NOT NULL,
	Imposto			money			NOT NULL,
	Transporte		money			NOT NULL,
	TotalFactura		money			NOT NULL)

CREATE TABLE ProdutosED(
	C�digo			char(10)		NOT NULL 
	   CONSTRAINT PK_ProdutosED PRIMARY KEY,
	Designa��o		varchar(50)		NOT NULL,
	Pre�oUnit�rio		money			NOT NULL,
	Quantidade		int			NOT NULL 
	  CONSTRAINT DF_ProdutosED_Quantidade DEFAULT (0))

CREATE TABLE ItensFacturasED(
	Factura 		int 			NOT NULL,
	Produto 		char(10) 		NOT NULL,
	Pre�oUnit�rio 		money 			NOT NULL,
	Quantidade 		int 			NOT NULL,
	TotalItem 		money 			NOT NULL,
	   CONSTRAINT PK_ItensFacturasED PRIMARY KEY (Factura, Produto),
	   CONSTRAINT FK_ItensFacturasED_FacturasED FOREIGN KEY (Factura) REFERENCES FacturasED (IDFactura),
	   CONSTRAINT FK_ItensFacturasED_Produtos FOREIGN KEY (Produto) REFERENCES ProdutosED (C�digo))

CREATE TABLE Op��esEncomenda(
	TaxaImposto					decimal(18, 4)	NOT NULL,
	CustoTransportePrimeiroLivro	money		NOT NULL,
	CustoTransporteRestantesLivros	money		NOT NULL)


