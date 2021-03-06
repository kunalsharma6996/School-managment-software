USE [master]
GO
/****** Object:  Database [WIS]    Script Date: 10-08-2017 20:39:31 ******/
CREATE DATABASE [WIS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WIS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WIS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WIS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WIS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WIS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WIS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WIS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WIS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WIS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WIS] SET ARITHABORT OFF 
GO
ALTER DATABASE [WIS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WIS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WIS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WIS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WIS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WIS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WIS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WIS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WIS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WIS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WIS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WIS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WIS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WIS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WIS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WIS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WIS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WIS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WIS] SET  MULTI_USER 
GO
ALTER DATABASE [WIS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WIS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WIS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WIS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WIS]
GO
/****** Object:  StoredProcedure [dbo].[Login_Employee]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Login_Employee]( 
	-- Add the parameters for the stored procedure here
	@Username varchar (64),
	 @Password varchar (64))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Employee where Employee_username=@Username and Employee_password=@Password and Employee_enable='1';
END

GO
/****** Object:  StoredProcedure [dbo].[Login_student]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Login_student]( 
	-- Add the parameters for the stored procedure here
	@Username varchar (64),
	 @Password varchar (64))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Student where Student_username=@Username and Student_password=@Password;
END

GO
/****** Object:  Table [dbo].[Course]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_id] [int] IDENTITY(1,1) NOT NULL,
	[Couse_name] [nvarchar](50) NOT NULL,
	[Credits] [int] NOT NULL,
	[Fee] [int] NOT NULL,
	[Prerequsite] [ntext] NULL,
	[Program_id] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_name] [nvarchar](50) NOT NULL,
	[Employee_role] [nvarchar](50) NOT NULL,
	[Employee_function] [int] NOT NULL,
	[Employee_enable] [int] NOT NULL,
	[Employee_Address] [text] NULL,
	[Employee_number] [int] NOT NULL,
	[Employee_username] [nvarchar](50) NOT NULL,
	[Employee_password] [nvarchar](50) NOT NULL,
	[Employee_email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[Employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_course]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_course](
	[Employee_id] [int] NOT NULL,
	[Course_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favourite_student]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite_student](
	[Course_id] [int] NOT NULL,
	[Student_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functions]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Functions](
	[Function_id] [int] IDENTITY(1,1) NOT NULL,
	[Function_role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[Function_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Program]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[Program_id] [int] IDENTITY(1,1) NOT NULL,
	[Program_name] [nvarchar](50) NOT NULL,
	[Program_length] [nvarchar](50) NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[Program_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_id] [int] IDENTITY(1,1) NOT NULL,
	[Student_name] [text] NOT NULL,
	[Student_father] [nvarchar](50) NULL,
	[Student_mother] [nvarchar](50) NULL,
	[Student_username] [nvarchar](50) NOT NULL,
	[Student_password] [nvarchar](50) NOT NULL,
	[Student_past_course] [nvarchar](50) NULL,
	[Student_contact] [int] NOT NULL,
	[Student_email] [nvarchar](50) NOT NULL,
	[Student_sibling] [int] NULL,
	[Student_program] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_course]    Script Date: 10-08-2017 20:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_course](
	[Student_id] [int] NOT NULL,
	[Course_id] [int] NOT NULL,
	[Marks_1] [int] NOT NULL,
	[Marks_2] [int] NOT NULL,
	[Marks_3] [int] NOT NULL,
	[Grade] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Course_id], [Couse_name], [Credits], [Fee], [Prerequsite], [Program_id]) VALUES (1, N'mobile technology', 30, 10500, N'android,java', 3)
INSERT [dbo].[Course] ([Course_id], [Couse_name], [Credits], [Fee], [Prerequsite], [Program_id]) VALUES (2, N'network security', 20, 10000, NULL, 1)
INSERT [dbo].[Course] ([Course_id], [Couse_name], [Credits], [Fee], [Prerequsite], [Program_id]) VALUES (3, N'time management', 20, 10000, NULL, 2)
INSERT [dbo].[Course] ([Course_id], [Couse_name], [Credits], [Fee], [Prerequsite], [Program_id]) VALUES (4, N'event managment', 30, 15000, NULL, 2)
INSERT [dbo].[Course] ([Course_id], [Couse_name], [Credits], [Fee], [Prerequsite], [Program_id]) VALUES (5, N'IOT', 40, 20000, NULL, 3)
INSERT [dbo].[Course] ([Course_id], [Couse_name], [Credits], [Fee], [Prerequsite], [Program_id]) VALUES (6, N'Data structures', 20, 10000, N'', 3)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_id], [Employee_name], [Employee_role], [Employee_function], [Employee_enable], [Employee_Address], [Employee_number], [Employee_username], [Employee_password], [Employee_email]) VALUES (1, N'emp_admin', N'admin', 1, 1, N'address', 123456, N'admin', N'12345', N'abc@gmial.com')
INSERT [dbo].[Employee] ([Employee_id], [Employee_name], [Employee_role], [Employee_function], [Employee_enable], [Employee_Address], [Employee_number], [Employee_username], [Employee_password], [Employee_email]) VALUES (2, N'BhumikaShah', N'lecturer', 5, 1, N'address132', 1234567, N'BhumikaShah', N'12345', N'abc@gmail.com')
INSERT [dbo].[Employee] ([Employee_id], [Employee_name], [Employee_role], [Employee_function], [Employee_enable], [Employee_Address], [Employee_number], [Employee_username], [Employee_password], [Employee_email]) VALUES (3, N'emp_staff', N'staff', 1, 1, N'address', 123456, N'staff', N'12345', N'abc@gmial.com')
INSERT [dbo].[Employee] ([Employee_id], [Employee_name], [Employee_role], [Employee_function], [Employee_enable], [Employee_Address], [Employee_number], [Employee_username], [Employee_password], [Employee_email]) VALUES (5, N'abcde123', N'lecturer', 4, 1, N'Surat gujarat', 123456790, N'abcde123', N'12345', N'abc@gmail.com')
INSERT [dbo].[Employee] ([Employee_id], [Employee_name], [Employee_role], [Employee_function], [Employee_enable], [Employee_Address], [Employee_number], [Employee_username], [Employee_password], [Employee_email]) VALUES (10, N'lecturer', N'lecturer', 1, 1, N'earth', 123456789, N'lecturer', N'12345', N'lec@gmial.com')
INSERT [dbo].[Employee] ([Employee_id], [Employee_name], [Employee_role], [Employee_function], [Employee_enable], [Employee_Address], [Employee_number], [Employee_username], [Employee_password], [Employee_email]) VALUES (1010, N'staff123', N'staff', 1, 1, N'world123', 1234567891, N'staff123', N'12345', N'staff@gmial.com')
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[Employee_course] ([Employee_id], [Course_id]) VALUES (2, 1)
INSERT [dbo].[Employee_course] ([Employee_id], [Course_id]) VALUES (2, 3)
INSERT [dbo].[Employee_course] ([Employee_id], [Course_id]) VALUES (2, 5)
INSERT [dbo].[Employee_course] ([Employee_id], [Course_id]) VALUES (2, 6)
INSERT [dbo].[Employee_course] ([Employee_id], [Course_id]) VALUES (5, 2)
INSERT [dbo].[Employee_course] ([Employee_id], [Course_id]) VALUES (5, 4)
INSERT [dbo].[Employee_course] ([Employee_id], [Course_id]) VALUES (5, 1)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (1, 4)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (2, 4)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (3, 10)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (3, 2)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (4, 2)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (6, 2)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (5, 2)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (2, 6)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (4, 6)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (5, 6)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (1, 6)
INSERT [dbo].[Favourite_student] ([Course_id], [Student_id]) VALUES (2, 10)
SET IDENTITY_INSERT [dbo].[Functions] ON 

INSERT [dbo].[Functions] ([Function_id], [Function_role]) VALUES (1, N'all access')
INSERT [dbo].[Functions] ([Function_id], [Function_role]) VALUES (2, N'view only')
INSERT [dbo].[Functions] ([Function_id], [Function_role]) VALUES (3, N'no access')
INSERT [dbo].[Functions] ([Function_id], [Function_role]) VALUES (4, N'insert access')
INSERT [dbo].[Functions] ([Function_id], [Function_role]) VALUES (5, N'update access')
SET IDENTITY_INSERT [dbo].[Functions] OFF
SET IDENTITY_INSERT [dbo].[Program] ON 

INSERT [dbo].[Program] ([Program_id], [Program_name], [Program_length]) VALUES (1, N'Certificate in IT', N'6')
INSERT [dbo].[Program] ([Program_id], [Program_name], [Program_length]) VALUES (2, N'Certificate in Business', N'6')
INSERT [dbo].[Program] ([Program_id], [Program_name], [Program_length]) VALUES (3, N'Diploma in IT level 5', N'12')
INSERT [dbo].[Program] ([Program_id], [Program_name], [Program_length]) VALUES (4, N'Diploma in IT level 6', N'12')
INSERT [dbo].[Program] ([Program_id], [Program_name], [Program_length]) VALUES (5, N'Diploma in Business level 5', N'12')
INSERT [dbo].[Program] ([Program_id], [Program_name], [Program_length]) VALUES (6, N'Diploma in Business level 6', N'12')
SET IDENTITY_INSERT [dbo].[Program] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Student_id], [Student_name], [Student_father], [Student_mother], [Student_username], [Student_password], [Student_past_course], [Student_contact], [Student_email], [Student_sibling], [Student_program]) VALUES (2, N'aditya', N'mukesh', N'meena', N'aditya', N'12345', NULL, 12345, N'aditya@gmial.com', 1, 1)
INSERT [dbo].[Student] ([Student_id], [Student_name], [Student_father], [Student_mother], [Student_username], [Student_password], [Student_past_course], [Student_contact], [Student_email], [Student_sibling], [Student_program]) VALUES (3, N'johna', N'mark', N'alex', N'johna', N'student', N' ', 12345, N'john@gmial.com', 2, 1)
INSERT [dbo].[Student] ([Student_id], [Student_name], [Student_father], [Student_mother], [Student_username], [Student_password], [Student_past_course], [Student_contact], [Student_email], [Student_sibling], [Student_program]) VALUES (4, N'kunal', N'mukeshbhai', N'meenaben', N'kunal', N'kun123', N' ', 1234567890, N'kunalsharma13@gmail.com', 3, 1)
INSERT [dbo].[Student] ([Student_id], [Student_name], [Student_father], [Student_mother], [Student_username], [Student_password], [Student_past_course], [Student_contact], [Student_email], [Student_sibling], [Student_program]) VALUES (6, N'div', N'muk', N'mee', N'div', N'12345', N' ', 12345, N'div@gmial.com', 0, 3)
INSERT [dbo].[Student] ([Student_id], [Student_name], [Student_father], [Student_mother], [Student_username], [Student_password], [Student_past_course], [Student_contact], [Student_email], [Student_sibling], [Student_program]) VALUES (8, N'bcd', N'efg', N'hij', N'bcd', N'student', N' ', 123456789, N'bcd@gmial.com', 1, 3)
INSERT [dbo].[Student] ([Student_id], [Student_name], [Student_father], [Student_mother], [Student_username], [Student_password], [Student_past_course], [Student_contact], [Student_email], [Student_sibling], [Student_program]) VALUES (10, N'jinay', N'sanjay', N'mom', N'jinay', N'12345', N' ', 1234567891, N'jinay@gmial.com', 1, 4)
SET IDENTITY_INSERT [dbo].[Student] OFF
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (2, 3, 40, 67, 82, N'AC')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (3, 3, 60, 60, 68, N'BB')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (4, 4, 70, 70, 70, N'AB')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (6, 4, 80, 80, 80, N'AA')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (2, 6, 100, 100, 100, N'AA')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (2, 4, 80, 80, 92, N'AA')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (2, 5, 80, 80, 92, N'AA')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (6, 3, 72, 76, 80, N'AB')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (6, 5, 72, 76, 80, N'AB')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (8, 1, 60, 70, 80, N'AB')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (10, 4, 60, 70, 80, N'AB')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (10, 1, 60, 70, 80, N'AB')
INSERT [dbo].[Student_course] ([Student_id], [Course_id], [Marks_1], [Marks_2], [Marks_3], [Grade]) VALUES (8, 6, 66, 78, 81, N'AB')
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Employee_function]  DEFAULT ((1)) FOR [Employee_function]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Employee_enable]  DEFAULT ((1)) FOR [Employee_enable]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Program] FOREIGN KEY([Program_id])
REFERENCES [dbo].[Program] ([Program_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Program]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Functions] FOREIGN KEY([Employee_function])
REFERENCES [dbo].[Functions] ([Function_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Functions]
GO
ALTER TABLE [dbo].[Employee_course]  WITH CHECK ADD  CONSTRAINT [FK_Employee_course_Course] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Course] ([Course_id])
GO
ALTER TABLE [dbo].[Employee_course] CHECK CONSTRAINT [FK_Employee_course_Course]
GO
ALTER TABLE [dbo].[Employee_course]  WITH CHECK ADD  CONSTRAINT [FK_Employee_course_Employee] FOREIGN KEY([Employee_id])
REFERENCES [dbo].[Employee] ([Employee_id])
GO
ALTER TABLE [dbo].[Employee_course] CHECK CONSTRAINT [FK_Employee_course_Employee]
GO
ALTER TABLE [dbo].[Favourite_student]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_student_Course] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Course] ([Course_id])
GO
ALTER TABLE [dbo].[Favourite_student] CHECK CONSTRAINT [FK_Favourite_student_Course]
GO
ALTER TABLE [dbo].[Favourite_student]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_student_Student] FOREIGN KEY([Student_id])
REFERENCES [dbo].[Student] ([Student_id])
GO
ALTER TABLE [dbo].[Favourite_student] CHECK CONSTRAINT [FK_Favourite_student_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Program] FOREIGN KEY([Student_program])
REFERENCES [dbo].[Program] ([Program_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Program]
GO
ALTER TABLE [dbo].[Student_course]  WITH CHECK ADD  CONSTRAINT [FK_Student_course_Course1] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Course] ([Course_id])
GO
ALTER TABLE [dbo].[Student_course] CHECK CONSTRAINT [FK_Student_course_Course1]
GO
ALTER TABLE [dbo].[Student_course]  WITH CHECK ADD  CONSTRAINT [FK_Student_course_Student] FOREIGN KEY([Student_id])
REFERENCES [dbo].[Student] ([Student_id])
GO
ALTER TABLE [dbo].[Student_course] CHECK CONSTRAINT [FK_Student_course_Student]
GO
USE [master]
GO
ALTER DATABASE [WIS] SET  READ_WRITE 
GO
