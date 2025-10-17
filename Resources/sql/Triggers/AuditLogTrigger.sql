CREATE TRIGGER trigger_name
ON [dbo].[Reservations]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;  -- Always include this in triggers

    -- Handle INSERTs
    IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
    BEGIN
        PRINT 'An INSERT occurred.';
        INSERT INTO [dbo].[AuditLog] (ResturantId, TableId, ReservationDate, ChangeDate)
        SELECT 
            i.RestaurantId,
            i.TableId,
            i.ReservationDate,
            GETDATE() AS ChangeDate
            FROM inserted i;
    END

    -- Handle UPDATEs
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        PRINT 'An UPDATE occurred.';
        INSERT INTO [dbo].[AuditLog] (ResturantId, TableId, ReservationDate, ChangeDate)
        SELECT 
            i.RestaurantId,
            i.TableId,
            i.ReservationDate,
            GETDATE() AS ChangeDate
        FROM inserted i;
    END
END;
GO
