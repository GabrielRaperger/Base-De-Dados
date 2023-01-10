-- USE Pagamentos

-- Lista drops

-- Lista creats

-- nomes das tabelas (ordenadas por ordem alfab�tica), campos e tipos de dados


Condi��esPagamento
	IDCondi��o            		INT           	
	Descri��o			VARCHAR(50)   
	PrazoPagamento         		SMALLINT      	

ContasBalan�o
	N�meroConta           		INT           	
	Descri��o              		VARCHAR(50)

Facturas
	IDFactura             		INT           	
	Fornecedor             		INT           	
	N�meroFactura         		VARCHAR(50)   	
	DataFactura            		SMALLDATETIME 	
	TotalFactura           		MONEY         	
	Pagamento              		MONEY         	
	Cr�dito                		MONEY         	
	Condi��oPagamento      		INT           	           					
	DataVencimentoFactura  		SMALLDATETIME 	
	DataPagamento          		SMALLDATETIME 	


Fornecedores
	IDFornecedor          		INT           	
	Nome                   		VARCHAR(50)   	
	Endere�o               		VARCHAR(50)   	
	Localidade             		VARCHAR(50)   	
	C�digoPostal           		VARCHAR(20)   	
	Telefone               		VARCHAR(50)   	
	PNoneContacto          		VARCHAR(50)   	
	�NomeContacto          		VARCHAR(50)   	
	Condi��oPagamentoPredefinida  	INT    	      	               					
	ContaBalan�oPredefinida       	INT    		
                       					

ItensFactura
	IDFactura             		INT           	                  					
	SequenciaItem          		SMALLINT      	
	ContaBalan�o           		INT           	               					
	MontanteItem           		MONEY         	
	Descri��oItem          		VARCHAR(100) 	