

/*2.1
IF OBJECT_ID('spTotalFactura') IS NOT NULL
DROP PROC spTotalFactura

GO

CREATE PROC spTotalFactura
 @Data smalldatetime = NULL,
 @Total money OUTPUT

 AS

SELECT @Total = SUM(TotalFactura)
FROM Facturas
WHERE DataFactura >= @Data 
 */


/*2.2
DECLARE @MeuTotal money
EXEC spTotalFactura @Data = '2006-01-01',
 @Total = @MeuTotal OUTPUT
PRINT 'Total das facturas com data posterior ou igual a 01/01/06: ' + CONVERT(varchar,@MeuTotal,1)*/


/*2.3
IF OBJECT_ID('spFaturasEmDividaPorIDFornecedor') IS NOT NULL
DROP PROC spFaturasEmDividaPorIDFornecedor

GO

CREATE PROC spFaturasEmDividaPorIDFornecedor
@IDFornecedor int = NULL

AS

SELECT Nome, NúmeroFactura, DataFactura, TotalFactura 
FROM Fornecedores INNER JOIN Facturas
	ON Fornecedores.IDFornecedor = Facturas.Fornecedor
WHERE IDFornecedor = @IDFornecedor AND (Pagamento + Crédito) < TotalFactura*/


/* 2,4
EXEC spFaturasEmDividaPorIDFornecedor 122
*/


/*2.5
IF OBJECT_ID('spAplicaIVA') IS NOT NULL
DROP PROC spAplicaIVA

GO

CREATE PROC spAplicaIVA
@Valor money = NULL,
@TaxaIVA varchar(9) =NULL,
@ValorComIVA money OUTPUT,
@ValorDoIVA float OUTPUT

AS
IF (LEFT(@TaxaIVA,1) = 'N') OR (LEFT(@TaxaIVA,1) = 'n')
	SET @ValorDoIVA = 0.23

ELSE IF (LEFT(@TaxaIVA,1) = 'R') OR (LEFT(@TaxaIVA,1) = 'r')
	SET @ValorDoIVA = 0.06

	SET @ValorComIVA = @Valor * (1 + @ValorDoIVA)
	*/


/* 2.6
	DECLARE @ComIVA money, @ValorIVA float, @ValorInicial money
	set @ValorInicial = 1000
	EXEC spAplicaIVA @ValorInicial, @TaxaIVA = 'Normal',
	@ValorComIVA = @ComIVA OUTPUT,
	@ValorDoIVA = @ValorIVA OUTPUT
	
	PRINT 'Valor:		' + CONVERT(varchar,@ValorInicial)
	PRINT 'Valor c/IVA:		' + CONVERT(varchar,@ComIVA)

	IF @ValorIVA = 0.06
	begin
		SET @ValorIVA = @ValorIVA * 100
		PRINT 'IVA:		' + CONVERT(varchar,@ValorIVA) + '%  [Reduzida]'	
	end

	IF @ValorIVA = 0.23
		begin
			SET @ValorIVA = @ValorIVA * 100
		PRINT 'IVA:		' + CONVERT(varchar,@ValorIVA) + '%  [Normal]'
		end
*/


/*2.7 E 2.8
IF OBJECT_ID('spTopReg') IS NOT NULL
DROP PROC spTopReg

GO 
CREATE PROC spTopReg
@NRegs NVARCHAR(2) = 5,
@Tabela NVARCHAR(50) = 'Projectos'
AS
DECLARE @ActualTableName AS NVarchar(255)
SELECT @ActualTableName = QUOTENAME( TABLE_NAME )
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = @Tabela
DECLARE @sql AS NVARCHAR(MAX)
SELECT @sql = 'SELECT TOP ' + @NRegs + '* FROM ' + @ActualTableName + ';'
    EXEC(@SQL)
GO
EXECUTE spTopReg 5 */

