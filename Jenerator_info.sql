USE [master]
GO
/****** Object:  Database [Jenerator_info]    Script Date: 7/31/2022 4:51:15 AM ******/
CREATE DATABASE [Jenerator_info]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Jenerator_info', FILENAME = N'I:\Jenerator_info.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Jenerator_info_log', FILENAME = N'I:\Jenerator_info_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Jenerator_info] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Jenerator_info].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Jenerator_info] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jenerator_info] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jenerator_info] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jenerator_info] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jenerator_info] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jenerator_info] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jenerator_info] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jenerator_info] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jenerator_info] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jenerator_info] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jenerator_info] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jenerator_info] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jenerator_info] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jenerator_info] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jenerator_info] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jenerator_info] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jenerator_info] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jenerator_info] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jenerator_info] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jenerator_info] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jenerator_info] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jenerator_info] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jenerator_info] SET RECOVERY FULL 
GO
ALTER DATABASE [Jenerator_info] SET  MULTI_USER 
GO
ALTER DATABASE [Jenerator_info] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jenerator_info] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Jenerator_info] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Jenerator_info] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Jenerator_info] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Jenerator_info', N'ON'
GO
ALTER DATABASE [Jenerator_info] SET QUERY_STORE = OFF
GO
USE [Jenerator_info]
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
USE [Jenerator_info]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/31/2022 4:51:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[Roles] [nvarchar](250) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Family] [nvarchar](150) NULL,
	[Email] [nvarchar](200) NULL,
	[Phone] [nvarchar](150) NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](1000) NULL,
	[ImageName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 7/31/2022 4:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserName] [nchar](10) NOT NULL,
	[Password] [nchar](10) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 7/31/2022 4:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Family] [nvarchar](150) NULL,
	[Email] [nvarchar](200) NULL,
	[Phone] [nvarchar](150) NULL,
	[Roles] [nvarchar](50) NOT NULL,
	[ImageName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 7/31/2022 4:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parts](
	[ID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 7/31/2022 4:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[ID] [int] NOT NULL,
	[SectionName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Values]    Script Date: 7/31/2022 4:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Values](
	[ID] [int] NOT NULL,
	[PartID] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Clock] [int] NOT NULL,
 CONSTRAINT [PK_Values_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employee] ([UserName], [Password], [Roles], [Name], [Family], [Email], [Phone], [City], [Address], [ImageName]) VALUES (N'hamid', N'hamid123', N'analyzer,                                         ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([UserName], [Password], [Roles], [Name], [Family], [Email], [Phone], [City], [Address], [ImageName]) VALUES (N'reza', N'reza123', N'analyzer,                                         ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Managers] ([UserName], [Password], [Name], [Family], [Email], [Phone], [Roles], [ImageName]) VALUES (N'Hhosein', N'hosein2020', N'حسین', N'حبی', N'h.hobbi20@gmail.com', N'09012672108', N'manager,', N'31e64984-0df6-4587-a343-4cd480e714a2.jpg')
INSERT [dbo].[Managers] ([UserName], [Password], [Name], [Family], [Email], [Phone], [Roles], [ImageName]) VALUES (N'MGheisary', N'magid2020', N'مجید', NULL, NULL, NULL, N'manager,', NULL)
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (1, 1, N'لرزش یاتاقان ژنراتور طرف تحریک')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (2, 1, N'لرزش یاتاقان ژنراتور طرف کلاچ')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (3, 1, N'لرزش یاتاقان کمپرسور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (4, 1, N'لرزش یاتاقان توربین')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (5, 2, N'حرارت خروجی کمپرسور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (6, 2, N'نقطه 11')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (7, 2, N'نقطه 12')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (8, 2, N'نقطه 13')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (9, 2, N'نقطه 14')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (10, 2, N'نقطه 15')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (11, 2, N'نقطه 16')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (12, 2, N'نقطه 17')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (13, 2, N'نقطه 18')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (14, 3, N'یاتاقان تراست کمپرسور سمت ژنراتور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (15, 3, N'یاتاقان تراست کمپرسور سمت توربین')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (16, 3, N'یاتاقان ژنراتور سمت تحریک کننده')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (17, 3, N'یاتاقان مرکزی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (18, 3, N'یاتاقان کمپرسور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (19, 3, N'یاتاقان توربین')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (20, 3, N'یاتاقان تراست ژنراتور سمت توربین')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (21, 3, N'یاتاقان تراست ژنراتورسمت تحریک')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (22, 3, N'یاتاقان ژنراتور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (23, 4, N'دور ژنراتور – توربین')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (24, 4, N'ولتاژکمکی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (25, 4, N'جریان تحریک کننده')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (26, 4, N'ولتاژ ژنراتور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (27, 4, N'جریان ژنراتور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (28, 4, N'مگاوار ژنراتور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (29, 4, N'مگاوات ژنراتور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (30, 4, N'جریان 380 داخلی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (31, 4, N'ولتاژ380 داخلی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (32, 4, N'ولتاژ 66 کیلو ولت پاسبار')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (33, 5, N'جریان ترانس 6 کیلو ولت کمکی داخلی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (34, 5, N'جریان تحریک ترانس 6 کیلوولت')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (35, 5, N'ولتاژ 6 کیلوولت')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (36, 5, N'جریان تحریک کننده')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (37, 5, N'ولتاژ تحریک کننده')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (38, 5, N'حرارت ورودی کمپرسور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (39, 5, N'فشار کمپرسور کمکی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (40, 5, N'اختلاف فشار مکش هوای ورودی ژنراتور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (41, 5, N'اخلاف فشار هوای ورودی کمپرسور1')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (42, 5, N'اخلاف فشار هوای ورودی کمپرسو2')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (43, 5, N'حرارت روغن بعد از کولر')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (44, 5, N'حرارت روغن قبل از کولر')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (45, 5, N'فشار یاتاقان مرکزی ')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (46, 5, N'فشار نفت گاز قبا از والو اضطراری')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (47, 5, N'فشار برگشت نفت گاز')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (48, 5, N'اختلاف فشار کمپرسور')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (49, 5, N'حرارت روغن ترانس')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (50, 5, N'حرارت هسته ترانس')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (51, 5, N'فشار روغن یاتاقان ژنراتور طرف کلاج')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (52, 5, N'فشار روغن یاتاقان ژنراتور طرف تحریک')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (53, 5, N'فشار روغن پمپ اصلی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (54, 5, N'فشار روغن اضطراری ')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (55, 5, N'فشار روغن روغنکاری')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (56, 5, N'فشار آخر کمپرسور اصلی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (57, 5, N'فشار روغن ثانویه سوخت نفت و گاز')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (58, 5, N'فشار روغن ثانویه سوخت گاز')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (59, 5, N'فشار سوخت گاز')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (60, 5, N'فشار پمپ گاز')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (61, 5, N'فشار پمپ نفت گاز')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (62, 5, N'فشار روغن بعد از فیلتر ')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (63, 5, N'فشار روغن قبل از فیلتر')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (64, 6, N'جریان یکسو کننده 24 ولت منفی ')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (65, 6, N'ولتاژ یکسو کننده 24 ولت منفی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (66, 6, N'جریان یکسو کننده 24 ولت مثبت')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (67, 6, N'ولتاژ یکسو کننده 24 ولت مثبت')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (68, 6, N'جریان یکسو کننده 220 ولت')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (69, 6, N'ولتاژ یکسو کننده 220 ولت')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (70, 7, N'اختلاف فشار فیلتر گاز')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (71, 7, N'فشار کمپرسور اصلی')
INSERT [dbo].[Parts] ([ID], [SectionID], [Name]) VALUES (72, 7, N'حرارت خروجی توربین')
INSERT [dbo].[Sections] ([ID], [SectionName]) VALUES (1, N'لرزش')
INSERT [dbo].[Sections] ([ID], [SectionName]) VALUES (2, N'درجه حرارت خروجی توربین')
INSERT [dbo].[Sections] ([ID], [SectionName]) VALUES (3, N'درجه حرارت یاتاقان ها')
INSERT [dbo].[Sections] ([ID], [SectionName]) VALUES (4, N'کنترل ژنراتور')
INSERT [dbo].[Sections] ([ID], [SectionName]) VALUES (5, N'فشار کمکی کنترل توربین')
INSERT [dbo].[Sections] ([ID], [SectionName]) VALUES (6, N'دستگاه یکسو کننده')
INSERT [dbo].[Sections] ([ID], [SectionName]) VALUES (7, N'کنترل توربین')
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (25, 1, 9, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (26, 1, 2, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (27, 1, 4, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (28, 1, 5, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (29, 1, 7, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (30, 1, 7, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (31, 1, 1, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (32, 1, 8, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (33, 1, 7, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (34, 1, 5, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (35, 1, 4, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (36, 1, 16, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (37, 1, 17, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (38, 1, 18, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (39, 1, 14, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (40, 1, 16, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (41, 1, 15, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (42, 1, 12, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (43, 1, 17, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (44, 1, 10, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (45, 1, 3, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (46, 1, 7, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (47, 1, 8, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (48, 1, 13, CAST(N'2022-06-23T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (49, 1, 1, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (50, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (51, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (52, 1, 1, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (53, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (54, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (55, 1, 2, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (56, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (57, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (58, 1, 3, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (59, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (60, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (61, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (62, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (63, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (64, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (65, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (66, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (67, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (68, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (69, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (70, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (71, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (72, 1, 0, CAST(N'2022-06-24T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (73, 1, 1, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (74, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (75, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (76, 1, 1, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (77, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (78, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (79, 1, 2, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (80, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (81, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (82, 1, 3, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (83, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (84, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (85, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (86, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (87, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (88, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (89, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (90, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (91, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (92, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (93, 1, 8, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (94, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (95, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (96, 1, 0, CAST(N'2022-06-25T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (97, 1, 1, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (98, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (99, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (100, 1, 1, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (101, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (102, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (103, 1, 2, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (104, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (105, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (106, 1, 3, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (107, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (108, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (109, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (110, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (111, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (112, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (113, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (114, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (115, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (116, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (117, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (118, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (119, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (120, 1, 0, CAST(N'2022-06-26T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (121, 1, 1, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (122, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (123, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (124, 1, 1, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (125, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (126, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (127, 1, 2, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (128, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (129, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (130, 1, 3, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (131, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (132, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (133, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (134, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (135, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (136, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (137, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (138, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (139, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (140, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (141, 1, 17, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (142, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (143, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (144, 1, 0, CAST(N'2022-06-27T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (145, 1, 1, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (146, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (147, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (148, 1, 1, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (149, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (150, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (151, 1, 2, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (152, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (153, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (154, 1, 3, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (155, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (156, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (157, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (158, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (159, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (160, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (161, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (162, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (163, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (164, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (165, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (166, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (167, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (168, 1, 0, CAST(N'2022-06-28T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (169, 1, 1, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (170, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (171, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (172, 1, 1, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (173, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (174, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (175, 1, 2, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (176, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (177, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (178, 1, 3, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (179, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (180, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (181, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (182, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (183, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (184, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (185, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (186, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (187, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (188, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (189, 1, 5, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (190, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (191, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (192, 1, 0, CAST(N'2022-06-29T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (193, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (194, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (195, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (196, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (197, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (198, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (199, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (200, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (201, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (202, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (203, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (204, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (205, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (206, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (207, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (208, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (209, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (210, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (211, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (212, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (213, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (214, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (215, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (216, 1, 0, CAST(N'2022-07-21T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (217, 1, 1, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (218, 1, 2, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (219, 1, 3, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (220, 1, 4, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (221, 1, 5, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (222, 1, 6, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (223, 1, 5, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (224, 1, 4, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 8)
GO
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (225, 1, 2, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (226, 1, 8, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (227, 1, 11, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (228, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (229, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (230, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (231, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (232, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (233, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (234, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (235, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (236, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (237, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (238, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (239, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (240, 1, 0, CAST(N'2022-06-22T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (241, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (242, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (243, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (244, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (245, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (246, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (247, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (248, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (249, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (250, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (251, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (252, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (253, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (254, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (255, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (256, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (257, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (258, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (259, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (260, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (261, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (262, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (263, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (264, 1, 0, CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (265, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (266, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (267, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (268, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (269, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (270, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (271, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (272, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (273, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (274, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (275, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (276, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (277, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (278, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (279, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (280, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (281, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (282, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (283, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (284, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (285, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (286, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (287, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (288, 1, 0, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (289, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (290, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (291, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (292, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (293, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (294, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (295, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (296, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (297, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (298, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (299, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (300, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (301, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (302, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (303, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (304, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (305, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (306, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (307, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (308, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (309, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (310, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (311, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (312, 1, 0, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (313, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (314, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (315, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (316, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (317, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (318, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (319, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (320, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (321, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (322, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (323, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (324, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 12)
GO
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (325, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (326, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (327, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (328, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (329, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (330, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (331, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (332, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (333, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (334, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (335, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (336, 1, 0, CAST(N'2022-07-03T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (337, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (338, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (339, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (340, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (341, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (342, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (343, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (344, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (345, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (346, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (347, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (348, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (349, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (350, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (351, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (352, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (353, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (354, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (355, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (356, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (357, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (358, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (359, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (360, 1, 0, CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (361, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (362, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (363, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (364, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (365, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (366, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (367, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (368, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (369, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (370, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (371, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (372, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (373, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (374, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (375, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (376, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (377, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (378, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (379, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (380, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (381, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (382, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (383, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (384, 1, 0, CAST(N'2022-07-05T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (385, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (386, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (387, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (388, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (389, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (390, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (391, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (392, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (393, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (394, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (395, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (396, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (397, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (398, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (399, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (400, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (401, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (402, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (403, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (404, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (405, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (406, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (407, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (408, 1, 0, CAST(N'2022-07-06T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (409, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (410, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (411, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (412, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (413, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (414, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (415, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (416, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (417, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (418, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (419, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (420, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (421, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (422, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (423, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (424, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 16)
GO
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (425, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (426, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (427, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (428, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (429, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (430, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (431, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (432, 1, 0, CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (433, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (434, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (435, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (436, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (437, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (438, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (439, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (440, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (441, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (442, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (443, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (444, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (445, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (446, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (447, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (448, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (449, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (450, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (451, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (452, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (453, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (454, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (455, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (456, 1, 0, CAST(N'2022-07-08T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (457, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (458, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (459, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (460, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (461, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (462, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (463, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (464, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (465, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (466, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (467, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (468, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (469, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (470, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (471, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (472, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (473, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (474, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (475, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (476, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (477, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (478, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (479, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (480, 1, 0, CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (481, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (482, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (483, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (484, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (485, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (486, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (487, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (488, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (489, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (490, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (491, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (492, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (493, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (494, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (495, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (496, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (497, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (498, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (499, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (500, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (501, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (502, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (503, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (504, 1, 0, CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (505, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (506, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (507, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (508, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (509, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (510, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (511, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (512, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (513, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (514, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (515, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (516, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (517, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (518, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (519, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (520, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (521, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (522, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (523, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (524, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 20)
GO
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (525, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (526, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (527, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (528, 1, 0, CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (529, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (530, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (531, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (532, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (533, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (534, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (535, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (536, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (537, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (538, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (539, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (540, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (541, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (542, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (543, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (544, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (545, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (546, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (547, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (548, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (549, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (550, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (551, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (552, 1, 0, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (553, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (554, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (555, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (556, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (557, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (558, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (559, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (560, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (561, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (562, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (563, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (564, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (565, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (566, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (567, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (568, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (569, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (570, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (571, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (572, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (573, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (574, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (575, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (576, 1, 0, CAST(N'2022-07-13T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (577, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (578, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (579, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (580, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (581, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (582, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (583, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (584, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (585, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (586, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (587, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (588, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (589, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (590, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (591, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (592, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (593, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (594, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 18)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (595, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 19)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (596, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 20)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (597, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (598, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 22)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (599, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 23)
INSERT [dbo].[Values] ([ID], [PartID], [Value], [Date], [Clock]) VALUES (600, 1, 0, CAST(N'2022-07-14T00:00:00.0000000' AS DateTime2), 24)
ALTER TABLE [dbo].[Parts]  WITH CHECK ADD  CONSTRAINT [FK_Parts_Sections] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sections] ([ID])
GO
ALTER TABLE [dbo].[Parts] CHECK CONSTRAINT [FK_Parts_Sections]
GO
USE [master]
GO
ALTER DATABASE [Jenerator_info] SET  READ_WRITE 
GO
