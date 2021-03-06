USE [master]
GO
/****** Object:  Database [TONAR_PCs_DB]    Script Date: 06.07.2021 20:42:26 ******/
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
/****** Object:  UserDefinedFunction [dbo].[ReturnBuildingID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ReturnBuildingID](@BuildingName as nvarchar(max))
returns int
begin
declare @RetID as int
select @RetID = id from Buildings where Name like @BuildingName
return @RetID
end
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnDepartmentID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ReturnDepartmentID](@Name as nvarchar(max))
returns int
begin
declare @RetID as int
select @RetID = id from Departments where name = @name
return @RetID
end
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnDriveTypeID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ReturnDriveTypeID](@TypeName as nvarchar(max))
returns int 
begin
declare @RetID as int
select @RetID = id from DrivesTypes where Type = @TypeName
return @RetID
end
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnManufacturerID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ReturnManufacturerID](@MName as varchar(max))
returns int 
begin 
declare @RetID as int
select @RetID = id from HardwareManufacturers where Name like @MName
return @RetID
end
GO
/****** Object:  UserDefinedFunction [dbo].[returnpcid]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[returnpcid](@N as nvarchar(max))
returns int 
begin
declare @r as int
select @r = id from computers where username like @n
return @r
end
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnProcessorMarkID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ReturnProcessorMarkID](@ProcessorMark as nvarchar(60))
returns int
begin
declare @RetID as int
select @RetID = id from ProcessorsMarks where Mark like @ProcessorMark
return @RetID
end
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnProcessorModelID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ReturnProcessorModelID](@ModelName as nvarchar(max))
RETURNS int 
as
begin
declare @id int
select @id = id from ProcessorsModels 
where name like @ModelName
return @id
end 
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnProcessorVendorID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ReturnProcessorVendorID](@VendorName as varchar(MAX))
returns int
as 
begin
declare @retid int 
select @retid = id from ProcessorsVendors
where name like @VendorName
return @retid
end
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnRAMTypeID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ReturnRAMTypeID](@Name as nvarchar(max))
returns int
begin
declare @r as int
select @r = id from RAMTypes where Type like @Name
return @r
end
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnSocketID]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Function [dbo].[ReturnSocketID](@Name as nvarchar(max))
returns int
begin
declare @retID as int
select @retID = id from Sockets where Socket like @Name
return @retID
end
GO
/****** Object:  Table [dbo].[RAM]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idHardwareManufacturer] [int] NOT NULL,
	[Volume] [int] NOT NULL,
	[TickSpeed] [int] NOT NULL,
	[idType] [int] NOT NULL,
	[Model] [nvarchar](50) NULL,
 CONSTRAINT [PK_RAM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HardwareManufacturers]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HardwareManufacturers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HardwareManufacturers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAMTypes]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAMTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RAMTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_ramstandart]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_ramstandart] as
SELECT        dbo.HardwareManufacturers.Name, dbo.RAM.Volume, dbo.RAM.TickSpeed, dbo.RAMTypes.Type, dbo.RAM.Model
FROM            dbo.RAM INNER JOIN
                         dbo.HardwareManufacturers ON dbo.HardwareManufacturers.id = dbo.RAM.idHardwareManufacturer INNER JOIN
                         dbo.RAMTypes ON dbo.RAMTypes.id = dbo.RAM.idType
GO
/****** Object:  Table [dbo].[Processors]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idModel] [int] NOT NULL,
	[idVendor] [int] NOT NULL,
	[idMark] [int] NOT NULL,
	[idSocket] [int] NOT NULL,
	[CacheL1] [int] NOT NULL,
	[CacheL2] [int] NOT NULL,
	[CacheL3] [int] NULL,
	[Tickspeed] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Processors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorsMarks]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorsMarks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Mark] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_ProcessorsMarks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorsModels]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorsModels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProcessorsModels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sockets]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sockets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Socket] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sockets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorsVendors]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorsVendors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProcessorsVendors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ProcessorsStandart]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_ProcessorsStandart]
as
Select Processors.id, Processors.CacheL1,
Processors.CacheL2, Processors.CacheL3,
Processors.Tickspeed, ProcessorsVendors.Name as vName,
ProcessorsVendors.Picture, ProcessorsMarks.Mark,
ProcessorsModels.Name, Sockets.Socket 
from processors
join ProcessorsVendors on ProcessorsVendors.id = Processors.idVendor
join ProcessorsModels on ProcessorsModels.id = processors.idModel
join ProcessorsMarks on ProcessorsMarks.id = Processors.idMark
join Sockets on Sockets.id = Processors.idSocket
GO
/****** Object:  Table [dbo].[Drives]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drives](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idType] [int] NOT NULL,
	[idManufacturer] [int] NOT NULL,
	[Volume] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Drives] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrivesTypes]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrivesTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DrivesTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_DrivesStandart]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_DrivesStandart] as
select drives.Volume, Drives.Model, DrivesTypes.Type, HardwareManufacturers.Name from Drives
join DrivesTypes on DrivesTypes.id = drives.idType
join HardwareManufacturers on HardwareManufacturers.id = drives.idManufacturer
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingsAndDepartments]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingsAndDepartments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBuilding] [int] NOT NULL,
	[idDepartment] [int] NOT NULL,
 CONSTRAINT [PK_BuildingsAndDepartments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idMotherBoard] [int] NOT NULL,
	[idProcessor] [int] NOT NULL,
	[idRam] [int] NOT NULL,
	[RamPlatesCount] [int] NOT NULL,
	[idVideoAdapter] [int] NULL,
	[idDriveSet] [int] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Computers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentsAndComputers]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentsAndComputers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idComputer] [int] NOT NULL,
	[idDepartment] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentsAndComputers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriveSets]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriveSets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[D1] [int] NOT NULL,
	[D2] [int] NULL,
 CONSTRAINT [PK_DriveSets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motherboards]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motherboards](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idHardwareManufacturer] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[idSBridge] [int] NOT NULL,
	[idSocket] [int] NOT NULL,
 CONSTRAINT [PK_Motherboards] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherboardsSBridges]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherboardsSBridges](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProcessorsVendors] [int] NOT NULL,
	[Model] [int] NOT NULL,
 CONSTRAINT [PK_MotherboardsSBridges] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorsVendorsAndModels]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorsVendorsAndModels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idVendor] [int] NOT NULL,
	[idModel] [int] NOT NULL,
 CONSTRAINT [PK_ProcessorsVendorsAndModels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocketsAndVendors]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocketsAndVendors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSocket] [int] NOT NULL,
	[idVendor] [int] NOT NULL,
 CONSTRAINT [PK_SocketsAndVendors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoAdapts]    Script Date: 06.07.2021 20:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoAdapts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idManufacturer] [int] NOT NULL,
	[idProcessorsVendors] [int] NOT NULL,
	[Volume] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VideoAdapts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([id], [Name]) VALUES (5, N'Производственный цех')
INSERT [dbo].[Buildings] ([id], [Name]) VALUES (6, N'Офисный комплекс')
INSERT [dbo].[Buildings] ([id], [Name]) VALUES (7, N'Столовая')
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[BuildingsAndDepartments] ON 

INSERT [dbo].[BuildingsAndDepartments] ([id], [idBuilding], [idDepartment]) VALUES (9, 5, 8)
INSERT [dbo].[BuildingsAndDepartments] ([id], [idBuilding], [idDepartment]) VALUES (10, 6, 9)
INSERT [dbo].[BuildingsAndDepartments] ([id], [idBuilding], [idDepartment]) VALUES (11, 5, 10)
INSERT [dbo].[BuildingsAndDepartments] ([id], [idBuilding], [idDepartment]) VALUES (12, 7, 11)
SET IDENTITY_INSERT [dbo].[BuildingsAndDepartments] OFF
GO
SET IDENTITY_INSERT [dbo].[Computers] ON 

INSERT [dbo].[Computers] ([id], [idMotherBoard], [idProcessor], [idRam], [RamPlatesCount], [idVideoAdapter], [idDriveSet], [Username]) VALUES (8, 5, 1, 1, 2, 1, 1, N'CEH-OIT-1')
INSERT [dbo].[Computers] ([id], [idMotherBoard], [idProcessor], [idRam], [RamPlatesCount], [idVideoAdapter], [idDriveSet], [Username]) VALUES (9, 5, 1, 1, 1, 1, 1, N'STL-KASSA-1')
SET IDENTITY_INSERT [dbo].[Computers] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([id], [Name]) VALUES (8, N'Отдел информационных технологий')
INSERT [dbo].[Departments] ([id], [Name]) VALUES (9, N'3 этаж')
INSERT [dbo].[Departments] ([id], [Name]) VALUES (10, N'Токарный цех')
INSERT [dbo].[Departments] ([id], [Name]) VALUES (11, N'Касса столовой')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentsAndComputers] ON 

INSERT [dbo].[DepartmentsAndComputers] ([id], [idComputer], [idDepartment]) VALUES (3, 8, 8)
INSERT [dbo].[DepartmentsAndComputers] ([id], [idComputer], [idDepartment]) VALUES (4, 9, 11)
SET IDENTITY_INSERT [dbo].[DepartmentsAndComputers] OFF
GO
SET IDENTITY_INSERT [dbo].[Drives] ON 

INSERT [dbo].[Drives] ([id], [idType], [idManufacturer], [Volume], [Model]) VALUES (1, 1, 2, 250, N'870 EVO SATA')
INSERT [dbo].[Drives] ([id], [idType], [idManufacturer], [Volume], [Model]) VALUES (2, 2, 3, 1000, N'WD10EZEX')
SET IDENTITY_INSERT [dbo].[Drives] OFF
GO
SET IDENTITY_INSERT [dbo].[DriveSets] ON 

INSERT [dbo].[DriveSets] ([id], [D1], [D2]) VALUES (1, 1, 2)
INSERT [dbo].[DriveSets] ([id], [D1], [D2]) VALUES (2, 2, NULL)
SET IDENTITY_INSERT [dbo].[DriveSets] OFF
GO
SET IDENTITY_INSERT [dbo].[DrivesTypes] ON 

INSERT [dbo].[DrivesTypes] ([id], [Type]) VALUES (1, N'SATA SSD')
INSERT [dbo].[DrivesTypes] ([id], [Type]) VALUES (2, N'SATA HDD')
SET IDENTITY_INSERT [dbo].[DrivesTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[HardwareManufacturers] ON 

INSERT [dbo].[HardwareManufacturers] ([id], [Name]) VALUES (1, N'Asus')
INSERT [dbo].[HardwareManufacturers] ([id], [Name]) VALUES (2, N'Samsung')
INSERT [dbo].[HardwareManufacturers] ([id], [Name]) VALUES (3, N'Western Digital')
SET IDENTITY_INSERT [dbo].[HardwareManufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[Motherboards] ON 

INSERT [dbo].[Motherboards] ([id], [idHardwareManufacturer], [Model], [idSBridge], [idSocket]) VALUES (5, 1, N'PRIME H310M-R', 3, 3)
SET IDENTITY_INSERT [dbo].[Motherboards] OFF
GO
SET IDENTITY_INSERT [dbo].[MotherboardsSBridges] ON 

INSERT [dbo].[MotherboardsSBridges] ([id], [idProcessorsVendors], [Model]) VALUES (3, 3, 310)
SET IDENTITY_INSERT [dbo].[MotherboardsSBridges] OFF
GO
SET IDENTITY_INSERT [dbo].[Processors] ON 

INSERT [dbo].[Processors] ([id], [idModel], [idVendor], [idMark], [idSocket], [CacheL1], [CacheL2], [CacheL3], [Tickspeed]) VALUES (1, 4, 3, 1, 1, 64, 128, 9216, N'3,7 GHz   ')
INSERT [dbo].[Processors] ([id], [idModel], [idVendor], [idMark], [idSocket], [CacheL1], [CacheL2], [CacheL3], [Tickspeed]) VALUES (2, 1002, 3, 5, 1002, 32, 32, 2048, N'2.4GHz    ')
INSERT [dbo].[Processors] ([id], [idModel], [idVendor], [idMark], [idSocket], [CacheL1], [CacheL2], [CacheL3], [Tickspeed]) VALUES (3, 9, 4, 2, 2, 64, 128, 9216, N'3.2GHz    ')
INSERT [dbo].[Processors] ([id], [idModel], [idVendor], [idMark], [idSocket], [CacheL1], [CacheL2], [CacheL3], [Tickspeed]) VALUES (4, 7, 4, 2, 2, 64, 256, 12198, N'3,9 ГГц   ')
INSERT [dbo].[Processors] ([id], [idModel], [idVendor], [idMark], [idSocket], [CacheL1], [CacheL2], [CacheL3], [Tickspeed]) VALUES (5, 3, 3, 4, 1, 32, 128, 512, N'2.88      ')
SET IDENTITY_INSERT [dbo].[Processors] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessorsMarks] ON 

INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (1, N'9600k')
INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (2, N'3360')
INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (3, N'9900')
INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (4, N'880')
INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (5, N'q6600')
SET IDENTITY_INSERT [dbo].[ProcessorsMarks] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessorsModels] ON 

INSERT [dbo].[ProcessorsModels] ([id], [Name]) VALUES (3, N'Core i7')
INSERT [dbo].[ProcessorsModels] ([id], [Name]) VALUES (4, N'Core i5')
INSERT [dbo].[ProcessorsModels] ([id], [Name]) VALUES (5, N'Core i3')
INSERT [dbo].[ProcessorsModels] ([id], [Name]) VALUES (7, N'Ryzen Threadripper')
INSERT [dbo].[ProcessorsModels] ([id], [Name]) VALUES (8, N'Ryzen 3')
INSERT [dbo].[ProcessorsModels] ([id], [Name]) VALUES (9, N'Ryzen 5')
INSERT [dbo].[ProcessorsModels] ([id], [Name]) VALUES (10, N'Ryzen 7')
INSERT [dbo].[ProcessorsModels] ([id], [Name]) VALUES (1002, N'Core 2 Quad')
SET IDENTITY_INSERT [dbo].[ProcessorsModels] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessorsVendors] ON 

INSERT [dbo].[ProcessorsVendors] ([id], [Name], [Picture], [Description]) VALUES (3, N'Intel', N'\Pictures\Processors\Vendors\Intel.png', N'Intel — американская компания, разработчик и производитель электронных устройств и компьютерных компонентов: микропроцессоров и наборов системной логики для клиентских вычислительных систем и для дата-центров, ПЛИС, чипов для систем искусственного интеллекта и для интернет вещей, энергонезависимой памяти.')
INSERT [dbo].[ProcessorsVendors] ([id], [Name], [Picture], [Description]) VALUES (4, N'AMD', N'\Pictures\Processors\Vendors\AMD.png', N'AMD — американский производитель интегральной микросхемной электроники, один из крупнейших производителей центральных процессоров, графических процессоров и адаптеров, материнских плат и чипсетов для них, также поставляет оперативную память и твердотельные накопители под торговой маркой Radeon.')
INSERT [dbo].[ProcessorsVendors] ([id], [Name], [Picture], [Description]) VALUES (5, N'NVIDIA', N'\Pictures\Processors\Vendors\NVIDIA.png', N'Производитель видеопроцессоров')
INSERT [dbo].[ProcessorsVendors] ([id], [Name], [Picture], [Description]) VALUES (6, N'QUALCOMM', N'\Pictures\Processors\Vendors\QUALCOMM.png', N'Производитель ARM процессоров')
SET IDENTITY_INSERT [dbo].[ProcessorsVendors] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessorsVendorsAndModels] ON 

INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (1, 3, 3)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (2, 3, 4)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (6, 4, 8)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (7, 4, 9)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (8, 4, 10)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (1002, 3, 1002)
SET IDENTITY_INSERT [dbo].[ProcessorsVendorsAndModels] OFF
GO
SET IDENTITY_INSERT [dbo].[RAM] ON 

INSERT [dbo].[RAM] ([id], [idHardwareManufacturer], [Volume], [TickSpeed], [idType], [Model]) VALUES (1, 2, 8, 2933, 1, N'M378A1K43EB2-CVF')
SET IDENTITY_INSERT [dbo].[RAM] OFF
GO
SET IDENTITY_INSERT [dbo].[RAMTypes] ON 

INSERT [dbo].[RAMTypes] ([id], [Type]) VALUES (1, N'DDR4')
INSERT [dbo].[RAMTypes] ([id], [Type]) VALUES (2, N'DDR3')
SET IDENTITY_INSERT [dbo].[RAMTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Sockets] ON 

INSERT [dbo].[Sockets] ([id], [Socket]) VALUES (1, N'LGA1151')
INSERT [dbo].[Sockets] ([id], [Socket]) VALUES (2, N'AM4+')
INSERT [dbo].[Sockets] ([id], [Socket]) VALUES (3, N'AM4')
INSERT [dbo].[Sockets] ([id], [Socket]) VALUES (1002, N'LGA775')
SET IDENTITY_INSERT [dbo].[Sockets] OFF
GO
SET IDENTITY_INSERT [dbo].[SocketsAndVendors] ON 

INSERT [dbo].[SocketsAndVendors] ([id], [idSocket], [idVendor]) VALUES (1, 1, 3)
INSERT [dbo].[SocketsAndVendors] ([id], [idSocket], [idVendor]) VALUES (2, 2, 4)
INSERT [dbo].[SocketsAndVendors] ([id], [idSocket], [idVendor]) VALUES (3, 3, 4)
INSERT [dbo].[SocketsAndVendors] ([id], [idSocket], [idVendor]) VALUES (1002, 1002, 3)
SET IDENTITY_INSERT [dbo].[SocketsAndVendors] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [Login], [Password]) VALUES (1, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[VideoAdapts] ON 

INSERT [dbo].[VideoAdapts] ([id], [idManufacturer], [idProcessorsVendors], [Volume], [Model]) VALUES (1, 1, 3, 3, N'GeForce GTX 1060')
SET IDENTITY_INSERT [dbo].[VideoAdapts] OFF
GO
ALTER TABLE [dbo].[BuildingsAndDepartments]  WITH CHECK ADD  CONSTRAINT [FK_BuildingsAndDepartments_Buildings] FOREIGN KEY([idBuilding])
REFERENCES [dbo].[Buildings] ([id])
GO
ALTER TABLE [dbo].[BuildingsAndDepartments] CHECK CONSTRAINT [FK_BuildingsAndDepartments_Buildings]
GO
ALTER TABLE [dbo].[BuildingsAndDepartments]  WITH CHECK ADD  CONSTRAINT [FK_BuildingsAndDepartments_Departments] FOREIGN KEY([idDepartment])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[BuildingsAndDepartments] CHECK CONSTRAINT [FK_BuildingsAndDepartments_Departments]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_DriveSets] FOREIGN KEY([idDriveSet])
REFERENCES [dbo].[DriveSets] ([id])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_DriveSets]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_Motherboards] FOREIGN KEY([idMotherBoard])
REFERENCES [dbo].[Motherboards] ([id])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_Motherboards]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_Processors] FOREIGN KEY([idProcessor])
REFERENCES [dbo].[Processors] ([id])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_Processors]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_RAM] FOREIGN KEY([idRam])
REFERENCES [dbo].[RAM] ([id])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_RAM]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_VideoAdapts] FOREIGN KEY([idVideoAdapter])
REFERENCES [dbo].[VideoAdapts] ([id])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_VideoAdapts]
GO
ALTER TABLE [dbo].[DepartmentsAndComputers]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentsAndComputers_Computers] FOREIGN KEY([idComputer])
REFERENCES [dbo].[Computers] ([id])
GO
ALTER TABLE [dbo].[DepartmentsAndComputers] CHECK CONSTRAINT [FK_DepartmentsAndComputers_Computers]
GO
ALTER TABLE [dbo].[DepartmentsAndComputers]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentsAndComputers_Departments] FOREIGN KEY([idDepartment])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[DepartmentsAndComputers] CHECK CONSTRAINT [FK_DepartmentsAndComputers_Departments]
GO
ALTER TABLE [dbo].[Drives]  WITH CHECK ADD  CONSTRAINT [FK_Drives_DrivesTypes] FOREIGN KEY([idType])
REFERENCES [dbo].[DrivesTypes] ([id])
GO
ALTER TABLE [dbo].[Drives] CHECK CONSTRAINT [FK_Drives_DrivesTypes]
GO
ALTER TABLE [dbo].[Drives]  WITH CHECK ADD  CONSTRAINT [FK_Drives_HardwareManufacturers] FOREIGN KEY([idManufacturer])
REFERENCES [dbo].[HardwareManufacturers] ([id])
GO
ALTER TABLE [dbo].[Drives] CHECK CONSTRAINT [FK_Drives_HardwareManufacturers]
GO
ALTER TABLE [dbo].[DriveSets]  WITH CHECK ADD  CONSTRAINT [FK_DriveSets_Drives] FOREIGN KEY([D1])
REFERENCES [dbo].[Drives] ([id])
GO
ALTER TABLE [dbo].[DriveSets] CHECK CONSTRAINT [FK_DriveSets_Drives]
GO
ALTER TABLE [dbo].[DriveSets]  WITH CHECK ADD  CONSTRAINT [FK_DriveSets_Drives1] FOREIGN KEY([D2])
REFERENCES [dbo].[Drives] ([id])
GO
ALTER TABLE [dbo].[DriveSets] CHECK CONSTRAINT [FK_DriveSets_Drives1]
GO
ALTER TABLE [dbo].[Motherboards]  WITH CHECK ADD  CONSTRAINT [FK_Motherboards_HardwareManufacturers] FOREIGN KEY([idHardwareManufacturer])
REFERENCES [dbo].[HardwareManufacturers] ([id])
GO
ALTER TABLE [dbo].[Motherboards] CHECK CONSTRAINT [FK_Motherboards_HardwareManufacturers]
GO
ALTER TABLE [dbo].[Motherboards]  WITH CHECK ADD  CONSTRAINT [FK_Motherboards_MotherboardsSBridges] FOREIGN KEY([idSBridge])
REFERENCES [dbo].[MotherboardsSBridges] ([id])
GO
ALTER TABLE [dbo].[Motherboards] CHECK CONSTRAINT [FK_Motherboards_MotherboardsSBridges]
GO
ALTER TABLE [dbo].[Motherboards]  WITH CHECK ADD  CONSTRAINT [FK_Motherboards_Sockets] FOREIGN KEY([idSocket])
REFERENCES [dbo].[Sockets] ([id])
GO
ALTER TABLE [dbo].[Motherboards] CHECK CONSTRAINT [FK_Motherboards_Sockets]
GO
ALTER TABLE [dbo].[MotherboardsSBridges]  WITH CHECK ADD  CONSTRAINT [FK_MotherboardsSBridges_ProcessorsVendors] FOREIGN KEY([idProcessorsVendors])
REFERENCES [dbo].[ProcessorsVendors] ([id])
GO
ALTER TABLE [dbo].[MotherboardsSBridges] CHECK CONSTRAINT [FK_MotherboardsSBridges_ProcessorsVendors]
GO
ALTER TABLE [dbo].[Processors]  WITH CHECK ADD  CONSTRAINT [FK_Processors_ProcessorsMarks] FOREIGN KEY([idMark])
REFERENCES [dbo].[ProcessorsMarks] ([id])
GO
ALTER TABLE [dbo].[Processors] CHECK CONSTRAINT [FK_Processors_ProcessorsMarks]
GO
ALTER TABLE [dbo].[Processors]  WITH CHECK ADD  CONSTRAINT [FK_Processors_ProcessorsModels] FOREIGN KEY([idModel])
REFERENCES [dbo].[ProcessorsModels] ([id])
GO
ALTER TABLE [dbo].[Processors] CHECK CONSTRAINT [FK_Processors_ProcessorsModels]
GO
ALTER TABLE [dbo].[Processors]  WITH CHECK ADD  CONSTRAINT [FK_Processors_ProcessorsVendors] FOREIGN KEY([idVendor])
REFERENCES [dbo].[ProcessorsVendors] ([id])
GO
ALTER TABLE [dbo].[Processors] CHECK CONSTRAINT [FK_Processors_ProcessorsVendors]
GO
ALTER TABLE [dbo].[Processors]  WITH CHECK ADD  CONSTRAINT [FK_Processors_Sockets] FOREIGN KEY([idSocket])
REFERENCES [dbo].[Sockets] ([id])
GO
ALTER TABLE [dbo].[Processors] CHECK CONSTRAINT [FK_Processors_Sockets]
GO
ALTER TABLE [dbo].[ProcessorsVendorsAndModels]  WITH CHECK ADD  CONSTRAINT [FK_ProcessorsVendorsAndModels_ProcessorsModels] FOREIGN KEY([idModel])
REFERENCES [dbo].[ProcessorsModels] ([id])
GO
ALTER TABLE [dbo].[ProcessorsVendorsAndModels] CHECK CONSTRAINT [FK_ProcessorsVendorsAndModels_ProcessorsModels]
GO
ALTER TABLE [dbo].[ProcessorsVendorsAndModels]  WITH CHECK ADD  CONSTRAINT [FK_ProcessorsVendorsAndModels_ProcessorsVendors] FOREIGN KEY([idVendor])
REFERENCES [dbo].[ProcessorsVendors] ([id])
GO
ALTER TABLE [dbo].[ProcessorsVendorsAndModels] CHECK CONSTRAINT [FK_ProcessorsVendorsAndModels_ProcessorsVendors]
GO
ALTER TABLE [dbo].[RAM]  WITH CHECK ADD  CONSTRAINT [FK_RAM_HardwareManufacturers] FOREIGN KEY([idHardwareManufacturer])
REFERENCES [dbo].[HardwareManufacturers] ([id])
GO
ALTER TABLE [dbo].[RAM] CHECK CONSTRAINT [FK_RAM_HardwareManufacturers]
GO
ALTER TABLE [dbo].[RAM]  WITH CHECK ADD  CONSTRAINT [FK_RAM_RAMTypes] FOREIGN KEY([idType])
REFERENCES [dbo].[RAMTypes] ([id])
GO
ALTER TABLE [dbo].[RAM] CHECK CONSTRAINT [FK_RAM_RAMTypes]
GO
ALTER TABLE [dbo].[SocketsAndVendors]  WITH CHECK ADD  CONSTRAINT [FK_SocketsAndVendors_ProcessorsVendors] FOREIGN KEY([idVendor])
REFERENCES [dbo].[ProcessorsVendors] ([id])
GO
ALTER TABLE [dbo].[SocketsAndVendors] CHECK CONSTRAINT [FK_SocketsAndVendors_ProcessorsVendors]
GO
ALTER TABLE [dbo].[SocketsAndVendors]  WITH CHECK ADD  CONSTRAINT [FK_SocketsAndVendors_Sockets] FOREIGN KEY([idSocket])
REFERENCES [dbo].[Sockets] ([id])
GO
ALTER TABLE [dbo].[SocketsAndVendors] CHECK CONSTRAINT [FK_SocketsAndVendors_Sockets]
GO
ALTER TABLE [dbo].[VideoAdapts]  WITH CHECK ADD  CONSTRAINT [FK_VideoAdapts_HardwareManufacturers] FOREIGN KEY([idManufacturer])
REFERENCES [dbo].[HardwareManufacturers] ([id])
GO
ALTER TABLE [dbo].[VideoAdapts] CHECK CONSTRAINT [FK_VideoAdapts_HardwareManufacturers]
GO
ALTER TABLE [dbo].[VideoAdapts]  WITH CHECK ADD  CONSTRAINT [FK_VideoAdapts_ProcessorsVendors] FOREIGN KEY([idProcessorsVendors])
REFERENCES [dbo].[ProcessorsVendors] ([id])
GO
ALTER TABLE [dbo].[VideoAdapts] CHECK CONSTRAINT [FK_VideoAdapts_ProcessorsVendors]
GO
USE [master]
GO
ALTER DATABASE [TONAR_PCs_DB] SET  READ_WRITE 
GO
