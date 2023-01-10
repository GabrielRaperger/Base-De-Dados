--USE Editora
IF OBJECT_ID('ItensFacturasED','U') IS NOT NULL
   DROP TABLE ItensFacturasED
IF OBJECT_ID('ProdutosED','U') IS NOT NULL
   DROP TABLE ProdutosED
IF OBJECT_ID('FacturasED','U') IS NOT NULL
   DROP TABLE FacturasED
IF OBJECT_ID('ClientesED','U') IS NOT NULL
   DROP TABLE ClientesED
IF OBJECT_ID('Províncias','U') IS NOT NULL
   DROP TABLE Províncias
IF OBJECT_ID('OpçõesEncomenda','U') IS NOT NULL
   DROP TABLE OpçõesEncomenda


CREATE TABLE Províncias(	
	Código			char(2) 		NOT NULL 
	   CONSTRAINT PK_Províncias PRIMARY KEY,
	Província		varchar(20) 		NOT NULL)
 
CREATE TABLE ClientesED(
	IDCliente		int IDENTITY(1,1)	NOT NULL
	   CONSTRAINT PK_ClientesED PRIMARY KEY,
	Nome			varchar(100)		NOT NULL,
	Endereço		varchar(50)		NOT NULL,
	Localidade		varchar(20)		NOT NULL,
	Província		char(2)			NOT NULL
	   CONSTRAINT FK_ClientesED_Províncias REFERENCES Províncias(Código),
	CódigoPostal	char(8)				NOT NULL)

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
	Código			char(10)		NOT NULL 
	   CONSTRAINT PK_ProdutosED PRIMARY KEY,
	Designação		varchar(50)		NOT NULL,
	PreçoUnitário		money			NOT NULL,
	Quantidade		int			NOT NULL 
	  CONSTRAINT DF_ProdutosED_Quantidade DEFAULT (0))

CREATE TABLE ItensFacturasED(
	Factura 		int 			NOT NULL,
	Produto 		char(10) 		NOT NULL,
	PreçoUnitário 		money 			NOT NULL,
	Quantidade 		int 			NOT NULL,
	TotalItem 		money 			NOT NULL,
	   CONSTRAINT PK_ItensFacturasED PRIMARY KEY (Factura, Produto),
	   CONSTRAINT FK_ItensFacturasED_FacturasED FOREIGN KEY (Factura) REFERENCES FacturasED (IDFactura),
	   CONSTRAINT FK_ItensFacturasED_Produtos FOREIGN KEY (Produto) REFERENCES ProdutosED (Código))

CREATE TABLE OpçõesEncomenda(
	TaxaImposto					decimal(18, 4)	NOT NULL,
	CustoTransportePrimeiroLivro	money		NOT NULL,
	CustoTransporteRestantesLivros	money		NOT NULL)


