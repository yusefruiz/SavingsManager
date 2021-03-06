USE [master]
GO
/****** Object:  Database [SavingsManagerDB]    Script Date: 09/03/2018 2:38:17 ******/
CREATE DATABASE [SavingsManagerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SavingsManagerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SavingsManagerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SavingsManagerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SavingsManagerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SavingsManagerDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SavingsManagerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SavingsManagerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SavingsManagerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SavingsManagerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SavingsManagerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SavingsManagerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SavingsManagerDB] SET  MULTI_USER 
GO
ALTER DATABASE [SavingsManagerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SavingsManagerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SavingsManagerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SavingsManagerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SavingsManagerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SavingsManagerDB] SET QUERY_STORE = OFF
GO
USE [SavingsManagerDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SavingsManagerDB]
GO
/****** Object:  Table [dbo].[Ahorro]    Script Date: 09/03/2018 2:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ahorro](
	[idpago] [int] IDENTITY(1,1) NOT NULL,
	[IdPlan] [int] NOT NULL,
	[IdSocio] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[MontoCuota] [decimal](18, 0) NOT NULL,
	[Estado] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Ahorro] PRIMARY KEY CLUSTERED 
(
	[idpago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 09/03/2018 2:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[IdGrupo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Fecha_Creacion] [datetime] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 09/03/2018 2:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[IdPlan] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Duracion] [int] NOT NULL,
	[Periodicidad] [char](1) NOT NULL,
	[MontoCuota] [decimal](18, 0) NOT NULL,
	[FechaInicial] [datetime] NOT NULL,
	[FechaFinal] [datetime] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanesSocio]    Script Date: 09/03/2018 2:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanesSocio](
	[IdPlan] [int] NOT NULL,
	[IdSocio] [int] NOT NULL,
 CONSTRAINT [PK_PlanesSocio] PRIMARY KEY CLUSTERED 
(
	[IdPlan] ASC,
	[IdSocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socio]    Script Date: 09/03/2018 2:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socio](
	[IdSocio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido1] [nvarchar](50) NOT NULL,
	[Apellido2] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IdGrupo] [int] NOT NULL,
 CONSTRAINT [PK_Socio] PRIMARY KEY CLUSTERED 
(
	[IdSocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ahorro]  WITH CHECK ADD  CONSTRAINT [FK_Ahorro_Plan] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[Plan] ([IdPlan])
GO
ALTER TABLE [dbo].[Ahorro] CHECK CONSTRAINT [FK_Ahorro_Plan]
GO
ALTER TABLE [dbo].[Ahorro]  WITH CHECK ADD  CONSTRAINT [FK_Ahorro_Socio] FOREIGN KEY([IdSocio])
REFERENCES [dbo].[Socio] ([IdSocio])
GO
ALTER TABLE [dbo].[Ahorro] CHECK CONSTRAINT [FK_Ahorro_Socio]
GO
ALTER TABLE [dbo].[PlanesSocio]  WITH CHECK ADD  CONSTRAINT [FK_PlanesSocio_Plan] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[Plan] ([IdPlan])
GO
ALTER TABLE [dbo].[PlanesSocio] CHECK CONSTRAINT [FK_PlanesSocio_Plan]
GO
ALTER TABLE [dbo].[PlanesSocio]  WITH CHECK ADD  CONSTRAINT [FK_PlanesSocio_Socio] FOREIGN KEY([IdSocio])
REFERENCES [dbo].[Socio] ([IdSocio])
GO
ALTER TABLE [dbo].[PlanesSocio] CHECK CONSTRAINT [FK_PlanesSocio_Socio]
GO
ALTER TABLE [dbo].[Socio]  WITH CHECK ADD  CONSTRAINT [FK_Socio_Grupo] FOREIGN KEY([IdGrupo])
REFERENCES [dbo].[Grupo] ([IdGrupo])
GO
ALTER TABLE [dbo].[Socio] CHECK CONSTRAINT [FK_Socio_Grupo]
GO
USE [master]
GO
ALTER DATABASE [SavingsManagerDB] SET  READ_WRITE 
GO
