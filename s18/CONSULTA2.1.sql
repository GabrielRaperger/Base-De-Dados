 SELECT * FROM nova_c�pia_forns WHERE IDFornecedor = 81
BEGIN TRAN
Update nova_c�pia_forns SET Nome='alterado' WHERE IDFornecedor = 81
ROLLBACK TRAN