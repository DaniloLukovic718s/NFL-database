USE [SQLProjekatNFL]
GO

/****** Object:  Table [dbo].[Statistika]    Script Date: 1/25/2021 9:59:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Statistika](
	[StatistikaID] [int] IDENTITY(1,1) NOT NULL,
	[IgracID] [int] NOT NULL,
	[Jardi] [float] NOT NULL,
	[Pokusaji] [int] NOT NULL,
	[TD] [int] NOT NULL,
	[Preko20] [int] NOT NULL,
	[Preko40] [int] NOT NULL,
 CONSTRAINT [PK_Statistika] PRIMARY KEY CLUSTERED 
(
	[StatistikaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Statistika]  WITH CHECK ADD  CONSTRAINT [FK_Statistika_Igrac] FOREIGN KEY([IgracID])
REFERENCES [dbo].[Igrac] ([IgracID])
GO

ALTER TABLE [dbo].[Statistika] CHECK CONSTRAINT [FK_Statistika_Igrac]
GO

