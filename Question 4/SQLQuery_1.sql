USE AdventureWorks2017
GO

ALTER PROCEDURE uspGETLIST
    @Product VARCHAR(40), 
    @MaxPrice MONEY, 
    @ComparePrice MONEY OUTPUT, 
    @ListPrice MONEY OUTPUT
AS
    SELECT sub.[Name] AS 'Product Name', ListPrice AS 'list Price'
    FROM Production.Product pro
    JOIN Production.ProductSubcategory sub ON PRO.ProductSubcategoryID = sub.ProductSubcategoryID
    
    WHERE sub.Name LIKE @Product AND pro.ListPrice < @MaxPrice
    SET @ListPrice = ( SELECT MAX(ListPrice)
        FROM Production.Product AS pro) 
    
    SET @ComparePrice = @MaxPrice;
GO
---------------------------------------------

DECLARE @price MONEY, @cost MONEY;
EXEC dbo.uspGETLIST '%Bikes%', 700, @price OUTPUT, @cost OUTPUT
IF @cost <= @price
BEGIN
    PRINT ('Cost price is less than compare price')
END
ELSE
BEGIN
    PRINT ('Cost price is greater than compare price')
END


SELECT [Name] from Production.ProductSubcategory
WHERE [Name] LIKE '%Bikes%'







    -----------------
SELECT * FROM Production.ProductSubcategory