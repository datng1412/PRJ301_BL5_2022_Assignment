USE [PRJ301_ChamCong_Real_1]
GO
ALTER TABLE [dbo].[Timesheet] DROP CONSTRAINT [FK_Timesheet_Symbol]
GO
ALTER TABLE [dbo].[Timesheet] DROP CONSTRAINT [FK_Timesheet_Employee]
GO
ALTER TABLE [dbo].[RequestToLeave] DROP CONSTRAINT [FK_RequestToLeave_Symbol]
GO
ALTER TABLE [dbo].[RequestToLeave] DROP CONSTRAINT [FK_RequestToLeave_Employee]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Team]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[AnnualLeave] DROP CONSTRAINT [FK_AnnualLeave_Employee]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 8/22/2022 4:10:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Timesheet]') AND type in (N'U'))
DROP TABLE [dbo].[Timesheet]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 8/22/2022 4:10:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
DROP TABLE [dbo].[Team]
GO
/****** Object:  Table [dbo].[Symbol]    Script Date: 8/22/2022 4:10:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Symbol]') AND type in (N'U'))
DROP TABLE [dbo].[Symbol]
GO
/****** Object:  Table [dbo].[RequestToLeave]    Script Date: 8/22/2022 4:10:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RequestToLeave]') AND type in (N'U'))
DROP TABLE [dbo].[RequestToLeave]
GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 8/22/2022 4:10:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Holiday]') AND type in (N'U'))
DROP TABLE [dbo].[Holiday]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/22/2022 4:10:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/22/2022 4:10:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[AnnualLeave]    Script Date: 8/22/2022 4:10:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnnualLeave]') AND type in (N'U'))
DROP TABLE [dbo].[AnnualLeave]
GO
/****** Object:  Table [dbo].[AnnualLeave]    Script Date: 8/22/2022 4:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnualLeave](
	[aid] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[AnnualLeave1] [decimal](4, 1) NOT NULL,
	[AnnualLeave2] [decimal](4, 1) NOT NULL,
 CONSTRAINT [PK_AnnualLeave] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/22/2022 4:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](150) NOT NULL,
	[DepartmentDescription] [varchar](150) NULL,
	[HolidayRewardRate] [decimal](5, 1) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/22/2022 4:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Sex] [varchar](10) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[ContractType] [varchar](10) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[Phone] [varchar](14) NOT NULL,
	[Salary] [decimal](38, 2) NOT NULL,
 CONSTRAINT [PK_Employee_1] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 8/22/2022 4:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[HolidayID] [int] NOT NULL,
	[HolidayName] [varchar](150) NOT NULL,
	[Ratio] [decimal](5, 1) NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[HolidayDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[HolidayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestToLeave]    Script Date: 8/22/2022 4:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestToLeave](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Receiver] [int] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[Reason] [varchar](max) NULL,
	[Accept] [bit] NOT NULL,
 CONSTRAINT [PK_RequestToLeave] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symbol]    Script Date: 8/22/2022 4:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symbol](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SymbolName] [varchar](50) NOT NULL,
	[AllDay] [varchar](5) NULL,
	[HalfDay] [varchar](5) NULL,
	[Saturday] [varchar](5) NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Symbol] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 8/22/2022 4:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [int] NOT NULL,
	[TeamName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 8/22/2022 4:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NOT NULL,
	[checkin] [datetime] NULL,
	[checkout] [datetime] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Timesheet] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (1, 2021, 1, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (2, 2021, 2, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (3, 2021, 3, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (4, 2021, 4, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (5, 2021, 5, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (6, 2021, 6, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (7, 2022, 1, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (8, 2022, 2, CAST(6.5 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (9, 2022, 3, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (10, 2022, 4, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (11, 2022, 5, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (12, 2022, 6, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (13, 2023, 1, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (14, 2023, 2, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (15, 2023, 3, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (16, 2023, 4, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (17, 2023, 5, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([aid], [Year], [EmployeeID], [AnnualLeave1], [AnnualLeave2]) VALUES (18, 2023, 6, CAST(12.0 AS Decimal(4, 1)), CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (1, N'CTO', N'A chief technology officer', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (2, N'CFO', N'The term chief financial officer', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (3, N'Project Manager', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (4, N'PM', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (5, N'UI Designer', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (6, N'BOD Assistant', N'Assistant to the Board of Director', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (7, N'Accountant', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (8, N'Driver', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (9, N'CSO', N'A Chief Security Officer', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (10, N'Legal', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (11, N'HRD', N'Human Resource Development', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (12, N'HR', N'Human Resource', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (13, N'CMO', N'Chief Marketing Officer', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (14, N'PM Lead', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (15, N'BD', N'Business Development', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (16, N'Content Lead', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (17, N'CM', N'provides oversight over the entire project directly for the owner', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (18, N'CM Lead', N'provides oversight over the entire project directly for the owner', CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (19, N'Analytics', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (20, N'Researcher', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (21, N'Content Editor', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (22, N'CSO Assistant', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (23, N'Investment Association', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (24, N'Ecosystem Partnership Manager', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (25, N'Brand Executive', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (26, N'Investor Relations Manager', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (27, N'Designer', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (28, N'Leader', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (29, N'Marketing Assistant', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription], [HolidayRewardRate]) VALUES (30, N'IT', NULL, CAST(1.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [ContractType], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (1, N'Nguyen A', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'2000-12-14T00:00:00.000' AS DateTime), N'Full-Time', 1, 1, N'0375802703', CAST(1.60 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [ContractType], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (2, N'Nguyen B', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'2000-12-13T00:00:00.000' AS DateTime), N'Part-Time', 2, 2, N'0375802704', CAST(1.80 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [ContractType], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (3, N'Nguyen C', CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'1999-12-12T00:00:00.000' AS DateTime), N'Full-Time', 3, 1, N'0375802705', CAST(2.00 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [ContractType], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (4, N'Nguyen D', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'1999-11-10T00:00:00.000' AS DateTime), N'Full-Time', 4, 3, N'0375802706', CAST(2.00 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [ContractType], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (5, N'Nguyen E', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Female', CAST(N'2001-12-14T00:00:00.000' AS DateTime), N'Senior', 5, 2, N'0375802707', CAST(1.00 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [ContractType], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (6, N'Nguyen F', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'2000-12-10T00:00:00.000' AS DateTime), N'Part-Time', 6, 3, N'0375802708', CAST(2.00 AS Decimal(38, 2)))
GO
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [Ratio], [From], [To], [HolidayDescription]) VALUES (1, N'TetDuongLich', CAST(2.0 AS Decimal(5, 1)), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T23:59:59.000' AS DateTime), NULL)
GO
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [Ratio], [From], [To], [HolidayDescription]) VALUES (2, N'TetAmLich', CAST(3.0 AS Decimal(5, 1)), CAST(N'2022-01-31T00:00:00.000' AS DateTime), CAST(N'2022-02-06T23:59:59.000' AS DateTime), NULL)
GO
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [Ratio], [From], [To], [HolidayDescription]) VALUES (3, N'GioTo', CAST(2.0 AS Decimal(5, 1)), CAST(N'2022-04-10T00:00:00.000' AS DateTime), CAST(N'2022-04-11T23:59:59.000' AS DateTime), NULL)
GO
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [Ratio], [From], [To], [HolidayDescription]) VALUES (4, N'Quoc Khanh', CAST(2.0 AS Decimal(5, 1)), CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'2022-09-02T23:59:59.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[RequestToLeave] ON 
GO
INSERT [dbo].[RequestToLeave] ([RequestID], [EmployeeID], [Receiver], [From], [To], [Type], [Reason], [Accept]) VALUES (1, 2, 1, CAST(N'2022-08-17T00:00:00.000' AS DateTime), CAST(N'2022-08-18T00:00:00.000' AS DateTime), 2, N'Dau bung', 1)
GO
INSERT [dbo].[RequestToLeave] ([RequestID], [EmployeeID], [Receiver], [From], [To], [Type], [Reason], [Accept]) VALUES (3, 3, 1, CAST(N'2022-08-17T00:00:00.000' AS DateTime), CAST(N'2022-08-18T00:00:00.000' AS DateTime), 2, N'Dau Bung', 0)
GO
INSERT [dbo].[RequestToLeave] ([RequestID], [EmployeeID], [Receiver], [From], [To], [Type], [Reason], [Accept]) VALUES (4, 2, 1, CAST(N'2022-08-18T00:00:00.000' AS DateTime), CAST(N'2022-08-19T00:00:00.000' AS DateTime), 3, N'Dau Bung', 1)
GO
INSERT [dbo].[RequestToLeave] ([RequestID], [EmployeeID], [Receiver], [From], [To], [Type], [Reason], [Accept]) VALUES (5, 2, 1, CAST(N'2022-08-19T00:00:00.000' AS DateTime), CAST(N'2022-08-20T00:00:00.000' AS DateTime), 4, N'Om', 1)
GO
INSERT [dbo].[RequestToLeave] ([RequestID], [EmployeeID], [Receiver], [From], [To], [Type], [Reason], [Accept]) VALUES (11, 2, 1, CAST(N'2022-08-20T00:00:00.000' AS DateTime), CAST(N'2022-08-21T00:00:00.000' AS DateTime), 4, NULL, 1)
GO
INSERT [dbo].[RequestToLeave] ([RequestID], [EmployeeID], [Receiver], [From], [To], [Type], [Reason], [Accept]) VALUES (12, 2, 1, CAST(N'2022-08-23T00:00:00.000' AS DateTime), CAST(N'2022-08-24T00:00:00.000' AS DateTime), 3, NULL, 1)
GO
INSERT [dbo].[RequestToLeave] ([RequestID], [EmployeeID], [Receiver], [From], [To], [Type], [Reason], [Accept]) VALUES (14, 6, 1, CAST(N'2022-08-31T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), 3, NULL, 1)
GO
INSERT [dbo].[RequestToLeave] ([RequestID], [EmployeeID], [Receiver], [From], [To], [Type], [Reason], [Accept]) VALUES (15, 2, 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-08-02T00:00:00.000' AS DateTime), 5, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[RequestToLeave] OFF
GO
SET IDENTITY_INSERT [dbo].[Symbol] ON 
GO
INSERT [dbo].[Symbol] ([ID], [SymbolName], [AllDay], [HalfDay], [Saturday], [Description]) VALUES (1, N'Ngay cong', N'8.0', N'4.0', NULL, NULL)
GO
INSERT [dbo].[Symbol] ([ID], [SymbolName], [AllDay], [HalfDay], [Saturday], [Description]) VALUES (2, N'Ngay hoc tap', N'H', N'0.5H', N'T7H', NULL)
GO
INSERT [dbo].[Symbol] ([ID], [SymbolName], [AllDay], [HalfDay], [Saturday], [Description]) VALUES (3, N'Nghi phep', N'P', N'0.5P', N'T7P', NULL)
GO
INSERT [dbo].[Symbol] ([ID], [SymbolName], [AllDay], [HalfDay], [Saturday], [Description]) VALUES (4, N'Nghi om', N'O', N'0.5O', N'T7O', NULL)
GO
INSERT [dbo].[Symbol] ([ID], [SymbolName], [AllDay], [HalfDay], [Saturday], [Description]) VALUES (5, N'Nghi viec rieng co luong', N'R', N'0.5R', N'T7R', NULL)
GO
INSERT [dbo].[Symbol] ([ID], [SymbolName], [AllDay], [HalfDay], [Saturday], [Description]) VALUES (6, N'Nghi khong luong', N'0', NULL, NULL, NULL)
GO
INSERT [dbo].[Symbol] ([ID], [SymbolName], [AllDay], [HalfDay], [Saturday], [Description]) VALUES (7, N'Nghi le', N'L', NULL, NULL, NULL)
GO
INSERT [dbo].[Symbol] ([ID], [SymbolName], [AllDay], [HalfDay], [Saturday], [Description]) VALUES (8, N'Thoi viec', N'NV', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Symbol] OFF
GO
INSERT [dbo].[Team] ([TeamID], [TeamName]) VALUES (1, N'Team A')
GO
INSERT [dbo].[Team] ([TeamID], [TeamName]) VALUES (2, N'Team B')
GO
INSERT [dbo].[Team] ([TeamID], [TeamName]) VALUES (3, N'Team C')
GO
INSERT [dbo].[Team] ([TeamID], [TeamName]) VALUES (4, N'Team D')
GO
INSERT [dbo].[Team] ([TeamID], [TeamName]) VALUES (5, N'Team E')
GO
SET IDENTITY_INSERT [dbo].[Timesheet] ON 
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (32, 1, CAST(N'2022-08-01T09:30:00.000' AS DateTime), CAST(N'2022-08-01T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (33, 1, CAST(N'2022-08-02T09:30:00.000' AS DateTime), CAST(N'2022-08-02T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (34, 1, CAST(N'2022-08-03T09:30:00.000' AS DateTime), CAST(N'2022-08-03T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (35, 1, CAST(N'2022-08-04T09:30:00.000' AS DateTime), CAST(N'2022-08-04T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (36, 1, CAST(N'2022-08-05T09:30:00.000' AS DateTime), CAST(N'2022-08-05T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (37, 1, CAST(N'2022-08-06T09:30:00.000' AS DateTime), CAST(N'2022-08-06T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (39, 1, CAST(N'2022-08-08T09:30:00.000' AS DateTime), CAST(N'2022-08-08T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (40, 1, CAST(N'2022-08-09T09:30:00.000' AS DateTime), CAST(N'2022-08-09T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (41, 1, CAST(N'2022-08-10T09:30:00.000' AS DateTime), CAST(N'2022-08-10T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (42, 1, CAST(N'2022-08-11T09:30:00.000' AS DateTime), CAST(N'2022-08-11T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (43, 1, CAST(N'2022-08-12T09:30:00.000' AS DateTime), CAST(N'2022-08-12T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (44, 1, CAST(N'2022-08-13T09:30:00.000' AS DateTime), CAST(N'2022-08-13T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (46, 1, CAST(N'2022-08-15T09:30:00.000' AS DateTime), CAST(N'2022-08-15T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (47, 1, CAST(N'2022-08-16T09:30:00.000' AS DateTime), CAST(N'2022-08-16T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (48, 1, CAST(N'2022-08-17T09:30:00.000' AS DateTime), CAST(N'2022-08-17T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (49, 1, CAST(N'2022-08-18T09:30:00.000' AS DateTime), CAST(N'2022-08-18T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (50, 1, CAST(N'2022-08-19T09:30:00.000' AS DateTime), CAST(N'2022-08-19T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (51, 1, CAST(N'2022-08-20T09:30:00.000' AS DateTime), CAST(N'2022-08-20T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (53, 1, CAST(N'2022-08-22T09:30:00.000' AS DateTime), CAST(N'2022-08-22T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (54, 1, CAST(N'2022-08-23T09:30:00.000' AS DateTime), CAST(N'2022-08-23T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (55, 1, CAST(N'2022-08-24T09:30:00.000' AS DateTime), CAST(N'2022-08-24T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (56, 1, CAST(N'2022-08-25T09:30:00.000' AS DateTime), CAST(N'2022-08-25T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (57, 1, CAST(N'2022-08-26T09:30:00.000' AS DateTime), CAST(N'2022-08-26T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (58, 1, CAST(N'2022-08-27T09:30:00.000' AS DateTime), CAST(N'2022-08-27T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (60, 1, CAST(N'2022-08-29T09:30:00.000' AS DateTime), CAST(N'2022-08-29T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (61, 1, CAST(N'2022-08-30T09:30:00.000' AS DateTime), CAST(N'2022-08-30T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (100, 4, CAST(N'2022-08-01T09:30:00.000' AS DateTime), CAST(N'2022-08-01T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (101, 4, CAST(N'2022-08-02T09:30:00.000' AS DateTime), CAST(N'2022-08-02T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (102, 4, CAST(N'2022-08-03T09:30:00.000' AS DateTime), CAST(N'2022-08-03T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (103, 4, CAST(N'2022-08-04T09:30:00.000' AS DateTime), CAST(N'2022-08-04T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (104, 4, CAST(N'2022-08-05T09:30:00.000' AS DateTime), CAST(N'2022-08-05T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (107, 4, CAST(N'2022-08-08T09:30:00.000' AS DateTime), CAST(N'2022-08-08T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (108, 4, CAST(N'2022-08-09T09:30:00.000' AS DateTime), CAST(N'2022-08-09T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (109, 4, CAST(N'2022-08-10T09:30:00.000' AS DateTime), CAST(N'2022-08-10T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (110, 4, CAST(N'2022-08-11T09:30:00.000' AS DateTime), CAST(N'2022-08-11T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (111, 4, CAST(N'2022-08-12T09:30:00.000' AS DateTime), CAST(N'2022-08-12T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (114, 4, CAST(N'2022-08-15T09:30:00.000' AS DateTime), CAST(N'2022-08-15T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (115, 4, CAST(N'2022-08-16T09:30:00.000' AS DateTime), CAST(N'2022-08-16T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (116, 4, CAST(N'2022-08-17T09:30:00.000' AS DateTime), CAST(N'2022-08-17T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (117, 4, CAST(N'2022-08-18T09:30:00.000' AS DateTime), CAST(N'2022-08-18T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (118, 4, CAST(N'2022-08-19T09:30:00.000' AS DateTime), CAST(N'2022-08-19T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (121, 4, CAST(N'2022-08-22T09:30:00.000' AS DateTime), CAST(N'2022-08-22T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (122, 4, CAST(N'2022-08-23T09:30:00.000' AS DateTime), CAST(N'2022-08-23T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (123, 4, CAST(N'2022-08-24T09:30:00.000' AS DateTime), CAST(N'2022-08-24T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (124, 4, CAST(N'2022-08-25T09:30:00.000' AS DateTime), CAST(N'2022-08-25T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (125, 4, CAST(N'2022-08-26T09:30:00.000' AS DateTime), CAST(N'2022-08-26T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (128, 4, CAST(N'2022-08-29T09:30:00.000' AS DateTime), CAST(N'2022-08-29T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (129, 4, CAST(N'2022-08-30T09:30:00.000' AS DateTime), CAST(N'2022-08-30T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (131, 5, CAST(N'2022-08-01T09:30:00.000' AS DateTime), CAST(N'2022-08-01T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (132, 5, CAST(N'2022-08-02T09:30:00.000' AS DateTime), CAST(N'2022-08-02T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (133, 5, CAST(N'2022-08-03T09:30:00.000' AS DateTime), CAST(N'2022-08-03T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (134, 5, CAST(N'2022-08-04T09:30:00.000' AS DateTime), CAST(N'2022-08-04T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (135, 5, CAST(N'2022-08-05T09:30:00.000' AS DateTime), CAST(N'2022-08-05T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (138, 5, CAST(N'2022-08-08T09:30:00.000' AS DateTime), CAST(N'2022-08-08T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (139, 5, CAST(N'2022-08-09T09:30:00.000' AS DateTime), CAST(N'2022-08-09T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (140, 5, CAST(N'2022-08-10T09:30:00.000' AS DateTime), CAST(N'2022-08-10T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (141, 5, CAST(N'2022-08-11T09:30:00.000' AS DateTime), CAST(N'2022-08-11T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (142, 5, CAST(N'2022-08-12T09:30:00.000' AS DateTime), CAST(N'2022-08-12T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (145, 5, CAST(N'2022-08-15T09:30:00.000' AS DateTime), CAST(N'2022-08-15T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (146, 5, CAST(N'2022-08-16T09:30:00.000' AS DateTime), CAST(N'2022-08-16T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (147, 5, CAST(N'2022-08-17T09:30:00.000' AS DateTime), CAST(N'2022-08-17T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (148, 5, CAST(N'2022-08-18T09:30:00.000' AS DateTime), CAST(N'2022-08-18T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (149, 5, CAST(N'2022-08-19T09:30:00.000' AS DateTime), CAST(N'2022-08-19T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (152, 5, CAST(N'2022-08-22T09:30:00.000' AS DateTime), CAST(N'2022-08-22T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (153, 5, CAST(N'2022-08-23T09:30:00.000' AS DateTime), CAST(N'2022-08-23T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (154, 5, CAST(N'2022-08-24T09:30:00.000' AS DateTime), CAST(N'2022-08-24T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (155, 5, CAST(N'2022-08-25T09:30:00.000' AS DateTime), CAST(N'2022-08-25T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (156, 5, CAST(N'2022-08-26T09:30:00.000' AS DateTime), CAST(N'2022-08-26T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (159, 5, CAST(N'2022-08-29T09:30:00.000' AS DateTime), CAST(N'2022-08-29T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (160, 5, CAST(N'2022-08-30T09:30:00.000' AS DateTime), CAST(N'2022-08-30T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (162, 6, CAST(N'2022-08-01T09:30:00.000' AS DateTime), CAST(N'2022-08-01T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (163, 6, CAST(N'2022-08-02T09:30:00.000' AS DateTime), CAST(N'2022-08-02T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (164, 6, CAST(N'2022-08-03T09:30:00.000' AS DateTime), CAST(N'2022-08-03T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (165, 6, CAST(N'2022-08-04T09:30:00.000' AS DateTime), CAST(N'2022-08-04T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (166, 6, CAST(N'2022-08-05T09:30:00.000' AS DateTime), CAST(N'2022-08-05T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (169, 6, CAST(N'2022-08-08T09:30:00.000' AS DateTime), CAST(N'2022-08-08T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (170, 6, CAST(N'2022-08-09T09:30:00.000' AS DateTime), CAST(N'2022-08-09T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (171, 6, CAST(N'2022-08-10T09:30:00.000' AS DateTime), CAST(N'2022-08-10T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (172, 6, CAST(N'2022-08-11T09:30:00.000' AS DateTime), CAST(N'2022-08-11T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (173, 6, CAST(N'2022-08-12T09:30:00.000' AS DateTime), CAST(N'2022-08-12T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (176, 6, CAST(N'2022-08-15T09:30:00.000' AS DateTime), CAST(N'2022-08-15T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (177, 6, CAST(N'2022-08-16T09:30:00.000' AS DateTime), CAST(N'2022-08-16T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (178, 6, CAST(N'2022-08-17T09:30:00.000' AS DateTime), CAST(N'2022-08-17T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (179, 6, CAST(N'2022-08-18T09:30:00.000' AS DateTime), CAST(N'2022-08-18T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (180, 6, CAST(N'2022-08-19T09:30:00.000' AS DateTime), CAST(N'2022-08-19T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (183, 6, CAST(N'2022-08-22T09:30:00.000' AS DateTime), CAST(N'2022-08-22T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (184, 6, CAST(N'2022-08-23T09:30:00.000' AS DateTime), CAST(N'2022-08-23T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (185, 6, CAST(N'2022-08-24T09:30:00.000' AS DateTime), CAST(N'2022-08-24T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (186, 6, CAST(N'2022-08-25T09:30:00.000' AS DateTime), CAST(N'2022-08-25T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (187, 6, CAST(N'2022-08-26T09:30:00.000' AS DateTime), CAST(N'2022-08-26T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (190, 6, CAST(N'2022-08-29T09:30:00.000' AS DateTime), CAST(N'2022-08-29T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (191, 6, CAST(N'2022-08-30T09:30:00.000' AS DateTime), CAST(N'2022-08-30T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (227, 4, CAST(N'2022-08-06T09:30:00.000' AS DateTime), CAST(N'2022-08-06T13:30:00.000' AS DateTime), 2)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (228, 5, CAST(N'2022-08-06T09:30:00.000' AS DateTime), CAST(N'2022-08-06T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (229, 6, CAST(N'2022-08-06T09:30:00.000' AS DateTime), CAST(N'2022-08-06T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (230, 6, CAST(N'2022-08-13T09:30:00.000' AS DateTime), CAST(N'2022-08-13T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (231, 5, CAST(N'2022-08-13T09:30:00.000' AS DateTime), CAST(N'2022-08-13T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (232, 4, CAST(N'2022-08-13T09:30:00.000' AS DateTime), CAST(N'2022-08-13T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (235, 4, CAST(N'2022-08-20T09:30:00.000' AS DateTime), CAST(N'2022-08-20T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (236, 5, CAST(N'2022-08-20T09:30:00.000' AS DateTime), CAST(N'2022-08-20T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (237, 6, CAST(N'2022-08-20T09:30:00.000' AS DateTime), CAST(N'2022-08-20T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (238, 6, CAST(N'2022-08-27T09:30:00.000' AS DateTime), CAST(N'2022-08-27T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (239, 5, CAST(N'2022-08-27T09:30:00.000' AS DateTime), CAST(N'2022-08-27T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (240, 4, CAST(N'2022-08-27T09:30:00.000' AS DateTime), CAST(N'2022-08-27T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (242, 1, CAST(N'2022-08-31T09:30:00.000' AS DateTime), CAST(N'2022-08-31T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (245, 4, CAST(N'2022-08-31T09:30:00.000' AS DateTime), CAST(N'2022-08-31T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (246, 5, CAST(N'2022-08-31T09:30:00.000' AS DateTime), CAST(N'2022-08-31T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (309, 3, CAST(N'2022-08-01T09:30:00.000' AS DateTime), CAST(N'2022-08-01T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (310, 3, CAST(N'2022-08-02T09:30:00.000' AS DateTime), CAST(N'2022-08-02T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (311, 3, CAST(N'2022-08-03T09:30:00.000' AS DateTime), CAST(N'2022-08-03T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (312, 3, CAST(N'2022-08-04T09:30:00.000' AS DateTime), CAST(N'2022-08-04T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (313, 3, CAST(N'2022-08-05T09:30:00.000' AS DateTime), CAST(N'2022-08-05T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (314, 3, CAST(N'2022-08-06T09:30:00.000' AS DateTime), CAST(N'2022-08-06T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (316, 3, CAST(N'2022-08-08T09:30:00.000' AS DateTime), CAST(N'2022-08-08T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (317, 3, CAST(N'2022-08-09T09:30:00.000' AS DateTime), CAST(N'2022-08-09T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (318, 3, CAST(N'2022-08-10T09:30:00.000' AS DateTime), CAST(N'2022-08-10T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (319, 3, CAST(N'2022-08-11T09:30:00.000' AS DateTime), CAST(N'2022-08-11T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (320, 3, CAST(N'2022-08-12T09:30:00.000' AS DateTime), CAST(N'2022-08-12T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (321, 3, CAST(N'2022-08-13T09:30:00.000' AS DateTime), CAST(N'2022-08-13T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (323, 3, CAST(N'2022-08-15T09:30:00.000' AS DateTime), CAST(N'2022-08-15T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (324, 3, CAST(N'2022-08-16T09:30:00.000' AS DateTime), CAST(N'2022-08-16T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (325, 3, CAST(N'2022-08-17T09:30:00.000' AS DateTime), CAST(N'2022-08-17T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (326, 3, CAST(N'2022-08-18T09:30:00.000' AS DateTime), CAST(N'2022-08-18T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (327, 3, CAST(N'2022-08-19T09:30:00.000' AS DateTime), CAST(N'2022-08-19T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (328, 3, CAST(N'2022-08-20T09:30:00.000' AS DateTime), CAST(N'2022-08-20T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (330, 3, CAST(N'2022-08-22T09:30:00.000' AS DateTime), CAST(N'2022-08-22T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (331, 3, CAST(N'2022-08-23T09:30:00.000' AS DateTime), CAST(N'2022-08-23T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (332, 3, CAST(N'2022-08-24T09:30:00.000' AS DateTime), CAST(N'2022-08-24T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (333, 3, CAST(N'2022-08-25T09:30:00.000' AS DateTime), CAST(N'2022-08-25T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (334, 3, CAST(N'2022-08-26T09:30:00.000' AS DateTime), CAST(N'2022-08-26T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (335, 3, CAST(N'2022-08-27T09:30:00.000' AS DateTime), CAST(N'2022-08-27T13:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (337, 3, CAST(N'2022-08-29T09:30:00.000' AS DateTime), CAST(N'2022-08-29T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (338, 3, CAST(N'2022-08-30T09:30:00.000' AS DateTime), CAST(N'2022-08-30T17:30:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [Type]) VALUES (339, 3, CAST(N'2022-08-31T09:30:00.000' AS DateTime), CAST(N'2022-08-31T17:30:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Timesheet] OFF
GO
ALTER TABLE [dbo].[AnnualLeave]  WITH CHECK ADD  CONSTRAINT [FK_AnnualLeave_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[AnnualLeave] CHECK CONSTRAINT [FK_AnnualLeave_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Team]
GO
ALTER TABLE [dbo].[RequestToLeave]  WITH CHECK ADD  CONSTRAINT [FK_RequestToLeave_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[RequestToLeave] CHECK CONSTRAINT [FK_RequestToLeave_Employee]
GO
ALTER TABLE [dbo].[RequestToLeave]  WITH CHECK ADD  CONSTRAINT [FK_RequestToLeave_Symbol] FOREIGN KEY([Type])
REFERENCES [dbo].[Symbol] ([ID])
GO
ALTER TABLE [dbo].[RequestToLeave] CHECK CONSTRAINT [FK_RequestToLeave_Symbol]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Employee]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Symbol] FOREIGN KEY([Type])
REFERENCES [dbo].[Symbol] ([ID])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Symbol]
GO
