USE [Restaurant Reservation Management ]
GO

/****** Object:  Table [dbo].[AuditLog]    Script Date: 10/17/2025 10:47:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AuditLog](
	[ResturantId] [bigint] NOT NULL,
	[TableId] [bigint] NOT NULL,
	[ReservationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NOT NULL
) ON [PRIMARY]
GO


