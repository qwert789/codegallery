IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SectorTimes_Athletes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SectorTimes]'))
ALTER TABLE [dbo].[SectorTimes] DROP CONSTRAINT [FK_SectorTimes_Athletes]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SectorTimes_Races]') AND parent_object_id = OBJECT_ID(N'[dbo].[SectorTimes]'))
ALTER TABLE [dbo].[SectorTimes] DROP CONSTRAINT [FK_SectorTimes_Races]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SectorTimes_Sectors]') AND parent_object_id = OBJECT_ID(N'[dbo].[SectorTimes]'))
ALTER TABLE [dbo].[SectorTimes] DROP CONSTRAINT [FK_SectorTimes_Sectors]
GO
/****** Object:  Table [dbo].[Athletes]    Script Date: 10/22/2008 07:37:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Athletes]') AND type in (N'U'))
DROP TABLE [dbo].[Athletes]
GO
/****** Object:  Table [dbo].[SectorTimes]    Script Date: 10/22/2008 07:37:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SectorTimes]') AND type in (N'U'))
DROP TABLE [dbo].[SectorTimes]
GO
/****** Object:  Table [dbo].[Races]    Script Date: 10/22/2008 07:37:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Races]') AND type in (N'U'))
DROP TABLE [dbo].[Races]
GO
/****** Object:  Table [dbo].[Sectors]    Script Date: 10/22/2008 07:37:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sectors]') AND type in (N'U'))
DROP TABLE [dbo].[Sectors]
GO
/****** Object:  Table [dbo].[Athletes]    Script Date: 10/22/2008 07:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Athletes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Athletes](
	[AthleteId] [int] NOT NULL,
	[AthleteName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Athletes] PRIMARY KEY CLUSTERED 
(
	[AthleteId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SectorTimes]    Script Date: 10/22/2008 07:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SectorTimes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SectorTimes](
	[RaceId] [int] NOT NULL,
	[AthleteId] [int] NOT NULL,
	[SectorId] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Duration] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Races]    Script Date: 10/22/2008 07:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Races]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Races](
	[RaceId] [int] NOT NULL,
	[RaceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Races] PRIMARY KEY CLUSTERED 
(
	[RaceId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sectors]    Script Date: 10/22/2008 07:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sectors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sectors](
	[SectorId] [int] NOT NULL,
	[SectorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sectors] PRIMARY KEY CLUSTERED 
(
	[SectorId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SectorTimes_Athletes]') AND parent_object_id = OBJECT_ID(N'[dbo].[SectorTimes]'))
ALTER TABLE [dbo].[SectorTimes]  WITH CHECK ADD  CONSTRAINT [FK_SectorTimes_Athletes] FOREIGN KEY([AthleteId])
REFERENCES [dbo].[Athletes] ([AthleteId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SectorTimes_Races]') AND parent_object_id = OBJECT_ID(N'[dbo].[SectorTimes]'))
ALTER TABLE [dbo].[SectorTimes]  WITH CHECK ADD  CONSTRAINT [FK_SectorTimes_Races] FOREIGN KEY([RaceId])
REFERENCES [dbo].[Races] ([RaceId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SectorTimes_Sectors]') AND parent_object_id = OBJECT_ID(N'[dbo].[SectorTimes]'))
ALTER TABLE [dbo].[SectorTimes]  WITH CHECK ADD  CONSTRAINT [FK_SectorTimes_Sectors] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sectors] ([SectorId])
GO
