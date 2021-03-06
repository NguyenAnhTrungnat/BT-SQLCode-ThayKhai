USE Northwind1
GO

--Lấy danh sách tất cả khách hàng MỨC 1
CREATE PROC DSTatCaKHMuc1
AS
	SELECT * FROM Northwind.dbo.Customers
GO

EXEC DSTatCaKHMuc1
GO

DROP DSTatCaKHMuc1
GO

--Lấy danh sách tất cả khách hàng MỨC 2
	--CÁCH 1

CREATE PROC DSTatCaKHMuc2
AS
	SELECT * FROM dbo.KH1
	UNION
	SELECT * FROM dbo.KH2
GO

EXEC DSTatCaKHMuc2
GO

DROP PROC DSTatCaKHMuc2
GO

	--CÁCH 2
CREATE PROC DSTatCaKHMuc2
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM sys.tables
		JOIN sys.schemas
		ON sys.tables.schema_id = sys.schemas.schema_id
		WHERE sys.schemas.name = N'dbo' AND sys.tables.name = N'TAM'
	) DROP TABLE Northwind1.dbo.TAM
	
	SELECT * INTO Northwind1.dbo.TAM
	FROM dbo.KH1
	INSERT INTO Northwind1.dbo.TAM SELECT * FROM dbo.KH2
	
	SELECT * FROM Northwind1.dbo.TAM ORDER BY Country
END
GO

EXEC DSTatCaKHMuc2
GO

DROP TABLE Northwind1.dbo.TAM
GO

DROP PROC DSTatCaKHMuc2
GO