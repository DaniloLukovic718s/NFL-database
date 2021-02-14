USE [SQLProjekatNFL]
GO

/****** Object:  Table [dbo].[Raspored]    Script Date: 1/25/2021 9:58:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Raspored](
	[RasporedID] [int] IDENTITY(1,1) NOT NULL,
	[UtakmicaID] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[BrojKola] [int] NOT NULL,
 CONSTRAINT [PK_Raspored] PRIMARY KEY CLUSTERED 
(
	[RasporedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Raspored]  WITH CHECK ADD  CONSTRAINT [FK_Raspored_Utakmica] FOREIGN KEY([UtakmicaID])
REFERENCES [dbo].[Utakmica] ([UtakmicaID])
GO

ALTER TABLE [dbo].[Raspored] CHECK CONSTRAINT [FK_Raspored_Utakmica]
GO

