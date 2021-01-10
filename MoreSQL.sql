USE MusicDatabase;
GO

GO
CREATE FUNCTION OpenShippingDay (@CustomerID INT)
RETURNS NVARCHAR (225)
AS
BEGIN
    DECLARE @CustomerName NVARCHAR(225);
    SELECT @CustomerName = @CustomerName
    FROM Shipping.Customer.C
    WHERE C.CustomerID = @CustomerID
    RETURN @CustomerName;
END;




GO
CREATE FUNCTION GetMusicDate (
    @OrderID INT 
)
RETURNS TABLE
AS
RETURN (SELECT * FROM MusicOrder WHERE OrderID = @OrderID)



GO
CREATE FUNCTION GetShipping()
RETURNS @Shipping Table (ShippingDay NVARCHAR(225), CustomerID INT, PaymentID INT)
AS
BEGIN 
INSERT INTO @Shipping
SELECT ShippingDay, CustomerID, PaymentID
FROM Shipping
RETURN
END;





GO
CREATE PROCEDURE FindCustomerName
AS BEGIN
SELECT * FROM Customer

END;


GO
CREATE PROCEDURE FindCustomers
    @CustomerID INT,
    @Name NVARCHAR(225)
AS BEGIN

BEGIN TRY
BEGIN TRANSACTION

UPDATE Customer
SET CustomerName = @Name
WHERE CustomerID = CustomerID

COMMIT

END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
         ROLLBACK
 RETURN -1
   END CATCH
END;


