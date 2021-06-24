USE [master]
GO
/****** Object:  Database [TONAR_PCs_DB]    Script Date: 24.06.2021 3:16:31 ******/
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
/****** Object:  UserDefinedFunction [dbo].[ReturnProcessorModelID]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  UserDefinedFunction [dbo].[ReturnProcessorVendorID]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  UserDefinedFunction [dbo].[ReturnSocketID]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[Buildings]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[BuildingsAndDepartments]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[Computers]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[DepartmentsAndComputers]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[Drives]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[DriveSets]    Script Date: 24.06.2021 3:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriveSets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idHDD] [int] NOT NULL,
	[idSSD] [int] NULL,
 CONSTRAINT [PK_DriveSets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrivesTypes]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[HardwareManufacturers]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[Motherboards]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[MotherboardsSBridges]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[Processors]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[ProcessorsMarks]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[ProcessorsModels]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[ProcessorsVendors]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[ProcessorsVendorsAndModels]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[RAM]    Script Date: 24.06.2021 3:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idHardwareManufacturer] [int] NOT NULL,
	[idVolume] [int] NOT NULL,
	[TickSpeed] [int] NOT NULL,
	[idType] [int] NOT NULL,
	[Model] [int] NULL,
 CONSTRAINT [PK_RAM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAMTypes]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[RAMVolumes]    Script Date: 24.06.2021 3:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAMVolumes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Volumes] [int] NOT NULL,
 CONSTRAINT [PK_RAMVolumes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sockets]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[SocketsAndVendors]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 24.06.2021 3:16:32 ******/
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
/****** Object:  Table [dbo].[VideoAdapts]    Script Date: 24.06.2021 3:16:32 ******/
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

INSERT [dbo].[Buildings] ([id], [Name]) VALUES (1, N'Производственный цех')
INSERT [dbo].[Buildings] ([id], [Name]) VALUES (2, N'Здание администрации')
INSERT [dbo].[Buildings] ([id], [Name]) VALUES (3, N'Столовая')
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessorsMarks] ON 

INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (1, N'9600k')
INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (2, N'3360')
INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (3, N'9900')
INSERT [dbo].[ProcessorsMarks] ([id], [Mark]) VALUES (4, N'880')
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
SET IDENTITY_INSERT [dbo].[ProcessorsModels] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessorsVendors] ON 

INSERT [dbo].[ProcessorsVendors] ([id], [Name], [Picture], [Description]) VALUES (3, N'Intel', N'\Pictures\Processors\Vendors\Intel.png', N'Intel — американская компания, разработчик и производитель электронных устройств и компьютерных компонентов: микропроцессоров и наборов системной логики для клиентских вычислительных систем и для дата-центров, ПЛИС, чипов для систем искусственного интеллекта и для интернет вещей, энергонезависимой памяти.')
INSERT [dbo].[ProcessorsVendors] ([id], [Name], [Picture], [Description]) VALUES (4, N'AMD', N'\Pictures\Processors\Vendors\AMD.png', N'AMD — американский производитель интегральной микросхемной электроники, один из крупнейших производителей центральных процессоров, графических процессоров и адаптеров, материнских плат и чипсетов для них, также поставляет оперативную память и твердотельные накопители под торговой маркой Radeon.')
INSERT [dbo].[ProcessorsVendors] ([id], [Name], [Picture], [Description]) VALUES (5, N'NVIDIA', N'\Pictures\Processors\Vendors\NVIDIA.png', N'Производитель видеопроцессоров')
SET IDENTITY_INSERT [dbo].[ProcessorsVendors] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessorsVendorsAndModels] ON 

INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (1, 3, 3)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (2, 3, 4)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (6, 4, 8)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (7, 4, 9)
INSERT [dbo].[ProcessorsVendorsAndModels] ([id], [idVendor], [idModel]) VALUES (8, 4, 10)
SET IDENTITY_INSERT [dbo].[ProcessorsVendorsAndModels] OFF
GO
SET IDENTITY_INSERT [dbo].[Sockets] ON 

INSERT [dbo].[Sockets] ([id], [Socket]) VALUES (1, N'LGA1151')
INSERT [dbo].[Sockets] ([id], [Socket]) VALUES (2, N'AM4+')
INSERT [dbo].[Sockets] ([id], [Socket]) VALUES (3, N'AM4')
SET IDENTITY_INSERT [dbo].[Sockets] OFF
GO
SET IDENTITY_INSERT [dbo].[SocketsAndVendors] ON 

INSERT [dbo].[SocketsAndVendors] ([id], [idSocket], [idVendor]) VALUES (1, 1, 3)
INSERT [dbo].[SocketsAndVendors] ([id], [idSocket], [idVendor]) VALUES (2, 2, 4)
INSERT [dbo].[SocketsAndVendors] ([id], [idSocket], [idVendor]) VALUES (3, 3, 4)
SET IDENTITY_INSERT [dbo].[SocketsAndVendors] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [Login], [Password]) VALUES (1, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[Users] OFF
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
ALTER TABLE [dbo].[DriveSets]  WITH CHECK ADD  CONSTRAINT [FK_DriveSets_Drives] FOREIGN KEY([idHDD])
REFERENCES [dbo].[Drives] ([id])
GO
ALTER TABLE [dbo].[DriveSets] CHECK CONSTRAINT [FK_DriveSets_Drives]
GO
ALTER TABLE [dbo].[DriveSets]  WITH CHECK ADD  CONSTRAINT [FK_DriveSets_Drives1] FOREIGN KEY([idSSD])
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
ALTER TABLE [dbo].[RAM]  WITH CHECK ADD  CONSTRAINT [FK_RAM_RAMVolumes] FOREIGN KEY([idVolume])
REFERENCES [dbo].[RAMVolumes] ([id])
GO
ALTER TABLE [dbo].[RAM] CHECK CONSTRAINT [FK_RAM_RAMVolumes]
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
