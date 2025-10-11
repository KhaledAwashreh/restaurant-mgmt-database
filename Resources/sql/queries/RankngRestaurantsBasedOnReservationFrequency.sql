WITH rAndRes as(
select 
r.RestaurantId as RestaurantId,
count(res.restaurantId) reservationCount
from Restaurants r
join Reservations res
on r.RestaurantId = res.RestaurantId
group by r.RestaurantId
)

SELECT 
    rAndRes.RestaurantId,
    rAndRes.ReservationCount,
    RANK() OVER (ORDER BY rAndRes.ReservationCount DESC) AS Rank_No
FROM rAndRes
ORDER BY Rank_No;
