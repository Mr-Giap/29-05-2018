USE [master]
GO
/****** Object:  Database [Univercity02]    Script Date: 25/06/2018 1:05:58 SA ******/
CREATE DATABASE [Univercity02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Univercity02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Univercity02.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Univercity02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Univercity02_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Univercity02] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Univercity02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Univercity02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Univercity02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Univercity02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Univercity02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Univercity02] SET ARITHABORT OFF 
GO
ALTER DATABASE [Univercity02] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Univercity02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Univercity02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Univercity02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Univercity02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Univercity02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Univercity02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Univercity02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Univercity02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Univercity02] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Univercity02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Univercity02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Univercity02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Univercity02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Univercity02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Univercity02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Univercity02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Univercity02] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Univercity02] SET  MULTI_USER 
GO
ALTER DATABASE [Univercity02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Univercity02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Univercity02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Univercity02] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Univercity02] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Univercity02]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[UserId] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Accounts_UserId]  DEFAULT (newid()),
	[UserName] [nvarchar](50) NULL,
	[PassWord] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CertificateClass]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertificateClass](
	[ClassId] [bigint] NOT NULL,
	[ClassName] [nvarchar](50) NULL,
	[SubjectId] [bigint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ProfessorId] [bigint] NULL,
 CONSTRAINT [PK_ClassId] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DegreeProgram]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DegreeProgram](
	[ProgramId] [bigint] NOT NULL,
	[ProgramName] [nvarchar](50) NULL,
	[FacultyId] [bigint] NULL,
	[ProfessorId] [bigint] NULL,
 CONSTRAINT [PK_ProgramId] PRIMARY KEY CLUSTERED 
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacultyId] [bigint] NOT NULL,
	[FacultyName] [nvarchar](50) NULL,
 CONSTRAINT [PK_FacultyId] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FacultyProfessor]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultyProfessor](
	[FacultyId] [bigint] NOT NULL,
	[ProfessorId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProfessorFaculty] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC,
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professor]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[ProfessorId] [bigint] NOT NULL,
	[ProfessorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProfessorId] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [bigint] NOT NULL,
	[StudenName] [nvarchar](50) NULL,
	[ProgramId] [bigint] NULL,
 CONSTRAINT [PK_StudentId] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentClass]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClass](
	[StudentId] [bigint] NOT NULL,
	[ClassId] [bigint] NOT NULL,
	[TestScore] [decimal](18, 0) NULL,
 CONSTRAINT [PK_StudentClass] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentTest]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTest](
	[StudentId] [bigint] NOT NULL,
	[ClassId] [bigint] NOT NULL,
	[FirstScore] [decimal](18, 0) NULL,
	[SecondScore] [decimal](18, 0) NULL,
	[ThirdScore] [decimal](18, 0) NULL,
 CONSTRAINT [PK_StudentTest] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [bigint] NOT NULL,
	[SubjectName] [nvarchar](50) NULL,
	[FacultyId] [bigint] NULL,
 CONSTRAINT [PK_SubjectId] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'850d0fec-5ef4-420a-bb45-0fa344c31458', N'ád', N'ádfafa', N'123@gmail.com', N'0123456789', N'IMyIC Technolog')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'6f8ac544-5a3e-4fe3-a843-17932354de77', N'adadazvx', N'qưedad', N'55546@gmail.com', N'16548787465', N'adada1654')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'bc0f8147-5436-467d-8671-17feccaac716', N'qưeasdad', N'qưedad', N'55546@gmail.com', N'16548787465', N'16548787465')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'2f916071-de8f-4060-acef-1be3024b0022', N'admin', N'1', N'123@gmail.com', N'12345687', N'dâdadadad')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'0b9e082e-5d6f-4dfb-9862-22b265eda93d', N'ádasdafzxc', N'qưedad', N'55546@gmail.com', N'16548787465', N'vadada1654')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'6acdb406-69fc-40d1-ac69-3e3d978b47ab', N'vxzasd', N'qưedad', N'55546@gmail.com', N'16548787465', N'adada1654')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'4b09b5d1-e03f-4bba-90c1-44fa9878a9f4', N'qưeqwe', N'qưedad', N'55546@gmail.com', N'16548787465', N'adada16548787465')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'b5af1e64-f05f-4328-8774-6df723d18bfe', N'ádadcvzxc', N'qưedad', N'55546@gmail.com', N'16548787465', N'adada1654')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'5223e250-3268-48db-b290-70918768ed45', N'adadasd', N'qưedad', N'55546@gmail.com', N'16548787465', N'adada1654')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'624c580e-81c1-4127-9ef2-a43180edf964', N'qưedad', N'qưedad', N'55546@gmail.com', N'16548787465', N'16548787465')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'8db285a3-c479-4b0a-be79-acca1ad4712a', N'ádasafa', N'qưedad', N'55546@gmail.com', N'16548787465', N'adada1654')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'8c693d8f-6ce0-42a3-9987-bce403c52ea3', N'qưeqzxczc', N'qưedad', N'55546@gmail.com', N'16548787465', N'adada1654')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'ef7351f8-3c4a-4578-9cf5-c3722a90fa03', N'doannv', N'nothing', N'doannv@imic.edu.vn', N'094345565656', N'IMIC Technology')
