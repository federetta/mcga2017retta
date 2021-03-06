USE [master]
GO
/****** Object:  Database [LeatherGoods]    Script Date: 10/11/2017 13:27:06 ******/
CREATE DATABASE [LeatherGoods]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LeatherGoods', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LeatherGoods.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LeatherGoods_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LeatherGoods_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LeatherGoods] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LeatherGoods].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LeatherGoods] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LeatherGoods] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LeatherGoods] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LeatherGoods] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LeatherGoods] SET ARITHABORT OFF 
GO
ALTER DATABASE [LeatherGoods] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LeatherGoods] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LeatherGoods] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LeatherGoods] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LeatherGoods] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LeatherGoods] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LeatherGoods] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LeatherGoods] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LeatherGoods] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LeatherGoods] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LeatherGoods] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LeatherGoods] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LeatherGoods] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LeatherGoods] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LeatherGoods] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LeatherGoods] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LeatherGoods] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LeatherGoods] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LeatherGoods] SET  MULTI_USER 
GO
ALTER DATABASE [LeatherGoods] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LeatherGoods] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LeatherGoods] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LeatherGoods] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LeatherGoods]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cookie] [nvarchar](40) NOT NULL,
	[CartDate] [datetime] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[Rowid] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
	[AspNetUsers] [nvarchar](128) NOT NULL,
	[City] [nvarchar](30) NULL,
	[SignupDate] [datetime] NOT NULL,
	[Rowid] [uniqueidentifier] NULL,
	[OrderCount] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealer]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[TotalProducts] [int] NOT NULL,
	[Rowid] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[ErrorDate] [datetime] NULL,
	[IpAddress] [nvarchar](40) NULL,
	[ClientAgent] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[Everything] [nvarchar](max) NULL,
	[HttpReferer] [nvarchar](500) NULL,
	[PathAndQuery] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LanguageCulture] [nvarchar](20) NOT NULL,
	[FlagImageFileName] [nvarchar](50) NULL,
	[RightToLeft] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocaleResourceKey]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocaleResourceKey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.LocaleResourceKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocaleStringResource]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocaleStringResource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceValue] [nvarchar](1000) NOT NULL,
	[LocaleResourceKey_Id] [int] NOT NULL,
	[Language_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.LocaleStringResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[State] [int] NULL,
	[OrderNumber] [int] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[Rowid] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderNumber]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[DealerId] [int] NOT NULL,
	[Image] [nvarchar](30) NOT NULL,
	[Price] [float] NOT NULL,
	[QuantitySold] [int] NOT NULL,
	[AvgStars] [float] NOT NULL,
	[Rowid] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Stars] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[LastChangeDate] [datetime2](7) NOT NULL,
	[WebSiteName] [nvarchar](500) NULL,
	[WebSiteUrl] [nvarchar](500) NULL,
	[PageTitle] [nvarchar](80) NULL,
	[AdminEmailAddress] [nvarchar](100) NULL,
	[SMTP] [varchar](100) NULL,
	[SMTPUsername] [nvarchar](100) NULL,
	[SMTPPassword] [nvarchar](100) NULL,
	[SMTPPort] [nvarchar](10) NULL,
	[SMTPEnableSSL] [bit] NULL,
	[Theme] [nvarchar](100) NULL,
	[DefaultLanguageId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_SETTING] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Poductos]    Script Date: 10/11/2017 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[VW_Poductos] AS
