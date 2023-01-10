/*2.1
SELECT Departamentos.Nome, UNome, PNome, IDProjecto, Projectos.Nome
FROM Departamentos LEFT OUTER JOIN Colaboradores
	ON Departamentos.IDDepartamento = Colaboradores.Departamento LEFT OUTER JOIN Projectos_Colaboradores
		 ON Colaboradores.IDColaborador = Projectos_Colaboradores.Colaborador LEFT OUTER JOIN Projectos
			ON Projectos.IDProjecto = Projectos_Colaboradores.Projecto
ORDER BY Departamentos.Nome, UNome, Projecto

2.2
SELECT Departamentos.Nome, UNome, PNome, IDProjecto, Projectos.Nome
FROM Departamentos LEFT OUTER JOIN Colaboradores
	ON Departamentos.IDDepartamento = Colaboradores.Departamento LEFT OUTER JOIN Projectos_Colaboradores
		ON Colaboradores.IDColaborador = Projectos_Colaboradores.Colaborador LEFT OUTER JOIN Projectos
			ON Projectos.IDProjecto = Projectos_Colaboradores.Projecto 
WHERE Departamentos.Nome IN('Pagamentos','Contabilidade')	
ORDER BY Departamentos.Nome

2.4
SELECT IDProjecto, Nome
FROM Projectos LEFT OUTER JOIN Projectos_Colaboradores
	ON Projectos.IDProjecto = Projectos_Colaboradores.Projecto
Where Projectos_Colaboradores.Projecto != Projectos.IDProjecto

2.5
SELECT PNome +' '+ UNome AS NOME, Departamentos.Nome AS Departamento
FROM Colaboradores LEFT OUTER JOIN Projectos_Colaboradores
	ON Colaboradores.IDColaborador = Projectos_Colaboradores.Colaborador LEFT OUTER JOIN Departamentos
		ON Colaboradores.Departamento = Departamentos.IDDepartamento
WHERE Projectos_Colaboradores.Colaborador IS NULL OR Projectos_Colaboradores.DataFinal < GETDATE()
ORDER BY Departamento, Nome


2.6
SELECT Projectos.Nome, 'Por iniciar' AS Estado, PNome + ' ' + UNome AS Colaborador, DataInicial, DataFinal
FROM Projectos
LEFT OUTER JOIN Projectos_Colaboradores
ON Projectos.IDProjecto = Projectos_Colaboradores.Projecto
LEFT OUTER JOIN Colaboradores
ON Projectos_Colaboradores.Colaborador = Colaboradores.IDColaborador
WHERE DataInicial IS NULL
UNION
SELECT Projectos.Nome, 'Em curso' AS Estado, PNome + ' ' + UNome AS Colaborador, DataInicial, DataFinal
FROM Projectos
LEFT OUTER JOIN Projectos_Colaboradores
ON Projectos.IDProjecto = Projectos_Colaboradores.Projecto
LEFT OUTER JOIN Colaboradores
ON Projectos_Colaboradores.Colaborador = Colaboradores.IDColaborador
WHERE DataFinal IS NULL
UNION
SELECT Projectos.Nome, 'Terminado' AS Estado, PNome + ' ' + UNome AS Colaborador, DataInicial, DataFinal
FROM Projectos
LEFT OUTER JOIN Projectos_Colaboradores
ON Projectos.IDProjecto = Projectos_Colaboradores.Projecto
LEFT OUTER JOIN Colaboradores
ON Projectos_Colaboradores.Colaborador = Colaboradores.IDColaborador
WHERE DataFinal <= GETDATE()
ORDER BY Estado, Projectos.Nome;


2.7

SELECT NúmeroConta, Descrição, Nome, Localidade
FROM ContasBalanço
LEFT OUTER JOIN Fornecedores
ON ContasBalanço.NúmeroConta = Fornecedores.ContaBalançoPredefinida
LEFT OUTER JOIN ItensFactura
ON ContasBalanço.NúmeroConta = ItensFactura.ContaBalanço
WHERE ItensFactura.ContaBalanço IS NULL
ORDER BY NúmeroConta ASC;
/*
2.8
SELECT IDFactura, NúmeroFactura, DataFactura, TotalFactura, Fornecedor, 'Liquidade' AS [Estado Pagamento]
FROM Facturas
LEFT OUTER JOIN Fornecedores
ON Facturas.Fornecedor = Fornecedores.IDFornecedor
WHERE DataPagamento IS NOT NULL
UNION
SELECT IDFactura, NúmeroFactura, DataFactura, TotalFactura, Fornecedor, 'Por liquidar' AS [Estado Pagamento]
FROM Facturas
LEFT OUTER JOIN Fornecedores
ON Facturas.Fornecedor = Fornecedores.IDFornecedor
WHERE DataPagamento IS NULL
ORDER BY [Estado Pagamento];*/