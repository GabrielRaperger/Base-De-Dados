/*2.1
SELECT IDFornecedor, Nome, Localidade
FROM Fornecedores
WHERE NOT EXISTS (SELECT  *FROM Facturas WHERE Fornecedor = Fornecedores.IDFornecedor)

2.2
Select distinct IDFornecedor, Nome, Localidade
from Fornecedores
left JOIN Facturas on
Fornecedor=Fornecedores.IDFornecedor
where IDFactura is null

2.3
select NúmeroFactura, DataFactura, TotalFactura, (TotalFactura - Pagamento - Crédito) as [Montante em dívida]
from Facturas
where (TotalFactura - Pagamento - Crédito) > 0
and (TotalFactura - Pagamento - Crédito) < 
(select avg(TotalFactura - Pagamento - Crédito)
from Facturas 
where (TotalFactura - Pagamento - Crédito) > 0)
order by TotalFactura desc

2.4
SELECT Nome,NúmeroFactura, TotalFactura
FROM Fornecedores inner join Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
where TotalFactura < (SELECT MAX(TotalFactura) FROM Facturas inner join Fornecedores on IDFornecedor = Fornecedor where Fornecedores.Nome in('Mc Graw Hill'))
ORDER BY Fornecedores.Nome

2.5
SELECT Nome,NúmeroFactura, TotalFactura
FROM Fornecedores inner join Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
where TotalFactura > (SELECT MAX(TotalFactura) FROM Facturas inner join Fornecedores on IDFornecedor = Fornecedor where Fornecedores.Nome in('Patinter'))
ORDER BY Fornecedores.Nome

2.6
SELECT Nome, (SELECT Descrição 
    FROM CondiçõesPagamento
    WHERE Fornecedores.CondiçãoPagamentoPredefinida = CondiçõesPagamento.IDCondição) AS [Condição Pagamento], (SELECT MAX(DataFactura)
    FROM Facturas
    WHERE Fornecedores.IDFornecedor = Facturas.Fornecedor) AS [Última Fatura]
FROM Fornecedores
ORDER BY [Última Fatura] DESC, [Condição Pagamento] DESC;

2.7
SELECT DISTINCT IDFornecedor, Nome, Localidade
FROM (SELECT * 
    FROM Fornecedores
    INNER JOIN Facturas
    ON Fornecedores.IDFornecedor = Facturas.Fornecedor
    INNER JOIN CondiçõesPagamento
    ON Facturas.CondiçãoPagamento = CondiçõesPagamento.IDCondição
    WHERE CondiçõesPagamento.Descrição = '30 dias liquido') AS [Fornecedores];
	
2.8
SELECT [Sumário1].Colaborador, [Sumário2].Departamento
FROM (SELECT PNome + ' ' + UNome AS [Colaborador], IDColaborador
    FROM Colaboradores
    LEFT OUTER JOIN Projectos_Colaboradores
    ON Colaboradores.IDColaborador = Projectos_Colaboradores.Colaborador
    WHERE Projectos_Colaboradores.Colaborador IS NULL) AS [Sumário1]
INNER JOIN (SELECT Departamentos.Nome AS [Departamento], IDColaborador
    FROM Colaboradores
    INNER JOIN Departamentos
    ON Colaboradores.Departamento = Departamentos.IDDepartamento) AS [Sumário2]
ON [Sumário1].IDColaborador = [Sumário2].IDColaborador
ORDER BY [Sumário2].Departamento, [Sumário1].Colaborador;*/



