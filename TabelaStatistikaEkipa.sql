USE [SQLProjekatNFL]
GO

/****** Object:  Table [dbo].[StatistikaEkipa]    Script Date: 1/25/2021 9:59:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StatistikaEkipa](
	[StatistikaEkipaID] [int] IDENTITY(1,1) NOT NULL,
	[EkipaID] [int] NOT NULL,
	[JardiBacanjem] [int] NOT NULL,
	[JardiTrcanjem] [int] NOT NULL,
	[UkupnoJardi] [int] NOT NULL,
	[Touchdown] [int] NOT NULL,
 CONSTRAINT [PK_StatistikaEkipa] PRIMARY KEY CLUSTERED 
(
	[StatistikaEkipaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[StatistikaEkipa]  WITH CHECK ADD  CONSTRAINT [FK_StatistikaEkipa_Ekipa] FOREIGN KEY([EkipaID])
REFERENCES [dbo].[Ekipa] ([EkipaID])
GO

ALTER TABLE [dbo].[StatistikaEkipa] CHECK CONSTRAINT [FK_StatistikaEkipa_Ekipa]
GO