INSERT [dbo].[Accounts] ([UserId], [UserName], [PassWord], [Email], [Mobile], [Description]) VALUES (N'a21ac624-1f85-4c9a-a608-df98f086e04f', N'adazxcc', N'qưedad', N'55546@gmail.com', N'16548787465', N'adada1654')
INSERT [dbo].[CertificateClass] ([ClassId], [ClassName], [SubjectId], [StartDate], [EndDate], [ProfessorId]) VALUES (110, N'Quản Trị Nhân Sự 110', 110, CAST(N'2018-05-20' AS Date), CAST(N'2018-08-20' AS Date), 100)
INSERT [dbo].[CertificateClass] ([ClassId], [ClassName], [SubjectId], [StartDate], [EndDate], [ProfessorId]) VALUES (120, N'Quản Trị Dự Án 120', 120, CAST(N'2018-04-20' AS Date), CAST(N'2018-06-20' AS Date), 300)
INSERT [dbo].[CertificateClass] ([ClassId], [ClassName], [SubjectId], [StartDate], [EndDate], [ProfessorId]) VALUES (210, N'Kế Toán Cơ Bản 210', 210, CAST(N'2018-08-15' AS Date), CAST(N'2018-10-15' AS Date), 400)
INSERT [dbo].[CertificateClass] ([ClassId], [ClassName], [SubjectId], [StartDate], [EndDate], [ProfessorId]) VALUES (220, N'Kế Toán Sản Xuất 220', 220, CAST(N'2018-07-24' AS Date), CAST(N'2018-09-24' AS Date), 300)
INSERT [dbo].[CertificateClass] ([ClassId], [ClassName], [SubjectId], [StartDate], [EndDate], [ProfessorId]) VALUES (230, N'Kế Toán Sản Xuất 230', 220, CAST(N'2018-09-24' AS Date), CAST(N'2018-11-24' AS Date), 400)
INSERT [dbo].[CertificateClass] ([ClassId], [ClassName], [SubjectId], [StartDate], [EndDate], [ProfessorId]) VALUES (240, N'Kế Toán Cơ Bản 240', 210, CAST(N'2018-06-15' AS Date), CAST(N'2018-08-15' AS Date), 300)
INSERT [dbo].[CertificateClass] ([ClassId], [ClassName], [SubjectId], [StartDate], [EndDate], [ProfessorId]) VALUES (250, N'Kế Toán Cơ Bản 250', 210, CAST(N'2018-04-15' AS Date), CAST(N'2018-06-15' AS Date), 200)
INSERT [dbo].[DegreeProgram] ([ProgramId], [ProgramName], [FacultyId], [ProfessorId]) VALUES (100, N'Quản Trị Kinh Doanh 100', 100, 100)
INSERT [dbo].[DegreeProgram] ([ProgramId], [ProgramName], [FacultyId], [ProfessorId]) VALUES (200, N'Ngoại Thương 200', 400, 400)
INSERT [dbo].[DegreeProgram] ([ProgramId], [ProgramName], [FacultyId], [ProfessorId]) VALUES (300, N'Quản Trị Du Lịch 300', 300, 300)
INSERT [dbo].[DegreeProgram] ([ProgramId], [ProgramName], [FacultyId], [ProfessorId]) VALUES (400, N'Kế Toán Tài Chính 400', 200, 200)
INSERT [dbo].[Faculty] ([FacultyId], [FacultyName]) VALUES (100, N'Quản Trị Kinh Doanh')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyName]) VALUES (200, N'Kế Toán')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyName]) VALUES (300, N'Du Lịch')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyName]) VALUES (400, N'Ngoại Thương')
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (100, 100)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (400, 100)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (100, 200)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (400, 200)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (100, 300)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (200, 300)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (100, 400)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (200, 400)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (200, 500)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (300, 500)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (200, 600)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (300, 600)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (300, 700)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (300, 800)
INSERT [dbo].[FacultyProfessor] ([FacultyId], [ProfessorId]) VALUES (400, 900)
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (100, N'Nguyễn Văn A')
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (200, N'Trần Văn B')
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (300, N'Lê Thị C')
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (400, N'Trịnh Hoàng D')
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (500, N'Văn Thế E')
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (600, N'Đồng Tiến F')
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (700, N'Đỗ Chính G')
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (800, N'Professor 800')
INSERT [dbo].[Professor] ([ProfessorId], [ProfessorName]) VALUES (900, N'Professor 900')
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (110, N'Sinh Viên 110', 100)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (120, N'Sinh Viên 120', 100)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (130, N'Sinh Viên 130', 100)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (140, N'Sinh Viên 140', 100)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (150, N'Sinh Viên 150', 100)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (210, N'Sinh Viên 210', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (220, N'Sinh Viên 220', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (230, N'Sinh Viên 230', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (240, N'Sinh Viên 240', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (250, N'Sinh Viên 250', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (310, N'Sinh Viên 310', 300)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (320, N'Sinh Viên 320', 300)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (330, N'Sinh Viên 330', 300)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (340, N'Sinh Viên 340', 300)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (350, N'Sinh Viên 350', 300)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (410, N'Sinh Viên 410', 400)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (420, N'Sinh Viên 420', 400)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (430, N'Sinh Viên 430', 400)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (440, N'Sinh Viên 440', 400)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (450, N'Sinh Viên 450', 400)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (451, N'Trần Thị Mộng Mơ', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (452, N'Trần Thị Mộng Mơ', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (453, N'Trần Thị Mộng Mơ', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (454, N'Trần Thị Mộng Mơ', 200)
INSERT [dbo].[Student] ([StudentId], [StudenName], [ProgramId]) VALUES (455, N'Trần Thị Mộng Mơ', 200)
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (110, 110, CAST(7 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (110, 120, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (110, 210, CAST(9 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (140, 110, CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (150, 110, CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (210, 210, CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (220, 220, CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (230, 220, CAST(7 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (240, 220, CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[StudentClass] ([StudentId], [ClassId], [TestScore]) VALUES (250, 220, CAST(9 AS Decimal(18, 0)))
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (110, N'Quản Trị Nhân Sự', 100)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (120, N'Quản Trị Dự Án', 100)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (130, N'Quản Trị Sản Xuất', 100)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (210, N'Kế Toán Cơ Bản', 200)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (220, N'Kế Toán Sản Xuất', 200)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (230, N'Kế Toán Kho', 200)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (310, N'Lịch Sử Việt Nam', 300)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (320, N'Văn Hóa Việt Nam', 300)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (330, N'Quản Trị Du Lịch', 300)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (410, N'Kinh Tế Đối Ngoại', 400)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (420, N'Quan Hệ Quốc Tế', 400)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [FacultyId]) VALUES (430, N'Hợp Đồng Ngoại Thương', 400)
ALTER TABLE [dbo].[CertificateClass]  WITH CHECK ADD  CONSTRAINT [FK_06] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[CertificateClass] CHECK CONSTRAINT [FK_06]
GO
ALTER TABLE [dbo].[CertificateClass]  WITH CHECK ADD  CONSTRAINT [FK_07] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([ProfessorId])
GO
ALTER TABLE [dbo].[CertificateClass] CHECK CONSTRAINT [FK_07]
GO
ALTER TABLE [dbo].[DegreeProgram]  WITH CHECK ADD  CONSTRAINT [FK_03] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([FacultyId])
GO
ALTER TABLE [dbo].[DegreeProgram] CHECK CONSTRAINT [FK_03]
GO
ALTER TABLE [dbo].[DegreeProgram]  WITH CHECK ADD  CONSTRAINT [FK_04] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([ProfessorId])
GO
ALTER TABLE [dbo].[DegreeProgram] CHECK CONSTRAINT [FK_04]
GO
ALTER TABLE [dbo].[FacultyProfessor]  WITH CHECK ADD  CONSTRAINT [FK_01] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([FacultyId])
GO
ALTER TABLE [dbo].[FacultyProfessor] CHECK CONSTRAINT [FK_01]
GO
ALTER TABLE [dbo].[FacultyProfessor]  WITH CHECK ADD  CONSTRAINT [FK_02] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([ProfessorId])
GO
ALTER TABLE [dbo].[FacultyProfessor] CHECK CONSTRAINT [FK_02]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_08] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[DegreeProgram] ([ProgramId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_08]
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_09] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_09]
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_10] FOREIGN KEY([ClassId])
REFERENCES [dbo].[CertificateClass] ([ClassId])
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_10]
GO
ALTER TABLE [dbo].[StudentTest]  WITH CHECK ADD  CONSTRAINT [FK_11] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentTest] CHECK CONSTRAINT [FK_11]
GO
ALTER TABLE [dbo].[StudentTest]  WITH CHECK ADD  CONSTRAINT [FK_12] FOREIGN KEY([ClassId])
REFERENCES [dbo].[CertificateClass] ([ClassId])
GO
ALTER TABLE [dbo].[StudentTest] CHECK CONSTRAINT [FK_12]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_05] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([FacultyId])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_05]
GO
/****** Object:  StoredProcedure [dbo].[SP_Accounts_getPaging]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Accounts_getPaging]
	@start int,
	@length int
AS
BEGIN
		SELECT * FROM(
			SELECT DISTINCT
			dbo.Accounts.UserId,
			dbo.Accounts.UserName,
			dbo.Accounts.PassWord,
			dbo.Accounts.Email,
			dbo.Accounts.Mobile,
			dbo.Accounts.Description,
			ROW_NUMBER() OVER (ORDER BY dbo.Accounts.UserName asc) as RC 
			FROM dbo.Accounts
		) a
		WHERE RC > @start AND RC <= @start + @length
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Accounts_paging_getEmail]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Accounts_paging_getEmail]
	@KeyString nvarchar(50),
	@start int,
	@length int
AS
BEGIN
	IF @KeyString Is Null
	BEGIN
		SELECT * FROM(
			SELECT DISTINCT
			dbo.Accounts.UserId,
			dbo.Accounts.UserName,
			dbo.Accounts.PassWord,
			dbo.Accounts.Email,
			dbo.Accounts.Mobile,
			dbo.Accounts.Description,
			ROW_NUMBER() OVER (ORDER BY dbo.Accounts.Email asc) as RC 
			FROM dbo.Accounts
		) a
		WHERE RC > @start AND RC <= @start + @length
	END
	ELSE
	BEGIN
		SELECT * FROM(
			SELECT DISTINCT
			dbo.Accounts.UserId,
			dbo.Accounts.UserName,
			dbo.Accounts.PassWord,
			dbo.Accounts.Email,
			dbo.Accounts.Mobile,
			dbo.Accounts.Description,
			ROW_NUMBER() OVER (ORDER BY dbo.Accounts.Email asc) as RC 
			FROM dbo.Accounts WHERE Email LIKE '%' + @KeyString + '%'
		) a
		WHERE RC > @start AND RC <= @start + @length
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CheckLogin]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_CheckLogin]
 @UserName varchar(50),
 @PassWord varchar(50)
As
Begin
	 Select * From Accounts
	 where username = @UserName
	 And password = @PassWord
End


GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Account]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_Account]
@userid uniqueidentifier
AS
BEGIN
	delete from Accounts
	where UserId = @userid
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Student]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Delete_Student]
  @StudentId int
As
Begin
     Delete from Student
	 Where StudentId = @StudentId	      
End


GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Account_all]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Account_all]
AS
BEGIN
	select * 
	from Accounts
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Get_CertificateClass]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Get_CertificateClass]  
As
Begin
	Select ClassId, ClassName, a.SubjectId, b.SubjectName, 
	a.StartDate, a.EndDate, a.ProfessorId, c.ProfessorName From CertificateClass a
	inner join Subject b on a.SubjectId = b.SubjectId
	inner join Professor c on a.ProfessorId = c.ProfessorId
End


GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Professor]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Get_Professor]
As
Begin
	 Select * From Professor
End


GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Professor_By_Id]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Get_Professor_By_Id]
  @ProfessorId int
As
Begin
	 Select * From Professor Where ProfessorId = @ProfessorId
End


GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Student_Classes_all]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Get_Student_Classes_all] 
As
Begin
	Select a.StudentId, StudenName,a.ClassId, b.ClassName, TestScore From StudentClass a
	inner join CertificateClass b on a.ClassId = b.ClassId
	inner join Student c on a.StudentId = c.StudentId
End


GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Student_Classes_by_ClassId]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Get_Student_Classes_by_ClassId]
  @ClassId int 
As
Begin
	Select a.StudentId, StudenName,a.ClassId, b.ClassName, TestScore From StudentClass a
	inner join CertificateClass b on a.ClassId = b.ClassId
	inner join Student c on a.StudentId = c.StudentId
	Where a.ClassId = @ClassId
End


GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Account]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_Account]
@userid uniqueidentifier,
@username nvarchar(50),
@password nvarchar(50),
@Email nvarchar(50),
@Mobile nvarchar(50),
@Description nvarchar(50)
AS
BEGIN
	Insert into Accounts(UserId,UserName,PassWord,Email,Mobile,Description)
	values(@userid,@username,@password,@Email,@Mobile,@Description)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Student]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Insert_Student]
  @StudentId int,
  @StudenName nvarchar(50),
  @ProgramId int
As
Begin
     Insert Into [dbo].[Student]
	 Values(@StudentId, @StudenName, @ProgramId)
End


GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Account]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Account]
@userid uniqueidentifier,
@username nvarchar(50),
@password nvarchar(50),
@Email nvarchar(50),
@Mobile nvarchar(50),
@Description nvarchar(50)
AS
BEGIN
	Update Accounts
	set UserName = @username, PassWord = @password, Email = @Email,Mobile = @Mobile, Description = @Description
	where UserId = @userid
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Student]    Script Date: 25/06/2018 1:05:59 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Update_Student]
  @StudentId int,
  @StudenName nvarchar(50),
  @ProgramId int
As
Begin
	 Update Student Set StudenName = @StudenName,
	 ProgramId = @ProgramId
	 Where StudentId = @StudentId     
End


GO
USE [master]
GO
ALTER DATABASE [Univercity02] SET  READ_WRITE 
GO
