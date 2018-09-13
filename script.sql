USE [UniversityCourseAndResultManagementSystemDB]
GO
SET IDENTITY_INSERT [dbo].[DepartmentTable] ON 

INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (1, N'IT', N'Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (9, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (10, N'BIT', N'Business Information Technology')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (11, N'CIS', N'Computer Information System')
INSERT [dbo].[DepartmentTable] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (12, N'BBA', N'Business Administration')
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
SET IDENTITY_INSERT [dbo].[CourseTable] ON 

INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (1, N'IT001', N'Introduction to Computing', CAST(3.0 AS Decimal(2, 1)), N'This is a course', 1, 1)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (2, N'CSE01', N'Computer Fundamental', CAST(4.0 AS Decimal(2, 1)), N'This is fundamental course', 9, 2)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (3, N'CSE10', N'Programming Language I ', CAST(3.0 AS Decimal(2, 1)), N'This is PL course.', 9, 1)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (4, N'MAT12', N'Mathematics', CAST(5.0 AS Decimal(2, 1)), N'This is a math course', 9, 2)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (5, N'IT220', N'Data Structures', CAST(5.0 AS Decimal(2, 1)), N'This is DS course', 1, 1)
INSERT [dbo].[CourseTable] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (6, N'CIS01', N'Discrete Mathematics', CAST(3.0 AS Decimal(2, 1)), N'This is DM course', 11, 3)
SET IDENTITY_INSERT [dbo].[CourseTable] OFF
SET IDENTITY_INSERT [dbo].[DesignationTable] ON 

INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (2, N'Associate Professor')
INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (4, N'Senior Lecturer')
INSERT [dbo].[DesignationTable] ([DesignationId], [DesignationName]) VALUES (5, N'Lecturer')
SET IDENTITY_INSERT [dbo].[DesignationTable] OFF
