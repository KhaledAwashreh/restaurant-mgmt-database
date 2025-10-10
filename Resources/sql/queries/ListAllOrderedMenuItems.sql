SELECT 
    mi.Name AS MenuItemName,
    r.ReservationId
FROM dbo.Reservations r
LEFT JOIN Orders o
    ON o.OrderId = r.ReservationId
LEFT JOIN OrderItems oi
    ON o.OrderId = oi.OrderId
LEFT JOIN MenuItems mi
    ON oi.ItemId = mi.ItemId
Where r.ReservationId = @ReservationId
ORDER BY r.ReservationId;