IF OBJECT_ID('tempdb..#TablesTemp') IS NOT NULL
    DROP TABLE #TablesTemp;

CREATE TABLE #TablesTemp(
Capacity int,
RestaurantId bigint,
TableId bigint);

GO

CREATE OR ALTER PROCEDURE sp_RetrieveFutureReservations
AS
	SELECT t.Capacity as Capacity,
	t.RestaurantId as RestaurantId,
	t.TableId as TableId
	From [dbo].[Reservations] r
	join [dbo].[Tables] t 
	on t.TableId = r.TableId
	WHERE r.ReservationDate > GETDATE()
GO

INSERT INTO #TablesTemp
EXECUTE  sp_RetrieveFutureReservations

SELECT 
r.RestaurantId,
r.Name,
r.Address,
r.PhoneNumber
FROM #TablesTemp tt
join [dbo].[Restaurants] r 
on tt.RestaurantId = r.RestaurantId

