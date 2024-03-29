USE [master]
GO
/****** Object:  Database [MovieWeb]    Script Date: 11/30/2023 7:51:35 PM ******/
CREATE DATABASE [MovieWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSQL\MSSQL\DATA\MovieWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSQL\MSSQL\DATA\MovieWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MovieWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieWeb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MovieWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [MovieWeb] SET  MULTI_USER 
GO
ALTER DATABASE [MovieWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MovieWeb', N'ON'
GO
ALTER DATABASE [MovieWeb] SET QUERY_STORE = OFF
GO
USE [MovieWeb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/30/2023 7:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Episode]    Script Date: 11/30/2023 7:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episode](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[videoSrc] [nvarchar](max) NOT NULL,
	[MovieID] [bigint] NOT NULL,
 CONSTRAINT [PK_Episode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow]    Script Date: 11/30/2023 7:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow](
	[MovieID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
 CONSTRAINT [PK_Follow] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 11/30/2023 7:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 11/30/2023 7:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NOT NULL,
	[updatedDate] [nvarchar](max) NOT NULL,
	[Duration] [nvarchar](max) NOT NULL,
	[realeasedYear] [int] NOT NULL,
	[numOfLikes] [int] NOT NULL,
	[numOfViews] [int] NOT NULL,
	[Rating] [float] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[imgSrc] [nvarchar](max) NOT NULL,
	[NationID] [bigint] NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenre]    Script Date: 11/30/2023 7:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenre](
	[MovieID] [bigint] NOT NULL,
	[GenreID] [bigint] NOT NULL,
 CONSTRAINT [PK_MovieGenre] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nation]    Script Date: 11/30/2023 7:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nation](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Nation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/30/2023 7:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
	[IsEmailConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231125012447_init', N'7.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231126102722_ud1', N'7.0.14')
GO
SET IDENTITY_INSERT [dbo].[Episode] ON 

INSERT [dbo].[Episode] ([ID], [Name], [videoSrc], [MovieID]) VALUES (1, N'Trailer', N'https://www.youtube.com/embed/IkaP0KJWTsQ', 2)
INSERT [dbo].[Episode] ([ID], [Name], [videoSrc], [MovieID]) VALUES (2, N'Trailer', N'https://www.youtube.com/embed/AsZj4AFPfcE', 3)
INSERT [dbo].[Episode] ([ID], [Name], [videoSrc], [MovieID]) VALUES (3, N'Full', N'https://localhost:7257/video/NhaBaNu.mp4', 2)
INSERT [dbo].[Episode] ([ID], [Name], [videoSrc], [MovieID]) VALUES (4, N'1', N'https://localhost:7257/video/BlueLock.mp4', 10)
INSERT [dbo].[Episode] ([ID], [Name], [videoSrc], [MovieID]) VALUES (5, N'2', N'https://localhost:7257/video/BlueLock.mp4', 10)
INSERT [dbo].[Episode] ([ID], [Name], [videoSrc], [MovieID]) VALUES (8, N'Full', N'https://localhost:7257/video/BlueLock.mp4', 3)
INSERT [dbo].[Episode] ([ID], [Name], [videoSrc], [MovieID]) VALUES (10, N'Full', N'https://localhost:7257/video/BlueLock.mp4', 35)
SET IDENTITY_INSERT [dbo].[Episode] OFF
GO
INSERT [dbo].[Follow] ([MovieID], [UserID]) VALUES (3, 1)
INSERT [dbo].[Follow] ([MovieID], [UserID]) VALUES (10, 1)
INSERT [dbo].[Follow] ([MovieID], [UserID]) VALUES (3, 2)
INSERT [dbo].[Follow] ([MovieID], [UserID]) VALUES (10, 2)
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([ID], [Name]) VALUES (1, N'Hành động')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (2, N'Lãng mạn')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (3, N'Học đường')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (4, N'Kinh dị')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (5, N'Tâm lý')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (6, N'Hoạt hình')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (2, N'Nhà bà Nữ', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-25 11:11:50', N'120 mins', 2023, 0, 8, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/NhaBaNu.jpg', 1)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (3, N'Hai Phượng', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-25 20:49:09', N'120 mins', 2019, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/HaiPhuong.jpg', 1)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (10, N'Blue Lock', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-28 00:26:31', N'24 mins', 2021, 0, 14, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/BlueLock.jpg', 4)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (11, N'A Silent Voice', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-29 08:35:58', N'120 mins', 2016, 0, 1, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/ASilentVoice.jpg', 4)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (12, N'Fairy Tail', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-29 08:36:35', N'24 mins', 2009, 0, 0, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/FairyTail.jpg', 4)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (13, N'Bố già', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-29 08:38:39', N'120 mins', 2021, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/BoGia.jpg', 1)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (14, N'Kimetsu no Yaiba: Mugen Ressha-hen', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-29 08:39:12', N'120 mins', 2020, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/DemonSlayer-MugenTrain.jpg', 4)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (15, N'Gintama', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-29 08:39:35', N'24 mins', 2006, 0, 0, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/Gintama.jpg', 4)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (16, N'Jujutsu Kaisen 0', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-29 08:39:57', N'120 mins', 2021, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/JujutsuKaisen0.jpg', 4)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (17, N'Ngọc Cốt Dao', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-29 08:40:33', N'24 mins', 2023, 0, 0, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/NgocCotDao.jpg', 3)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (18, N'Mười', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 08:48:06', N'120 mins', 2007, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/Muoi.jpg', 1)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (19, N'The Penthouse', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 08:53:12', N'24 mins', 2020, 0, 0, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/ThePenthouse.jpg', 6)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (20, N'All of Us Are Dead', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 08:54:34', N'24 mins', 2022, 0, 0, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/AllOfUsAreDead.jpg', 6)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (21, N'One Piece', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'1085/??', N'2023-11-30 08:55:58', N'24 mins', 1999, 0, 0, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/OnePiece.jpg', 4)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (22, N'Naruto Shippuden', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 08:57:56', N'24 mins', 2007, 0, 0, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/NarutoShippuden.jpg', 4)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (23, N'The Escape of the Seven', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 09:00:07', N'24 mins', 2023, 0, 0, 10, N'Phim bộ', N'https://localhost:7257/img/Movies/TheEscapeOfTheSeven.jpg', 6)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (24, N'Kung Fu Hustle', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 09:03:11', N'120 mins', 2004, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/KungFuHustle.jpg', 3)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (25, N'Shaolin Soccer', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 09:24:54', N'120 mins', 2001, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/ShaolinSoccer.jpg', 3)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (26, N'Spider-Man: Homecoming', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 09:25:44', N'120 mins', 2017, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/Spider-ManHomecoming.jpg', 2)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (27, N'Avengers: Infinity War', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 09:27:01', N'120 mins', 2018, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/AvengersInfinityWar.jpg', 2)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (28, N'Avengers: Endgame', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 10:06:36', N'120 mins', 2019, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/AvengersEndgame.webp', 2)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (29, N'Hotel Transylvania', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 10:07:48', N'120 mins', 2012, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/HotelTransylvania.jpg', 2)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (30, N'The Emoji Movie', N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, voluptatum. Quidem officia repellat, nisi beatae consequuntur, officiis placeat quia tempora totam, voluptatibus dignissimos illo ipsam minima laboriosam odio quis at.', N'Full', N'2023-11-30 14:20:57', N'120 mins', 2017, 0, 0, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/TheEmojiMovie.jpg', 2)
INSERT [dbo].[Movie] ([ID], [Name], [Description], [Status], [updatedDate], [Duration], [realeasedYear], [numOfLikes], [numOfViews], [Rating], [Type], [imgSrc], [NationID]) VALUES (35, N'Star Trek', N'TBD', N'Full', N'2023-11-30 19:12:34', N'120 mins', 2000, 0, 1, 10, N'Phim lẻ', N'https://localhost:7257/img/Movies/StarTrek.jpeg', 2)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (3, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (10, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (12, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (14, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (15, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (16, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (17, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (19, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (21, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (22, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (23, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (28, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (35, 1)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (2, 2)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (11, 2)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (17, 2)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (11, 3)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (16, 4)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (18, 4)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (23, 4)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (2, 5)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (3, 5)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (11, 5)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (18, 5)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (19, 5)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (35, 5)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (10, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (11, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (12, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (14, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (15, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (16, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (21, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (22, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (29, 6)
INSERT [dbo].[MovieGenre] ([MovieID], [GenreID]) VALUES (30, 6)
GO
SET IDENTITY_INSERT [dbo].[Nation] ON 

INSERT [dbo].[Nation] ([ID], [Name]) VALUES (1, N'Việt Nam')
INSERT [dbo].[Nation] ([ID], [Name]) VALUES (2, N'Mỹ')
INSERT [dbo].[Nation] ([ID], [Name]) VALUES (3, N'Trung Quốc')
INSERT [dbo].[Nation] ([ID], [Name]) VALUES (4, N'Nhật Bản')
INSERT [dbo].[Nation] ([ID], [Name]) VALUES (6, N'Hàn Quốc')
SET IDENTITY_INSERT [dbo].[Nation] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Role], [IsEmailConfirmed]) VALUES (1, N'Owner', N'testproject52100113@gmail.com', N'Owner123', N'Chủ sở hữu', 1)
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Role], [IsEmailConfirmed]) VALUES (2, N'Thinh', N'thnhphan90@gmail.com', N'Thinh123', N'Quản lý', 1)
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Role], [IsEmailConfirmed]) VALUES (3, N'Tu', N'tu@gmail.com', N'NAT123', N'Người dùng', 0)
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Role], [IsEmailConfirmed]) VALUES (11, N'a', N'aaa@gmail.com', N'Aaa123', N'Người dùng', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Episode_MovieID]    Script Date: 11/30/2023 7:51:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Episode_MovieID] ON [dbo].[Episode]
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Follow_UserID]    Script Date: 11/30/2023 7:51:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Follow_UserID] ON [dbo].[Follow]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movie_NationID]    Script Date: 11/30/2023 7:51:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Movie_NationID] ON [dbo].[Movie]
(
	[NationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieGenre_GenreID]    Script Date: 11/30/2023 7:51:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieGenre_GenreID] ON [dbo].[MovieGenre]
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsEmailConfirmed]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_Movie_MovieID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_Movie_MovieID]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow_Movie_MovieID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow_Movie_MovieID]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow_User_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow_User_UserID]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Nation_NationID] FOREIGN KEY([NationID])
REFERENCES [dbo].[Nation] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Nation_NationID]
GO
ALTER TABLE [dbo].[MovieGenre]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenre_Genre_GenreID] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieGenre] CHECK CONSTRAINT [FK_MovieGenre_Genre_GenreID]
GO
ALTER TABLE [dbo].[MovieGenre]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenre_Movie_MovieID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieGenre] CHECK CONSTRAINT [FK_MovieGenre_Movie_MovieID]
GO
USE [master]
GO
ALTER DATABASE [MovieWeb] SET  READ_WRITE 
GO
