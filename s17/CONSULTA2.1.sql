delete from itensfactura where IDFactura=33
delete from facturas where IDFactura=33
Declare @IDFatura int
INSERT Facturas VALUES
(33,34,'ZXA-080','2006-08-30',14092.59,0,0,3,'2006-09-30',NULL)
SET @IDFatura=33
INSERT ItensFactura VALUES (@IDFatura, 1, 160,4447.23, 'HW upgrade')
INSERT ItensFactura VALUES (@IDFatura, 2, 160,9645.36, 'OS upgrade')
SELECT * FROM Facturas WHERE IDFactura=@IDFatura
SELECT * FROM ItensFactura WHERE IDFactura=@IDFatura