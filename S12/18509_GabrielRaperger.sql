/*2.1
DECLARE @FornecedorUnico TABLE
(Fornecedor varchar(50), Total money, NFacturas int)

INSERT @FornecedorUnico
VALUES('Painter', 14600.50, 14)
PRINT 'Fornecedor: Painter Total: 14600.50 NFacturas: 14'
SELECT * FROM @FornecedorUnico*/
 
/*2.2
DECLARE @Nmaiorfac INT, @Nmenorfac INT, @MEDIAFACTURAS money, @VALORFACTURAS int
SET @MEDIAFACTURAS = (Select AVG(TotalFactura) FROM Facturas)
SET @Nmaiorfac = (SELECT COUNT(TotalFactura) FROM Facturas WHERE TotalFactura > @MEDIAFACTURAS)
SET @Nmenorfac = (SELECT COUNT(TotalFactura) FROM Facturas WHERE TotalFactura < @MEDIAFACTURAS)

PRINT 'Valor Medio de todas as Facturas: ' + CONVERT (varchar, @MEDIAFACTURAS, 2)
PRINT 'Nº Facturas com o valor maior que a media: ' + CONVERT (varchar, @Nmaiorfac , 2)
PRINT 'Nº Facturas com o valor menor que a media: ' + CONVERT (varchar, @Nmenorfac, 2)
*/

/*2.3
DECLARE @IDForn INT, @Maiorfactura money, @Mediafactura money, @NFactura int, @NúmeroFact varchar(10), @DataFact DATE
SET @IDForn = 122
SET	@Maiorfactura = (SELECT MAX(TotalFactura) FROM Facturas WHERE Fornecedor = @IDForn)
SET	@Mediafactura = (SELECT AVG(TotalFactura) FROM Facturas WHERE Fornecedor = @IDForn)
SET @NFactura = (SELECT COUNT(IDFactura) FROM Facturas WHERE Fornecedor = @IDForn)
SET @DataFact = (SELECT MAX(DataFactura) FROM Facturas WHERE Fornecedor = @IDForn)
SET	@NúmeroFact =	(SELECT NúmeroFactura FROM Facturas WHERE Fornecedor = @IDForn AND DataFactura = @DataFact)

PRINT 'Factura mais dispenciosa: ' + CONVERT(varchar, @Maiorfactura, 1)
PRINT 'Valor medio de todas as facturas: ' + CONVERT(varchar, @Mediafactura, 1)
PRINT 'Numero de facturas emitidas: ' + CONVERT(varchar, @NFactura, 1)
PRINT 'Numero da ultima factura: ' + @NúmeroFact
PRINT 'Data da ultima factura: ' + CONVERT(varchar, @DataFact)*/

/*2.4
DECLARE @FacturaMaiorTotal TABLE
(NúmeroFactura varchar(20), Fornecedor	int, DataFactura DATETIME, TotalFactura money)
INSERT @FacturaMaiorTotal
SELECT TOP 5 NúmeroFactura, Fornecedor, DataFactura, MAX(TotalFactura) AS [MaiorFactura]
FROM Facturas
GROUP BY NúmeroFactura, Fornecedor, DataFactura
ORDER BY [MaiorFactura] DESC
SELECT * FROM @FacturaMaiorTotal*/

/* 2.5
SELECT TOP 5 NúmeroFactura, Fornecedor, DataFactura, MAX(TotalFactura) AS [MaiorFactura]
INTO #FacturaMaiorTotal
FROM Facturas
GROUP BY NúmeroFactura, Fornecedor, DataFactura
ORDER BY [MaiorFactura] DESC
SELECT * FROM #FacturaMaiorTotal*/

/* 2.6
IF OBJECT_ID('tempdb..#FacturaMaiorTotal') IS NOT NULL
DROP TABLE #FacturaMaiorTotal
SELECT TOP 5 NúmeroFactura, Fornecedor, DataFactura, MAX(TotalFactura) AS [MaiorFactura]
INTO #FacturaMaiorTotal
FROM Facturas
GROUP BY NúmeroFactura, Fornecedor, DataFactura
ORDER BY [MaiorFactura] DESC
SELECT * FROM #FacturaMaiorTotal*/

