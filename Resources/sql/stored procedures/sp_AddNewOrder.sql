

CREATE OR ALTER PROCEDURE sp_AddNewOrder
    @ReservationId BIGINT,
    @EmployeeId BIGINT,
    @OrderDate DATETIME,
    @TotalAmount DECIMAL(18, 0)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the reservation exists
    IF NOT EXISTS (SELECT 1 FROM dbo.Reservations WHERE ReservationId = @ReservationId)
    BEGIN
        RAISERROR('Error: Reservation does not exist.');
        RETURN;
    END

    -- Check if the employee exists
    IF NOT EXISTS (SELECT 1 FROM dbo.Employees WHERE EmployeeId = @EmployeeId)
    BEGIN
        RAISERROR('Error: Employee does not exist.');
        RETURN;
    END

    -- Insert new order
    INSERT INTO dbo.Orders (ReservationId, EmployeeId, OrderDate, TotalAmount)
    VALUES (@ReservationId, @EmployeeId, @OrderDate, @TotalAmount);

    -- Return success message
    SELECT 'New order added successfully.' AS Message;
END
GO
