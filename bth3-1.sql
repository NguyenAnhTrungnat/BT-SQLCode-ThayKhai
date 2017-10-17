USE Northwind
GO

CREATE FUNCTION ChaoBan(@ten nvarchar(50))
RETURNS nvarchar(50)
AS
BEGIN
	RETURN N'Xin chào bạn ' + @ten 
END
GO

PRINT dbo.ChaoBan(N'Trung')
GO

SELECT dbo.ChaoBan(N'Nguyễn Anh Trung') AS N'Lời chào'
GO