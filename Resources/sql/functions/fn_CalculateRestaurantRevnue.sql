CREATE OR ALTER FUNCTION dbo.fn_CalculateRevenue (@RestaurantId BIGINT)
RETURNS DECIMAL(10,3)
AS
BEGIN
    DECLARE @revenue DECIMAL(10,3);

    SELECT @revenue = SUM(o.TotalAmount)
    FROM [dbo].[Reservations] re
        JOIN [dbo].[Orders] o 
            ON o.ReservationId = re.ReservationId
    WHERE re.RestaurantId = @RestaurantId;

    RETURN ISNULL(@revenue, 0);
END;
GO  