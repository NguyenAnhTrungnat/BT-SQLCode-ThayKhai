USE Northwind1
GO
--Danh sách đơn hàng biết quốc gia MỨC 1
CREATE PROC DSDHBietQGMuc1(@tenQG nvarchar(50))
AS
		SELECT * 
		FROM Northwind.dbo.Orders o
		WHERE o.CustomerID IN (SELECT c.CustomerID
								FROM Northwind.dbo.Customers c
								WHERE c.Country = @tenQG)
GO

EXEC DSDHBietQGMuc1 N'Canada'
GO

DROP PROC DSDHBietQGMuc1
GO
--Danh sách đơn hàng biết quốc gia MỨC 2 
CREATE PROC DSDHBietQGMuc2(@tenQG nvarchar(50))
AS
BEGIN
	IF(@tenQG = N'USA' OR @tenQG = N'UK')
		SELECT * 
		FROM dbo.DH1 o
		WHERE o.CustomerID IN (SELECT c.CustomerID
								FROM dbo.KH1 c
								WHERE c.Country = @tenQG)
	ELSE
		SELECT * 
		FROM dbo.DH2 o
		WHERE o.CustomerID IN (SELECT c.CustomerID
								FROM dbo.KH2 c
								WHERE c.Country = @tenQG)
END
GO

EXEC DSDHBietQGMuc2 N'Canada'
GO

EXEC DSDHBietQGMuc2 N'USA'
GO

DROP PROC DSDHBietQGMuc2
GO