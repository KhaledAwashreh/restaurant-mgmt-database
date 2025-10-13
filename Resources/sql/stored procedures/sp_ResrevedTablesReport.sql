CREATE OR ALTER PROCEDURE sp_ReservedTablesReport(@StartDate DateTime, @EndDate DateTime)
AS
	Select 
	res.ReservationDate as Reservation_Date,
	res.PartySize as Party_Size,
	res.TableId as Table_Id,
	t.Capacity as Table_Capacity,
	r.Name as Restaurant_Name,
	r.Address as Restaurant_Address,
	r.OpeningHours as Opening_Hours
	From [dbo].[Restaurants] r 
		join [dbo].[Reservations] res
		on res.ReservationId = r.RestaurantId
		join [dbo].[Tables] t 
		on t.TableId = res.TableId
	Where res.ReservationDate >= @StartDate AND res.ReservationDate < @EndDate
GO