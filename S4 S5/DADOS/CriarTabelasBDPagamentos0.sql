-- USE Pagamentos

CREATE TABLE Condi��esPagamento(
	IDCondi��o            		INT           	NOT NULL CONSTRAINT PK_Condi��esPagamento PRIMARY KEY,
	Descri��o			VARCHAR(50)   	NOT NULL,
	PrazoPagamento         		SMALLINT      	NOT NULL)

CREATE TABLE ContasBalan�o(
	N�meroConta           		INT           	NOT NULL CONSTRAINT PK_ContasBalan�o PRIMARY KEY,
	Descri��o              		VARCHAR(50)   	NOT NULL)

CREATE TABLE Fornecedores(
	IDFornecedor          		INT           	NOT NULL CONSTRAINT PK_Fornecedores PRIMARY KEY,
	Nome                   		VARCHAR(50)   	NOT NULL,
	Endere�o               		VARCHAR(50)   	NULL,
	Localidade             		VARCHAR(50)   	NOT NULL,
	C�digoPostal           		VARCHAR(20)   	NOT NULL,
	Telefone               		VARCHAR(50)   	NULL,
	PNoneContacto          		VARCHAR(50)   	NULL,
	�NomeContacto          		VARCHAR(50)   	NULL,
	Condi��oPagamentoPredefinida  	INT    	      	NOT NULL
	               					CONSTRAINT FK_Fornecedores_Condi��esPagamento REFERENCES Condi��esPagamento(IDCondi��o),
	ContaBalan�oPredefinida       	INT    		NOT NULL
                       					CONSTRAINT FK_Fornecedores_ContasBalan�o REFERENCES ContasBalan�o(N�meroConta))

CREATE TABLE Facturas(
	IDFactura             		INT           	NOT NULL CONSTRAINT PK_Facturas  PRIMARY KEY,
	Fornecedor             		INT           	NOT NULL CONSTRAINT FK_Facturas_Fornecedores REFERENCES Fornecedores(IDFornecedor),
	N�meroFactura         		VARCHAR(50)   	NOT NULL,
	DataFactura            		SMALLDATETIME 	NOT NULL,
	TotalFactura           		MONEY         	NOT NULL,
	Pagamento              		MONEY         	NOT NULL DEFAULT 0,
	Cr�dito                		MONEY         	NOT NULL DEFAULT 0,
	Condi��oPagamento      		INT           	NOT NULL
                       					CONSTRAINT FK_Facturas_Condi��esPagamento REFERENCES Condi��esPagamento(IDCondi��o),
	DataVencimentoFactura  		SMALLDATETIME 	NOT NULL,
	DataPagamento          		SMALLDATETIME 	NULL)

CREATE TABLE ItensFactura(
	IDFactura             		INT           	NOT NULL
                       					CONSTRAINT FK_ItensFactura_Facturas REFERENCES Facturas(IDFactura),
	SequenciaItem          		SMALLINT      	NOT NULL,
	ContaBalan�o           		INT           	NOT NULL
                       					CONSTRAINT FK_ItensFactura_ContasBalan�o REFERENCES ContasBalan�o(N�meroConta),
	MontanteItem           		MONEY         	NOT NULL,
	Descri��oItem          		VARCHAR(100) 	NOT NULL,
	CONSTRAINT PK_ItensFactura  PRIMARY KEY (IDFactura, SequenciaItem))