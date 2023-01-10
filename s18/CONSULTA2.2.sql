SELECT * FROM nova_cópia_forns WHERE IDFornecedor = 81
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
Begin tran
Update nova_cópia_forns
set Nome='alterado' where idFornecedor = 81