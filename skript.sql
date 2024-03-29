USE [master]
GO
/****** Object:  Database [DB_Currort_Igora_kpm]    Script Date: 10/10/2023 11:40:57 AM ******/
CREATE DATABASE [DB_Currort_Igora_kpm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Currort_Igora_kpm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_Currort_Igora_kpm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Currort_Igora_kpm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_Currort_Igora_kpm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Currort_Igora_kpm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET QUERY_STORE = OFF
GO
USE [DB_Currort_Igora_kpm]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 10/10/2023 11:40:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Code] [nvarchar](15) NOT NULL,
	[Family] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[PasportSeria] [nvarchar](50) NOT NULL,
	[PasportNumber] [nvarchar](50) NOT NULL,
	[DateBirthday] [date] NOT NULL,
	[Adress] [nvarchar](150) NOT NULL,
	[E-mail] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empoloyees]    Script Date: 10/10/2023 11:40:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empoloyees](
	[Id] [nvarchar](10) NOT NULL,
	[PostId] [int] NOT NULL,
	[FIO] [nvarchar](150) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastLogin] [datetime] NOT NULL,
	[TypeLoginId] [int] NOT NULL,
 CONSTRAINT [PK_Empoloyees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/10/2023 11:40:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[DateCreate] [date] NOT NULL,
	[TimeOrder] [time](7) NOT NULL,
	[CodeClient] [nvarchar](25) NOT NULL,
	[Services] [nvarchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
	[DateClose] [date] NULL,
	[RentalTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 10/10/2023 11:40:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 10/10/2023 11:40:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/10/2023 11:40:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[CostOfHour] [float] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeLogin]    Script Date: 10/10/2023 11:40:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462526', N'Фролов', N'Андрей', N'Иванович', N'1180', N'176596', CAST(N'2001-07-14' AS Date), N'344288, г. Санкт-Петербург, ул. Чехова, 1, кв. 34', N'gohufreilagrau-3818@yopmail.com', N'cl12345')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462527', N'Николаев', N'Даниил', N'Всеволодович', N'2280', N'223523', CAST(N'2001-02-10' AS Date), N'614164, г. Санкт-Петербург, ул. Степная, 30, кв. 75', N'xawugosune-1385@yopmail.com', N'cl12346')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462528', N'Снегирев', N'Макар', N'Иванович', N'4560', N'354155', CAST(N'1998-05-21' AS Date), N'394242, г. Санкт-Петербург, ул. Коммунистическая, 43, кв. 57', N'satrahuddusei-4458@yopmail.com', N'cl12347')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462529', N'Иванов', N'Иван', N'Ильич', N'9120', N'554296', CAST(N'1998-10-01' AS Date), N'660540, г. Санкт-Петербург, ул. Солнечная, 25, кв. 78', N'boippaxeufrepra-7093@yopmail.com', N'cl12348')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462530', N'Филиппова', N'Анна', N'Глебовна', N'2367', N'558134', CAST(N'1976-05-31' AS Date), N'125837, г. Санкт-Петербург, ул. Шоссейная, 40, кв. 92', N'zapramaxesu-7741@yopmail.com', N'cl12349')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462531', N'Иванов', N'Михаил', N'Владимирович', N'7101', N'669343', CAST(N'1985-11-04' AS Date), N'125703, г. Санкт-Петербург, ул. Партизанская, 49, кв. 84', N'rouzecroummegre-3899@yopmail.com', N'cl12350')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462532', N'Власов', N'Дмитрий', N'Александрович', N'3455', N'719630', CAST(N'1998-08-17' AS Date), N'625283, г. Санкт-Петербург, ул. Победы, 46, кв. 7', N'ziyeuddocrabri-4748@yopmail.com', N'cl12351')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462533', N'Серова', N'Екатерина', N'Львовна', N'2377', N'871623', CAST(N'1984-10-24' AS Date), N'614611, г. Санкт-Петербург, ул. Молодежная, 50, кв. 78', N'ketameissoinnei-1951@yopmail.com', N'cl12352')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462534', N'Борисова', N'Ирина', N'Ивановна', N'8755', N'921148', CAST(N'1976-10-14' AS Date), N'454311, г. Санкт-Петербург, ул. Новая, 19, кв. 78', N'yipraubaponou-5849@yopmail.com', N'cl12353')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462535', N'Зайцев', N'Никита', N'Артёмович', N'4355', N'104594', CAST(N'1999-10-14' AS Date), N'660007, г. Санкт-Петербург, ул. Октябрьская, 19, кв. 42', N'crapedocouca-3572@yopmail.com', N'cl12354')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462536', N'Медведев', N'Святослав', N'Евгеньевич', N'2791', N'114390', CAST(N'1985-07-13' AS Date), N'603036, г. Санкт-Петербург, ул. Садовая, 4, кв. 13', N'ceigoixakaunni-9227@yopmail.com', N'cl12355')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462537', N'Коротков', N'Кирилл', N'Алексеевич', N'5582', N'126286', CAST(N'1976-05-26' AS Date), N'450983, г. Санкт-Петербург, ул. Комсомольская, 26, кв. 60', N'yeimmeiwauzomo-7054@yopmail.com', N'cl12356')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462538', N'Калашникова', N'Арина', N'Максимовна', N'2978', N'133653', CAST(N'1999-08-13' AS Date), N'394782, г. Санкт-Петербург, ул. Чехова, 3, кв. 14', N'poleifenevi-1560@yopmail.com', N'cl12357')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462539', N'Минина', N'Таисия', N'Кирилловна', N'7512', N'141956', CAST(N'1985-10-13' AS Date), N'603002, г. Санкт-Петербург, ул. Дзержинского, 28, кв. 56', N'kauprezofautei-6607@yopmail.com', N'cl12358')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462540', N'Наумов', N'Серафим', N'Романович', N'5046', N'158433', CAST(N'1999-04-15' AS Date), N'450558, г. Санкт-Петербург, ул. Набережная, 30, кв. 71', N'quaffaullelourei-1667@yopmail.com', N'cl12359')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462541', N'Воробьева', N'Василиса', N'Евгеньевна', N'2460', N'169505', CAST(N'1999-01-13' AS Date), N'394060, г. Санкт-Петербург, ул. Фрунзе, 43, кв. 79', N'jsteele@rojas-robinson.net', N'cl12360')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462542', N'Калинин', N'Александр', N'Андреевич', N'3412', N'174593', CAST(N'1999-01-07' AS Date), N'410661, г. Санкт-Петербург, ул. Школьная, 50, кв. 53', N'vhopkins@lewis-mullen.com', N'cl12361')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462543', N'Кузнецова', N'Милана', N'Владиславовна', N'4950', N'183034', CAST(N'1999-01-24' AS Date), N'625590, г. Санкт-Петербург, ул. Коммунистическая, 20, кв. 34', N'nlewis@yahoo.com', N'cl12362')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462544', N'Фирсов', N'Егор', N'Романович', N'5829', N'219464', CAST(N'1993-09-02' AS Date), N'625683, г. Санкт-Петербург, ул. 8 Марта, 20, кв. 21', N'garciadavid@mckinney-mcbride.com', N'cl12363')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462545', N'Зимина', N'Агния', N'Александровна', N'6443', N'208059', CAST(N'1998-09-03' AS Date), N'400562, г. Санкт-Петербург, ул. Зеленая, 32, кв. 67', N'cbradley@castro.com', N'cl12364')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462546', N'Титов', N'Андрей', N'Глебович', N'7079', N'213265', CAST(N'1985-10-23' AS Date), N'614510, г. Санкт-Петербург, ул. Маяковского, 47, кв. 72', N'cuevascatherine@carlson.biz', N'cl12365')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462547', N'Орлов', N'Николай', N'Егорович', N'8207', N'522702', CAST(N'1985-07-27' AS Date), N'410542, г. Санкт-Петербург, ул. Светлая, 46, кв. 82', N'thomasmoore@wilson-singh.net', N'cl12366')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462548', N'Кузнецова', N'Аиша', N'Михайловна', N'9307', N'232158', CAST(N'1998-10-04' AS Date), N'620839, г. Санкт-Петербург, ул. Цветочная, 8, кв. 100', N'jessica84@hotmail.com', N'cl12367')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462549', N'Куликов', N'Никита', N'Георгиевич', N'1357', N'242839', CAST(N'1999-04-23' AS Date), N'443890, г. Санкт-Петербург, ул. Коммунистическая, 1, кв. 10', N'jessicapark@hotmail.com', N'cl12368')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462550', N'Карпова', N'София', N'Егоровна', N'1167', N'256636', CAST(N'1993-10-01' AS Date), N'603379, г. Санкт-Петербург, ул. Спортивная, 46, кв. 95', N'ginaritter@schneider-buchanan.com', N'cl12369')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462551', N'Смирнова', N'Дарья', N'Макаровна', N'1768', N'266986', CAST(N'1976-03-22' AS Date), N'603721, г. Санкт-Петербург, ул. Гоголя, 41, кв. 57', N'stephen99@yahoo.com', N'cl12370')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462552', N'Абрамова', N'Александра', N'Мироновна', N'1710', N'427875', CAST(N'1999-03-26' AS Date), N'410172, г. Санкт-Петербург, ул. Северная, 13, кв. 86', N'lopezlisa@hotmail.com', N'cl12371')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462553', N'Наумов', N'Руслан', N'Михайлович', N'1806', N'289145', CAST(N'1999-10-11' AS Date), N'420151, г. Санкт-Петербург, ул. Вишневая, 32, кв. 81', N'lori17@hotmail.com', N'cl12372')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462554', N'Бочаров', N'Никита', N'Матвеевич', N'1587', N'291249', CAST(N'1997-06-29' AS Date), N'125061, г. Санкт-Петербург, ул. Подгорная, 8, кв. 74', N'campbellkevin@gardner.com', N'cl12373')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462555', N'Соловьев', N'Давид', N'Ильич', N'1647', N'306372', CAST(N'1984-03-06' AS Date), N'630370, г. Санкт-Петербург, ул. Шоссейная, 24, кв. 81', N'morganhoward@clark.com', N'cl12374')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462556', N'Васильева', N'Валерия', N'Дмитриевна', N'1742', N'316556', CAST(N'1999-09-30' AS Date), N'614753, г. Санкт-Петербург, ул. Полевая, 35, кв. 39', N'carsontamara@gmail.com', N'cl12375')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462557', N'Макарова', N'Василиса', N'Андреевна', N'1474', N'326347', CAST(N'1999-04-08' AS Date), N'426030, г. Санкт-Петербург, ул. Маяковского, 44, кв. 93', N'kevinpatel@gmail.com', N'cl12376')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462558', N'Алексеев', N'Матвей', N'Викторович', N'1452', N'339539', CAST(N'1998-08-02' AS Date), N'450375, г. Санкт-Петербург, ул. Клубная, 44, кв. 80', N'sethbishop@yahoo.com', N'cl12377')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462559', N'Никитина', N'Полина', N'Александровна', N'2077', N'443480', CAST(N'1976-09-19' AS Date), N'625560, г. Санкт-Петербург, ул. Некрасова, 12, кв. 66', N'drollins@schultz-soto.net', N'cl12378')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462560', N'Окулова', N'Олеся', N'Алексеевна', N'2147', N'357518', CAST(N'1999-04-03' AS Date), N'630201, г. Санкт-Петербург, ул. Комсомольская, 17, кв. 25', N'pblack@copeland-winters.org', N'cl12379')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462561', N'Захарова', N'Полина', N'Яновна', N'2687', N'363884', CAST(N'1976-04-21' AS Date), N'190949, г. Санкт-Петербург, ул. Мичурина, 26, кв. 93', N'johnathon.oberbrunner@yahoo.com', N'cl12380')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462562', N'Зайцев', N'Владимир', N'Давидович', N'2376', N'443711', CAST(N'1998-01-26' AS Date), N'350501, г. Санкт-Петербург, ул. Парковая, 2, кв. 7', N'bradly29@gmail.com', N'cl12381')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462563', N'Иванов', N'Виталий', N'Даниилович', N'2568', N'386237', CAST(N'1976-08-11' AS Date), N'450048, г. Санкт-Петербург, ул. Коммунистическая, 21, кв. 3', N'stark.cristina@hilpert.biz', N'cl12382')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462564', N'Захаров', N'Матвей', N'Романович', N'2556', N'439376', CAST(N'1993-07-12' AS Date), N'644921, г. Санкт-Петербург, ул. Школьная, 46, кв. 37', N'bruen.eleanore@yahoo.com', N'cl12383')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462565', N'Иванов', N'Степан', N'Степанович', N'2737', N'407501', CAST(N'1998-09-19' AS Date), N'614228, г. Санкт-Петербург, ул. Дорожная, 36, кв. 54', N'percival.halvorson@yahoo.com', N'cl12384')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462566', N'Ткачева', N'Милана', N'Тимуровна', N'2581', N'441645', CAST(N'1998-05-24' AS Date), N'350940, г. Санкт-Петербург, ул. Первомайская, 23, кв. 2', N'javonte71@kuhlman.biz', N'cl12385')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462567', N'Семенов', N'Даниил', N'Иванович', N'2675', N'427933', CAST(N'1976-01-04' AS Date), N'344990, г. Санкт-Петербург, ул. Красноармейская, 19, кв. 92', N'vconnelly@kautzer.com', N'cl12386')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462568', N'Виноградов', N'Вячеслав', N'Дмитриевич', N'2967', N'434531', CAST(N'1976-07-12' AS Date), N'410248, г. Санкт-Петербург, ул. Чкалова, 11, кв. 75', N'anabelle07@schultz.info', N'cl12387')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462569', N'Соболева', N'Николь', N'Фёдоровна', N'3070', N'449655', CAST(N'1976-05-02' AS Date), N'400839, г. Санкт-Петербург, ул. 8 Марта, 46, кв. 44', N'nitzsche.katlynn@yahoo.com', N'cl12388')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462570', N'Тихонова', N'Анна', N'Львовна', N'3108', N'451174', CAST(N'1985-03-23' AS Date), N'450539, г. Санкт-Петербург, ул. Заводская, 3, кв. 81', N'corine16@von.com', N'cl12389')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462571', N'Кузнецова', N'Ульяна', N'Савельевна', N'3250', N'464705', CAST(N'1999-06-03' AS Date), N'614591, г. Санкт-Петербург, ул. Цветочная, 20, кв. 40', N'otha.wisozk@lubowitz.org', N'cl12390')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462572', N'Смирнова', N'Анна', N'Германовна', N'3392', N'471644', CAST(N'1997-07-18' AS Date), N'400260, г. Санкт-Петербург, ул. Больничная, 30, кв. 53', N'may.kirlin@hotmail.com', N'cl12391')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462573', N'Черепанова', N'Анна', N'Давидовна', N'3497', N'487819', CAST(N'1985-11-06' AS Date), N'660924, г. Санкт-Петербург, ул. Молодежная, 32, кв. 59', N'bryana.kautzer@yahoo.com', N'cl12392')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462574', N'Григорьев', N'Максим', N'Кириллович', N'3560', N'491260', CAST(N'1999-05-26' AS Date), N'644133, г. Санкт-Петербург, ул. Гагарина, 28, кв. 69', N'deborah.christiansen@quigley.biz', N'cl12393')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462575', N'Голубев', N'Даниэль', N'Александрович', N'3620', N'506034', CAST(N'1999-06-14' AS Date), N'450698, г. Санкт-Петербург, ул. Вокзальная, 14, кв. 37', N'connelly.makayla@yahoo.com', N'cl12394')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462576', N'Миронов', N'Юрий', N'Денисович', N'3774', N'511438', CAST(N'1985-01-26' AS Date), N'620653, г. Санкт-Петербург, ул. Западная, 15, кв. 25', N'tatum.collins@fay.org', N'cl12395')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462577', N'Терехов', N'Михаил', N'Андреевич', N'3862', N'521377', CAST(N'1976-07-06' AS Date), N'644321, г. Санкт-Петербург, ул. Клубная, 32, кв. 10', N'itzel73@anderson.com', N'cl12396')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462578', N'Орлова', N'Алиса', N'Михайловна', N'3084', N'535966', CAST(N'1997-02-24' AS Date), N'603653, г. Санкт-Петербург, ул. Молодежная, 2, кв. 45', N'arjun39@hotmail.com', N'cl12397')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462579', N'Кулаков', N'Константин', N'Даниилович', N'4021', N'541528', CAST(N'1993-06-20' AS Date), N'410181, г. Санкт-Петербург, ул. Механизаторов, 16, кв. 74', N'ohara.rebeka@yahoo.com', N'cl12398')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462580', N'Кудрявцев', N'Максим', N'Романович', N'4109', N'554053', CAST(N'1998-05-10' AS Date), N'394207, г. Санкт-Петербург, ул. Свердлова, 31, кв. 28', N'danika58@rath.com', N'cl12399')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462581', N'Соболева', N'Кира', N'Фёдоровна', N'4537', N'564868', CAST(N'1998-03-14' AS Date), N'420633, г. Санкт-Петербург, ул. Матросова, 18, кв. 41', N'janae.bogan@gmail.com', N'cl12400')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462582', N'Коновалов', N'Арсений', N'Максимович', N'4914', N'572471', CAST(N'1985-02-18' AS Date), N'445720, г. Санкт-Петербург, ул. Матросова, 50, кв. 67', N'vern91@yahoo.com', N'cl12401')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462583', N'Гусев', N'Михаил', N'Дмитриевич', N'4445', N'581302', CAST(N'1999-11-23' AS Date), N'400646, г. Санкт-Петербург, ул. Октябрьская, 47, кв. 65', N'mariana.leannon@larkin.net', N'cl12402')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462584', N'Суханова', N'Варвара', N'Матвеевна', N'4743', N'598180', CAST(N'1993-09-13' AS Date), N'644410, г. Санкт-Петербург, ул. Красная, 17, кв. 69', N'vmoore@gmail.com', N'cl12403')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462585', N'Орлова', N'Ясмина', N'Васильевна', N'4741', N'601821', CAST(N'1984-06-24' AS Date), N'400750, г. Санкт-Петербург, ул. Школьная, 36, кв. 71', N'damon.mcclure@mills.com', N'cl12404')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462586', N'Васильева', N'Ксения', N'Константиновна', N'4783', N'612567', CAST(N'1999-08-01' AS Date), N'660590, г. Санкт-Петербург, ул. Дачная, 37, кв. 70', N'grady.reilly@block.com', N'cl12405')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462587', N'Борисова', N'Тамара', N'Данииловна', N'4658', N'621200', CAST(N'1993-05-29' AS Date), N'426083, г. Санкт-Петербург, ул. Механизаторов, 41, кв. 26', N'boyd.koss@yahoo.com', N'cl12406')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462588', N'Дмитриев', N'Мирон', N'Ильич', N'4908', N'634613', CAST(N'1985-04-13' AS Date), N'410569, г. Санкт-Петербург, ул. Парковая, 36, кв. 17', N'obartell@franecki.info', N'cl12407')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462589', N'Лебедева', N'Анна', N'Александровна', N'5092', N'642468', CAST(N'1985-03-30' AS Date), N'443375, г. Санкт-Петербург, ул. Дзержинского, 50, кв. 95', N'reina75@ferry.net', N'cl12408')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462590', N'Пономарев', N'Артём', N'Маркович', N'5155', N'465274', CAST(N'1984-06-02' AS Date), N'614316, г. Санкт-Петербург, ул. Первомайская, 48, кв. 31', N'karson28@hotmail.com', N'cl12409')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462591', N'Борисова', N'Елена', N'Михайловна', N'5086', N'666893', CAST(N'1976-05-23' AS Date), N'445685, г. Санкт-Петербург, ул. Зеленая, 7, кв. 47', N'damaris61@okon.com', N'cl12410')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462592', N'Моисеев', N'Камиль', N'Максимович', N'5333', N'675375', CAST(N'1999-06-17' AS Date), N'614505, г. Санкт-Петербург, ул. Нагорная, 37, кв. 31', N'carroll.jerod@hotmail.com', N'cl12411')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462593', N'Герасимова', N'Дарья', N'Константиновна', N'5493', N'684572', CAST(N'1984-10-13' AS Date), N'426629, г. Санкт-Петербург, ул. Весенняя, 32, кв. 46', N'ron.treutel@quitzon.com', N'cl12412')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462594', N'Михайлова', N'Мария', N'Марковна', N'5150', N'696226', CAST(N'1976-12-02' AS Date), N'603743, г. Санкт-Петербург, ул. Матросова, 19, кв. 20', N'olen79@yahoo.com', N'cl12413')
