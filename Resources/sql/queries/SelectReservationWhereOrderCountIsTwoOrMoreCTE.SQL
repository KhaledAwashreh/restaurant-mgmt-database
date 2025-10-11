with cte_reservations_with_orders as (

select
res.ReservationId,
COUNT(o.OrderId) as OrderCount
from Reservations res
join Orders o
on o.ReservationId = res.ReservationId
group by res.ReservationId
)
select * 
from cte_reservations_with_orders
where OrderCount>=2