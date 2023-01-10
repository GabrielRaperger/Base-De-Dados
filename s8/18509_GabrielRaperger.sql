
/*2.1
SELECT 'Após' + ' ' + '1/1/2006' AS [Data Inicial De Pesquisa] , COUNT(*) AS [Quantidade de Facturas], 
MAX (TotalFactura) AS [Factras Com Maior Montante], MIN (TotalFactura) AS [Factras Com Menor Montante]
FROM Facturas

2.2
SELECT COUNT(*) AS [Quantidade de Facturas], COUNT(DISTINCT Fornecedor) AS [Quantidade de Facturas],
AVG (TotalFactura) AS [Montante Médio Das Facturas], SUM (TotalFactura) AS [Total Montante Das Facturas]
FROM Facturas

2.3
SELECT Fornecedor, COUNT(*) AS [Quantidade de Facturas]
FROM Facturas
GROUP BY Fornecedor

2.4
SELECT Localidade, Nome, COUNT(*) AS [Quantidade de Facturas]
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
GROUP BY Localidade, Nome
ORDER BY [Quantidade de Facturas] DESC

2.5
SELECT Localidade, CódigoPostal, COUNT(*) AS [Número De Facturas], AVG (TotalFactura) AS [Montante Médio Das Facturas]
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
GROUP BY Localidade,CódigoPostal
HAVING   COUNT(*) > 1
ORDER BY Localidade + CódigoPostal

2.6
SELECT Nome, Telefone, SUM(TotalFactura - Pagamento - Crédito) AS [Montante Em Divida]
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
	WHERE TotalFactura - Pagamento - Crédito > 0 
GROUP BY Nome, Telefone
ORDER BY Nome  DESC

2.7
 SELECT DATEPART(YEAR, DataVencimentoFactura) AS Ano, DATEPART(MONTH, DataVencimentoFactura) AS Mês, COUNT(IDFactura) AS [Número de Facturas], SUM(TotalFactura) AS [Total do montnate das faturas]
FROM Facturas
GROUP BY DATEPART(YEAR, DataVen
cimentoFactura), DATEPART(MONTH, DataVencimentoFactura)
ORDER BY Ano ASC, Mês ASC;

2.8
select CondiçõesPagamento.Descrição AS [Condição Pagamento], SUM(MontanteItem) AS [Montante total dos itens],
AVG(MontanteItem) AS [Montante médio dos itens], MAX(MontanteItem) AS [Montante máximo dos itens], MIN(MontanteItem) AS [Montante mínimo dos itens]
FROM Facturas inner join CondiçõesPagamento
	ON Facturas.CondiçãoPagamento = CondiçõesPagamento.IDCondição inner join ItensFactura
		ON Facturas.IDFactura = ItensFactura.IDFactura
GROUP BY CondiçõesPagamento.Descrição
HAVING COUNT(MontanteItem) > 1
ORDER BY [Condição Pagamento] ASC

2.9
SELECT DataInicial AS [Data de início do projecto], COUNT(Projectos.IDProjecto) AS [Número de projectos]
FROM Projectos INNER JOIN Projectos_Colaboradores
	ON Projectos.IDProjecto = Projectos_Colaboradores.Projecto
GROUP BY DataInicial
ORDER BY DataInicial DESC

2.10
SELECT UNome + ', ' + PNome AS [Colaborador], COUNT(Projectos.IDProjecto)
FROM Projectos inner join Projectos_Colaboradores
ON Projectos.IDProjecto = Projectos_Colaboradores.Projecto
FULL OUTER JOIN Colaboradores
on Projectos_Colaboradores.Colaborador = Colaboradores.IDColaborador
GROUP BY PNome, UNome
ORDER BY UNome ASC*/
