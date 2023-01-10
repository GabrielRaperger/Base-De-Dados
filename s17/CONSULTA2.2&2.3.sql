 Declare @IDFatura int
SET @IDFatura=33
Declare @num_itens int
SET @num_itens=2
Declare @rows int
BEGIN TRY
    BEGIN TRAN
         delete from itensfactura WHERE IDFactura=@IDFatura;
         SET @rows = @@ROWCOUNT
    IF @rows > @num_itens
      BEGIN
        ROLLBACK TRAN
        Print 'Erro: Os itensfactura são maiores que @num_itens';
      END
    ELSE
    BEGIN
     delete from Facturas WHERE IDFactura=@IDFatura;
    Print 'Operação bem sucedida.';
    END
    COMMIT TRAN
END TRY
BEGIN CATCH
END CATCH