Select p.Id ,p.Title, p.Description, c.Id as cid ,c.Name, p.Image, p.Price from product p
JOIN Dealer d on d.Id = p.DealerId
JOIN Category c on d.CategoryId = c.Id
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0e1269d6-be2a-4fc8-af5a-7674c289743e', N'fretta@net2one.com.ar', 0, N'ADlQQHlmQ7xZHJNA5aHlgyw/3jWZ8BSJU6aN2vXP0lRa+3wVpRd076zlMqK9loCpow==', N'3c60e45b-a3eb-406e-bd43-06604dcfbe65', NULL, 0, 0, NULL, 1, 0, N'fretta@net2one.com.ar')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'45cdaac9-54b7-41ab-b167-581a356fbb07', N'fede@fede.com', 0, N'AMxh3vSACcZdxf1FECgzq2luUrRRdD26l2cx0Bq+wRO0U5bIVOV7R5/6QWE3S65lUA==', N'f61aa9d3-a8d2-4e4d-bb6c-613f6cdd320c', NULL, 0, 0, NULL, 1, 0, N'fede@fede.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bb205337-35c4-45cf-918a-3bad95d1f29b', N'admin@asf.com', 0, N'APIIq9WPfFOfNq0O7pweDgv/b4p91FY2QgKv0LHpl1sHlFfK3oWeg3z2Xfe7eLbCgw==', N'8253afe7-4f35-4e63-be52-4de57eca4363', NULL, 0, 0, NULL, 1, 0, N'admin@asf.com')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (2, N'Computadoras', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (3, N'Teclados', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Email], [CountryId], [AspNetUsers], [City], [SignupDate], [Rowid], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (3, N'Federico', N'Retta', N'fretta@net2one.comar', 1, N'1', NULL, CAST(N'2017-09-18T19:21:20.387' AS DateTime), N'5b8eceb1-bf9c-e711-83eb-00090ffe0001', 0, CAST(N'2017-09-18T19:21:20.387' AS DateTime), NULL, CAST(N'2017-09-18T19:21:20.387' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (1, N'Argentina', CAST(N'2017-09-18T19:21:01.6330000' AS DateTime2), NULL, CAST(N'2017-09-18T19:21:01.6330000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Dealer] ON 

