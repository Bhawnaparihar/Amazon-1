USE [master]
GO
/****** Object:  Database [RadixDb]    Script Date: 24-02-2020 17:30:20 ******/
CREATE DATABASE [RadixDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RadixDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\RadixDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RadixDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\RadixDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RadixDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RadixDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RadixDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RadixDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RadixDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RadixDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RadixDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RadixDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RadixDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RadixDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RadixDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RadixDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RadixDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RadixDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RadixDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RadixDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RadixDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RadixDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RadixDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RadixDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RadixDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RadixDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RadixDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RadixDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RadixDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RadixDb] SET  MULTI_USER 
GO
ALTER DATABASE [RadixDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RadixDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RadixDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RadixDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RadixDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RadixDb] SET QUERY_STORE = OFF
GO
USE [RadixDb]
GO
/****** Object:  Schema [core]    Script Date: 24-02-2020 17:30:20 ******/
CREATE SCHEMA [core]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductPrice] [bigint] NOT NULL,
	[SellerDetailId] [int] NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
	[BrandId] [int] NULL,
	[SizeId] [int] NULL,
	[MaterialId] [int] NULL,
	[ColorId] [int] NULL,
	[LanguageId] [int] NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[SellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vBrands]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBrands]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Brands ON dbo.Sellers.BrandId = dbo.Brands.BrandId
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[Size] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vSizes]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSizes]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Sizes ON dbo.Sellers.SizeId = dbo.Sizes.SizeId
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[Material] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vMaterials]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vMaterials]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Materials ON dbo.Sellers.MaterialId = dbo.Materials.MaterialId
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vColors]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vColors]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Colors ON dbo.Sellers.ColorId = dbo.Colors.ColorId
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Language] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vLanguages]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLanguages]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Languages ON dbo.Sellers.LanguageId = dbo.Languages.LanguageId
GO
/****** Object:  Table [dbo].[ApplicationLocales]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationLocales](
	[ApplicationLocaleId] [int] IDENTITY(1,1) NOT NULL,
	[LocaleCode] [varchar](50) NOT NULL,
	[LocaleName] [nvarchar](300) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationLocales] PRIMARY KEY CLUSTERED 
(
	[ApplicationLocaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationTimeZones]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationTimeZones](
	[ApplicationTimeZoneId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationTimeZoneName] [nvarchar](100) NOT NULL,
	[Comment] [nvarchar](200) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_TimeZones] PRIMARY KEY CLUSTERED 
(
	[ApplicationTimeZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationLocaleId] [int] NOT NULL,
	[ApplicationTimeZoneId] [int] NOT NULL,
	[LanguageCode] [varchar](3) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [binary](132) NOT NULL,
	[Salt] [binary](140) NOT NULL,
	[LoginBlocked] [bit] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vUsers]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUsers]
AS
SELECT        appuser.UserId, timezone.ApplicationTimeZoneName, appuser.LanguageCode, appuser.UserName, appuser.Password, appuser.Salt, appuser.LoginBlocked, locale.LocaleCode
FROM            dbo.Users AS appuser INNER JOIN
                         dbo.ApplicationLocales AS locale ON appuser.ApplicationLocaleId = locale.ApplicationLocaleId INNER JOIN
                         dbo.ApplicationTimeZones AS timezone ON appuser.ApplicationTimeZoneId = timezone.ApplicationTimeZoneId
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[AppUserId] [int] IDENTITY(1,1) NOT NULL,
	[AppUserName] [varchar](20) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductQuantity] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[PaymentDate] [datetimeoffset](7) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CartValue] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerDetails]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerDetails](
	[SellerDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[PanNumber] [varchar](10) NOT NULL,
	[BankDetailId] [int] NOT NULL,
	[ShippingFeeDetailId] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_SellerDetails] PRIMARY KEY CLUSTERED 
(
	[SellerDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[PromoCodeId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId] [int] NOT NULL,
	[InvoiceDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vInvoices]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vInvoices]
AS
SELECT        dbo.Invoices.InvoiceId, dbo.Invoices.InvoiceDate, dbo.AppUsers.AppUserName, dbo.SellerDetails.CompanyName, dbo.Sellers.ProductName, dbo.CartItems.ProductQuantity, dbo.Sellers.ProductPrice, dbo.Orders.CreatedDate, 
                         dbo.Carts.CartValue
FROM            dbo.Payments INNER JOIN
                         dbo.Invoices ON dbo.Payments.PaymentId = dbo.Invoices.PaymentId INNER JOIN
                         dbo.Orders ON dbo.Payments.OrderId = dbo.Orders.OrderId INNER JOIN
                         dbo.AppUsers INNER JOIN
                         dbo.Carts ON dbo.AppUsers.AppUserId = dbo.Carts.AppUserId INNER JOIN
                         dbo.CartItems ON dbo.Carts.CartId = dbo.CartItems.CartId ON dbo.Orders.AppUserId = dbo.AppUsers.AppUserId INNER JOIN
                         dbo.Sellers ON dbo.AppUsers.AppUserId = dbo.Sellers.RoleId INNER JOIN
                         dbo.SellerDetails ON dbo.AppUsers.AppUserId = dbo.SellerDetails.AppUserId AND dbo.Sellers.SellerDetailId = dbo.SellerDetails.SellerDetailId
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryId] [int] NOT NULL,
	[SellerId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vCartItems]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vCartItems]
AS
SELECT        dbo.Sellers.ProductName, dbo.Sellers.ProductPrice, dbo.CartItems.ProductQuantity, dbo.Carts.CartValue
FROM            dbo.Products INNER JOIN
                         dbo.Sellers ON dbo.Products.SellerId = dbo.Sellers.SellerId INNER JOIN
                         dbo.CartItems ON dbo.Products.ProductId = dbo.CartItems.ProductId INNER JOIN
                         dbo.Carts ON dbo.CartItems.CartId = dbo.Carts.CartId
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[AdvertisementId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [image] NULL,
	[OfferId] [int] NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_Advertisements] PRIMARY KEY CLUSTERED 
(
	[AdvertisementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[SellerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ValidityFrom] [datetimeoffset](7) NOT NULL,
	[ValidityTill] [datetimeoffset](7) NOT NULL,
	[DiscountPrice] [int] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[OfferId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OfferPercentage] [int] NOT NULL,
	[DiscountId] [int] NOT NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[OfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAdvertisements]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAdvertisements]
AS
SELECT        dbo.Advertisements.AdvertisementId, dbo.Offers.OfferPercentage, dbo.Discounts.DiscountPrice
FROM            dbo.Advertisements INNER JOIN
                         dbo.Offers ON dbo.Advertisements.OfferId = dbo.Offers.OfferId INNER JOIN
                         dbo.Discounts ON dbo.Offers.DiscountId = dbo.Discounts.DiscountId
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationModules]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationModules](
	[ApplicationModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleMasterId] [int] NOT NULL,
	[ParentApplicationModuleId] [int] NULL,
 CONSTRAINT [PK_ApplicationModules] PRIMARY KEY CLUSTERED 
(
	[ApplicationModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjects]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjects](
	[ApplicationObjectId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeId] [int] NOT NULL,
	[ApplicationObjectName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjects] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjectTypes]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjectTypes](
	[ApplicationObjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjectTypes] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserTokens]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserTokens](
	[ApplicationUserTokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SecurityKey] [varchar](200) NOT NULL,
	[JwtToken] [varchar](max) NOT NULL,
	[AudienceType] [varchar](50) NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ApplicationUserTokens] PRIMARY KEY CLUSTERED 
(
	[ApplicationUserTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankDetails]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankDetails](
	[BankDetailId] [int] IDENTITY(1,1) NOT NULL,
	[AccountHolderName] [varchar](50) NOT NULL,
	[AccountType] [varchar](50) NOT NULL,
	[AccountNumber] [int] NOT NULL,
 CONSTRAINT [PK_BankDetails] PRIMARY KEY CLUSTERED 
(
	[BankDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [bigint] NOT NULL,
	[CardType] [varchar](50) NOT NULL,
	[ExpiryDate] [varchar](50) NOT NULL,
	[Cvv] [smallint] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentLanguageContents]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentLanguageContents](
	[ComponentLanguageContentId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentKeyId] [int] NOT NULL,
	[LanguageContentId] [int] NOT NULL,
	[En] [varchar](max) NULL,
	[Fr] [varchar](max) NULL,
 CONSTRAINT [PK_ModuleProperties] PRIMARY KEY CLUSTERED 
(
	[ComponentLanguageContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBacks](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [varchar](50) NULL,
	[Image] [image] NULL,
	[Ratings] [float] NOT NULL,
	[AppUserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_FeedBacks] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageContentKeys]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageContentKeys](
	[LanguageContentKeyId] [int] IDENTITY(1,1) NOT NULL,
	[KeyName] [varchar](50) NOT NULL,
	[IsComponent] [bit] NOT NULL,
 CONSTRAINT [PK_LanguageContentKeys] PRIMARY KEY CLUSTERED 
(
	[LanguageContentKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageContents]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageContents](
	[LanguageContentId] [int] IDENTITY(1,1) NOT NULL,
	[LanguageContentKeyId] [int] NOT NULL,
	[ContentType] [varchar](3) NOT NULL,
	[En] [varchar](max) NOT NULL,
	[Fr] [varchar](max) NULL,
 CONSTRAINT [PK_LanguageContents] PRIMARY KEY CLUSTERED 
(
	[LanguageContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleMasters]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleMasters](
	[ModuleMasterId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleMasterName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ModuleMasters] PRIMARY KEY CLUSTERED 
(
	[ModuleMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musics]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musics](
	[MusicId] [int] IDENTITY(1,1) NOT NULL,
	[MusicName] [varchar](20) NOT NULL,
	[MusicSubCategoryId] [int] NOT NULL,
	[AlbumName] [varchar](20) NOT NULL,
	[ArtistName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Musics] PRIMARY KEY CLUSTERED 
(
	[MusicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusicSubCategories]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicSubCategories](
	[MusicSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[PrimeMusicId] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_MusicSubCategories] PRIMARY KEY CLUSTERED 
(
	[MusicSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ExpectedDate] [datetimeoffset](7) NOT NULL,
	[ShippingFeeDetailId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[CartId] [int] NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_OrdeDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otps]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otps](
	[OtpId] [int] IDENTITY(1,1) NOT NULL,
	[OtpNumber] [int] NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_Otps] PRIMARY KEY CLUSTERED 
(
	[OtpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimeMusics]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimeMusics](
	[PrimeMusicId] [int] IDENTITY(1,1) NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_PrimeMusics] PRIMARY KEY CLUSTERED 
(
	[PrimeMusicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryName] [varchar](50) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSubCategories]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSubCategories](
	[ProductSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryName] [varchar](50) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductSubCategories] PRIMARY KEY CLUSTERED 
(
	[ProductSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromoCodes]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromoCodes](
	[PromoCodeId] [int] IDENTITY(1,1) NOT NULL,
	[PromoCodeName] [varchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PromoCodes] PRIMARY KEY CLUSTERED 
(
	[PromoCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ApplicationModuleId] [int] NOT NULL,
	[CanView] [bit] NULL,
	[CanAdd] [bit] NULL,
	[CanEdit] [bit] NULL,
	[CanDelete] [bit] NULL,
	[PermissionPriority] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RolePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ShippingDate] [datetimeoffset](7) NOT NULL,
	[SellerId] [int] NOT NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingFeeDetails]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingFeeDetails](
	[ShippingFeeDetailId] [int] IDENTITY(1,1) NOT NULL,
	[LocalAmount] [int] NOT NULL,
	[RegionalAmount] [int] NOT NULL,
	[NationalAmount] [int] NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_ShippingFeeDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingFeeDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[TaxDetails] [varchar](50) NOT NULL,
	[Gst] [varchar](50) NOT NULL,
	[Signature] [image] NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddresses]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddresses](
	[UserAddressId] [int] IDENTITY(1,1) NOT NULL,
	[HouseNumber] [varchar](50) NOT NULL,
	[Area] [varchar](50) NULL,
	[Landmark] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[UserAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__NoAcc__114A936A]  DEFAULT ((0)) FOR [CanView]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__Reado__123EB7A3]  DEFAULT ((0)) FOR [CanAdd]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF_RolePermissions_AllowView]  DEFAULT ((0)) FOR [CanEdit]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__FullA__1332DBDC]  DEFAULT ((0)) FOR [CanDelete]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LoginBlocked]  DEFAULT ((0)) FOR [LoginBlocked]
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD  CONSTRAINT [FK_Admins_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Admins] CHECK CONSTRAINT [FK_Admins_Roles]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_ApplicationObjects]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_Offers] FOREIGN KEY([OfferId])
REFERENCES [dbo].[Offers] ([OfferId])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_Offers]
GO
ALTER TABLE [dbo].[ApplicationLocales]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationLocales_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ApplicationLocales] CHECK CONSTRAINT [FK_ApplicationLocales_ApplicationObjects]
GO
ALTER TABLE [dbo].[ApplicationModules]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationModules_ModuleMasters] FOREIGN KEY([ModuleMasterId])
REFERENCES [dbo].[ModuleMasters] ([ModuleMasterId])
GO
ALTER TABLE [dbo].[ApplicationModules] CHECK CONSTRAINT [FK_ApplicationModules_ModuleMasters]
GO
ALTER TABLE [dbo].[ApplicationObjects]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationObjects_ApplicationObjectTypes] FOREIGN KEY([ApplicationObjectTypeId])
REFERENCES [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId])
GO
ALTER TABLE [dbo].[ApplicationObjects] CHECK CONSTRAINT [FK_ApplicationObjects_ApplicationObjectTypes]
GO
ALTER TABLE [dbo].[ApplicationTimeZones]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationTimeZones_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ApplicationTimeZones] CHECK CONSTRAINT [FK_ApplicationTimeZones_ApplicationObjects]
GO
ALTER TABLE [dbo].[ApplicationUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUserTokens_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ApplicationUserTokens] CHECK CONSTRAINT [FK_ApplicationUserTokens_Users]
GO
ALTER TABLE [dbo].[AppUsers]  WITH CHECK ADD  CONSTRAINT [FK_AppUsers_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[AppUsers] CHECK CONSTRAINT [FK_AppUsers_Roles]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_AppUsers]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([CartId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_AppUsers]
GO
ALTER TABLE [dbo].[ComponentLanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_ComponentLanguageContents_LanguageContentKeys] FOREIGN KEY([ComponentKeyId])
REFERENCES [dbo].[LanguageContentKeys] ([LanguageContentKeyId])
GO
ALTER TABLE [dbo].[ComponentLanguageContents] CHECK CONSTRAINT [FK_ComponentLanguageContents_LanguageContentKeys]
GO
ALTER TABLE [dbo].[ComponentLanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_ComponentLanguageContents_LanguageContents] FOREIGN KEY([LanguageContentId])
REFERENCES [dbo].[LanguageContents] ([LanguageContentId])
GO
ALTER TABLE [dbo].[ComponentLanguageContents] CHECK CONSTRAINT [FK_ComponentLanguageContents_LanguageContents]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Products]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Sellers]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_AppUsers]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_Products]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Payments] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payments] ([PaymentId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Payments]
GO
ALTER TABLE [dbo].[LanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_LanguageContents_LanguageContentKeys] FOREIGN KEY([LanguageContentKeyId])
REFERENCES [dbo].[LanguageContentKeys] ([LanguageContentKeyId])
GO
ALTER TABLE [dbo].[LanguageContents] CHECK CONSTRAINT [FK_LanguageContents_LanguageContentKeys]
GO
ALTER TABLE [dbo].[ModuleMasters]  WITH CHECK ADD  CONSTRAINT [FK_ModuleMasters_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ModuleMasters] CHECK CONSTRAINT [FK_ModuleMasters_ApplicationObjects]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_MusicSubCategories] FOREIGN KEY([MusicSubCategoryId])
REFERENCES [dbo].[MusicSubCategories] ([MusicSubCategoryId])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_MusicSubCategories]
GO
ALTER TABLE [dbo].[MusicSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_MusicSubCategories_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[MusicSubCategories] CHECK CONSTRAINT [FK_MusicSubCategories_ApplicationObjects]
GO
ALTER TABLE [dbo].[MusicSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_MusicSubCategories_PrimeMusics] FOREIGN KEY([PrimeMusicId])
REFERENCES [dbo].[PrimeMusics] ([PrimeMusicId])
GO
ALTER TABLE [dbo].[MusicSubCategories] CHECK CONSTRAINT [FK_MusicSubCategories_PrimeMusics]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Discounts] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([DiscountId])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Discounts]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetails_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([CartId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrdeDetails_Carts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrdeDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetails_ShippingFeeDetails] FOREIGN KEY([ShippingFeeDetailId])
REFERENCES [dbo].[ShippingFeeDetails] ([ShippingFeeDetailId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrdeDetails_ShippingFeeDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ApplicationObjects]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AppUsers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PromoCodes] FOREIGN KEY([PromoCodeId])
REFERENCES [dbo].[PromoCodes] ([PromoCodeId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PromoCodes]
GO
ALTER TABLE [dbo].[Otps]  WITH CHECK ADD  CONSTRAINT [FK_Otps_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Otps] CHECK CONSTRAINT [FK_Otps_AppUsers]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_ApplicationObjects]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders]
GO
ALTER TABLE [dbo].[PrimeMusics]  WITH CHECK ADD  CONSTRAINT [FK_PrimeMusics_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[PrimeMusics] CHECK CONSTRAINT [FK_PrimeMusics_AppUsers]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_ApplicationObjects]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Stores]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductSubCategories] FOREIGN KEY([ProductSubCategoryId])
REFERENCES [dbo].[ProductSubCategories] ([ProductSubCategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductSubCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sellers]
GO
ALTER TABLE [dbo].[ProductSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubCategories_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[ProductSubCategories] CHECK CONSTRAINT [FK_ProductSubCategories_ProductCategories]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_ApplicationModules] FOREIGN KEY([ApplicationModuleId])
REFERENCES [dbo].[ApplicationModules] ([ApplicationModuleId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_ApplicationModules]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_ApplicationObjects]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_ApplicationObjects1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_ApplicationObjects1]
GO
ALTER TABLE [dbo].[SellerDetails]  WITH CHECK ADD  CONSTRAINT [FK_SellerDetails_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[SellerDetails] CHECK CONSTRAINT [FK_SellerDetails_AppUsers]
GO
ALTER TABLE [dbo].[SellerDetails]  WITH CHECK ADD  CONSTRAINT [FK_SellerDetails_SellerDetails] FOREIGN KEY([BankDetailId])
REFERENCES [dbo].[BankDetails] ([BankDetailId])
GO
ALTER TABLE [dbo].[SellerDetails] CHECK CONSTRAINT [FK_SellerDetails_SellerDetails]
GO
ALTER TABLE [dbo].[SellerDetails]  WITH CHECK ADD  CONSTRAINT [FK_SellerDetails_ShippingFeeDetails] FOREIGN KEY([ShippingFeeDetailId])
REFERENCES [dbo].[ShippingFeeDetails] ([ShippingFeeDetailId])
GO
ALTER TABLE [dbo].[SellerDetails] CHECK CONSTRAINT [FK_SellerDetails_ShippingFeeDetails]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_ApplicationObjects]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_AppUsers] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_AppUsers]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Brands]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Colors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([ColorId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Colors]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Languages]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([MaterialId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Materials]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Roles]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_SellerDetails] FOREIGN KEY([SellerDetailId])
REFERENCES [dbo].[SellerDetails] ([SellerDetailId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_SellerDetails]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Sizes] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([SizeId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Sizes]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_Sellers]
GO
ALTER TABLE [dbo].[ShippingFeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingFeeDetails_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ShippingFeeDetails] CHECK CONSTRAINT [FK_ShippingFeeDetails_ApplicationObjects]
GO
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_ApplicationObjects]
GO
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_AppUsers]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_ApplicationObjects]
GO
/****** Object:  StoredProcedure [dbo].[spCanDeleteRecord]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spCanDeleteRecord](@TableName nvarchar(50), @RecordId int)
AS
BEGIN
			--DECLARE @RecordId INT=1
			--DECLARE @TableName nvarchar(50)='ApplicationModules'

			DECLARE @FkName nvarchar(250)
			DECLARE @ParentTable nvarchar(100)
			DECLARE @KeyName nvarchar(100)
			DECLARE @ReferenceTable nvarchar(100)
			DECLARE @TableSchema nvarchar(100)

			DECLARE @DynSql nvarchar(max)
			DECLARE @ReturnValue bit = 0
			CREATE TABLE #myTable(Cnt int)

			DECLARE RefCursor Cursor FOR
							SELECT
								    fk.name 'FkName',
								    tp.name 'ParentTable',
								    cp.name 'KeyName', 
									tr.name 'RefrenceTable',
									info.TABLE_SCHEMA 'TableSchema'
							FROM 
									sys.foreign_keys fk
									INNER JOIN 
									    sys.tables tp ON fk.parent_object_id = tp.object_id
									INNER JOIN 
										sys.tables tr ON fk.referenced_object_id = tr.object_id
									INNER JOIN 
										sys.foreign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
									INNER JOIN 
										sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
									INNER JOIN 
										sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
						             INNER JOIN 
									    INFORMATION_SCHEMA.COLUMNS info ON tp.[name] =info.TABLE_NAME
							WHERE 
									tr.name=@TableName
									and tp.name!='Addresses' --To be removed once actual implementation done with Archi. 14-07-2017

			OPEN RefCursor
			FETCH NEXT FROM RefCursor INTO @FkName, @ParentTable, @KeyName, @ReferenceTable,@TableSchema
			WHILE @@FETCH_STATUS=0
			BEGIN
					--SELECT 	@FkName, @ParentTable, @KeyName, @ReferenceTable
					SET @DynSql	='	SELECT COUNT(*) Cnt FROM ' +@TableSchema+'.' + @ParentTable + '  WHERE ' + @KeyName + ' = ' + Cast(@RecordId as nvarchar(5))

					INSERT INTO #myTable(Cnt)
					EXEC (@DynSQL)  

					IF EXISTS(Select CNT from #myTable WHERE CNT>0)
					BEGIN
							SET @ReturnValue =1
							BREAK;
					END
					SET @DynSql=''		
					FETCH NEXT FROM RefCursor INTO @FkName, @ParentTable, @KeyName, @ReferenceTable,@TableSchema
			END
			CLOSE RefCursor
			Deallocate RefCursor
			DROP TABLE #myTable
			SELECT 1 as Id,  @ReturnValue as Result

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchProducts]    Script Date: 24-02-2020 17:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSearchProducts]
	-- Add the parameters for the stored procedure here
	@Product varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductName from Sellers where (ProductName like @Product + '%') 
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent Application Module' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationModules', @level2type=N'COLUMN',@level2name=N'ParentApplicationModuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Main Primary Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationObjects', @level2type=N'COLUMN',@level2name=N'ApplicationObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application Objects is used Application wide' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationObjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thid field is the reference of LanguageContentKeys table, This stores only those ids of the respective IsComponent column value is true.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ComponentLanguageContents', @level2type=N'COLUMN',@level2name=N'ComponentKeyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'only respective values are allowed  like for placeholder ''p'', label ''l'',gridHeader ''gh''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LanguageContents', @level2type=N'COLUMN',@level2name=N'ContentType'
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
         Begin Table = "Advertisements"
            Begin Extent = 
               Top = 210
               Left = 59
               Bottom = 340
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Offers"
            Begin Extent = 
               Top = 115
               Left = 327
               Bottom = 245
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Discounts"
            Begin Extent = 
               Top = 28
               Left = 580
               Bottom = 156
               Right = 750
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAdvertisements'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAdvertisements'
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
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Brands"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBrands'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBrands'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[5] 2[20] 3) )"
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
         Begin Table = "Carts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 35
               Left = 1058
               Bottom = 165
               Right = 1252
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 66
               Left = 707
               Bottom = 179
               Right = 916
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CartItems"
            Begin Extent = 
               Top = 146
               Left = 367
               Bottom = 276
               Right = 544
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
      End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCartItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCartItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCartItems'
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
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Colors"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vColors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vColors'
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
         Begin Table = "AppUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Carts"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CartItems"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Invoices"
            Begin Extent = 
               Top = 6
               Left = 669
               Bottom = 128
               Right = 839
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Payments"
            Begin Extent = 
               Top = 6
               Left = 877
               Bottom = 136
               Right = 1072
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 1110
               Bottom = 136
               Right = 1280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 175
               Left = 552
               Bottom = 305
               Right = 747
            End
            DisplayFlags = 280
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            TopColumn = 0
         End
         Begin Table = "SellerDetails"
            Begin Extent = 
               Top = 169
               Left = 98
               Bottom = 299
               Right = 292
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
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
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Languages"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLanguages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLanguages'
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
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Materials"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vMaterials'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vMaterials'
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
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sizes"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vSizes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vSizes'
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
         Begin Table = "appuser"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "locale"
            Begin Extent = 
               Top = 6
               Left = 289
               Bottom = 136
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "timezone"
            Begin Extent = 
               Top = 6
               Left = 521
               Bottom = 136
               Right = 756
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
USE [master]
GO
ALTER DATABASE [RadixDb] SET  READ_WRITE 
GO
