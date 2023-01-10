-- USE Pagamentos

CREATE TABLE CondiçõesPagamento(
	IDCondição            		INT           	NOT NULL CONSTRAINT PK_CondiçõesPagamento PRIMARY KEY,
	Descrição			VARCHAR(50)   	NOT NULL,
	PrazoPagamento         		SMALLINT      	NOT NULL)

CREATE TABLE ContasBalanço(
	NúmeroConta           		INT           	NOT NULL CONSTRAINT PK_ContasBalanço PRIMARY KEY,
	Descrição              		VARCHAR(50)   	NOT NULL)

CREATE TABLE Fornecedores(
	IDFornecedor          		INT           	NOT NULL CONSTRAINT PK_Fornecedores PRIMARY KEY,
	Nome                   		VARCHAR(50)   	NOT NULL,
	Endereço               		VARCHAR(50)   	NULL,
	Localidade             		VARCHAR(50)   	NOT NULL,
	CódigoPostal           		VARCHAR(20)   	NOT NULL,
	Telefone               		VARCHAR(50)   	NULL,
	PNoneContacto          		VARCHAR(50)   	NULL,
	ÚNomeContacto          		VARCHAR(50)   	NULL,
	CondiçãoPagamentoPredefinida  	INT    	      	NOT NULL
	               					CONSTRAINT FK_Fornecedores_CondiçõesPagamento REFERENCES CondiçõesPagamento(IDCondição),
	ContaBalançoPredefinida       	INT    		NOT NULL
                       					CONSTRAINT FK_Fornecedores_ContasBalanço REFERENCES ContasBalanço(NúmeroConta))

CREATE TABLE Facturas(
	IDFactura             		INT           	NOT NULL CONSTRAINT PK_Facturas  PRIMARY KEY,
	Fornecedor             		INT           	NOT NULL CONSTRAINT FK_Facturas_Fornecedores REFERENCES Fornecedores(IDFornecedor),
	NúmeroFactura         		VARCHAR(50)   	NOT NULL,
	DataFactura            		SMALLDATETIME 	NOT NULL,
	TotalFactura           		MONEY         	NOT NULL,
	Pagamento              		MONEY         	NOT NULL DEFAULT 0,
	Crédito                		MONEY         	NOT NULL DEFAULT 0,
	CondiçãoPagamento      		INT           	NOT NULL
                       					CONSTRAINT FK_Facturas_CondiçõesPagamento REFERENCES CondiçõesPagamento(IDCondição),
	DataVencimentoFactura  		SMALLDATETIME 	NOT NULL,
	DataPagamento          		SMALLDATETIME 	NULL)

CREATE TABLE ItensFactura(
	IDFactura             		INT           	NOT NULL
                       					CONSTRAINT FK_ItensFactura_Facturas REFERENCES Facturas(IDFactura),
	SequenciaItem          		SMALLINT      	NOT NULL,
	ContaBalanço           		INT           	NOT NULL
                       					CONSTRAINT FK_ItensFactura_ContasBalanço REFERENCES ContasBalanço(NúmeroConta),
	MontanteItem           		MONEY         	NOT NULL,
	DescriçãoItem          		VARCHAR(100) 	NOT NULL,
	CONSTRAINT PK_ItensFactura  PRIMARY KEY (IDFactura, SequenciaItem))