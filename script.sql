USE [master]
GO
/****** Object:  Database [UniversityCourseAndResultManagementSystemDB]    Script Date: 18-Sep-18 9:07:50 PM ******/
CREATE DATABASE [UniversityCourseAndResultManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityCourseAndResultManagementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UniversityCourseAndResultManagementSystemDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityCourseAndResultManagementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UniversityCourseAndResultManagementSystemDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityCourseAndResultManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityCourseAndResultManagementSystemDB]
GO
/****** Object:  Table [dbo].[AllocateClassRoomTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocateClassRoomTable](
	[AllocateClassRoomId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[CourseId] [int] NULL,
	[RoomId] [int] NULL,
	[DayId] [int] NULL,
	[From] [time](7) NULL,
	[To] [time](7) NULL,
 CONSTRAINT [PK_AllocateClassRoomTable] PRIMARY KEY CLUSTERED 
(
	[AllocateClassRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignCourseToTeacherTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignCourseToTeacherTable](
	[AssignCourseToTeacherId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[TeacherId] [int] NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_AssignCourseToTeacherTable] PRIMARY KEY CLUSTERED 
(
	[AssignCourseToTeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseTable](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
	[CourseCredit] [decimal](2, 1) NOT NULL,
	[CourseDescription] [varchar](500) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_CourseTable] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DayTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DayTable](
	[Dayid] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NULL,
 CONSTRAINT [PK_DayTable] PRIMARY KEY CLUSTERED 
(
	[Dayid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DepartmentTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepartmentTable](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](10) NULL,
	[DepartmentName] [varchar](100) NULL,
 CONSTRAINT [PK_DepartmentTable] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DesignationTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DesignationTable](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NULL,
 CONSTRAINT [PK_DesignationTable] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourseTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourseTable](
	[EnrollCourseId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_EnrollCourseTable] PRIMARY KEY CLUSTERED 
(
	[EnrollCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GradeLetterTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeLetterTable](
	[GradeLetterId] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetterName] [varchar](50) NULL,
 CONSTRAINT [PK_GradeLetterTable] PRIMARY KEY CLUSTERED 
(
	[GradeLetterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTable](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [int] NULL,
 CONSTRAINT [PK_RoomTable] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SemesterTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SemesterTable](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](50) NULL,
 CONSTRAINT [PK_SemesterTable] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentCourseTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourseTable](
	[StudentCourseId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_StudentCourseTable] PRIMARY KEY CLUSTERED 
(
	[StudentCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResultTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResultTable](
	[StudentResultId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
	[GradeLetterId] [int] NULL,
 CONSTRAINT [PK_StudentResultTable] PRIMARY KEY CLUSTERED 
(
	[StudentResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentTable](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](100) NULL,
	[StudentEmail] [varchar](50) NULL,
	[StudentContactNo] [varchar](50) NULL,
	[Date] [date] NULL,
	[StudentAddress] [varchar](250) NULL,
	[DepartmentId] [int] NULL,
	[RegNo] [varchar](50) NULL,
 CONSTRAINT [PK_StudentTable] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherTable]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherTable](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [varchar](100) NULL,
	[TeacherAddress] [varchar](250) NULL,
	[TeacherEmail] [varchar](50) NULL,
	[TeacherContactNo] [varchar](50) NULL,
	[DesignationId] [int] NULL,
	[DepartmentId] [int] NULL,
	[CreditToBeTaken] [decimal](20, 2) NULL,
 CONSTRAINT [PK_TeacherTable] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[TeacherCourseDepartmentView]    Script Date: 18-Sep-18 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TeacherCourseDepartmentView]
AS
SELECT        dbo.DepartmentTable.DepartmentId, dbo.TeacherTable.TeacherId, dbo.CourseTable.CourseId, dbo.TeacherTable.TeacherName, dbo.CourseTable.CourseCode
FROM            dbo.DepartmentTable INNER JOIN
                         dbo.TeacherTable ON dbo.DepartmentTable.DepartmentId = dbo.TeacherTable.DepartmentId INNER JOIN
                         dbo.CourseTable ON dbo.DepartmentTable.DepartmentId = dbo.CourseTable.DepartmentId

GO
SET IDENTITY_INSERT [dbo].[AssignCourseToTeacherTable] ON 

INSERT [dbo].[AssignCourseToTeacherTable] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId]) VALUES (1, 1, 3, 5)
INSERT [dbo].[AssignCourseToTeacherTable] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId]) VALUES (2, 1, 3, 1)
INSERT [dbo].[AssignCourseToTeacherTable] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId]) VALUES (3, 10, 8, 8)
INSERT [dbo].[AssignCourseToTeacherTable] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId]) VALUES (4, 10, 8, 9)
SET IDENTITY_INSERT [dbo].[AssignCourseToTeacherTable] OFF
SET IDENTITY_INSERT [dbo].[CourseTable] ON 

INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (1, N'IT001', N'Introduction to Computing', CAST(3.0 AS Decimal(2, 1)), N'This is a course', 1, 1)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (2, N'CSE01', N'Computer Fundamental', CAST(4.0 AS Decimal(2, 1)), N'This is fundamental course', 9, 2)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (3, N'CSE10', N'Programming Language I ', CAST(3.0 AS Decimal(2, 1)), N'This is PL course.', 9, 1)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (4, N'MAT12', N'Mathematics', CAST(5.0 AS Decimal(2, 1)), N'This is a math course', 9, 2)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (5, N'IT220', N'Data Structures', CAST(5.0 AS Decimal(2, 1)), N'This is DS course', 1, 1)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (6, N'CIS01', N'Discrete Mathematics', CAST(3.0 AS Decimal(2, 1)), N'This is DM course', 11, 3)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (7, N'BBA01', N'Business Information', CAST(3.0 AS Decimal(2, 1)), N'This is BBA course', 12, 3)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (8, N'BIT01', N'Computer Network', CAST(5.0 AS Decimal(2, 1)), N'This is CN course', 10, 6)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (9, N'BIT02', N'Foundation Math', CAST(3.0 AS Decimal(2, 1)), NULL, 10, 2)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (10, N'BA101', N'Financial Accounting I', CAST(3.0 AS Decimal(2, 1)), NULL, 12, 7)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (11, N'BA201', N'Financial Accounting II', CAST(3.0 AS Decimal(2, 1)), NULL, 12, 6)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (12, N'BA202', N'Management Accounting', CAST(3.0 AS Decimal(2, 1)), NULL, 12, 6)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (13, N'BC103', N'Business Communication', CAST(3.0 AS Decimal(2, 1)), NULL, 12, 8)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (14, N'BF301', N'Financial Management I', CAST(3.0 AS Decimal(2, 1)), NULL, 12, 5)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (15, N'BF302', N'Financial Management II', CAST(3.0 AS Decimal(2, 1)), NULL, 12, 3)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (16, N'BH301', N'Human Resources Management', CAST(3.0 AS Decimal(2, 1)), NULL, 12, 2)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (17, N'CF101', N'Computer Fundamentals', CAST(3.0 AS Decimal(2, 1)), NULL, 11, 8)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (18, N'AT101', N'Mathematics - I', CAST(3.0 AS Decimal(2, 1)), NULL, 11, 7)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (19, N'NG101', N'English Lanugage -', CAST(3.0 AS Decimal(2, 1)), NULL, 11, 6)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (20, N'CIS11', N'Information Systems Engineering', CAST(3.0 AS Decimal(2, 1)), NULL, 11, 5)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (21, N'CIS12', N'Fundamentals of Website Development', CAST(3.0 AS Decimal(2, 1)), NULL, 11, 4)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (22, N'S121L', N'Fundamentals of Website Development Lab', CAST(3.0 AS Decimal(2, 1)), NULL, 11, 3)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (23, N'IS122', N'Structured Programming', CAST(3.0 AS Decimal(2, 1)), NULL, 11, 2)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (24, N'S122L', N'Structured Programming Lab', CAST(3.0 AS Decimal(2, 1)), NULL, 11, 1)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (25, N'BITID', N'Interaction Design', CAST(5.0 AS Decimal(2, 1)), NULL, 10, 8)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (26, N'ITDFM', N'Development Framework Methodology', CAST(5.0 AS Decimal(2, 1)), NULL, 10, 7)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (27, N'ITITP', N'Introduction to Programming', CAST(5.0 AS Decimal(2, 1)), NULL, 10, 6)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (28, N'BITDE', N'Database Engineering', CAST(5.0 AS Decimal(2, 1)), NULL, 10, 5)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (29, N'BITRA', N'Requirements Analysis', CAST(5.0 AS Decimal(2, 1)), NULL, 10, 4)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (30, N'BITPR', N'Project', CAST(5.0 AS Decimal(2, 1)), NULL, 10, 8)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (31, N'IEWSD', N'Enterprise Web Solutions Development', CAST(5.0 AS Decimal(2, 1)), NULL, 10, 3)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (32, N'CSE11', N'Programming Language II', CAST(3.0 AS Decimal(2, 1)), NULL, 9, 8)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (33, N'CSE22', N'Algorithms ', CAST(3.0 AS Decimal(2, 1)), NULL, 9, 7)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (34, N'CSE40', N'Operating Systems and System Programming', CAST(3.0 AS Decimal(2, 1)), NULL, 1, 8)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (35, N'GE402', N'Business Psychology', CAST(3.0 AS Decimal(2, 1)), NULL, 1, 7)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (36, N'CSE03', N'Computer Networking', CAST(3.0 AS Decimal(2, 1)), NULL, 1, 6)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (37, N'CSE04', N'Database Management System-I', CAST(3.0 AS Decimal(2, 1)), NULL, 1, 5)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (38, N'BUS05', N'Business Studies for Engineers', CAST(3.0 AS Decimal(2, 1)), NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[CourseTable] OFF
SET IDENTITY_INSERT [dbo].[DepartmentTable] ON 

INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (1, N'IT', N'Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (9, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (10, N'BIT', N'Business Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (11, N'CIS', N'Computer Information System')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (12, N'BBA', N'Business Administration')
SET IDENTITY_INSERT [dbo].[DepartmentTable] OFF
SET IDENTITY_INSERT [dbo].[DesignationTable] ON 

INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (2, N'Associate Professor')
INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (4, N'Senior Lecturer')
INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (5, N'Lecturer')
SET IDENTITY_INSERT [dbo].[DesignationTable] OFF
SET IDENTITY_INSERT [dbo].[SemesterTable] ON 

INSERT [dbo].[SemesterTable] ([SemesterId], [SemesterName]) VALUES (1, N'1st')
INSERT [dbo].[SemesterTable] ([SemesterId], [SemesterName]) VALUES (2, N'2nd')
INSERT [dbo].[SemesterTable] ([SemesterId], [SemesterName]) VALUES (3, N'3rd')
INSERT [dbo].[SemesterTable] ([SemesterId], [SemesterName]) VALUES (4, N'4th')
INSERT [dbo].[SemesterTable] ([SemesterId], [SemesterName]) VALUES (5, N'5th')
INSERT [dbo].[SemesterTable] ([SemesterId], [SemesterName]) VALUES (6, N'6th')
INSERT [dbo].[SemesterTable] ([SemesterId], [SemesterName]) VALUES (7, N'7th')
INSERT [dbo].[SemesterTable] ([SemesterId], [SemesterName]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[SemesterTable] OFF
SET IDENTITY_INSERT [dbo].[TeacherTable] ON 

INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (1, N'Dr. Nasreen Wadud', N'Dhaka', N'mkbd1234@yahoo.com', N'01711101011', 1, 1, CAST(21.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (3, N'Dr. Zerina Begum', N'Khulna', N'zerin@du.ac.bd', N'01711376970', 2, 1, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (4, N'Mohd. Zulfiquar Hafiz (Jewel)', N'Satkhira', N'jewel@du.ac.bd', N'88029661920', 3, 10, CAST(20.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (5, N'Dr. Md. Mahbubul Alam Joarder', N'Tala, Satkhira', N'joarder@du.ac.bd', N'01730051232', 4, 9, CAST(14.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (6, N'Mohammad Shoyaib', N'Dhanmondi, dhaka', N'shoyaib@du.ac.bd', N'01711101011', 5, 11, CAST(10.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (7, N'Mohammed Shafiul Alam Khan', N'Khulna', N'shafiul@univdhaka.edu', N'01552344178', 4, 11, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (8, N'B M Mainul Hossain', N'Satkhira', N'raju@univdhaka.edu', N'01911489984', 2, 10, CAST(17.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (9, N'Shah Mostafa Khaled', N'Dhaka', N'khaled@du.ac.bd', N'01812698789', 2, 12, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (10, N'Shah Mostafa Khaled', N'Dhaka', N'smk@du.ac.bd', N'01711101011', 5, 1, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (11, N'Alim Ul Gias', N'Dhaka', N'aug@gmail.com', N'01711101011', 5, 1, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (12, N'Md. Rayhanur Rahman', N'Dhaka', N'rr@gmail.com', N'01711101011', 5, 1, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (13, N'Asif Imran', N'Khulna', N'ai@du.ac.bd', N'01711101011', 5, 1, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (14, N'Amit Seal Ami', N'Satkhira', N'asm@du.ac.bd', N'01711101011', 5, 1, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (15, N'Dr. Md. Monirul Islam', N'Dhaka', N'mmi@gmail.com', N'01711101011', 4, 9, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (16, N'Dr. Md. Mustafizur Rahman', N'Khulna', N'mmr@du.ac.bd', N'01711101011', 1, 9, CAST(20.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (17, N'Dr. Md. Haider Ali', N'Satkhira', N'mha@du.ac.bd', N'01711101011', 1, 9, CAST(20.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (18, N'Dr. Md. Rezaul Karim', N'Khulna', N'mrk@du.ac.bd', N'01711101011', 1, 9, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (19, N'Dr. Shabbir Ahmed', N'Tala, Satkhira', N'sa@du.ac.bd', N'01711101011', 1, 9, CAST(20.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (20, N'BM Nazmul Haque', N'Azimpur, Dhaka', N'bmnh@daffodil.ac', N'01711101011', 4, 10, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (21, N'Mr. Md. Nasimul Kader', N'Dhaka', N'mnk@daffodil.ac', N'01711101011', 4, 10, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (22, N'Md. Sarwar Hossain Mollah', N'Tongi, Gazipur', N'dad@daffodil.ac', N'01711101011', 3, 10, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (23, N'Nazrana Haque', N'Dhaka', N'cc@daffodil.ac', N'01711101011', 4, 10, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (24, N'Mr. Mustafizur Rahman', N'Mohammadpur, Dhaka', N'acc@daffodil.ac', N'01711101011', 4, 10, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (25, N'Md. Ali Imran', N'Munshiganj', N'ai@daffodil.ac', N'01711101011', 5, 11, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (26, N'Ms. Nayeema Rahman', N'Dhaka', N'nr@diu.ac.bd', N'01711101011', 4, 11, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (27, N'Kazi Sanghati Sowharda Haque', N'Pabna', N'kssh@gmail.com', N'01711101011', 4, 11, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (28, N' Mohammad Azizur Rahman', N'B.Baria', N'mar@gmail.com', N'01711101011', 5, 11, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (29, N'Md. Siplu Sinha', N'Narayanganj', N'ss@daffodil.ac', N'01711101011', 4, 10, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (30, N'Gouranga Chandra Debnath', N'Dhaka', N'gcd@gmail.com', N'01711101011', 4, 12, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (31, N'M. Shahjahan Mina', N'Dhaka', N'sm@gmail.com', N'01711101011', 1, 12, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (32, N'Rafiqul Islam', N'Dhaka', N'ri@gmail.com', N'01711101011', 1, 12, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (33, N'Ki Kwan Yoon', N'Japan', N'ky@gmail.com', N'01711101011', 1, 12, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (34, N'Ahmed Fakhrul Alam', N'Dhaka', N'afa@gmail.com', N'01711101011', 1, 12, CAST(15.00 AS Decimal(20, 2)))
INSERT [dbo].[TeacherTable] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (35, N'Md Zakir Hossain', N'Dhaka', N'zh@gmail.com', N'01711101011', 2, 12, CAST(15.00 AS Decimal(20, 2)))
SET IDENTITY_INSERT [dbo].[TeacherTable] OFF
ALTER TABLE [dbo].[AllocateClassRoomTable]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoomTable_CourseTable] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseTable] ([CourseId])
GO
ALTER TABLE [dbo].[AllocateClassRoomTable] CHECK CONSTRAINT [FK_AllocateClassRoomTable_CourseTable]
GO
ALTER TABLE [dbo].[AllocateClassRoomTable]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoomTable_DayTable] FOREIGN KEY([DayId])
REFERENCES [dbo].[DayTable] ([Dayid])
GO
ALTER TABLE [dbo].[AllocateClassRoomTable] CHECK CONSTRAINT [FK_AllocateClassRoomTable_DayTable]
GO
ALTER TABLE [dbo].[AllocateClassRoomTable]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoomTable_DepartmentTable] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTable] ([DepartmentId])
GO
ALTER TABLE [dbo].[AllocateClassRoomTable] CHECK CONSTRAINT [FK_AllocateClassRoomTable_DepartmentTable]
GO
ALTER TABLE [dbo].[AllocateClassRoomTable]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoomTable_RoomTable] FOREIGN KEY([RoomId])
REFERENCES [dbo].[RoomTable] ([RoomId])
GO
ALTER TABLE [dbo].[AllocateClassRoomTable] CHECK CONSTRAINT [FK_AllocateClassRoomTable_RoomTable]
GO
ALTER TABLE [dbo].[AssignCourseToTeacherTable]  WITH CHECK ADD  CONSTRAINT [FK_AssignCourseToTeacherTable_CourseTable] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseTable] ([CourseId])
GO
ALTER TABLE [dbo].[AssignCourseToTeacherTable] CHECK CONSTRAINT [FK_AssignCourseToTeacherTable_CourseTable]
GO
ALTER TABLE [dbo].[AssignCourseToTeacherTable]  WITH CHECK ADD  CONSTRAINT [FK_AssignCourseToTeacherTable_DepartmentTable] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTable] ([DepartmentId])
GO
ALTER TABLE [dbo].[AssignCourseToTeacherTable] CHECK CONSTRAINT [FK_AssignCourseToTeacherTable_DepartmentTable]
GO
ALTER TABLE [dbo].[AssignCourseToTeacherTable]  WITH CHECK ADD  CONSTRAINT [FK_AssignCourseToTeacherTable_TeacherTable] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[TeacherTable] ([TeacherId])
GO
ALTER TABLE [dbo].[AssignCourseToTeacherTable] CHECK CONSTRAINT [FK_AssignCourseToTeacherTable_TeacherTable]
GO
ALTER TABLE [dbo].[CourseTable]  WITH CHECK ADD  CONSTRAINT [FK_CourseTable_DepartmentTable] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTable] ([DepartmentId])
GO
ALTER TABLE [dbo].[CourseTable] CHECK CONSTRAINT [FK_CourseTable_DepartmentTable]
GO
ALTER TABLE [dbo].[CourseTable]  WITH CHECK ADD  CONSTRAINT [FK_CourseTable_SemesterTable] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[SemesterTable] ([SemesterId])
GO
ALTER TABLE [dbo].[CourseTable] CHECK CONSTRAINT [FK_CourseTable_SemesterTable]
GO
ALTER TABLE [dbo].[EnrollCourseTable]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourseTable_CourseTable] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseTable] ([CourseId])
GO
ALTER TABLE [dbo].[EnrollCourseTable] CHECK CONSTRAINT [FK_EnrollCourseTable_CourseTable]
GO
ALTER TABLE [dbo].[EnrollCourseTable]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourseTable_StudentTable] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentTable] ([StudentId])
GO
ALTER TABLE [dbo].[EnrollCourseTable] CHECK CONSTRAINT [FK_EnrollCourseTable_StudentTable]
GO
ALTER TABLE [dbo].[StudentResultTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultTable_CourseTable] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseTable] ([CourseId])
GO
ALTER TABLE [dbo].[StudentResultTable] CHECK CONSTRAINT [FK_StudentResultTable_CourseTable]
GO
ALTER TABLE [dbo].[StudentResultTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultTable_GradeLetterTable] FOREIGN KEY([GradeLetterId])
REFERENCES [dbo].[GradeLetterTable] ([GradeLetterId])
GO
ALTER TABLE [dbo].[StudentResultTable] CHECK CONSTRAINT [FK_StudentResultTable_GradeLetterTable]
GO
ALTER TABLE [dbo].[StudentResultTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultTable_StudentTable] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentTable] ([StudentId])
GO
ALTER TABLE [dbo].[StudentResultTable] CHECK CONSTRAINT [FK_StudentResultTable_StudentTable]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_DepartmentTable] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTable] ([DepartmentId])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_DepartmentTable]
GO
ALTER TABLE [dbo].[TeacherTable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTable_DepartmentTable] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentTable] ([DepartmentId])
GO
ALTER TABLE [dbo].[TeacherTable] CHECK CONSTRAINT [FK_TeacherTable_DepartmentTable]
GO
ALTER TABLE [dbo].[TeacherTable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTable_DesignationTable] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[DesignationTable] ([DesignationId])
GO
ALTER TABLE [dbo].[TeacherTable] CHECK CONSTRAINT [FK_TeacherTable_DesignationTable]
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
         Begin Table = "DepartmentTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TeacherTable"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 136
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseTable"
            Begin Extent = 
               Top = 6
               Left = 487
               Bottom = 136
               Right = 673
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TeacherCourseDepartmentView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TeacherCourseDepartmentView'
GO
USE [master]
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET  READ_WRITE 
GO
