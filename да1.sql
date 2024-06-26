USE [master]
GO
/****** Object:  Database [Demka]    Script Date: 22.06.2024 6:46:12 ******/
CREATE DATABASE [Demka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Demka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Demka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Demka] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demka] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demka] SET RECOVERY FULL 
GO
ALTER DATABASE [Demka] SET  MULTI_USER 
GO
ALTER DATABASE [Demka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Demka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Demka] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demka', N'ON'
GO
ALTER DATABASE [Demka] SET QUERY_STORE = ON
GO
ALTER DATABASE [Demka] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Demka]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 22.06.2024 6:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](50) NOT NULL,
	[MasterID] [int] NOT NULL,
	[RequestID] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 22.06.2024 6:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NULL,
	[TechTypeID] [int] NULL,
	[TechModel] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[RequestStatusID] [int] NULL,
	[CompleteDate] [date] NULL,
	[RepairParts] [nvarchar](200) NULL,
	[MasterID] [int] NULL,
	[ClientID] [int] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestStatus]    Script Date: 22.06.2024 6:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_RequestStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 22.06.2024 6:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechType]    Script Date: 22.06.2024 6:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TechType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22.06.2024 6:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([ID], [Message], [MasterID], [RequestID]) VALUES (1, N'Всё сделаем!', 2, 1)
INSERT [dbo].[Comments] ([ID], [Message], [MasterID], [RequestID]) VALUES (2, N'Всё сделаем!', 3, 2)
INSERT [dbo].[Comments] ([ID], [Message], [MasterID], [RequestID]) VALUES (3, N'Починим в момент.', 3, 3)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (1, CAST(N'2024-06-19' AS Date), 2, N'2', N'цвф', 1, NULL, NULL, NULL, 1)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (2, CAST(N'2023-05-05' AS Date), 1, N'Electrolux EACS/I-09HAT/N3_21Y белый', N'Выключается сам по себеуакйуфа', 2, NULL, NULL, 3, 8)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (3, CAST(N'2022-07-07' AS Date), 2, N'Xiaomi Smart Humidifier 2', N'Пар имеет неприятный запах', 3, CAST(N'2023-01-01' AS Date), NULL, 3, 9)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (4, CAST(N'2023-08-02' AS Date), 2, N'Polaris PUH 2300 WIFI IQ Home', N'Увлажнитель воздуха продолжает работать при предельном снижении уровня воды', 1, NULL, NULL, NULL, 8)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (5, CAST(N'2022-08-01' AS Date), 1, N'Ballu BAHD-1250', N'Не работает, но теперь работает', 1, NULL, NULL, NULL, 9)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (6, CAST(N'2024-06-19' AS Date), 1, N'TestModel', N'Не работает', 1, NULL, NULL, NULL, 7)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (7, CAST(N'2024-06-19' AS Date), 1, N'123', N'132', 1, NULL, NULL, NULL, 2)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (8, CAST(N'2024-06-19' AS Date), 1, N'не дует', N'сушка', 1, NULL, NULL, NULL, 7)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (15, CAST(N'2024-06-13' AS Date), 2, NULL, N'2', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (17, CAST(N'2024-06-01' AS Date), 2, NULL, N'te', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Request] ([ID], [StartDate], [TechTypeID], [TechModel], [Description], [RequestStatusID], [CompleteDate], [RepairParts], [MasterID], [ClientID]) VALUES (18, CAST(N'2024-06-13' AS Date), 1, NULL, N'gsagsadfg', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestStatus] ON 

INSERT [dbo].[RequestStatus] ([ID], [Name]) VALUES (1, N'Новая заявка')
INSERT [dbo].[RequestStatus] ([ID], [Name]) VALUES (2, N'В процессе ремонта')
INSERT [dbo].[RequestStatus] ([ID], [Name]) VALUES (3, N'Готова к выдаче')
SET IDENTITY_INSERT [dbo].[RequestStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Менеджер
')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Специалист
')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'Оператор
')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (4, N'Заказчик
')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (5, N'')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[TechType] ON 

INSERT [dbo].[TechType] ([ID], [Name]) VALUES (1, N'Кондиционер')
INSERT [dbo].[TechType] ([ID], [Name]) VALUES (2, N'Увлажнитель воздуха')
INSERT [dbo].[TechType] ([ID], [Name]) VALUES (3, N'Сушилка для рук')
SET IDENTITY_INSERT [dbo].[TechType] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (1, N'Широков', N'Василий', N'Матвеевич', N'89210563128', N'login1', N'pass1', 1)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (2, N'Кудрявцева', N'Ева', N'Ивановна', N'89535078985', N'login2', N'pass2', 2)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (3, N'Гончарова', N'Ульяна', N'Ярославовна', N'89210673849', N'login3', N'pass3', 2)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (4, N'Гусева', N'Виктория', N'Данииловна', N'89990563748', N'login4', N'pass4', 3)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (5, N'Баранов', N'Артём', N'Юрьевич', N'89994563847', N'login5', N'pass5', 3)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (6, N'Овчинников', N'Фёдор', N'Никитич', N'89219567849', N'login6', N'pass6', 4)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (7, N'Петров', N'Никита', N'Артёмович', N'89219567841', N'login7', N'pass7', 4)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (8, N'Ковалева', N'Софья', N'Владимировна', N'89219567842', N'login8', N'pass8', 4)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (9, N'Кузнецов', N'Сергей', N'Матвеевич', N'89219567843', N'login9', N'pass9', 4)
INSERT [dbo].[Users] ([ID], [LastName], [FirstName], [MiddleName], [Phone], [Login], [Password], [RoleID]) VALUES (10, N'Беспалова', N'Екатерина', N'Даниэльевна', N'89219567844', N'login10', N'pass10', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Request]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([MasterID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_RequestStatus] FOREIGN KEY([RequestStatusID])
REFERENCES [dbo].[RequestStatus] ([ID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_RequestStatus]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_TechType] FOREIGN KEY([TechTypeID])
REFERENCES [dbo].[TechType] ([ID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_TechType]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Users] FOREIGN KEY([MasterID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Users]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Users1] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [Demka] SET  READ_WRITE 
GO
