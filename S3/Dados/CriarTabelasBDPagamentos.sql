-- USE Pagamentos

-- Lista drops

-- Lista creats

-- nomes das tabelas (ordenadas por ordem alfabética), campos e tipos de dados


CondiçõesPagamento
	IDCondição            		INT           	
	Descrição			VARCHAR(50)   
	PrazoPagamento         		SMALLINT      	

ContasBalanço
	NúmeroConta           		INT           	
	Descrição              		VARCHAR(50)

Facturas
	IDFactura             		INT           	
	Fornecedor             		INT           	
	NúmeroFactura         		VARCHAR(50)   	
	DataFactura            		SMALLDATETIME 	
	TotalFactura           		MONEY         	
	Pagamento              		MONEY         	
	Crédito                		MONEY         	
	CondiçãoPagamento      		INT           	           					
	DataVencimentoFactura  		SMALLDATETIME 	
	DataPagamento          		SMALLDATETIME 	


Fornecedores
	IDFornecedor          		INT           	
	Nome                   		VARCHAR(50)   	
	Endereço               		VARCHAR(50)   	
	Localidade             		VARCHAR(50)   	
	CódigoPostal           		VARCHAR(20)   	
	Telefone               		VARCHAR(50)   	
	PNoneContacto          		VARCHAR(50)   	
	ÚNomeContacto          		VARCHAR(50)   	
	CondiçãoPagamentoPredefinida  	INT    	      	               					
	ContaBalançoPredefinida       	INT    		
                       					

ItensFactura
	IDFactura             		INT           	                  					
	SequenciaItem          		SMALLINT      	
	ContaBalanço           		INT           	               					
	MontanteItem           		MONEY         	
	DescriçãoItem          		VARCHAR(100) 	