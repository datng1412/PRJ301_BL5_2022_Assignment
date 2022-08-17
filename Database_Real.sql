USE [PRJ301_ChamCong_Real]
GO
/****** Object:  Table [dbo].[AnnualLeave]    Script Date: 8/17/2022 8:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnualLeave](
	[Year] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[AnnualLeave] [decimal](4, 1) NOT NULL,
 CONSTRAINT [PK_AnnualLeave] PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/17/2022 8:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](150) NOT NULL,
	[DepartmentDescription] [varchar](150) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/17/2022 8:14:19 AM ******/
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
	[Status] [varchar](10) NOT NULL,
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
/****** Object:  Table [dbo].[Holiday]    Script Date: 8/17/2022 8:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[HolidayID] [int] NOT NULL,
	[HolidayType] [varchar](150) NOT NULL,
	[HolidayDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[HolidayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestToLeave]    Script Date: 8/17/2022 8:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestToLeave](
	[RequestID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[From] [int] NOT NULL,
	[To] [int] NOT NULL,
	[Type] [varchar](150) NOT NULL,
	[Reason] [varchar](150) NULL,
 CONSTRAINT [PK_RequestToLeave] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 8/17/2022 8:14:19 AM ******/
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
/****** Object:  Table [dbo].[Timesheet]    Script Date: 8/17/2022 8:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NOT NULL,
	[checkin] [datetime] NOT NULL,
	[checkout] [datetime] NOT NULL,
 CONSTRAINT [PK_Timesheet] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2021, 1, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2021, 2, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2021, 3, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2021, 4, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2021, 5, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2022, 1, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2022, 2, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2022, 3, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2022, 4, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2022, 5, CAST(11.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2023, 1, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2023, 2, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2023, 3, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2023, 4, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[AnnualLeave] ([Year], [EmployeeID], [AnnualLeave]) VALUES (2023, 5, CAST(12.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (1, N'CTO', N'A chief technology officer')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (2, N'CFO', N'The term chief financial officer')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (3, N'Project Manager', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (4, N'PM', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (5, N'UI Designer', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (6, N'BOD Assistant', N'Assistant to the Board of Director')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (7, N'Accountant', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (8, N'Driver', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (9, N'CSO', N'A Chief Security Officer')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (10, N'Legal', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (11, N'HRD', N'Human Resource Development')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (12, N'HR', N'Human Resource')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (13, N'CMO', N'Chief Marketing Officer')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (14, N'PM Lead', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (15, N'BD', N'Business Development')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (16, N'Content Lead', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (17, N'CM', N'provides oversight over the entire project directly for the owner')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (18, N'CM Lead', N'provides oversight over the entire project directly for the owner')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (19, N'Analytics', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (20, N'Researcher', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (21, N'Content Editor', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (22, N'CSO Assistant', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (23, N'Investment Association', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (24, N'Ecosystem Partnership Manager', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (25, N'Brand Executive', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (26, N'Investor Relations Manager', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (27, N'Designer', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (28, N'Leader', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (29, N'Marketing Assistant', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (30, N'IT', NULL)
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [Status], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (1, N'Nguyen A', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'2000-12-14T00:00:00.000' AS DateTime), N'Full-Time', 1, 1, N'0375802703', CAST(3.00 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [Status], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (2, N'Nguyen b', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'2000-12-13T00:00:00.000' AS DateTime), N'Part-Time', 2, 2, N'0375802704', CAST(2.50 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [Status], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (3, N'Nguyen c', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Female', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'Intern', 3, 3, N'0375802705', CAST(2.00 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [Status], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (4, N'Nguyen D', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'2000-12-11T00:00:00.000' AS DateTime), N'Full-Time', 4, 4, N'0375802706', CAST(1.50 AS Decimal(38, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [StartDate], [Sex], [DOB], [Status], [DepartmentID], [TeamID], [Phone], [Salary]) VALUES (5, N'Nguyen E', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Male', CAST(N'2000-12-10T00:00:00.000' AS DateTime), N'Full-Time', 5, 5, N'0375802707', CAST(1.80 AS Decimal(38, 2)))
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
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout]) VALUES (4, 1, CAST(N'2022-08-05T09:30:00.000' AS DateTime), CAST(N'2022-08-05T17:30:00.000' AS DateTime))
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
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Employee]
GO
