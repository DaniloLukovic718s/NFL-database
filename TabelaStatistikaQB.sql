USE [SQLProjekatNFL]
GO

/****** Object:  Table [dbo].[StatistikaQB]    Script Date: 1/25/2021 9:59:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StatistikaQB](
	[StatistikaQBID] [int] IDENTITY(1,1) NOT NULL,
	[StatistikaID] [int] NOT NULL,
	[Interception] [int] NOT NULL,
	[ProcenatUspesnosti] [float] NOT NULL,
	[Sack] [int] NOT NULL,
 CONSTRAINT [PK_StatistikaQB] PRIMARY KEY CLUSTERED 
(
	[StatistikaQBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[StatistikaQB]  WITH CHECK ADD  CONSTRAINT [FK_StatistikaQB_Statistika] FOREIGN KEY([StatistikaID])
REFERENCES [dbo].[Statistika] ([StatistikaID])
GO

ALTER TABLE [dbo].[StatistikaQB] CHECK CONSTRAINT [FK_StatistikaQB_Statistika]
GO

