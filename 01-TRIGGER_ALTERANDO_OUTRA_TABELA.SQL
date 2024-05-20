CREATE TRIGGER TriggerOrderDetails
ON dbo.OrderDetails
AFTER INSERT
AS
BEGIN
	DECLARE
		@Amount real,
		@SalesmanID int

	SELECT 	@Amount= INSERTED.Amount,
		@SalesmanID= INSERTED.[Salesman ID]
	FROM INSERTED
	
	UPDATE dbo.Sales
	SET [Total Sales]= [Total Sales] + @Amount
	WHERE [Salesman ID]= @SalesmanID
END