USE Northwind1
GO

--Phân mảnh đơn hàng theo khách hàng.
	--CÁCH AN TOÀN
SELECT * INTO Northwind1.dbo.DH1
FROM Northwind.dbo.Orders o
WHERE o.CustomerID IN (SELECT c.CustomerID 
						FROM Northwind.dbo.Customers c
						WHERE (c.Country=N'USA') OR (c.Country=N'UK'))
SELECT * INTO Northwind1.dbo.DH2
FROM Northwind.dbo.Orders o
WHERE o.CustomerID IN (SELECT c.CustomerID 
						FROM Northwind.dbo.Customers c
						WHERE (c.Country<>N'USA') AND (c.Country<>N'UK'))
GO

DROP TABLE Northwind1.dbo.DH1
GO 

DROP TABLE Northwind1.dbo.DH2
GO 

	--CÁCH NHANH GỌN
SELECT * INTO Northwind1.dbo.DH1
FROM Northwind.dbo.Orders o
WHERE o.CustomerID IN (SELECT k1.CustomerID FROM Northwind1.dbo.KH1 k1)

SELECT * INTO Northwind1.dbo.DH2
FROM Northwind.dbo.Orders o
WHERE o.CustomerID IN (SELECT k2.CustomerID FROM Northwind1.dbo.KH2 k2)

GO

DROP TABLE Northwind1.dbo.DH1
GO 

DROP TABLE Northwind1.dbo.DH2
GO 