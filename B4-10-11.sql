USE Northwind1
GO

--Danh sách đơn hàng MỨC 1
SELECT * FROM Northwind.dbo.Orders ORDER BY OrderID

--Danh sách đơn hàng MỨC 2
	--CÁCH KHÔNG ORDER BY
SELECT * FROM dbo.DH1
UNION
SELECT * FROM dbo.DH2

	--CÁCH CÓ ORDER BY (CẦN SỬA LẠI)??????????????????????
	--?????????????????????????????????
CREATE PROC DSDonHangOBMuc2
AS
BEGIN
	IF EXISTS (
		SELECT *
		FROM sys.tables
		JOIN sys.schemas
		ON sys.tables.schema_id = sys.schemas.schema_id
		WHERE sys.schemas.name = N'dbo' AND sys.tables.name = N'TAMDH'
	)	DROP TABLE Northwind1.dbo.TAMDH

	SELECT * INTO Northwind1.dbo.TAMDH FROM Northwind1.dbo.DH1
	INSERT INTO Northwind1.dbo.TAMDH SELECT * FROM Northwind1.dbo.DH2
	SELECT * FROM Northwind1.dbo.TAMDH ORDER BY OrderID
END
GO

EXEC DSDonHangOBMuc2
GO

DROP PROC DSDonHangOBMuc2
GO
