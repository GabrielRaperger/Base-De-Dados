/*2.1
SELECT N�meroFactura,Nome,DataVencimentoFactura,TotalFactura - Pagamento - Cr�dito AS MontanteEmDivida
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
WHERE TotalFactura - Pagamento - Cr�dito > 0
ORDER BY DataVencimentoFactura DESC

2.2
SELECT TOP 3 N�meroFactura,Nome,DataVencimentoFactura,TotalFactura,Pagamento,Cr�dito, TotalFactura - Pagamento - Cr�dito AS MontanteEmDivida,Descri��o
FROM Fornecedores INNER JOIN Facturas
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor INNER JOIN Condi��esPagamento
		ON Facturas.Condi��oPagamento = Condi��esPagamento.IDCondi��o
WHERE TotalFactura - Pagamento - Cr�dito = 0
ORDER BY TotalFactura DESC

2.3
SELECT N�meroFactura,Nome,Descri��oItem,DataVencimentoFactura,TotalFactura,Pagamento,Cr�dito, TotalFactura - Pagamento - Cr�dito AS MontanteEmDivida, Descri��o
FROM Fornecedores INNER JOIN Facturas
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor INNER JOIN ItensFactura
		ON Facturas.IDFactura = ItensFactura.IDFactura INNER JOIN Condi��esPagamento
		ON Facturas.Condi��oPagamento = Condi��esPagamento.IDCondi��o
WHERE Descri��o = '60 dias liquido'
ORDER BY N�meroFactura

2.4
SELECT TOP 3 N�meroFactura,DataFactura,TotalFactura,DataPagamento, Nome
FROM Fornecedores INNER JOIN Facturas
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor
WHERE DataPagamento < '2015-01-01'
ORDER BY TotalFactura DESC

2.6
SELECT Descri��o,N�meroFactura,Descri��oItem, MontanteItem
FROM ItensFactura INNER JOIN FacturaS
	ON ItensFactura.IDFactura = Facturas.IDFactura INNER JOIN ContasBalan�o
		ON ItensFactura.ContaBalan�o = ContasBalan�o.N�meroConta
WHERE ContasBalan�o.Descri��o LIKE '%d�vida%'
ORDER BY MontanteItem DESC

2.7
SELECT Nome, Localidade, N�meroFactura, DataFactura, TotalFactura, TotalFactura / 1.23 AS BaseDeIncidenciaIVA,  TotalFactura -TotalFactura / 1.23
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
WHERE Localidade != 'Lisboa'
ORDER BY Nome, TotalFactura DESC

2.8
SELECT N�meroFactura,DataFactura,TotalFactura,TotalFactura - Pagamento - Cr�dito AS MontanteEmDivida, Descri��o, �NomeContacto + ', ' + PNoneContacto, Telefone
FROM Facturas INNER JOIN Fornecedores
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor INNER JOIN Condi��esPagamento
	ON Facturas.Condi��oPagamento = Condi��esPagamento.IDCondi��o
WHERE TotalFactura - Pagamento - Cr�dito > 0

2.9
SELECT DISTINCT	 Nome, Endere�o +', '+ C�digoPostal +', '+ Localidade AS MoradaFonecedor, Telefone, Descri��o
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor INNER JOIN ItensFactura
		ON Facturas.IDFactura = ItensFactura.IDFactura INNER JOIN ContasBalan�o
			ON ItensFactura.ContaBalan�o = ContasBalan�o.N�meroConta
WHERE ContasBalan�o.Descri��o IN ('Invent�rio', 'Fretes')
ORDER BY Nome*/
