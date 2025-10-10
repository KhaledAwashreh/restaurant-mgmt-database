SELECT 
    e.EmployeeId,
    e.FirstName,
    e.LastName,
    AVG(o.TotalAmount) AS AvgOrderAmount
FROM dbo.Employees e
LEFT JOIN dbo.Orders o
    ON o.EmployeeId = e.EmployeeId
WHERE E.EmployeeId = @EmployeeId
GROUP BY e.EmployeeId, e.FirstName, e.LastName;
