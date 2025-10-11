-- Drop the view if it already exists
IF OBJECT_ID('dbo.Full_Employee_Information', 'V') IS NOT NULL
    DROP VIEW dbo.Full_Employee_Information;
GO

-- Create the view with explicit column aliases


CREATE VIEW dbo.Full_Employee_Information
AS
SELECT 
e.EmployeeId Employee_Id,
e.FirstName First_Name,
e.LastName Last_Name,
e.Position Position,
e.RestaurantId Restaurant_Id,
res.Address Adress,
res.Name Name,
res.OpeningHours Opening_Hours,
res.PhoneNumber Phone_Number
FROM dbo.Employees e
left join Restaurants res 
on e.RestaurantId = res.RestaurantId
GO