INSERT [dbo].[Clients] ([Code], [Family], [Name], [Patronymic], [PasportSeria], [PasportNumber], [DateBirthday], [Adress], [E-mail], [Password]) VALUES (N'45462595', N'Коршунов', N'Кирилл', N'Максимович', N'1308', N'703305', CAST(N'1985-05-22' AS Date), N'450750, г. Санкт-Петербург, ул. Клубная, 23, кв. 90', N'pacocha.robbie@yahoo.com', N'cl12414')
GO
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'101', 3, N'Иванов Иван Иванович', N'Ivanov@namecomp.ru', N'2L6KZG', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'102', 3, N'Петров Петр Петрович', N'petrov@namecomp.ru', N'uzWC67', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'103', 1, N'Федоров Федор Федорович', N'fedorov@namecomp.ru', N'8ntwUp', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'104', 2, N'Миронов Вениамин Куприянович', N'mironov@namecomp.ru', N'YOyhfR', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'105', 2, N'Ширяев Ермолай Вениаминович', N'shiryev@namecomp.ru', N'RSbvHv', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 2)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'106', 2, N'Игнатов Кассиан Васильевич', N'ignatov@namecomp.ru', N'rwVDh9', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'107', 3, N'Хохлов Владимир Мэлсович', N'hohlov@namecomp.ru', N'LdNyos', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'108', 3, N'Стрелков Мстислав Георгьевич', N'strelkov@namecomp.ru', N'gynQMT', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 2)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'109', 3, N'Беляева Лилия Наумовна', N'belyeva@@namecomp.ru', N'AtnDjr', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Empoloyees] ([Id], [PostId], [FIO], [Login], [Password], [LastLogin], [TypeLoginId]) VALUES (N'110', 3, N'Смирнова Ульяна Гордеевна', N'smirnova@@namecomp.ru', N'JlFRCZ', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (1, N'45462526/12.03.2022', CAST(N'2022-03-12' AS Date), CAST(N'09:10:00' AS Time), N'45462526', N'34, 31, 353, 336', 1, NULL, N'120 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (2, N'45462527/13.03.2022', CAST(N'2022-03-13' AS Date), CAST(N'10:10:00' AS Time), N'45462527', N'98, 45, 89, 99, 123', 2, NULL, N'600 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (3, N'45462528/14.03.2022', CAST(N'2022-03-14' AS Date), CAST(N'11:10:00' AS Time), N'45462528', N'92, 45, 57, 88', 2, NULL, N'2 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (4, N'45462529/15.03.2022', CAST(N'2022-03-15' AS Date), CAST(N'12:10:00' AS Time), N'45462529', N'92, 45, 57, 88, 44', 1, NULL, N'10 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (5, N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), CAST(N'13:10:00' AS Time), N'45462530', N'98, 45, 89, 353, 336, 34', 3, CAST(N'2022-04-16' AS Date), N'320 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (6, N'45462531/17.03.2022', CAST(N'2022-03-17' AS Date), CAST(N'14:10:00' AS Time), N'45462531', N'34, 31, 353, 337', 1, NULL, N'480 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (7, N'45462532/18.03.2022', CAST(N'2022-03-18' AS Date), CAST(N'15:10:00' AS Time), N'45462532', N'98, 45, 89, 99, 124', 1, NULL, N'4 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (8, N'45462533/19.03.2022', CAST(N'2022-03-19' AS Date), CAST(N'16:10:00' AS Time), N'45462533', N'92, 45, 57, 89', 2, NULL, N'6 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (9, N'45462534/20.03.2022', CAST(N'2022-03-20' AS Date), CAST(N'10:00:00' AS Time), N'45462534', N'92, 45, 57, 88, 45', 2, NULL, N'12 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (10, N'45462535/21.03.2022', CAST(N'2022-03-21' AS Date), CAST(N'11:00:00' AS Time), N'45462535', N'98, 45, 89, 353, 336, 35', 1, NULL, N'120 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (11, N'45462536/22.03.2022', CAST(N'2022-03-22' AS Date), CAST(N'12:00:00' AS Time), N'45462536', N'34, 31, 353, 338', 3, CAST(N'2022-03-22' AS Date), N'600 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (12, N'45462537/23.03.2022', CAST(N'2022-03-23' AS Date), CAST(N'13:00:00' AS Time), N'45462537', N'98, 45, 89, 99, 125', 2, NULL, N'2 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (13, N'45462538/24.03.2022', CAST(N'2022-03-24' AS Date), CAST(N'14:00:00' AS Time), N'45462538', N'92, 45, 57, 90', 2, NULL, N'10 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (14, N'45462539/25.03.2022', CAST(N'2022-03-25' AS Date), CAST(N'15:00:00' AS Time), N'45462539', N'92, 45, 57, 88, 46', 2, NULL, N'320 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (15, N'45462540/26.03.2022', CAST(N'2022-03-26' AS Date), CAST(N'16:00:00' AS Time), N'45462540', N'98, 45, 89, 353, 336, 36', 3, CAST(N'2022-04-26' AS Date), N'480 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (16, N'45462541/27.03.2022', CAST(N'2022-03-27' AS Date), CAST(N'17:00:00' AS Time), N'45462541', N'34, 31, 353, 339', 1, NULL, N'4 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (17, N'45462542/28.03.2022', CAST(N'2022-03-28' AS Date), CAST(N'18:00:00' AS Time), N'45462542', N'98, 45, 89, 99, 126', 2, NULL, N'6 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (18, N'45462543/29.03.2022', CAST(N'2022-03-29' AS Date), CAST(N'19:00:00' AS Time), N'45462543', N'92, 45, 57, 91', 2, NULL, N'12 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (19, N'45462544/30.03.2022', CAST(N'2022-03-30' AS Date), CAST(N'12:30:00' AS Time), N'45462544', N'92, 45, 57, 88, 47', 1, NULL, N'120 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (20, N'45462545/31.03.2022', CAST(N'2022-03-31' AS Date), CAST(N'13:30:00' AS Time), N'45462545', N'98, 45, 89, 353, 336, 37', 1, NULL, N'600 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (21, N'45462546/01.04.2022', CAST(N'2022-04-01' AS Date), CAST(N'14:30:00' AS Time), N'45462546', N'34, 31, 353, 340', 3, CAST(N'2022-04-01' AS Date), N'2 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (22, N'45462547/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), N'45462547', N'98, 45, 89, 99, 127', 1, NULL, N'10 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (23, N'45462548/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), N'45462548', N'92, 45, 57, 92', 1, NULL, N'320 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (24, N'45462549/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), N'45462549', N'92, 45, 57, 88, 48', 2, NULL, N'480 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (25, N'45462550/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'18:30:00' AS Time), N'45462550', N'98, 45, 89, 353, 336, 38', 2, NULL, N'4 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (26, N'45462551/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'15:30:00' AS Time), N'45462551', N'34, 31, 353, 341', 2, NULL, N'6 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (27, N'45462552/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'16:30:00' AS Time), N'45462552', N'98, 45, 89, 99, 128', 2, NULL, N'12 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (28, N'45462553/08.04.2022', CAST(N'2022-04-08' AS Date), CAST(N'17:30:00' AS Time), N'45462553', N'92, 45, 57, 93', 3, CAST(N'2022-04-08' AS Date), N'120 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (29, N'45462554/09.04.2022', CAST(N'2022-04-09' AS Date), CAST(N'18:30:00' AS Time), N'45462554', N'92, 45, 57, 88, 49', 1, NULL, N'600 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (30, N'45462555/10.04.2022', CAST(N'2022-04-10' AS Date), CAST(N'19:30:00' AS Time), N'45462555', N'98, 45, 89, 353, 336, 39', 2, NULL, N'2 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (31, N'45462556/11.04.2022', CAST(N'2022-04-11' AS Date), CAST(N'10:30:00' AS Time), N'45462556', N'34, 31, 353, 342', 2, NULL, N'10 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (32, N'45462557/12.04.2022', CAST(N'2022-04-12' AS Date), CAST(N'11:30:00' AS Time), N'45462557', N'98, 45, 89, 99, 129', 1, NULL, N'320 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (33, N'45462558/13.04.2022', CAST(N'2022-04-13' AS Date), CAST(N'12:30:00' AS Time), N'45462558', N'92, 45, 57, 94', 1, NULL, N'480 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (34, N'45462559/14.04.2022', CAST(N'2022-04-14' AS Date), CAST(N'13:30:00' AS Time), N'45462559', N'92, 45, 57, 88, 50', 1, NULL, N'4 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (35, N'45462560/15.04.2022', CAST(N'2022-04-15' AS Date), CAST(N'14:30:00' AS Time), N'45462560', N'98, 45, 89, 353, 336, 40', 2, NULL, N'6 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (36, N'45462561/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), N'45462561', N'34, 31, 353, 343', 2, NULL, N'12 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (37, N'45462562/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), N'45462562', N'98, 45, 89, 99, 130', 2, NULL, N'120 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (38, N'45462563/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), N'45462563', N'92, 45, 57, 95', 3, CAST(N'2022-04-04' AS Date), N'600 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (39, N'45462564/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'10:15:00' AS Time), N'45462564', N'92, 45, 57, 88, 51', 2, NULL, N'2 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (40, N'45462565/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'11:15:00' AS Time), N'45462565', N'98, 45, 89, 353, 336, 41', 1, NULL, N'10 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (41, N'45462566/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'12:15:00' AS Time), N'45462566', N'34, 31, 353, 344', 3, CAST(N'2022-04-07' AS Date), N'320 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (42, N'45462567/08.04.2022', CAST(N'2022-04-08' AS Date), CAST(N'13:15:00' AS Time), N'45462567', N'98, 45, 89, 99, 131', 2, NULL, N'480 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (43, N'45462568/09.04.2022', CAST(N'2022-04-09' AS Date), CAST(N'14:15:00' AS Time), N'45462568', N'92, 45, 57, 96', 2, NULL, N'4 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (44, N'45462569/01.04.2022', CAST(N'2022-04-01' AS Date), CAST(N'15:15:00' AS Time), N'45462569', N'92, 45, 57, 88, 52', 2, NULL, N'6 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (45, N'45462570/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'16:15:00' AS Time), N'45462570', N'98, 45, 89, 353, 336, 42', 2, NULL, N'12 часов')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (46, N'45462571/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'10:45:00' AS Time), N'45462571', N'34, 31, 353, 345', 2, NULL, N'480 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (47, N'45462572/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'11:45:00' AS Time), N'45462572', N'98, 45, 89, 99, 132', 3, CAST(N'2022-04-04' AS Date), N'320 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (48, N'45462573/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'12:45:00' AS Time), N'45462573', N'92, 45, 57, 97', 1, NULL, N'480 минут')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (49, N'45462574/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'13:45:00' AS Time), N'45462574', N'92, 45, 57, 88, 53', 1, NULL, N'4 часа')
INSERT [dbo].[Orders] ([Id], [Code], [DateCreate], [TimeOrder], [CodeClient], [Services], [StatusId], [DateClose], [RentalTime]) VALUES (50, N'45462575/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'14:45:00' AS Time), N'45462575', N'98, 45, 89, 353, 336, 43', 1, NULL, N'6 часов')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (1, N'Новая')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (2, N'В прокате')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (3, N'Закрыта')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (2, N'Старший смены')
INSERT [dbo].[Posts] ([Id], [Name]) VALUES (3, N'Продавец')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'123', N'Подъем на 3 уровень', N'638VVNQ3', 1200)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'31', N'Прокат сноуборда', N'JUR8R', 1200)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'336', N'Прокат лыж', N'8HFJHG443', 800)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'34', N'Прокат обуви для сноуборда', N'JKFBJ09', 400)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'353', N'Прокат лыжных палок', N'87FDJKHJ', 100)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'44', N'Прокат салазок', N'DHBGFY563', 450)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'45', N'Прокат защитных подушек для сноубордистов', N'JFH7382', 300)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'57', N'Подъем на 1 уровень', N'JHVSJF6', 300)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'88', N'Подъем на 2  уровень', N'DJHGBS982', 700)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'89', N'Прокат очков для лыжников', N'OIJNB12', 150)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'92', N'Прокат санок', N'HJBUJE21J', 300)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'98', N'Прокат шлема', N'63748HF', 300)
INSERT [dbo].[Services] ([Id], [Name], [Code], [CostOfHour]) VALUES (N'99', N'Прокат вартушки', N'BSFBHV63', 100)
GO
SET IDENTITY_INSERT [dbo].[TypeLogin] ON 

INSERT [dbo].[TypeLogin] ([Id], [Type]) VALUES (1, N'Успешно')
INSERT [dbo].[TypeLogin] ([Id], [Type]) VALUES (2, N'Неуспешно')
SET IDENTITY_INSERT [dbo].[TypeLogin] OFF
GO
ALTER TABLE [dbo].[Empoloyees]  WITH CHECK ADD  CONSTRAINT [FK_Empoloyees_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Empoloyees] CHECK CONSTRAINT [FK_Empoloyees_Posts]
GO
ALTER TABLE [dbo].[Empoloyees]  WITH CHECK ADD  CONSTRAINT [FK_Empoloyees_TypeLogin] FOREIGN KEY([TypeLoginId])
REFERENCES [dbo].[TypeLogin] ([Id])
GO
ALTER TABLE [dbo].[Empoloyees] CHECK CONSTRAINT [FK_Empoloyees_TypeLogin]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
USE [master]
GO
ALTER DATABASE [DB_Currort_Igora_kpm] SET  READ_WRITE 
GO
