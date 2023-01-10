 SELECT * FROM nova_cópia_forns WHERE IDFornecedor = 81
BEGIN TRAN
Update nova_cópia_forns SET Nome='alterado' WHERE IDFornecedor = 81
ROLLBACK TRAN