USE Northwind1
GO

--Phân mảnh
SELECT * INTO dbo.KH1
FROM Northwind.dbo.Customers c
WHERE (c.Country = N'USA') OR (c.Country = N'UK')
GO

SELECT * INTO dbo.KH2
FROM Northwind.dbo.Customers c
WHERE (c.Country <> N'USA') AND (c.Country <> N'UK')
GO

--Xem dữ liệu
SELECT * FROM Northwind1.dbo.KH1 ORDER BY Country
GO

SELECT * FROM Northwind1.dbo.KH2 ORDER BY Country
GO

