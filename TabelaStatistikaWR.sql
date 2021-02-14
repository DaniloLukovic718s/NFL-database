USE [SQLProjekatNFL]
GO

/****** Object:  Table [dbo].[StatistikaWR]    Script Date: 1/25/2021 9:59:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StatistikaWR](
	[StatistikaWRID] [int] IDENTITY(1,1) NOT NULL,
	[StatistikaID] [int] NOT NULL,
	[Meta] [int] NOT NULL,
	[Uspesnost] [float] NOT NULL,
 CONSTRAINT [PK_StatistikaWR] PRIMARY KEY CLUSTERED 
(
	[StatistikaWRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[StatistikaWR]  WITH CHECK ADD  CONSTRAINT [FK_StatistikaWR_Statistika] FOREIGN KEY([StatistikaID])
REFERENCES [dbo].[Statistika] ([StatistikaID])
GO

ALTER TABLE [dbo].[StatistikaWR] CHECK CONSTRAINT [FK_StatistikaWR_Statistika]
GO

