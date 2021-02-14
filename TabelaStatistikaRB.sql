USE [SQLProjekatNFL]
GO

/****** Object:  Table [dbo].[StatistikaRB]    Script Date: 1/25/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StatistikaRB](
	[StatistikaRBID] [int] IDENTITY(1,1) NOT NULL,
	[StatistikaID] [int] NOT NULL,
	[Fumble] [int] NOT NULL,
 CONSTRAINT [PK_StatistikaRB] PRIMARY KEY CLUSTERED 
(
	[StatistikaRBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[StatistikaRB]  WITH CHECK ADD  CONSTRAINT [FK_StatistikaRB_Statistika] FOREIGN KEY([StatistikaID])
REFERENCES [dbo].[Statistika] ([StatistikaID])
GO

ALTER TABLE [dbo].[StatistikaRB] CHECK CONSTRAINT [FK_StatistikaRB_Statistika]
GO

