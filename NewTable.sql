USE MusicDatabase;
GO

SELECT 'Customer.CustomerName' AS Names FROM Customer;
GO  

SELECT TOP 10 CustomerName FROM Customer;
GO

SELECT TOP 10 CustomerID, OrderID FROM Shipping ORDER BY ShippingDay DESC;

SELECT TOP 10 CustomerID, ArtistID FROM ArtistCustomer ORDER BY CustomerID DESC;

SELECT TOP 10 SongID, OrderID FROM OrderSong ORDER BY SongID DESC;


SET NOCOUNT ON;


SELECT COUNT (DISTINCT [CreditNumber]) DistinctValue FROM [Payment];


SELECT TOP 10 AlbumName, ReleaseDate FROM Albums ORDER BY ArtistID;


SELECT CONCAT ('Album', 'AlbumSongs') AS 'AlbumPlaylist';


SELECT TOP 10 PaymentID FROM Shipping;
SELECT MAX(PaymentID) AS 'MaxPayment' FROM Payment;
SELECT MIN(PaymentID) AS 'MinPayment' FROM PAYMENT;
SELECT AVG(PaymentID) AS 'FinalPayment' FROM PAYMENT;
SELECT SUM(PaymentID) AS 'TotalCustomerPayment' FROM PAYMENT;


SELECT TOP 10 *
FROM Payment
ORDER BY CreditNumber;



SELECT TOP 10 *
FROM Customer c LEFT JOIN MusicOrder o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;
GO


