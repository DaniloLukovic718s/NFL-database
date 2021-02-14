USE [SQLProjekatNFL]
GO

/****** Object:  Table [dbo].[Ekipa]    Script Date: 1/25/2021 11:40:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ekipa](
	[EkipaID] [int] IDENTITY(1,1) NOT NULL,
	[NazivEkipe] [nvarchar](50) NOT NULL,
	[ImeDrzave] [nchar](50) NOT NULL,
	[ImeStadiona] [nchar](50) NOT NULL,
	[KapacitetStadiona] [int] NOT NULL,
 CONSTRAINT [PK_Ekipa] PRIMARY KEY CLUSTERED 
(
	[EkipaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
