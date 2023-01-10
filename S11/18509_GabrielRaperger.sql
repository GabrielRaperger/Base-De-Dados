
/* 2.1
CREATE VIEW FornecedoresLisboaEmD�vida40Dias1S2006
AS
SELECT Nome + ' ' + PNoneContacto + ' ' + �NomeContacto + ' - ' + Telefone AS Contacto, N�meroFactura, DataFactura,
TotalFactura,(TotalFactura - Pagamento - Cr�dito) as [Montante em d�vida] 
FROM Fornecedores INNER JOIN Facturas
	ON Facturas.Fornecedor = Fornecedores.IDFornecedor
WHERE DATEPART(MONTH, DataFactura) <= 6 AND YEAR(DataFactura) = 2006 AND (Localidade = 'Viseu' OR Localidade = 'Lisboa') AND Condi��oPagamento = '4' AND TotalFactura - Pagamento - Cr�dito > 0

Select *
FROM FornecedoresLisboaEmD�vida40Dias1S2006


2.2
CREATE VIEW Sum�rioFacturas
AS
SELECT Nome, COUNT(IDFactura) AS [Quantidade de Facturas], SUM(TotalFactura) AS [Montante Total]
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
GROUP BY Nome

SELECT * FROM Sum�rioFacturas


2.3
CREATE VIEW PagamentosFornecedores
AS
SELECT Nome, N�meroFactura, DataFactura, DataPagamento, TotalFactura, Cr�dito, Pagamento
FROM CopiaFornecedores INNER JOIN CopiaFacturas
	ON CopiaFornecedores.IDFornecedor = CopiaFacturas.Fornecedor
WHERE TotalFactura - Pagamento - Cr�dito > 0

Select * FROM PagamentosFornecedores


2.4
UPDATE PagamentosFornecedores
SET Pagamento = 1727.54, DataPagamento = '2006-08-01'
WHERE [N�meroFactura] = '989319-487'

Select * FROM PagamentosFornecedores
select * from CopiaFacturas



2.5
CREATE VIEW FacturasIBM
AS
SELECT IDFactura, Fornecedor,N�meroFactura,DataFactura,TotalFactura, Pagamento,Cr�dito, Condi��oPagamento, DataVencimentoFactura
FROM Facturas
WHERE Facturas.Fornecedor = (SELECT IDFornecedor FROM Fornecedores WHERE IDFornecedor = 34)

SELECT * FROM FacturasIBM


2.6
INSERT INTO FacturasIBM
VALUES(20,34,'RA23988','2006-07-31',417.34,0,0,4,'2006-09-30')

SELECT * FROM FacturasIBM
SELECT * FROM Facturas


2.7
SELECT *
FROM FacturasIBM
DELETE FacturasIBM
WHERe IDFactura = 20
SELECT *
FROM FacturasIBM

2.8
WITH cte as
    ( SELECT *
    FROM Facturas
    INNER JOIN Fornecedores
    ON Facturas.Fornecedor = Fornecedores.IDFornecedor
    WHERE Nome = 'IBM')
select * from cte;*/

