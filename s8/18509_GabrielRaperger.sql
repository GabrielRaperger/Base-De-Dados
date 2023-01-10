
/*2.1
SELECT 'Ap�s' + ' ' + '1/1/2006' AS [Data Inicial De Pesquisa] , COUNT(*) AS [Quantidade de Facturas], 
MAX (TotalFactura) AS [Factras Com Maior Montante], MIN (TotalFactura) AS [Factras Com Menor Montante]
FROM Facturas

2.2
SELECT COUNT(*) AS [Quantidade de Facturas], COUNT(DISTINCT Fornecedor) AS [Quantidade de Facturas],
AVG (TotalFactura) AS [Montante M�dio Das Facturas], SUM (TotalFactura) AS [Total Montante Das Facturas]
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
SELECT Localidade, C�digoPostal, COUNT(*) AS [N�mero De Facturas], AVG (TotalFactura) AS [Montante M�dio Das Facturas]
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
GROUP BY Localidade,C�digoPostal
HAVING   COUNT(*) > 1
ORDER BY Localidade + C�digoPostal

2.6
SELECT Nome, Telefone, SUM(TotalFactura - Pagamento - Cr�dito) AS [Montante Em Divida]
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
	WHERE TotalFactura - Pagamento - Cr�dito > 0 
GROUP BY Nome, Telefone
ORDER BY Nome  DESC

2.7
 SELECT DATEPART(YEAR, DataVencimentoFactura) AS Ano, DATEPART(MONTH, DataVencimentoFactura) AS M�s, COUNT(IDFactura) AS [N�mero de Facturas], SUM(TotalFactura) AS [Total do montnate das faturas]
FROM Facturas
GROUP BY DATEPART(YEAR, DataVen
cimentoFactura), DATEPART(MONTH, DataVencimentoFactura)
ORDER BY Ano ASC, M�s ASC;

2.8
select Condi��esPagamento.Descri��o AS [Condi��o Pagamento], SUM(MontanteItem) AS [Montante total dos itens],
AVG(MontanteItem) AS [Montante m�dio dos itens], MAX(MontanteItem) AS [Montante m�ximo dos itens], MIN(MontanteItem) AS [Montante m�nimo dos itens]
FROM Facturas inner join Condi��esPagamento
	ON Facturas.Condi��oPagamento = Condi��esPagamento.IDCondi��o inner join ItensFactura
		ON Facturas.IDFactura = ItensFactura.IDFactura
GROUP BY Condi��esPagamento.Descri��o
HAVING COUNT(MontanteItem) > 1
ORDER BY [Condi��o Pagamento] ASC

2.9
SELECT DataInicial AS [Data de in�cio do projecto], COUNT(Projectos.IDProjecto) AS [N�mero de projectos]
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
