USE [master]
GO
/****** Object:  Database [TONAR_PCs_DB]    Script Date: 04.06.2021 14:04:20 ******/
CREATE DATABASE [TONAR_PCs_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TONAR_PCs_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TONAR_PCs_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TONAR_PCs_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TONAR_PCs_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TONAR_PCs_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TONAR_PCs_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TONAR_PCs_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TONAR_PCs_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TONAR_PCs_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TONAR_PCs_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TONAR_PCs_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TONAR_PCs_DB] SET  MULTI_USER 
GO
ALTER DATABASE [TONAR_PCs_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TONAR_PCs_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TONAR_PCs_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TONAR_PCs_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TONAR_PCs_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TONAR_PCs_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TONAR_PCs_DB] SET QUERY_STORE = OFF
GO
USE [TONAR_PCs_DB]
GO
/****** Object:  Table [dbo].[Drives]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drives](
	[id] [int] NOT NULL,
	[idType] [int] NOT NULL,
	[idManufacturer] [int] NOT NULL,
	[Volume] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrivesTypes]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrivesTypes](
	[id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HardwareManufacturers]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HardwareManufacturers](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motherboards]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motherboards](
	[id] [int] NOT NULL,
	[idHardwareManufacturer] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[idSBridge] [int] NOT NULL,
	[idSocket] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherboardsSBridges]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherboardsSBridges](
	[id] [int] NOT NULL,
	[idProcessorsVendors] [int] NOT NULL,
	[Model] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processors]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processors](
	[id] [int] NOT NULL,
	[idModel] [int] NOT NULL,
	[idVendor] [int] NOT NULL,
	[idMark] [int] NOT NULL,
	[idSocket] [int] NOT NULL,
	[idIndex] [int] NULL,
	[CacheL1] [int] NOT NULL,
	[CacheL2] [int] NOT NULL,
	[CacheL3] [int] NULL,
	[Tickspeed] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorsIndexes]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorsIndexes](
	[id] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorsMarks]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorsMarks](
	[id] [int] NOT NULL,
	[Mark] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorsModels]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorsModels](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorsVendors]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorsVendors](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAM]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAM](
	[id] [int] NOT NULL,
	[idHardwareManufacturer] [int] NOT NULL,
	[idVolume] [int] NOT NULL,
	[TickSpeed] [int] NOT NULL,
	[idType] [int] NOT NULL,
	[Model] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAMTypes]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAMTypes](
	[id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAMVolumes]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAMVolumes](
	[id] [int] NOT NULL,
	[Volumes] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sockets]    Script Date: 04.06.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sockets](
	[id] [int] NOT NULL,
	[Socket] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TONAR_PCs_DB] SET  READ_WRITE 
GO
