
/*2.1
CREATE TABLE Teste(  
	id  int,
	desig char(2)
);
INSERT INTO Teste
VALUES(1, 'A'),(2,'B'),(3,'C')
Select *
from Teste

2.2
UPDATE Teste
SET desig = 'T' + desig
Select *
from Teste

2.3
Select * from CopiaFacturas WHERE N�meroFactura = '97/522'
UPDATE CopiaFacturas
SET Cr�dito = Cr�dito + 100
Select * from CopiaFacturas WHERE N�meroFactura = '97/522'

2.4
SELECT *
FROM CopiaFacturas INNER JOIN Fornecedores
	ON Fornecedores.IDFornecedor = CopiaFacturas.Fornecedor
WHERE Fornecedores.Localidade LIKE 'Porto' OR Fornecedores.Localidade LIKE 'Lisboa'
UPDATE CopiaFacturas
SET Condi��oPagamento = 2
FROM CopiaFacturas INNER JOIN Fornecedores
	ON Fornecedores.IDFornecedor = CopiaFacturas.Fornecedor
WHERE Fornecedores.Localidade LIKE 'Porto' OR Fornecedores.Localidade LIKE 'Lisboa'
SELECT *
FROM CopiaFacturas INNER JOIN Fornecedores
	ON Fornecedores.IDFornecedor = CopiaFacturas.Fornecedor
WHERE Fornecedores.Localidade LIKE 'Porto' OR Fornecedores.Localidade LIKE 'Lisboa'

2.5
SELECT *
FROM CopiaFacturas
DELETE CopiaFacturas
WHERE Fornecedor = 121
SELECT *
FROM CopiaFacturas

2.6
SELECT *
FROM CopiaFornecedores
DELETE CopiaFornecedores
WHERE NOT EXISTS (SELECT  *FROM Facturas WHERE Fornecedor = CopiaFornecedores.IDFornecedor)
SELECT *
FROM CopiaFornecedores

2.7
SELECT IDFornecedor, Nome, N�meroFactura, TotalFactura - Pagamento - Cr�dito AS [Montante em d�vida], 'Aguardando Pagamento' AS ESTADO
INTO Dividas
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
WHERE TotalFactura - Pagamento - Cr�dito > 0
select *
From Dividas

2.8
INSERT INTO Dividas
SELECT IDFornecedor, Nome, N�meroFactura, TotalFactura - Pagamento - Cr�dito AS [Montante em d�vida], 'Liquidada' AS ESTADO
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
WHERE TotalFactura - Pagamento - Cr�dito <= 0
select *
From Dividas

2.9
Select * from Dividas;
UPDATE Dividas
SET [Montante em d�vida] = 0, ESTADO = 'Liquidada'
WHERE Nome = 'Patinter';
Select * from Dividas*/