INSERT [dbo].[Dealer] ([Id], [FirstName], [LastName], [CategoryId], [CountryId], [Description], [TotalProducts], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (2, N'Proveedor', N'GBA', 2, 1, N'GBA', 10, N'3ba37068-c89c-e711-83eb-00090ffe0001', CAST(N'2017-09-18T20:23:42.767' AS DateTime), NULL, CAST(N'2017-09-18T20:23:42.767' AS DateTime), NULL)
INSERT [dbo].[Dealer] ([Id], [FirstName], [LastName], [CategoryId], [CountryId], [Description], [TotalProducts], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (3, N'Proveedor2', N'GBA', 2, 1, N'GBA', 5, N'093ab87e-c89c-e711-83eb-00090ffe0001', CAST(N'2017-09-18T20:24:20.147' AS DateTime), NULL, CAST(N'2017-09-18T20:24:20.147' AS DateTime), NULL)
INSERT [dbo].[Dealer] ([Id], [FirstName], [LastName], [CategoryId], [CountryId], [Description], [TotalProducts], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (7, N'Proveedor', N'2', 3, 1, N'Proveedor3', 0, N'11907080-6bc2-e711-83f6-00090ffe0001', CAST(N'2017-11-05T17:54:24.020' AS DateTime), NULL, CAST(N'2017-11-05T17:54:24.020' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Dealer] OFF
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([Id], [Name], [LanguageCulture], [FlagImageFileName], [RightToLeft]) VALUES (1, N'Espaniol', N'ES-AR', NULL, 0)
SET IDENTITY_INSERT [dbo].[Language] OFF
SET IDENTITY_INSERT [dbo].[LocaleResourceKey] ON 

INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (2, N'Product', NULL, CAST(N'2017-09-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[LocaleResourceKey] OFF
SET IDENTITY_INSERT [dbo].[LocaleStringResource] ON 

INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (1, N'Producto', 2, 1)
SET IDENTITY_INSERT [dbo].[LocaleStringResource] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (7, N'Teclado USB', N'Teclado USB', 7, N'/img/10', 100, 0, 0, N'7813ee9c-6bc2-e711-83f6-00090ffe0001', CAST(N'2017-11-05T17:55:11.820' AS DateTime), NULL, CAST(N'2017-11-05T17:55:11.820' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (5, N'monitor', N'Samsung', 2, N'/image/', 99.99, 0, 0, N'cbc776e1-d29c-e711-83eb-00090ffe0001', CAST(N'2017-09-18T21:38:40.780' AS DateTime), NULL, CAST(N'2017-09-18T21:38:40.780' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (10, N'Tomatoes - Diced, Canned', N'Drainage of Dura Mater, Percutaneous Endoscopic Approach', 7, N'/img/img.jpg', 534.95, 0, 0, N'88aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.900' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.900' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (13, N'Ecolab Silver Fusion', N'Fusion Cerv Jt w Nonaut Sub, Post Appr P Col, Perc Endo', 7, N'/img/img.jpg', 842.04, 0, 0, N'8baaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.900' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.900' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (16, N'Bar Energy Chocchip', N'Drainage of Lumbosacral Joint, Open Approach, Diagnostic', 7, N'/img/img.jpg', 318.29, 0, 0, N'8eaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.903' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.903' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (17, N'Chocolate Bar - Smarties', N'Dilation of Ascending Colon, Endo', 7, N'/img/img.jpg', 101.91, 0, 0, N'8faaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.903' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.903' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (19, N'Mushroom - Oyster, Fresh', N'Dilate of L Temporal Art with Drug-elut Intra, Open Approach', 7, N'/img/img.jpg', 793.22, 0, 0, N'91aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.903' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.903' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (20, N'Wine - Alsace Riesling Reserve', N'Plain Radiography of R Int Mamm Graft using H Osm Contrast', 7, N'/img/img.jpg', 600.62, 0, 0, N'92aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.907' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.907' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (21, N'Island Oasis - Peach Daiquiri', N'Dilate R Verteb Art, Bifurc, w 2 Intralum Dev, Perc', 7, N'/img/img.jpg', 453.57, 0, 0, N'93aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.907' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.907' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (23, N'Cornflakes', N'Removal of Hearing Device from Left Inner Ear, Open Approach', 7, N'/img/img.jpg', 884.26, 0, 0, N'95aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.907' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.907' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (26, N'Tortillas - Flour, 12', N'Supplement Dura Mater with Nonaut Sub, Perc Endo Approach', 7, N'/img/img.jpg', 660.43, 0, 0, N'98aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.910' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.910' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (27, N'Scallops - In Shell', N'Bypass Right Fallopian Tube to L Fallop, Open Approach', 7, N'/img/img.jpg', 540.71, 0, 0, N'99aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (28, N'Pepper - Paprika, Hungarian', N'Bursae and Ligaments, Change', 7, N'/img/img.jpg', 774.09, 0, 0, N'9aaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (29, N'Sage - Ground', N'Supplement Uvula with Autol Sub, Extern Approach', 7, N'/img/img.jpg', 901.24, 0, 0, N'9baaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (30, N'Tea - Apple Green Tea', N'Dilate R Post Tib Art, Bifurc, w 2 Drug-elut, Perc', 7, N'/img/img.jpg', 518.76, 0, 0, N'9caaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (34, N'Nantucket - Orange Mango Cktl', N'Occlusion of Middle Esophagus, Endo', 7, N'/img/img.jpg', 479.6, 0, 0, N'a0aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.913' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (36, N'Pork - Back Ribs', N'Intraoperative Radiation Therapy (IORT) of Ureter', 7, N'/img/img.jpg', 249.01, 0, 0, N'a2aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.917' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.917' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (37, N'Trout - Rainbow, Fresh', N'Excision of Left Trunk Tendon, Open Approach, Diagnostic', 7, N'/img/img.jpg', 993.91, 0, 0, N'a3aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.917' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.917' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (43, N'Spice - Chili Powder Mexican', N'Revision of Autol Sub in Low Art, Perc Endo Approach', 7, N'/img/img.jpg', 138.43, 0, 0, N'a9aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.920' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.920' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (45, N'Jam - Apricot', N'Extirpate of Matter from R Trunk Tendon, Perc Endo Approach', 7, N'/img/img.jpg', 760.51, 0, 0, N'abaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.923' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.923' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (47, N'Scallops - In Shell', N'Excision of Right Hand Tendon, Perc Endo Approach, Diagn', 7, N'/img/img.jpg', 771.01, 0, 0, N'adaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:46.923' AS DateTime), NULL, CAST(N'2017-11-08T11:12:46.923' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (50, N'Bread - Crusty Italian Poly', N'Revision of Nonaut Sub in Mouth/Throat, Via Opening', 7, N'/img/img.jpg', 868.25, 0, 0, N'b0aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.027' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.027' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (55, N'Soup - Campbells, Cream Of', N'Dilate R Int Iliac Art w 3 Drug-elut, Perc Endo', 7, N'/img/img.jpg', 322.25, 0, 0, N'b5aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.033' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.033' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (57, N'Wine - White, Gewurtzraminer', N'Removal of Infusion Device from Thymus, Perc Endo Approach', 7, N'/img/img.jpg', 279.57, 0, 0, N'b7aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.037' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.037' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (59, N'Chocolate - Dark', N'Nonimag Nucl Med Prob of Up Extrem using Technetium 99m', 7, N'/img/img.jpg', 183.32, 0, 0, N'b9aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.037' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.037' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (60, N'Lamb Rack Frenched Australian', N'Dilation of Right Axillary Artery, Percutaneous Approach', 7, N'/img/img.jpg', 275.99, 0, 0, N'baaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.037' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.037' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (62, N'Icecream - Dibs', N'Replacement of Right Maxilla with Autol Sub, Perc Approach', 7, N'/img/img.jpg', 106.94, 0, 0, N'bcaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.040' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.040' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (63, N'Truffle - Whole Black Peeled', N'Replacement of Aortic Valve with Zooplastic, Perc Approach', 7, N'/img/img.jpg', 559.54, 0, 0, N'bdaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.040' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.040' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (66, N'Potatoes - Yukon Gold 5 Oz', N'Beam Radiation of Thorax Lymphatics using Heavy Particles', 7, N'/img/img.jpg', 724.27, 0, 0, N'c0aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.040' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.040' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (69, N'Cocoa Powder - Dutched', N'Removal of Synth Sub from Up Back, Extern Approach', 7, N'/img/img.jpg', 901.75, 0, 0, N'c3aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.043' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.043' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (70, N'Steampan Lid', N'Revision of Autol Sub in R Clavicle, Perc Approach', 7, N'/img/img.jpg', 494.46, 0, 0, N'c4aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.043' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.043' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (73, N'Coriander - Ground', N'Supplement Right Femoral Vein with Nonaut Sub, Open Approach', 7, N'/img/img.jpg', 861.4, 0, 0, N'c7aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.047' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.047' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (74, N'Asparagus - White, Canned', N'Division of Right Lower Leg Skin, External Approach', 7, N'/img/img.jpg', 131.84, 0, 0, N'c8aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.047' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.047' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (77, N'Sauce - Plum', N'Occlusion L Up Lobe Bronc w Intralum Dev, Perc', 7, N'/img/img.jpg', 161.1, 0, 0, N'cbaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.053' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.053' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (80, N'Wine - Red, Black Opal Shiraz', N'Drainage of Right Knee Joint, Open Approach, Diagnostic', 7, N'/img/img.jpg', 667.51, 0, 0, N'ceaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (81, N'Pork - Ham Hocks - Smoked', N'Remove Drain Dev from Low Extrem Subcu/Fascia, Perc', 7, N'/img/img.jpg', 875.26, 0, 0, N'cfaaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (82, N'Cleaner - Bleach', N'Release Right Colic Artery, Percutaneous Endoscopic Approach', 7, N'/img/img.jpg', 296.41, 0, 0, N'd0aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (83, N'Soup - Cream Of Broccoli', N'Introduction of Immunostimulator into Periph Art, Open', 7, N'/img/img.jpg', 602.03, 0, 0, N'd1aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (84, N'Garlic - Peeled', N'Supplement Left Foot with Synth Sub, Open Approach', 7, N'/img/img.jpg', 826.4, 0, 0, N'd2aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (85, N'Soup - Cream Of Potato / Leek', N'Removal of Int Fix from L Metatarsotars Jt, Open Approach', 7, N'/img/img.jpg', 948.6, 0, 0, N'd3aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.057' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (86, N'Puff Pastry - Slab', N'Removal of Autol Sub from R Low Femur, Perc Approach', 7, N'/img/img.jpg', 449.18, 0, 0, N'd4aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.060' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.060' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (87, N'Asparagus - White, Canned', N'Insertion of Int Fix into R Mandible, Open Approach', 7, N'/img/img.jpg', 721, 0, 0, N'd5aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.060' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.060' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (89, N'Ham Black Forest', N'Alteration of L Ext Ear with Nonaut Sub, Perc Endo Approach', 7, N'/img/img.jpg', 226.53, 0, 0, N'd7aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.060' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.060' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (100, N'Lentils - Green, Dry', N'Excision of Right Orbit, Percutaneous Approach, Diagnostic', 7, N'/img/img.jpg', 484.3, 0, 0, N'e2aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.073' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.073' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (102, N'Wine - Redchard Merritt', N'Bypass R Com Iliac Vein to Low Vein w Autol Art, Open', 7, N'/img/img.jpg', 568.44, 0, 0, N'e4aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.077' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.077' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (104, N'Salsify, Organic', N'Dilation of Right Internal Jugular Vein, Perc Endo Approach', 7, N'/img/img.jpg', 325.5, 0, 0, N'e6aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.090' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.090' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (105, N'Nantucket - Kiwi Berry Cktl.', N'Revision of Synthetic Substitute in Diaphragm, Perc Approach', 7, N'/img/img.jpg', 642.97, 0, 0, N'e7aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.090' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.090' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (107, N'Chicken - Base', N'Revision of Drainage Device in Mouth/Throat, Perc Approach', 7, N'/img/img.jpg', 872.78, 0, 0, N'e9aaabe4-8ec4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:12:47.090' AS DateTime), NULL, CAST(N'2017-11-08T11:12:47.090' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (108, N'Bread - Olive', N'Chiropractic Manipulation of Pelvis, Mechanically Assisted', 2, N'/img/img.jpg', 822.33, 0, 0, N'92016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.090' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.090' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (109, N'Chicken - White Meat With Tender', N'Supplement Right Humeral Shaft with Autol Sub, Open Approach', 2, N'/img/img.jpg', 375.18, 0, 0, N'93016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.097' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.097' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (110, N'Cheese - Gouda Smoked', N'Supplement Thorax Lymphatic with Synth Sub, Open Approach', 2, N'/img/img.jpg', 787.7, 0, 0, N'94016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (111, N'Tomatoes - Plum, Canned', N'Release Right Lower Extremity Lymphatic, Perc Endo Approach', 2, N'/img/img.jpg', 231.77, 0, 0, N'95016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (112, N'Brandy Apricot', N'Replace of L Knee Jt with Synth Sub, Uncement, Open Approach', 2, N'/img/img.jpg', 229.97, 0, 0, N'96016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (113, N'Container - Clear 32 Oz', N'Supplement Thoracic Duct with Synth Sub, Open Approach', 2, N'/img/img.jpg', 233.19, 0, 0, N'97016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (114, N'Carroway Seed', N'Reposition Hepatic Artery, Open Approach', 2, N'/img/img.jpg', 871.94, 0, 0, N'98016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (115, N'Dates', N'Supplement Left Axilla with Synth Sub, Open Approach', 2, N'/img/img.jpg', 920.53, 0, 0, N'99016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (116, N'Tart Shells - Sweet, 4', N'Revision of Intraluminal Device in L Ear, Perc Endo Approach', 2, N'/img/img.jpg', 884.05, 0, 0, N'9a016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (117, N'Pepper - Jalapeno', N'Removal of Ext Fix from L Ankle Jt, Open Approach', 2, N'/img/img.jpg', 315.98, 0, 0, N'9b016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (118, N'Wine - Fume Blanc Fetzer', N'Dilate L Renal Art, Bifurc, w 2 Intralum Dev, Open', 2, N'/img/img.jpg', 714.56, 0, 0, N'9c016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (119, N'Oil - Coconut', N'Removal of Ext Fix from L Carpal Jt, Perc Approach', 2, N'/img/img.jpg', 214.14, 0, 0, N'9d016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (120, N'Wine - Alsace Riesling Reserve', N'Excision of Left External Jugular Vein, Open Approach', 2, N'/img/img.jpg', 205.18, 0, 0, N'9e016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (121, N'Pork - Kidney', N'Excision of Anus, Percutaneous Endoscopic Approach', 2, N'/img/img.jpg', 732.48, 0, 0, N'9f016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (122, N'Liners - Banana, Paper', N'Resection of Lesser Omentum, Open Approach', 2, N'/img/img.jpg', 762.21, 0, 0, N'a0016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.100' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (123, N'Easy Off Oven Cleaner', N'Remove Nonaut Sub from R Metacarpocarp Jt, Perc Endo', 2, N'/img/img.jpg', 679.23, 0, 0, N'a1016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (124, N'Rice - Basmati', N'Fusion 2-7 T Jt w Synth Sub, Post Appr P Col, Perc Endo', 2, N'/img/img.jpg', 883.74, 0, 0, N'a2016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (125, N'Flower - Carnations', N'Excision of Right Vas Deferens, Perc Endo Approach', 2, N'/img/img.jpg', 872.19, 0, 0, N'a3016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (126, N'Oneshot Automatic Soap System', N'Drainage of Left Axillary Vein, Open Approach', 2, N'/img/img.jpg', 533.17, 0, 0, N'a4016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (127, N'Venison - Liver', N'Dilation of L Ext Iliac Art with 2 Drug-elut, Perc Approach', 2, N'/img/img.jpg', 847.55, 0, 0, N'a5016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (128, N'Milk - Chocolate 250 Ml', N'Extirpate matter from Ant Neck Subcu/Fascia, Perc', 2, N'/img/img.jpg', 864.86, 0, 0, N'a6016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (129, N'Clam Nectar', N'Magnetic Resonance Imaging (MRI) of Brachial Plexus', 2, N'/img/img.jpg', 852.09, 0, 0, N'a7016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (130, N'Pectin', N'Release Right External Carotid Artery, Perc Endo Approach', 2, N'/img/img.jpg', 518.5, 0, 0, N'a8016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (131, N'Beef - Flank Steak', N'Drainage of R Low Arm & Wrist Tendon, Perc Endo Approach', 2, N'/img/img.jpg', 694.56, 0, 0, N'a9016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (132, N'Cake Slab', N'Excision of Right Internal Iliac Artery, Perc Endo Approach', 2, N'/img/img.jpg', 774.78, 0, 0, N'aa016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (133, N'Skirt - 29 Foot', N'Fluoroscopy of Bilateral Renal Veins using Other Contrast', 2, N'/img/img.jpg', 387.67, 0, 0, N'ab016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (134, N'Walkers Special Old Whiskey', N'Dilation of L Hand Art with 3 Intralum Dev, Perc Approach', 2, N'/img/img.jpg', 994.31, 0, 0, N'ac016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (135, N'Trueblue - Blueberry', N'Drainage of Cranial Cavity, Open Approach, Diagnostic', 2, N'/img/img.jpg', 216.06, 0, 0, N'ad016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (136, N'Ginger - Crystalized', N'Destruction of Right External Ear, Open Approach', 2, N'/img/img.jpg', 576.84, 0, 0, N'ae016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.103' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (137, N'Coffee - Flavoured', N'Occlusion of Right Axillary Vein, Percutaneous Approach', 2, N'/img/img.jpg', 664.41, 0, 0, N'af016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (138, N'Basil - Pesto Sauce', N'Repair Urethra, External Approach', 2, N'/img/img.jpg', 323.23, 0, 0, N'b0016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (139, N'Bar Nature Valley', N'Division of Left Sphenoid Bone, Percutaneous Approach', 2, N'/img/img.jpg', 892.82, 0, 0, N'b1016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (140, N'Sauce - Ranch Dressing', N'Division of Left Ovary, Open Approach', 2, N'/img/img.jpg', 185.01, 0, 0, N'b2016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (141, N'Versatainer Nc - 888', N'Release Right Ovary, Percutaneous Approach', 2, N'/img/img.jpg', 178.72, 0, 0, N'b3016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (142, N'Sping Loaded Cup Dispenser', N'Supplement Left Hip Joint with Synth Sub, Perc Approach', 2, N'/img/img.jpg', 252.43, 0, 0, N'b4016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (143, N'Soup Knorr Chili With Beans', N'Restrict Inf Mesent Art w Extralum Dev, Perc Endo', 2, N'/img/img.jpg', 905.59, 0, 0, N'b5016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (144, N'Pop Shoppe Cream Soda', N'Insertion of Monopln Ext Fix into R Fibula, Perc Approach', 2, N'/img/img.jpg', 895.73, 0, 0, N'b6016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (145, N'Soup Campbells Mexicali Tortilla', N'Fluoroscopy Bi Verteb Art w H Osm Contrast, Laser Intraop', 2, N'/img/img.jpg', 413.68, 0, 0, N'b7016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (146, N'Veal - Inside', N'Reposition Left Ethmoid Bone, Perc Endo Approach', 2, N'/img/img.jpg', 435.17, 0, 0, N'b8016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (147, N'Fudge - Chocolate Fudge', N'Revision of Drainage Device in Lum Disc, Perc Approach', 2, N'/img/img.jpg', 761.75, 0, 0, N'b9016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.107' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (148, N'Pastry - Cheese Baked Scones', N'Assistance with Resp Ventilation, >96 Hrs, Intermit Neg Air', 2, N'/img/img.jpg', 409.45, 0, 0, N'ba016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (149, N'Wine - Zonnebloem Pinotage', N'Removal of Int Fix from L Metacarpophal Jt, Open Approach', 2, N'/img/img.jpg', 168.29, 0, 0, N'bb016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (150, N'Lid - 3oz Med Rec', N'Dilate R Ant Tib Art, Bifurc, w Drug-elut Intra, Open', 2, N'/img/img.jpg', 358.25, 0, 0, N'bc016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (151, N'Vinegar - Balsamic, White', N'Detachment at Left Thumb, High, Open Approach', 2, N'/img/img.jpg', 107.78, 0, 0, N'bd016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (152, N'Triple Sec - Mcguinness', N'Immobilization of Left Finger using Brace', 2, N'/img/img.jpg', 458.93, 0, 0, N'be016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (153, N'Lettuce - Boston Bib - Organic', N'Dilate Innom Art, Bifurc, w 2 Intralum Dev, Perc Endo', 2, N'/img/img.jpg', 627.15, 0, 0, N'bf016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (154, N'Pastry - Cheese Baked Scones', N'Excision of Right Lower Lobe Bronchus, Via Opening', 2, N'/img/img.jpg', 146.41, 0, 0, N'c0016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (155, N'Beer - Camerons Auburn', N'Supplement L Knee Bursa/Lig with Synth Sub, Open Approach', 2, N'/img/img.jpg', 305.3, 0, 0, N'c1016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (156, N'Roe - Flying Fish', N'Imaging, Respiratory System, Fluoroscopy', 2, N'/img/img.jpg', 729.5, 0, 0, N'c2016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (157, N'Foam Tray S2', N'Occlusion Cystic Duct w Extralum Dev, Perc Endo', 2, N'/img/img.jpg', 296.43, 0, 0, N'c3016104-8fc4-e711-83f6-00090ffe0001', CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL, CAST(N'2017-11-08T11:13:40.110' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (158, N'Lala', N'Lala', 7, N'/img/lala', 100, 0, 0, N'c6d7b734-1bc6-e711-83f6-00090ffe0001', CAST(N'2017-11-10T10:29:41.893' AS DateTime), NULL, CAST(N'2017-11-10T10:29:41.893' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (159, N'lala', N'la', 2, N'/232/imag', 10, 0, 0, N'9c102d77-1bc6-e711-83f6-00090ffe0001', CAST(N'2017-11-10T10:31:33.393' AS DateTime), NULL, CAST(N'2017-11-10T10:31:33.393' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (160, N'la', N'la', 2, N'/imag/', 10, 0, 0, N'6354e9a6-1dc6-e711-83f6-00090ffe0001', CAST(N'2017-11-10T10:47:12.473' AS DateTime), NULL, CAST(N'2017-11-10T10:47:12.473' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Index [PK_CART]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [PK_CART] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexCartCookie]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexCartCookie] ON [dbo].[Cart]
(
	[Cookie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CARTITEM]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[CartItem] ADD  CONSTRAINT [PK_CARTITEM] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexCartItemCartId]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexCartItemCartId] ON [dbo].[CartItem]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexCategoryName]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexCategoryName] ON [dbo].[Category]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Client]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [PK_Client] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexClientEmail]    Script Date: 10/11/2017 13:27:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IndexClientEmail] ON [dbo].[Client]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexClientLastName]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexClientLastName] ON [dbo].[Client]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderCount]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexOrderCount] ON [dbo].[Client]
(
	[OrderCount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexCountryName]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexCountryName] ON [dbo].[Country]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Dealer]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[Dealer] ADD  CONSTRAINT [PK_Dealer] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexDealerCountry]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexDealerCountry] ON [dbo].[Dealer]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexDealerLastName]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexDealerLastName] ON [dbo].[Dealer]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ERROR]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[Error] ADD  CONSTRAINT [PK_ERROR] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexErrorDate]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexErrorDate] ON [dbo].[Error]
(
	[ErrorDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ORDER]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [PK_ORDER] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderClientId]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexOrderClientId] ON [dbo].[Order]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderDate]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexOrderDate] ON [dbo].[Order]
(
	[OrderDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderOrderNumber]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexOrderOrderNumber] ON [dbo].[Order]
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ORDERDETAIL]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [PK_ORDERDETAIL] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderDetailOrderId]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexOrderDetailOrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ORDERNUMBER]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[OrderNumber] ADD  CONSTRAINT [PK_ORDERNUMBER] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexOrderNumber]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexOrderNumber] ON [dbo].[OrderNumber]
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PRODUCT]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [PK_PRODUCT] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexProductAvgStars]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexProductAvgStars] ON [dbo].[Product]
(
	[AvgStars] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexProductDealerId]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexProductDealerId] ON [dbo].[Product]
(
	[DealerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexProductPrice]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexProductPrice] ON [dbo].[Product]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexProductQuantitySold]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexProductQuantitySold] ON [dbo].[Product]
(
	[QuantitySold] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexProductTitle]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexProductTitle] ON [dbo].[Product]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_RATING]    Script Date: 10/11/2017 13:27:07 ******/
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [PK_RATING] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexRatingClientId]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexRatingClientId] ON [dbo].[Rating]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndexRatingProductId]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexRatingProductId] ON [dbo].[Rating]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndexSettingName]    Script Date: 10/11/2017 13:27:07 ******/
CREATE NONCLUSTERED INDEX [IndexSettingName] ON [dbo].[Setting]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [CartDate]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [ItemCount]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (newsequentialid()) FOR [Rowid]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[CartItem] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[CartItem] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[CartItem] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT (getdate()) FOR [SignupDate]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT (newsequentialid()) FOR [Rowid]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT ((0)) FOR [OrderCount]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Dealer] ADD  DEFAULT ((0)) FOR [TotalProducts]
GO
ALTER TABLE [dbo].[Dealer] ADD  DEFAULT (newsequentialid()) FOR [Rowid]
GO
ALTER TABLE [dbo].[Dealer] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Dealer] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Error] ADD  DEFAULT (getdate()) FOR [ErrorDate]
GO
ALTER TABLE [dbo].[Error] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Error] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [ItemCount]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (newsequentialid()) FOR [Rowid]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[OrderNumber] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[OrderNumber] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [QuantitySold]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [AvgStars]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (newsequentialid()) FOR [Rowid]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Rating] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Rating] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Setting] ADD  DEFAULT (getdate()) FOR [LastChangeDate]
GO
ALTER TABLE [dbo].[Setting] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Setting] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CARTITEM_REFERENCE_CART] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([Id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CARTITEM_REFERENCE_CART]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_CLIENT_REFERENCE_COUNTRY] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_CLIENT_REFERENCE_COUNTRY]
GO
ALTER TABLE [dbo].[Dealer]  WITH CHECK ADD  CONSTRAINT [FK_DEALER_REFERENCE_CATEGORY] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Dealer] CHECK CONSTRAINT [FK_DEALER_REFERENCE_CATEGORY]
GO
ALTER TABLE [dbo].[Dealer]  WITH CHECK ADD  CONSTRAINT [FK_DEALER_REFERENCE_COUNTRY] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Dealer] CHECK CONSTRAINT [FK_DEALER_REFERENCE_COUNTRY]
GO
ALTER TABLE [dbo].[LocaleStringResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocaleStringResource_dbo.Language_Language_Id] FOREIGN KEY([Language_Id])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[LocaleStringResource] CHECK CONSTRAINT [FK_dbo.LocaleStringResource_dbo.Language_Language_Id]
GO
ALTER TABLE [dbo].[LocaleStringResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocaleStringResource_dbo.LocaleResourceKey_LocaleResourceKey_Id] FOREIGN KEY([LocaleResourceKey_Id])
REFERENCES [dbo].[LocaleResourceKey] ([Id])
GO
ALTER TABLE [dbo].[LocaleStringResource] CHECK CONSTRAINT [FK_dbo.LocaleStringResource_dbo.LocaleResourceKey_LocaleResourceKey_Id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_REFERENCE_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDER_REFERENCE_Client]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDET_REFERENCE_ORDER] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_ORDERDET_REFERENCE_ORDER]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDET_REFERENCE_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_ORDERDET_REFERENCE_PRODUCT]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_REFERENCE_Dealer] FOREIGN KEY([DealerId])
REFERENCES [dbo].[Dealer] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_PRODUCT_REFERENCE_Dealer]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_RATING_REFERENCE_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_RATING_REFERENCE_Client]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_RATING_REFERENCE_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_RATING_REFERENCE_PRODUCT]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [CKC_GSTATE_ORDER] CHECK  (([State]='Reviewed' OR [State]='Suspended' OR [State]='Closed' OR [State]='Cancelled' OR [State]='Approved'))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [CKC_GSTATE_ORDER]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Poductos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Poductos'
GO
USE [master]
GO
ALTER DATABASE [LeatherGoods] SET  READ_WRITE 
GO
