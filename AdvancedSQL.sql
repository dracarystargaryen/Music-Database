USE MusicDatabase;
GO

--Two Grouped Queries
SELECT Customer.CustomerName, COUNT(MusicORder.OrderID) AS OrderDate FROM MusicOrder 
LEFT JOIN Customer ON MusicOrder.CustomerID = Customer.CustomerID
GROUP BY CustomerName;

--Create Temp
CREATE TABLE #MusicTemp (
    CustomerID INT NOT NULL,
    CustomerName NVARCHAR(225),

);
INSERT INTO #MusicTemp(CustomerID, CustomerName)
SELECT CustomerID AS C, CustomerName AS T
FROM Customer


--Merge
MERGE Customer AS TARGET
USING #MusicTemp AS SOURCE
ON (TARGET.CustomerID = SOURCE.CustomerID)

WHEN MATCHED AND TARGET.CustomerID = SOURCE.CustomerID
THEN UPDATE SET TARGET.CustomerName = SOURCE.CustomerName;


--CTE
WITH CTE(ShippingID, ShippingDay)
AS(
    SELECT ShippingID, ShippingDay
    FROM Shipping
    WHERE CustomerID IS NOT NULL
    UNION ALL 
    SELECT s.ShippingID, s.ShippingDay
    FROM Shipping s
    INNER JOIN CTE r 
    ON s.ShippingID = r.ShippingID

)



--Date
SELECT ReleaseDate 
FROM Albums
WHERE ReleaseDate = '20110805';