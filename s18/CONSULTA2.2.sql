SELECT * FROM nova_c�pia_forns WHERE IDFornecedor = 81
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
Begin tran
Update nova_c�pia_forns
set Nome='alterado' where idFornecedor = 81