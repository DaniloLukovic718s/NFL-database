USE [SQLProjekatNFL]
GO

/****** Object:  Table [dbo].[Utakmica]    Script Date: 1/25/2021 10:00:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Utakmica](
	[UtakmicaID] [int] IDENTITY(1,1) NOT NULL,
	[EkipaID1] [int] NOT NULL,
	[EkipaID2] [int] NOT NULL,
	[PoeniPrviTim] [int] NOT NULL,
	[PoeniDrugiTim] [int] NOT NULL,
 CONSTRAINT [PK_Utakmica] PRIMARY KEY CLUSTERED 
(
	[UtakmicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Utakmica]  WITH CHECK ADD  CONSTRAINT [FK_Utakmica_Ekipa] FOREIGN KEY([EkipaID1])
REFERENCES [dbo].[Ekipa] ([EkipaID])
GO

ALTER TABLE [dbo].[Utakmica] CHECK CONSTRAINT [FK_Utakmica_Ekipa]
GO

ALTER TABLE [dbo].[Utakmica]  WITH CHECK ADD  CONSTRAINT [FK_Utakmica_Ekipa1] FOREIGN KEY([EkipaID2])
REFERENCES [dbo].[Ekipa] ([EkipaID])
GO

ALTER TABLE [dbo].[Utakmica] CHECK CONSTRAINT [FK_Utakmica_Ekipa1]
GO

