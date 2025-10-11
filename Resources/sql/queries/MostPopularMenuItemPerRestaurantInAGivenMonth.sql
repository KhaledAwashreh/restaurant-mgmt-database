USE [Restaurant Reservation Management ]
GO
DECLARE @GivenDate DATE = '2025-10-11';  -- Your parameter


WITH CTE_Menu_Item_Selections_Per_Restaurant AS( select 
mi.Name Menu_Item_Name,
o.OrderDate Order_Date,
r.RestaurantId Restaurant_Id
from dbo.Restaurants r
	join dbo.Reservations res
		on res.RestaurantId = r.RestaurantId
		join dbo.Orders o 
			on o.ReservationId = res.ReservationId
			join dbo.OrderItems oi
				on o.OrderId = oi.OrderId
					join MenuItems mi 
					on mi.ItemId = oi.ItemId
),
 CTE_ORDER_FREQUENCY_PER_RESTAURANT_IN_GIVEN_MONTH as(
SELECT 
COUNT(CTE_Menu_Item_Selections_Per_Restaurant.Menu_Item_Name) order_frequency_count,
	Menu_Item_Name,
	CTE_Menu_Item_Selections_Per_Restaurant.Restaurant_Id
	FROM CTE_Menu_Item_Selections_Per_Restaurant 
	where YEAR(Order_Date) = YEAR(@GivenDate) AND MONTH(Order_Date) = MONTH(@GivenDate)
	Group by Menu_Item_Name, CTE_Menu_Item_Selections_Per_Restaurant.Restaurant_Id
)

SELECT 

Menu_Item_Name,
Restaurant_Id,
order_frequency_count,
DENSE_RANK  () OVER (PARTITION BY Restaurant_Id ORDER BY order_frequency_count DESC) as rank_place
from CTE_ORDER_FREQUENCY_PER_RESTAURANT_IN_GIVEN_MONTH
