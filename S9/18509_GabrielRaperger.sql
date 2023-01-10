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
select N�meroFactura, DataFactura, TotalFactura, (TotalFactura - Pagamento - Cr�dito) as [Montante em d�vida]
from Facturas
where (TotalFactura - Pagamento - Cr�dito) > 0
and (TotalFactura - Pagamento - Cr�dito) < 
(select avg(TotalFactura - Pagamento - Cr�dito)
from Facturas 
where (TotalFactura - Pagamento - Cr�dito) > 0)
order by TotalFactura desc

2.4
SELECT Nome,N�meroFactura, TotalFactura
FROM Fornecedores inner join Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
where TotalFactura < (SELECT MAX(TotalFactura) FROM Facturas inner join Fornecedores on IDFornecedor = Fornecedor where Fornecedores.Nome in('Mc Graw Hill'))
ORDER BY Fornecedores.Nome

2.5
SELECT Nome,N�meroFactura, TotalFactura
FROM Fornecedores inner join Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
where TotalFactura > (SELECT MAX(TotalFactura) FROM Facturas inner join Fornecedores on IDFornecedor = Fornecedor where Fornecedores.Nome in('Patinter'))
ORDER BY Fornecedores.Nome

2.6
SELECT Nome, (SELECT Descri��o 
    FROM Condi��esPagamento
    WHERE Fornecedores.Condi��oPagamentoPredefinida = Condi��esPagamento.IDCondi��o) AS [Condi��o Pagamento], (SELECT MAX(DataFactura)
    FROM Facturas
    WHERE Fornecedores.IDFornecedor = Facturas.Fornecedor) AS [�ltima Fatura]
FROM Fornecedores
ORDER BY [�ltima Fatura] DESC, [Condi��o Pagamento] DESC;

2.7
SELECT DISTINCT IDFornecedor, Nome, Localidade
FROM (SELECT * 
    FROM Fornecedores
    INNER JOIN Facturas
    ON Fornecedores.IDFornecedor = Facturas.Fornecedor
    INNER JOIN Condi��esPagamento
    ON Facturas.Condi��oPagamento = Condi��esPagamento.IDCondi��o
    WHERE Condi��esPagamento.Descri��o = '30 dias liquido') AS [Fornecedores];
	
2.8
SELECT [Sum�rio1].Colaborador, [Sum�rio2].Departamento
FROM (SELECT PNome + ' ' + UNome AS [Colaborador], IDColaborador
    FROM Colaboradores
    LEFT OUTER JOIN Projectos_Colaboradores
    ON Colaboradores.IDColaborador = Projectos_Colaboradores.Colaborador
    WHERE Projectos_Colaboradores.Colaborador IS NULL) AS [Sum�rio1]
INNER JOIN (SELECT Departamentos.Nome AS [Departamento], IDColaborador
    FROM Colaboradores
    INNER JOIN Departamentos
    ON Colaboradores.Departamento = Departamentos.IDDepartamento) AS [Sum�rio2]
ON [Sum�rio1].IDColaborador = [Sum�rio2].IDColaborador
ORDER BY [Sum�rio2].Departamento, [Sum�rio1].Colaborador;*/



