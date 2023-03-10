USE [master]
GO
/****** Object:  Database [TransactionDB]    Script Date: 09/01/2023 07:35:39 PM ******/
CREATE DATABASE [TransactionDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TransactionDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TransactionDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TransactionDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TransactionDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TransactionDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TransactionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TransactionDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TransactionDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TransactionDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TransactionDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TransactionDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TransactionDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TransactionDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TransactionDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TransactionDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TransactionDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TransactionDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TransactionDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TransactionDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TransactionDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TransactionDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TransactionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TransactionDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TransactionDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TransactionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TransactionDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TransactionDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TransactionDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TransactionDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TransactionDB] SET  MULTI_USER 
GO
ALTER DATABASE [TransactionDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TransactionDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TransactionDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TransactionDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TransactionDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TransactionDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TransactionDB] SET QUERY_STORE = OFF
GO
USE [TransactionDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09/01/2023 07:35:39 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 09/01/2023 07:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](5) NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 09/01/2023 07:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[description] [nvarchar](75) NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230105083828_initial create', N'6.0.11')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Title], [Icon], [Type]) VALUES (1, N'Salary', N'💵', N'Income')
INSERT [dbo].[Categories] ([CategoryID], [Title], [Icon], [Type]) VALUES (2, N'Food', N'🍔', N'Expense')
INSERT [dbo].[Categories] ([CategoryID], [Title], [Icon], [Type]) VALUES (3, N'Health care', N'❤️', N'Expense')
INSERT [dbo].[Categories] ([CategoryID], [Title], [Icon], [Type]) VALUES (4, N'Side Commision', N'💵', N'Income')
INSERT [dbo].[Categories] ([CategoryID], [Title], [Icon], [Type]) VALUES (5, N'Travel', N'✈️', N'Expense')
INSERT [dbo].[Categories] ([CategoryID], [Title], [Icon], [Type]) VALUES (6, N'Bill', N'🧾', N'Expense')
INSERT [dbo].[Categories] ([CategoryID], [Title], [Icon], [Type]) VALUES (7, N'grocery', N'🛍️', N'Expense')
INSERT [dbo].[Categories] ([CategoryID], [Title], [Icon], [Type]) VALUES (8, N'Stock Market', N'📈', N'Income')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (1, 1, 10000, N'salary', CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (3, 2, 500, N'Chinese food', CAST(N'2023-01-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (4, 3, 2000, N'Hospital Bills
', CAST(N'2023-01-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (6, 3, 10000, N'for an operation', CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (8, 2, 500, N'Hotel Bill', CAST(N'2022-12-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (9, 2, 600, N'Bill', CAST(N'2022-10-06T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (10, 2, 2500, N'Birthday Celebration', CAST(N'2022-09-24T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (11, 3, 1000, N'Medicine', CAST(N'2022-08-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (12, 1, 200, NULL, CAST(N'2023-01-06T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (13, 1, 200, NULL, CAST(N'2023-01-06T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (14, 3, 26000, N'operation', CAST(N'2023-01-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (15, 1, 25000, N'salary', CAST(N'2023-01-04T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (16, 8, 11000, N'Profit', CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Transactions] ([TransactionId], [CategoryId], [Amount], [description], [Date]) VALUES (17, 5, 5000, N'go to Mumbai', CAST(N'2022-12-23T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
/****** Object:  Index [IX_Transactions_CategoryId]    Script Date: 09/01/2023 07:35:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_CategoryId] ON [dbo].[Transactions]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [TransactionDB] SET  READ_WRITE 
GO
