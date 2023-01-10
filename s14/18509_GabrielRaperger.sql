
/*2.1
IF OBJECT_ID('fnTotalFaturasPendentes') IS NOT NULL
	DROP FUNCTION fnTotalFaturasPendentes
GO
CREATE FUNCTION fnTotalFaturasPendentes()
RETURNS money
BEGIN
	RETURN (SELECT SUM(TotalFactura) FROM Facturas WHERE TotalFactura - Pagamento - Crédito >0)

END
GO
PRINT 'Valor total da dívida: ' + CONVERT(varchar,scdi60.fnTotalFaturasPendentes(),1) 

GO
*/
/*2.2

IF OBJECT_ID('fn_AplicaDesconto') IS NOT NULL
	DROP FUNCTION fn_AplicaDesconto
GO
CREATE FUNCTION fn_AplicaDesconto(@Valor money)
RETURNS money
	
BEGIN
	IF @Valor>=100 AND @Valor<500 SET @Valor=@Valor*0.98
	IF @Valor>=500 AND @Valor<5000 SET @Valor=@Valor*0.95
	IF @Valor>=5000 SET @Valor=@Valor*0.90
	RETURN @Valor
END
GO



DECLARE @Valor money
--SET @Valor=50
--SET @Valor=100
--SET @Valor=560
SET @Valor=10000

PRINT 'Valor '+ CONVERT(varchar,@Valor,1)+' com desconto: ' + CONVERT(varchar,scdi60.fn_AplicaDesconto(@Valor),1) 
*/
/*2.3
GO
IF OBJECT_ID('fnTopFornecedores') IS NOT NULL
	DROP FUNCTION fnTopFornecedores
GO
CREATE FUNCTION fnTopFornecedores(@TopFornecedores int)
RETURNS table

	RETURN SELECT TOP  (@TopFornecedores)  TotalFactura,  Fornecedor, Nome
	FROM Facturas JOIN Fornecedores ON Fornecedor = IDFornecedor
	
	ORDER BY TotalFactura DESC

GO
SELECT Fornecedor,Nome, TotalFactura FROM scdi60.fnTopFornecedores(5)

*/
/*2.4
GO
IF OBJECT_ID('fnFactFornecedores') IS NOT NULL
	DROP FUNCTION fnFactFornecedores
GO
CREATE FUNCTION fnFactFornecedores(@nFacturas int)
RETURNS table
	RETURN
SELECT Nome, COUNT(IDFactura) AS [Numero Facturas], SUM(TotalFactura) AS Soma
FROM Facturas JOIN Fornecedores ON Fornecedor =IDFornecedor
GROUP BY Nome
HAVING COUNT(IDFactura) >= @nFacturas
GO

SELECT * FROM scdi60.fnFactFornecedores(3)

*/
/*2.5
GO
IF OBJECT_ID('fnMediaFactFornecedores') IS NOT NULL
	DROP FUNCTION fnMediaFactFornecedores
GO
CREATE FUNCTION fnMediaFactFornecedores(@nMontante int)

RETURNS table
	RETURN
SELECT  TOP (@nMontante) Fornecedor, Nome AS [Nome Fornecedor], MAX(DataFactura) AS [Data Mais Recente], AVG(TotalFactura) AS [Media Fatura]
FROM Facturas INNER JOIN Fornecedores
    ON Fornecedor = IDFornecedor
GROUP BY Fornecedor, Nome
ORDER BY [Media Fatura] DESC
GO

SELECT * FROM scdi60.fnMediaFactFornecedores(5)
*/

/*2.6
GO
IF OBJECT_ID('fnDivideFrases') IS NOT NULL
	DROP FUNCTION fnDivideFrases
GO
CREATE FUNCTION fnDivideFrases(@Palavra VARCHAR(MAX), @Delimitador CHAR(1)) 
RETURNS @saida TABLE(divisaopal VARCHAR(MAX) ) 
BEGIN 
    DECLARE @inicio INT, @fim INT 
    SELECT @inicio = 1, @fim = CHARINDEX(@Delimitador, @Palavra) 
    WHILE @inicio < LEN(@Palavra) + 1
	 BEGIN 
        IF @fim = 0  
            SET @fim = LEN(@Palavra) + 1
       
        INSERT INTO @saida (divisaopal)  
        VALUES(SUBSTRING(@Palavra, @inicio, @fim - @inicio)) 
        SET @inicio = @fim + 1 
        SET @fim = CHARINDEX(@Delimitador, @Palavra, @inicio)
        
    END 
    RETURN 
END
GO
SELECT * FROM fnDivideFrases('Olá, hoje está um dia de verão',' ')
SELECT * FROM fnDivideFrases('Olá, hoje está um dia de verão',',')
SELECT * FROM fnDivideFrases('91,12,65,78,56,789',',')
GO
*/
/*2.7
IF OBJECT_ID('Temp') IS NOT NULL
	DROP TABLE Temp
GO
CREATE TABLE Temp
	(Nome varchar(50) not null, 
	Localidade varchar(50) not null,
	Telefone varchar(50) null,
	id int identity(1,1))
GO
INSERT INTO Temp (Nome, Localidade, Telefone)
	SELECT Nome, Localidade, Telefone
	FROM Fornecedores
	go
GO
SELECT * FROM Temp
GO

IF OBJECT_ID('ParaJSON') IS NOT NULL
	DROP FUNCTION ParaJSON
GO
CREATE Function ParaJSON()
	RETURNS VARCHAR(MAX)

BEGIN

DECLARE @TEMP VARCHAR(MAX)
DECLARE @TEMP2 VARCHAR(MAX)
DECLARE @INC INT = 1

SET @TEMP = '"{Fornecedores":['
WHILE @INC < ((SELECT COUNT(id) FROM Temp)+1)
	BEGIN
		SET @TEMP2 = CHAR(10) + '{"Nome":"' + (SELECT Nome FROM Temp WHERE id = @INC) + '", "Localidade":"' +
		 (SELECT Localidade FROM Temp WHERE id=@INC) + '", "Telefone":"' +
		 (SELECT Telefone FROM Temp WHERE id=@INC) + '"},'
		SET @TEMP = @TEMP + @TEMP2
		SET @TEMP = @INC + 1
	END
SET @TEMP = @TEMP + CHAR(10) + ']}'
RETURN @TEMP
END

GO

PRINT scdi60.ParaJSON()
*/