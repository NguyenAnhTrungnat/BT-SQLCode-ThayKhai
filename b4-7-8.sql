USE Northwind1
GO

--Danh sách khách hàng biết tên quốc gia
	--MỨC 1
CREATE PROC DSKHBietTenQGMuc1(@tenQG nvarchar(50))
AS
	SELECT *
	FROM Northwind.dbo.Customers c
	WHERE c.Country = @tenQG
GO

EXEC DSKHBietTenQGMuc1 N'Canada'
GO

EXEC DSKHBietTenQGMuc1 N'USA'
GO

DROP PROC DSKHBietTenQGMuc1
GO

	--MỨC 1
CREATE PROC DSKHBietTenQGMuc2(@tenQG nvarchar(50))
AS
BEGIN
	IF(@tenQG=N'USA' OR @tenQG=N'UK')
		SELECT * FROM Northwind1.dbo.KH1 k1 WHERE k1.Country = @tenQG
	ELSE SELECT * FROM Northwind1.dbo.KH2 k2 WHERE k2.Country = @tenQG
END
GO


EXEC DSKHBietTenQGMuc2 N'Canada'
GO

EXEC DSKHBietTenQGMuc2 N'USA'
GO

DROP PROC DSKHBietTenQGMuc2
GO