/* 2.7
DECLARE @VarIDFornecedor INT
DECLARE @MenorDívida money, @MaiorDívida money
DECLARE @MenorDataDívida date
DECLARE @NFacturas INT
DECLARE @MaiorDataDívida date
SET @VarIDFornecedor = 122

SELECT @MenorDívida = MIN(TotalFactura - Pagamento - Crédito),
 @MaiorDívida = MAX(TotalFactura - Pagamento - Crédito),
 @MenorDataDívida = MIN(DataVencimentoFactura),
 @MaiorDataDívida = MAX(DataVencimentoFactura),
 @NFacturas = COUNT(*)
FROM Facturas
WHERE TotalFactura - Pagamento - Crédito > 0 AND Fornecedor = @VarIDFornecedor

IF @MenorDataDívida < GETDATE()
BEGIN
PRINT CONVERT(varchar, @NFacturas) + ' Facturas por liquidar em atraso relativamente à data
 de pagamento!'
 PRINT 'Datas em dívida de ' + CONVERT(varchar,@MenorDataDívida) +
 ' até ' + CONVERT(varchar,@MaiorDataDívida) + '.'
 PRINT 'Montante em dívida desde ' + CONVERT(varchar,@MenorDívida,1)
 + ' a ' + CONVERT(varchar,@MaiorDívida,1) + '.'
END
ELSE --@MenorDataDívida >= GETDATE()
 PRINT 'Não existem facturas com atrasos de pagamento'*/

 /* 2.8

 --2.1
 GO
 BEGIN TRY
 PRINT 'Q 2.1'
 DECLARE @FornecedorUnico TABLE
(Fornecedor varchar(50), Total money, NFacturas int)

INSERT @FornecedorUnico
VALUES('Painter', 14600.50, 14)
PRINT 'Fornecedor: Painter Total: 14600.50 NFacturas: 14'
SELECT * FROM @FornecedorUnico
 
-- 2.2
 PRINT 'Q 2.2'
DECLARE @Nmaiorfac INT, @Nmenorfac INT, @MEDIAFACTURAS money, @VALORFACTURAS int
SET @MEDIAFACTURAS = (Select AVG(TotalFactura) FROM Facturas)
SET @Nmaiorfac = (SELECT COUNT(TotalFactura) FROM Facturas WHERE TotalFactura > @MEDIAFACTURAS)
SET @Nmenorfac = (SELECT COUNT(TotalFactura) FROM Facturas WHERE TotalFactura < @MEDIAFACTURAS)

PRINT 'Valor Medio de todas as Facturas: ' + CONVERT (varchar, @MEDIAFACTURAS, 2)
PRINT 'Nº Facturas com o valor maior que a media: ' + CONVERT (varchar, @Nmaiorfac , 2)
PRINT 'Nº Facturas com o valor menor que a media: ' + CONVERT (varchar, @Nmenorfac, 2)


-- 2.3
 PRINT 'Q 2.3'
DECLARE @IDForn INT, @Maiorfactura money, @Mediafactura money, @NFactura int, @NúmeroFact varchar(10), @DataFact DATE
SET @IDForn = 122
SET	@Maiorfactura = (SELECT MAX(TotalFactura) FROM Facturas WHERE Fornecedor = @IDForn)
SET	@Mediafactura = (SELECT AVG(TotalFactura) FROM Facturas WHERE Fornecedor = @IDForn)
SET @NFactura = (SELECT COUNT(IDFactura) FROM Facturas WHERE Fornecedor = @IDForn)
SET @DataFact = (SELECT MAX(DataFactura) FROM Facturas WHERE Fornecedor = @IDForn)
SET	@NúmeroFact =	(SELECT NúmeroFactura FROM Facturas WHERE Fornecedor = @IDForn AND DataFactura = @DataFact)

PRINT 'Factura mais dispenciosa: ' + CONVERT(varchar, @Maiorfactura, 1)
PRINT 'Valor medio de todas as facturas: ' + CONVERT(varchar, @Mediafactura, 1)
PRINT 'Numero de facturas emitidas: ' + CONVERT(varchar, @NFactura, 1)
PRINT 'Numero da ultima factura: ' + @NúmeroFact
PRINT 'Data da ultima factura: ' + CONVERT(varchar, @DataFact)

-- 2.4
 PRINT 'Q 2.4'
DECLARE @FacturaMaiorTotal TABLE
(NúmeroFactura varchar(20), Fornecedor	int, DataFactura DATETIME, TotalFactura money)
INSERT @FacturaMaiorTotal
SELECT TOP 5 NúmeroFactura, Fornecedor, DataFactura, MAX(TotalFactura) AS [MaiorFactura]
FROM Facturas
GROUP BY NúmeroFactura, Fornecedor, DataFactura
ORDER BY [MaiorFactura] DESC
SELECT * FROM @FacturaMaiorTotal


-- 2.6 e 2.5
 PRINT 'Q 2.5 e 2.6'
IF OBJECT_ID('tempdb..#FacturaMaiorTotal') IS NOT NULL
DROP TABLE #FacturaMaiorTotal
SELECT TOP 5 NúmeroFactura, Fornecedor, DataFactura, MAX(TotalFactura) AS [MaiorFactura]
INTO #FacturaMaiorTotal
FROM Facturas
GROUP BY NúmeroFactura, Fornecedor, DataFactura
ORDER BY [MaiorFactura] DESC
SELECT * FROM #FacturaMaiorTotal


-- 2.7
 PRINT 'Q 2.7 - VarIDFornecedor = 122'
DECLARE @VarIDFornecedor INT
DECLARE @MenorDívida money, @MaiorDívida money
DECLARE @MenorDataDívida date
DECLARE @NFacturas INT
DECLARE @MaiorDataDívida date
SET @VarIDFornecedor = 122

SELECT @MenorDívida = MIN(TotalFactura - Pagamento - Crédito),
 @MaiorDívida = MAX(TotalFactura - Pagamento - Crédito),
 @MenorDataDívida = MIN(DataVencimentoFactura),
 @MaiorDataDívida = MAX(DataVencimentoFactura),
 @NFacturas = COUNT(*)
FROM Facturas
WHERE TotalFactura - Pagamento - Crédito > 0 AND Fornecedor = @VarIDFornecedor

IF @MenorDataDívida < GETDATE()
BEGIN
PRINT CONVERT(varchar, @NFacturas) + ' Facturas por liquidar em atraso relativamente à data
 de pagamento!'
 PRINT 'Datas em dívida de ' + CONVERT(varchar,@MenorDataDívida) +
 ' até ' + CONVERT(varchar,@MaiorDataDívida) + '.'
 PRINT 'Montante em dívida desde ' + CONVERT(varchar,@MenorDívida,1)
 + ' a ' + CONVERT(varchar,@MaiorDívida,1) + '.'
END
ELSE --@MenorDataDívida >= GETDATE()
 PRINT 'Não existem facturas com atrasos de pagamento'
 END TRY


 -- AREA DOS ERROS
BEGIN CATCH
PRINT 'FALHA: O registo não foi inserido.'
-- Pode utilizar uma instrução SELECT para devolver
-- um resultado que contenha dados sobre o erro
SELECT
ERROR_NUMBER() AS [Número do erro],
ERROR_MESSAGE() AS [Mensagem de erro]
END CATCH*/

/*2.9
DECLARE @Tabela VARCHAR(50)
SET @Tabela = 'Facturas'
EXEC ('SELECT TOP 10 * FROM ' + @Tabela);
*/

