/* 2.1 
DECLARE @id_fornecedor INT, @nome_fornecedor VARCHAR(50)
DECLARE Cursor_Fornecedores CURSOR
STATIC
FOR
SELECT IDFornecedor, Nome
FROM Fornecedores

OPEN Cursor_Fornecedores
FETCH NEXT FROM Cursor_Fornecedores INTO
@id_fornecedor, @nome_fornecedor
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT CONVERT(VARCHAR, @id_fornecedor) + ', ' + @nome_fornecedor
	FETCH NEXT FROM Cursor_Fornecedores INTO
	@id_fornecedor, @nome_fornecedor
END
CLOSE Cursor_Fornecedores
DEALLOCATE Cursor_Fornecedores */

/* 2.2 
DECLARE @id_fornecedor INT, @nome_fornecedor VARCHAR(50)
DECLARE Cursor_Fornecedores CURSOR
STATIC READ_ONLY
FOR
SELECT IDFornecedor, Nome
FROM Fornecedores

OPEN Cursor_Fornecedores
FETCH NEXT FROM Cursor_Fornecedores INTO
@id_fornecedor, @nome_fornecedor
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT CONVERT(VARCHAR, @id_fornecedor) + ', ' + @nome_fornecedor
	FETCH NEXT FROM Cursor_Fornecedores INTO
	@id_fornecedor, @nome_fornecedor
	FETCH NEXT FROM Cursor_Fornecedores INTO
	@id_fornecedor, @nome_fornecedor
END
CLOSE Cursor_Fornecedores
DEALLOCATE Cursor_Fornecedores */

/* 2.3 
IF OBJECT_ID('tempdb..#temp_Fornecedores') IS NOT NULL
DROP TABLE #temp_Fornecedores

CREATE TABLE #temp_Fornecedores
(
    temp_nome VARCHAR(50),
	temp_localidade VARCHAR(50),
	temp_divida MONEY
)

INSERT INTO #temp_Fornecedores
SELECT Nome, Localidade, SUM(TotalFactura - Pagamento - Crédito) AS Divida
FROM Fornecedores
INNER JOIN Facturas
ON Fornecedores.IDFornecedor = Facturas.Fornecedor
GROUP BY IDFornecedor, Nome, Localidade
HAVING SUM(TotalFactura - Pagamento - Crédito) > 0

DECLARE @nome VARCHAR(50), @localidade VARCHAR(50), @divida MONEY
DECLARE Cursor_Fornecedores_Com_Dividas CURSOR
FORWARD_ONLY READ_ONLY
FOR
SELECT temp_nome, temp_localidade, temp_divida
FROM #temp_Fornecedores

OPEN Cursor_Fornecedores_Com_Dividas
FETCH NEXT FROM Cursor_Fornecedores_Com_Dividas INTO
@nome, @localidade, @divida
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @nome + ' (' + @localidade + ')'
	PRINT 'Divida: ' + CONVERT(VARCHAR, @divida, 1)
	PRINT ''
	FETCH NEXT FROM Cursor_Fornecedores_Com_Dividas INTO
	@nome, @localidade, @divida
END
CLOSE Cursor_Fornecedores_Com_Dividas
DEALLOCATE Cursor_Fornecedores_Com_Dividas */

/* 2.4 
DECLARE @departamento VARCHAR(30), @nome_colaborador VARCHAR(70), @projeto VARCHAR(30)
DECLARE Cursor_DCP CURSOR
FORWARD_ONLY READ_ONLY
FOR
SELECT Departamentos.Nome AS Departamento, Colaboradores.PNome + ' ' + Colaboradores.UNome AS Nome, Projectos.Nome AS Projeto
from Departamentos
LEFT JOIN Colaboradores
ON Departamentos.IDDepartamento = Colaboradores.Departamento
LEFT JOIN Projectos_Colaboradores
ON Colaboradores.IDColaborador = Projectos_Colaboradores.Colaborador
LEFT JOIN Projectos
ON Projectos_Colaboradores.Projecto = Projectos.IDProjecto
ORDER BY Departamento

OPEN Cursor_DCP
FETCH NEXT FROM Cursor_DCP INTO
@departamento, @nome_colaborador, @projeto
PRINT 'Departamento | Nome Colaborador | Projeto'
PRINT '-----------------------------------------'
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @projeto IS NULL
	SET @projeto = '- sem projeto -'
	IF @nome_colaborador IS NULL
	SET @nome_colaborador = '- sem colaborador -'
	PRINT @departamento + ' | ' + @nome_colaborador + ' | ' + @projeto
	FETCH NEXT FROM Cursor_DCP INTO
	@departamento, @nome_colaborador, @projeto
END
CLOSE Cursor_DCP
DEALLOCATE Cursor_DCP */