/*2.1
SELECT NúmeroFactura,Nome,DataVencimentoFactura,TotalFactura - Pagamento - Crédito AS MontanteEmDivida
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
WHERE TotalFactura - Pagamento - Crédito > 0
ORDER BY DataVencimentoFactura DESC

2.2
SELECT TOP 3 NúmeroFactura,Nome,DataVencimentoFactura,TotalFactura,Pagamento,Crédito, TotalFactura - Pagamento - Crédito AS MontanteEmDivida,Descrição
FROM Fornecedores INNER JOIN Facturas
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor INNER JOIN CondiçõesPagamento
		ON Facturas.CondiçãoPagamento = CondiçõesPagamento.IDCondição
WHERE TotalFactura - Pagamento - Crédito = 0
ORDER BY TotalFactura DESC

2.3
SELECT NúmeroFactura,Nome,DescriçãoItem,DataVencimentoFactura,TotalFactura,Pagamento,Crédito, TotalFactura - Pagamento - Crédito AS MontanteEmDivida, Descrição
FROM Fornecedores INNER JOIN Facturas
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor INNER JOIN ItensFactura
		ON Facturas.IDFactura = ItensFactura.IDFactura INNER JOIN CondiçõesPagamento
		ON Facturas.CondiçãoPagamento = CondiçõesPagamento.IDCondição
WHERE Descrição = '60 dias liquido'
ORDER BY NúmeroFactura

2.4
SELECT TOP 3 NúmeroFactura,DataFactura,TotalFactura,DataPagamento, Nome
FROM Fornecedores INNER JOIN Facturas
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor
WHERE DataPagamento < '2015-01-01'
ORDER BY TotalFactura DESC

2.6
SELECT Descrição,NúmeroFactura,DescriçãoItem, MontanteItem
FROM ItensFactura INNER JOIN FacturaS
	ON ItensFactura.IDFactura = Facturas.IDFactura INNER JOIN ContasBalanço
		ON ItensFactura.ContaBalanço = ContasBalanço.NúmeroConta
WHERE ContasBalanço.Descrição LIKE '%dívida%'
ORDER BY MontanteItem DESC

2.7
SELECT Nome, Localidade, NúmeroFactura, DataFactura, TotalFactura, TotalFactura / 1.23 AS BaseDeIncidenciaIVA,  TotalFactura -TotalFactura / 1.23
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
WHERE Localidade != 'Lisboa'
ORDER BY Nome, TotalFactura DESC

2.8
SELECT NúmeroFactura,DataFactura,TotalFactura,TotalFactura - Pagamento - Crédito AS MontanteEmDivida, Descrição, ÚNomeContacto + ', ' + PNoneContacto, Telefone
FROM Facturas INNER JOIN Fornecedores
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor INNER JOIN CondiçõesPagamento
	ON Facturas.CondiçãoPagamento = CondiçõesPagamento.IDCondição
WHERE TotalFactura - Pagamento - Crédito > 0

2.9
SELECT DISTINCT	 Nome, Endereço +', '+ CódigoPostal +', '+ Localidade AS MoradaFonecedor, Telefone, Descrição
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor INNER JOIN ItensFactura
		ON Facturas.IDFactura = ItensFactura.IDFactura INNER JOIN ContasBalanço
			ON ItensFactura.ContaBalanço = ContasBalanço.NúmeroConta
WHERE ContasBalanço.Descrição IN ('Inventário', 'Fretes')
ORDER BY Nome*/
