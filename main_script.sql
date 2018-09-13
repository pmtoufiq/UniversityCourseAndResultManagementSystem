USE [master]
GO
/****** Object:  Database [UniversityCourseAndResultManagementSystemDB]    Script Date: 9/12/2018 1:20:00 PM ******/
CREATE DATABASE [UniversityCourseAndResultManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityCourseAndResultManagementSystemDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityCourseAndResultManagementSystemDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityCourseAndResultManagementSystemDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityCourseAndResultManagementSystemDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[AllocateClassRoomTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[AssignCourseToTeacherTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[CourseTable]    Script Date: 9/12/2018 1:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseTable](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NULL,
	[CourseName] [varchar](100) NULL,
	[CourseCredit] [decimal](2, 1) NULL,
	[CourseDescription] [varchar](500) NULL,
	[DepartmentId] [int] NULL,
	[SemesterId] [int] NULL,
 CONSTRAINT [PK_CourseTable] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DayTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[DepartmentTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[DesignationTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[EnrollCourseTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[GradeLetterTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[RoomTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[SemesterTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[StudentResultTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[StudentTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
/****** Object:  Table [dbo].[TeacherTable]    Script Date: 9/12/2018 1:20:00 PM ******/
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
	[CreditToBeTaken] [decimal](2, 1) NULL,
 CONSTRAINT [PK_TeacherTable] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentTable] ON 

INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (1, N'IT001', N'Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (2, N'IT001', N'Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (3, N'IT001', N'Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (4, N'IT001', N'Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (5, N'asdf', N'IT')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (6, N'asdf', N'asdf')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (7, N'adsfasf', N'Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (8, N'asdfa', N'Information Technology')
SET IDENTITY_INSERT [dbo].[DepartmentTable] OFF
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
USE [master]
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET  READ_WRITE 
GO
