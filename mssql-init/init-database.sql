CREATE database SaiGonWaterBus
GO

USE [SaiGonWaterBusPhuong]
GO
/****** Object:  User [vinh1]    Script Date: 2024-07-23 12:06:58 PM ******/
CREATE USER [vinh1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[vinh1]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [vinh1]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [vinh1]
GO
/****** Object:  Schema [vinh1]    Script Date: 2024-07-23 12:06:58 PM ******/
CREATE SCHEMA [vinh1]
GO
/****** Object:  Table [dbo].[account]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime] NULL,
	[delete_at] [datetime] NULL,
	[email] [nvarchar](255) NULL,
	[firstname] [nvarchar](255) NULL,
	[lastname] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[phone_number] [varchar](255) NULL,
	[role] [varchar](255) NOT NULL,
	[status] [varchar](255) NULL,
	[update_at] [datetime] NULL,
	[username] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[captain]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[captain](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[create_at] [date] NULL,
	[delete_at] [date] NULL,
	[firstname] [nvarchar](255) NOT NULL,
	[lastname] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](10) NOT NULL,
	[ship_license] [varchar](12) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[update_at] [date] NULL,
	[ship_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_at] [date] NULL,
	[delete_at] [date] NULL,
	[pay_method] [varchar](255) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[total_amount] [float] NOT NULL,
	[update_at] [date] NULL,
	[account_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[route]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[route](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime] NULL,
	[delete_at] [datetime] NULL,
	[name_route] [nvarchar](255) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[update_at] [datetime] NULL,
	[from_terminal] [bigint] NOT NULL,
	[to_terminal] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[route_waypoints]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[route_waypoints](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[stop_order] [int] NOT NULL,
	[route_id] [bigint] NOT NULL,
	[station_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime] NULL,
	[delete_at] [datetime] NULL,
	[seat_name] [nvarchar](255) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[update_at] [datetime] NULL,
	[ship_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ship]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ship](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_at] [date] NULL,
	[delete_at] [date] NULL,
	[status] [varchar](255) NOT NULL,
	[total_seats] [int] NOT NULL,
	[update_at] [date] NULL,
	[ship_number] [varchar](255) NULL,
	[number_plate] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[station]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[station](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address_station] [nvarchar](255) NOT NULL,
	[create_at] [datetime] NULL,
	[delete_at] [datetime] NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [varchar](255) NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_at] [date] NULL,
	[delete_at] [date] NULL,
	[departure_date] [date] NULL,
	[price] [float] NOT NULL,
	[status] [varchar](255) NOT NULL,
	[update_at] [date] NULL,
	[invoiceid] [bigint] NULL,
	[seatid] [bigint] NULL,
	[tripid] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[arrival_time] [varchar](255) NOT NULL,
	[available_seats] [int] NOT NULL,
	[create_at] [date] NULL,
	[delete_at] [date] NULL,
	[departure_date] [date] NULL,
	[departure_time] [varchar](255) NOT NULL,
	[fixed] [varchar](255) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[update_at] [date] NULL,
	[route_id] [bigint] NOT NULL,
	[ship_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [create_at], [delete_at], [email], [firstname], [lastname], [password], [phone_number], [role], [status], [update_at], [username]) VALUES (1, CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'phuongvu.xu@gmail.com', N'Thị Thu Phương Vũ (Clay)', NULL, NULL, N'Not update2024-07-08T21:16:45.774063900', N'USER', N'ACTIVE', NULL, N'phuongvu.xu@gmail.com')
INSERT [dbo].[account] ([id], [create_at], [delete_at], [email], [firstname], [lastname], [password], [phone_number], [role], [status], [update_at], [username]) VALUES (2, CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'phuongvttps26491@fpt.edu.vn', N'ADMIN', N'ADMIN1', N'$2y$10$5yHpriFI3ZYvzs9vW7WgF.SYE7JvlIwGtIjI4zt5kzdzaMT40NmLW', N'0386139125', N'ADMIN', N'ACTIVE', NULL, N'admin')
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[captain] ON 

INSERT [dbo].[captain] ([id], [address], [create_at], [delete_at], [firstname], [lastname], [phone_number], [ship_license], [status], [update_at], [ship_id]) VALUES (1, N'Quan 7', CAST(N'2024-07-08' AS Date), NULL, N'Tan', N'Tang Duy', N'0123456789', N'SSG0123', N'ACTIVE', NULL, 1)
INSERT [dbo].[captain] ([id], [address], [create_at], [delete_at], [firstname], [lastname], [phone_number], [ship_license], [status], [update_at], [ship_id]) VALUES (2, N'Quan 12', CAST(N'2024-07-08' AS Date), NULL, N'Anh', N'Nguyen Nhat', N'0231654789', N'SSG4567', N'ACTIVE', NULL, 2)
INSERT [dbo].[captain] ([id], [address], [create_at], [delete_at], [firstname], [lastname], [phone_number], [ship_license], [status], [update_at], [ship_id]) VALUES (3, N'Quan Tan Binh', CAST(N'2024-07-08' AS Date), NULL, N'Duy', N'Thanh', N'0582147963', N'SSG0159', N'ACTIVE', NULL, 3)
INSERT [dbo].[captain] ([id], [address], [create_at], [delete_at], [firstname], [lastname], [phone_number], [ship_license], [status], [update_at], [ship_id]) VALUES (4, N'Quan Tan Phu', CAST(N'2024-07-08' AS Date), NULL, N'Khoa', N'Vu', N'0369741258', N'SSG7894', N'ACTIVE', NULL, 4)
INSERT [dbo].[captain] ([id], [address], [create_at], [delete_at], [firstname], [lastname], [phone_number], [ship_license], [status], [update_at], [ship_id]) VALUES (5, N'Quan 10', CAST(N'2024-07-08' AS Date), NULL, N'Vu', N'Vu', N'0789632541', N'SSG7410', N'ACTIVE', NULL, 5)
SET IDENTITY_INSERT [dbo].[captain] OFF
GO
SET IDENTITY_INSERT [dbo].[invoice] ON 

INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (1, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (2, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (3, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (4, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (5, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (6, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (7, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (8, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (9, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (10, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (11, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (12, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (13, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 15000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (14, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 30000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (15, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 30000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (16, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 30000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (17, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (18, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (19, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (20, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (21, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (22, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (23, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (24, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (25, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (26, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (27, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (28, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (29, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (30, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (31, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (32, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (33, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (34, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (35, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (36, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (37, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (38, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (39, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 30000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (40, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (41, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (42, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (43, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (44, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (45, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (46, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (47, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (48, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (49, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (50, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (51, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (52, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (53, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (54, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (55, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (56, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (57, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (58, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (59, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (60, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (61, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (62, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (63, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (64, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (65, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 30000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (66, CAST(N'2024-07-11' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (67, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (68, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (69, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (70, CAST(N'2024-07-11' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (71, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (72, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (73, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (74, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (75, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (76, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (77, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (78, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (79, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (80, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (81, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (82, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (83, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (84, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (85, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (86, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (87, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (88, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (89, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (90, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (91, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (92, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (93, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (94, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (95, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (96, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (97, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (98, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (99, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
GO
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (100, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (101, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (102, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (103, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (104, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (105, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (106, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (107, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (108, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (109, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (110, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (111, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (112, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (113, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (114, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (115, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (116, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (117, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (118, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (119, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (120, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (121, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (122, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (123, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (124, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (125, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (126, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (127, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (128, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (129, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (130, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (131, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (132, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (133, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (134, CAST(N'2024-07-12' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (135, CAST(N'2024-07-12' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (136, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (137, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (138, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (139, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (140, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (141, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (142, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 15000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (143, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (144, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (145, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (146, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (147, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (148, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (149, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (150, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (151, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 75000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (152, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (153, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (154, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (155, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (156, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (157, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (158, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (159, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (160, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 90000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (161, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (162, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (163, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (164, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (165, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (166, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (167, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (168, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (169, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (170, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (171, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (172, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (173, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (174, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (175, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (176, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 30000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (177, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (178, CAST(N'2024-07-14' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 60000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (179, CAST(N'2024-07-14' AS Date), NULL, N'CASH', N'COMPLETED', 45000, NULL, NULL)
INSERT [dbo].[invoice] ([id], [create_at], [delete_at], [pay_method], [status], [total_amount], [update_at], [account_id]) VALUES (180, CAST(N'2024-07-23' AS Date), NULL, N'BANK_TRANSFER', N'COMPLETED', 45000, NULL, 2)
SET IDENTITY_INSERT [dbo].[invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[route] ON 

INSERT [dbo].[route] ([id], [create_at], [delete_at], [name_route], [status], [update_at], [from_terminal], [to_terminal]) VALUES (1, CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'Bạch Đằng - Linh Đông', N'ACTIVE', NULL, 1, 5)
INSERT [dbo].[route] ([id], [create_at], [delete_at], [name_route], [status], [update_at], [from_terminal], [to_terminal]) VALUES (2, CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'Linh Đông - Bạch Đằng', N'ACTIVE', NULL, 5, 1)
SET IDENTITY_INSERT [dbo].[route] OFF
GO
SET IDENTITY_INSERT [dbo].[route_waypoints] ON 

INSERT [dbo].[route_waypoints] ([id], [stop_order], [route_id], [station_id]) VALUES (1, 1, 1, 2)
INSERT [dbo].[route_waypoints] ([id], [stop_order], [route_id], [station_id]) VALUES (2, 2, 1, 3)
INSERT [dbo].[route_waypoints] ([id], [stop_order], [route_id], [station_id]) VALUES (3, 3, 1, 4)
INSERT [dbo].[route_waypoints] ([id], [stop_order], [route_id], [station_id]) VALUES (4, 1, 2, 4)
INSERT [dbo].[route_waypoints] ([id], [stop_order], [route_id], [station_id]) VALUES (5, 2, 2, 3)
INSERT [dbo].[route_waypoints] ([id], [stop_order], [route_id], [station_id]) VALUES (6, 3, 2, 2)
SET IDENTITY_INSERT [dbo].[route_waypoints] OFF
GO
SET IDENTITY_INSERT [dbo].[seat] ON 

INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (1, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (2, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (3, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (4, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (5, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (6, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (7, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (8, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (9, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (10, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (11, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (12, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (13, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (14, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (15, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (16, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (17, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (18, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (19, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (20, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (21, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (22, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (23, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (24, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (25, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (26, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (27, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (28, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (29, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (30, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (31, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (32, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (33, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (34, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (35, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (36, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (37, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (38, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (39, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (40, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (41, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (42, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (43, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (44, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (45, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (46, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (47, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (48, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (49, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (50, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (51, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (52, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (53, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (54, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (55, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (56, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (57, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (58, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (59, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (60, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (61, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (62, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (63, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (64, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (65, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (66, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (67, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12A', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (68, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12B', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (69, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12C', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (70, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12D', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (71, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12E', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (72, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12F', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (73, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12G', N'ACTIVE', NULL, 1)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (74, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (75, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (76, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (77, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (78, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (79, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (80, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (81, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (82, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (83, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (84, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (85, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (86, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (87, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (88, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (89, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (90, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (91, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (92, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (93, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (94, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (95, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (96, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (97, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (98, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (99, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5B', N'ACTIVE', NULL, 2)
GO
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (100, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (101, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (102, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (103, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (104, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (105, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (106, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (107, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (108, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (109, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (110, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (111, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (112, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (113, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (114, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (115, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (116, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (117, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (118, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (119, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (120, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (121, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (122, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (123, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (124, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (125, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (126, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (127, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (128, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (129, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (130, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (131, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (132, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (133, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (134, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (135, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (136, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (137, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (138, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (139, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (140, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12A', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (141, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12B', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (142, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12C', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (143, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12D', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (144, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12E', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (145, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12F', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (146, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12G', N'ACTIVE', NULL, 2)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (147, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (148, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (149, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (150, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (151, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (152, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (153, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (154, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (155, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (156, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (157, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (158, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (159, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (160, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (161, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (162, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (163, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (164, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (165, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (166, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (167, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (168, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (169, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (170, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (171, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (172, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (173, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (174, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (175, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (176, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (177, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (178, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (179, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (180, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (181, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (182, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (183, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (184, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (185, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (186, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (187, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (188, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (189, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (190, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (191, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (192, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (193, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (194, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (195, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (196, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (197, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (198, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (199, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9E', N'ACTIVE', NULL, 3)
GO
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (200, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (201, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (202, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (203, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (204, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (205, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (206, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (207, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (208, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (209, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (210, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (211, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (212, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (213, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12A', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (214, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12B', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (215, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12C', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (216, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12D', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (217, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12E', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (218, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12F', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (219, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12G', N'ACTIVE', NULL, 3)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (220, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (221, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (222, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (223, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (224, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (225, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'1F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (226, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (227, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (228, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (229, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (230, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (231, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'2F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (232, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (233, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (234, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (235, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (236, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (237, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'3F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (238, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (239, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (240, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (241, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (242, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (243, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'4F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (244, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (245, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (246, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (247, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (248, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (249, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'5F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (250, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (251, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (252, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (253, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (254, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (255, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'6F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (256, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (257, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (258, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (259, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (260, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (261, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'7F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (262, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (263, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (264, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (265, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (266, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (267, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'8F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (268, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (269, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (270, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (271, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (272, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (273, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'9F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (274, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (275, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (276, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (277, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (278, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (279, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'10F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (280, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (281, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (282, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (283, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (284, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (285, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'11F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (286, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12A', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (287, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12B', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (288, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12C', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (289, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12D', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (290, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12E', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (291, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12F', N'ACTIVE', NULL, 4)
INSERT [dbo].[seat] ([id], [create_at], [delete_at], [seat_name], [status], [update_at], [ship_id]) VALUES (292, CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'12G', N'ACTIVE', NULL, 4)
SET IDENTITY_INSERT [dbo].[seat] OFF
GO
SET IDENTITY_INSERT [dbo].[ship] ON 

INSERT [dbo].[ship] ([id], [create_at], [delete_at], [status], [total_seats], [update_at], [ship_number], [number_plate]) VALUES (1, CAST(N'2024-07-08' AS Date), NULL, N'ACTIVE', 75, NULL, N'SG001', NULL)
INSERT [dbo].[ship] ([id], [create_at], [delete_at], [status], [total_seats], [update_at], [ship_number], [number_plate]) VALUES (2, CAST(N'2024-07-08' AS Date), NULL, N'ACTIVE', 75, NULL, N'SG002', NULL)
INSERT [dbo].[ship] ([id], [create_at], [delete_at], [status], [total_seats], [update_at], [ship_number], [number_plate]) VALUES (3, CAST(N'2024-07-08' AS Date), NULL, N'ACTIVE', 75, NULL, N'SG003', NULL)
INSERT [dbo].[ship] ([id], [create_at], [delete_at], [status], [total_seats], [update_at], [ship_number], [number_plate]) VALUES (4, CAST(N'2024-07-08' AS Date), NULL, N'ACTIVE', 75, NULL, N'SG004', NULL)
INSERT [dbo].[ship] ([id], [create_at], [delete_at], [status], [total_seats], [update_at], [ship_number], [number_plate]) VALUES (5, CAST(N'2024-07-08' AS Date), NULL, N'ACTIVE', 75, NULL, N'SG005', NULL)
SET IDENTITY_INSERT [dbo].[ship] OFF
GO
SET IDENTITY_INSERT [dbo].[station] ON 

INSERT [dbo].[station] ([id], [address_station], [create_at], [delete_at], [name], [status], [update_at]) VALUES (1, N'10B Đường Tôn Đức Thắng, Phường Bến Nghé, Quận 1', CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'Bạch Đằng', N'ACTIVE', NULL)
INSERT [dbo].[station] ([id], [address_station], [create_at], [delete_at], [name], [status], [update_at]) VALUES (2, N'Đường Số 21, Phường Bình An, Quận 2', CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'Bình An', N'ACTIVE', NULL)
INSERT [dbo].[station] ([id], [address_station], [create_at], [delete_at], [name], [status], [update_at]) VALUES (3, N'Lô 1, Thanh Đa, Phường 27, Quận Bình Thạnh', CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'Thanh Đa', N'ACTIVE', NULL)
INSERT [dbo].[station] ([id], [address_station], [create_at], [delete_at], [name], [status], [update_at]) VALUES (4, N'70 đường số 10, Hiệp Bình Chánh, Thủ Đức, Thành phố Hồ Chí Minh', CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'Hiệp Bình Chánh', N'ACTIVE', NULL)
INSERT [dbo].[station] ([id], [address_station], [create_at], [delete_at], [name], [status], [update_at]) VALUES (5, N'Cuối đường 36, Linh Đông, Thủ Đức, TP Hồ Chí Minh', CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'Linh Đông ', N'ACTIVE', NULL)
SET IDENTITY_INSERT [dbo].[station] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket] ON 

INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (0, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 1, 1, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (1, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 1, 2, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (2, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 1, 3, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (3, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 2, 4, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (4, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 2, 5, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (5, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 2, 6, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (6, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 3, 7, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (7, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 3, 8, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (8, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 3, 9, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (9, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 3, 10, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (10, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 3, 11, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (11, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 4, 12, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (12, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 4, 13, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (13, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 4, 14, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (14, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 4, 15, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (15, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 4, 16, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (16, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 5, 17, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (17, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 5, 18, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (18, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 5, 19, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (19, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 5, 20, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (20, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 5, 21, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (21, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 6, 22, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (22, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 6, 23, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (23, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 6, 24, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (24, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 6, 25, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (25, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 6, 26, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (26, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 7, 27, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (27, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 7, 28, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (28, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 7, 29, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (29, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 7, 30, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (30, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 7, 31, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (31, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 8, 32, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (32, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 8, 33, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (33, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 8, 34, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (34, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 8, 35, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (35, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 8, 36, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (36, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 9, 37, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (37, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 9, 38, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (38, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 9, 39, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (39, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 9, 40, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (40, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 9, 41, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (41, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 10, 42, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (42, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 10, 43, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (43, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 10, 44, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (44, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 10, 45, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (45, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 10, 46, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (46, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 11, 47, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (47, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 11, 48, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (48, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 11, 49, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (49, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 11, 50, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (50, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 11, 51, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (51, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 12, 52, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (52, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 12, 53, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (53, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 12, 54, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (54, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 12, 55, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (55, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 12, 56, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (56, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 13, 57, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (57, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 14, 58, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (58, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 14, 59, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (59, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 14, 60, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (60, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 15, 61, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (61, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 15, 62, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (62, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 15, 63, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (63, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 16, 71, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (64, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 16, 72, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (65, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 16, 73, 1)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (66, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 17, 1, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (67, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 17, 2, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (68, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 17, 3, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (69, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 18, 4, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (70, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 18, 5, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (71, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 18, 6, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (72, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 19, 7, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (73, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 19, 8, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (74, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 19, 9, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (75, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 19, 10, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (76, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 19, 11, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (77, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 20, 12, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (78, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 20, 13, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (79, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 20, 14, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (80, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 20, 15, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (81, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 20, 16, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (82, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 21, 17, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (83, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 21, 18, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (84, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 21, 19, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (85, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 21, 20, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (86, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 21, 21, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (109, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 22, 74, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (110, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 22, 75, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (111, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 22, 76, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (112, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 23, 77, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (113, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 23, 78, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (114, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 23, 79, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (115, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 24, 80, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (116, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 24, 81, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (117, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 24, 82, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (118, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 24, 83, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (119, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 24, 84, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (120, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 25, 85, 2)
GO
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (121, CAST(N'2024-11-07' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 25, 86, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (122, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 25, 87, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (123, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 26, 88, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (124, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 26, 89, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (125, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 27, 90, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (126, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 27, 91, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (127, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 27, 92, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (128, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 27, 93, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (129, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 27, 94, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (130, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 28, 95, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (131, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 28, 96, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (132, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 28, 97, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (133, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 28, 98, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (134, CAST(N'2024-07-11' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 28, 99, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (135, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 29, 101, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (136, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 29, 102, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (137, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 29, 103, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (138, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 29, 109, 2)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (139, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 30, 150, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (140, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 30, 151, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (141, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 30, 152, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (142, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 30, 158, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (143, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 30, 157, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (144, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 30, 156, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (145, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 31, 154, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (146, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 31, 160, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (147, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 31, 166, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (148, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 31, 167, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (149, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 31, 173, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (150, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 32, 198, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (151, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 32, 200, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (152, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 32, 194, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (153, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 32, 188, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (154, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 33, 179, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (155, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 33, 185, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (156, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 33, 191, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (157, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 33, 197, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (158, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 33, 196, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (159, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 33, 190, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (160, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 34, 162, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (161, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 34, 168, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (162, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 34, 180, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (163, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 34, 175, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (164, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 34, 181, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (165, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 34, 187, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (166, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 35, 215, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (167, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 35, 216, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (168, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 35, 217, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (169, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 35, 218, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (170, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 35, 219, 3)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (171, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 36, 222, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (172, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 36, 221, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (173, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 36, 220, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (174, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 36, 226, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (175, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 36, 227, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (176, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 36, 228, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (177, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 37, 290, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (178, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 37, 289, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (179, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 37, 288, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (180, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 38, 242, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (181, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 38, 243, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (182, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 38, 237, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (183, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 38, 236, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (184, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 38, 230, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (185, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 38, 231, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (186, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 39, 252, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (187, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 39, 258, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (188, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 40, 272, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (189, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 40, 273, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (190, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 40, 267, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (191, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 40, 261, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (192, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 41, 262, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (193, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 41, 256, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (194, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 41, 250, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (195, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 42, 259, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (196, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 42, 253, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (197, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 42, 254, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (198, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 43, 71, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (199, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 43, 70, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (200, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 43, 64, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (201, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 44, 54, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (202, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 44, 48, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (203, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 44, 42, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (204, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 45, 223, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (205, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 45, 229, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (206, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 45, 230, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (207, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 45, 231, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (208, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 45, 225, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (209, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 46, 232, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (210, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 46, 233, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (211, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 46, 234, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (212, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 46, 220, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (213, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 47, 254, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (214, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 47, 255, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (215, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 47, 261, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (216, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 47, 260, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (217, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 47, 266, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (218, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 47, 267, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (219, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 48, 238, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (220, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 48, 244, 8)
GO
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (221, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 48, 250, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (222, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 48, 256, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (223, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 49, 274, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (224, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 49, 280, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (225, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 49, 286, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (226, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 50, 265, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (227, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 50, 271, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (228, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 50, 277, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (229, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 50, 283, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (230, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 50, 290, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (231, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 51, 39, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (232, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 51, 45, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (233, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 51, 44, 5)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (234, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 52, 77, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (235, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 52, 78, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (236, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 52, 79, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (237, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 52, 76, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (238, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 52, 75, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (239, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 52, 74, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (240, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 53, 95, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (241, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 53, 96, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (242, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 53, 101, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (243, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 53, 102, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (244, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 54, 92, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (245, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 54, 98, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (246, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 54, 104, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (247, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 54, 110, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (248, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 55, 121, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (249, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 55, 127, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (250, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 55, 115, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (251, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 55, 109, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (252, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 56, 150, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (253, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 56, 151, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (254, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 56, 157, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (255, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 57, 131, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (256, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 57, 137, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (257, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 57, 144, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (258, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 58, 122, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (259, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 58, 86, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (260, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 58, 80, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (261, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 59, 100, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (262, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 59, 106, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (263, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 59, 112, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (264, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 59, 118, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (265, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 60, 147, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (266, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 60, 153, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (267, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 60, 159, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (268, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 60, 165, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (269, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 61, 148, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (270, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 61, 149, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (271, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 61, 152, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (272, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 61, 158, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (273, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 61, 156, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (274, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 62, 171, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (275, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 62, 177, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (276, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 62, 183, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (277, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 62, 189, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (278, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 62, 195, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (279, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 62, 201, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (280, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 63, 273, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (281, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 63, 285, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (282, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 63, 279, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (283, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 63, 292, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (284, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 64, 164, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (285, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 64, 170, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (286, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 64, 176, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (287, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 64, 182, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (288, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 64, 188, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (289, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 65, 222, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (290, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 65, 221, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (291, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 66, 228, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (292, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 66, 227, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (293, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 66, 226, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (294, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 67, 140, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (295, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 67, 134, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (296, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 67, 128, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (297, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 67, 116, 6)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (298, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 68, 154, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (299, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 68, 155, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (300, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 68, 161, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (301, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 68, 160, 7)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (302, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 69, 224, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (303, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 69, 289, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (304, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 69, 288, 8)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (305, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 70, 224, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (306, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 70, 225, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (307, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-11' AS Date), 15000, N'BOOKED', NULL, 70, 223, 4)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (308, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 71, 4, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (309, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 71, 5, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (310, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 71, 6, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (311, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 71, 12, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (312, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 71, 11, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (313, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 71, 10, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (314, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 72, 2, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (315, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 72, 8, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (316, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 72, 1, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (317, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 72, 3, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (318, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 72, 9, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (319, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 73, 13, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (320, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 73, 14, 9)
GO
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (321, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 73, 20, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (322, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 73, 19, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (323, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 74, 47, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (324, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 74, 48, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (325, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 74, 42, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (326, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 74, 36, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (327, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 75, 63, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (328, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 75, 69, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (329, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 75, 57, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (330, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 75, 51, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (331, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 75, 45, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (332, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 75, 39, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (333, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 76, 76, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (334, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 76, 75, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (335, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 76, 81, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (336, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 76, 82, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (337, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 77, 22, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (338, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 77, 28, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (339, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 77, 29, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (340, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 77, 30, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (341, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 77, 24, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (342, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 77, 23, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (343, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 78, 43, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (344, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 78, 49, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (345, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 78, 37, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (346, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 78, 38, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (347, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 78, 44, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (348, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 78, 50, 9)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (349, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 79, 150, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (350, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 79, 151, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (351, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 79, 152, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (352, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 79, 149, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (353, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 79, 156, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (354, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 79, 157, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (355, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 80, 5, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (356, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 80, 11, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (357, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 80, 17, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (358, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 80, 18, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (359, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 80, 24, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (360, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 80, 23, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (361, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 81, 147, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (362, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 81, 153, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (363, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 81, 148, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (364, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 81, 154, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (365, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 81, 155, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (366, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 81, 159, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (367, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 82, 92, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (368, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 82, 86, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (369, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 82, 80, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (370, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 82, 74, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (371, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 82, 116, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (372, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 82, 122, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (373, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 83, 224, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (374, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 83, 223, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (375, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 83, 229, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (376, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 83, 230, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (377, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 83, 231, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (378, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 83, 225, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (379, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 84, 221, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (380, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 84, 227, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (381, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 84, 226, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (382, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 84, 232, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (383, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 84, 233, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (384, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 84, 234, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (385, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 85, 164, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (386, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 85, 170, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (387, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 85, 176, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (388, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 85, 158, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (389, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 86, 165, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (390, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 86, 171, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (391, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 86, 177, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (392, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 86, 183, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (393, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 86, 189, 11)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (394, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 87, 249, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (395, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 87, 247, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (396, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 87, 248, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (397, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 87, 242, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (398, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 88, 4, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (399, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 88, 5, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (400, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 88, 6, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (401, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 88, 12, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (402, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 88, 11, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (403, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 88, 10, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (404, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 89, 1, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (405, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 89, 7, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (406, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 89, 8, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (407, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 89, 2, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (408, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 89, 3, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (409, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 89, 9, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (410, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 90, 13, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (411, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 90, 14, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (412, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 90, 20, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (413, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 90, 19, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (414, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 91, 22, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (415, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 91, 23, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (416, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 91, 30, 13)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (417, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 92, 223, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (418, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 92, 224, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (419, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 92, 225, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (420, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 92, 231, 16)
GO
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (421, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 92, 230, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (422, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 92, 229, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (423, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 93, 221, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (424, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 93, 220, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (425, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 93, 226, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (426, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 93, 227, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (427, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 94, 272, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (428, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 94, 273, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (429, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 94, 267, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (430, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 94, 266, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (431, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 95, 232, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (432, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 95, 233, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (433, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 95, 234, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (434, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 95, 228, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (435, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 95, 222, 16)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (436, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 96, 120, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (437, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 96, 121, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (438, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 96, 115, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (439, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 96, 114, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (440, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 96, 108, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (441, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 96, 109, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (442, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 97, 238, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (443, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 97, 220, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (444, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 97, 222, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (445, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 97, 228, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (446, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 97, 240, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (447, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 97, 239, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (448, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 98, 250, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (449, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 98, 251, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (450, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 98, 252, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (451, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 98, 246, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (452, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 98, 245, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (453, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 98, 244, 12)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (454, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 99, 100, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (455, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 99, 94, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (456, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 99, 93, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (457, CAST(N'2024-07-12' AS Date), NULL, CAST(N'2024-07-12' AS Date), 15000, N'BOOKED', NULL, 99, 99, 10)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (458, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 100, 3, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (459, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 100, 2, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (460, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 100, 8, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (461, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 100, 9, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (462, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 100, 15, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (463, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 100, 14, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (464, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 101, 10, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (465, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 101, 16, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (466, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 101, 17, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (467, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 101, 4, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (468, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 101, 5, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (469, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 102, 49, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (470, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 102, 55, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (471, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 102, 61, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (472, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 102, 62, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (473, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 102, 56, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (474, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 102, 50, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (475, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 103, 223, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (476, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 103, 224, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (477, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 103, 225, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (478, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 104, 148, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (479, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 104, 154, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (480, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 104, 155, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (481, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 104, 216, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (482, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 104, 217, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (483, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 104, 219, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (484, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 105, 150, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (485, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 105, 151, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (486, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 105, 157, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (487, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 105, 177, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (488, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 106, 86, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (489, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 106, 87, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (490, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 106, 93, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (491, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 106, 99, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (492, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 107, 158, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (493, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 107, 164, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (494, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 107, 170, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (495, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 107, 169, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (496, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 107, 193, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (497, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 108, 159, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (498, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 108, 153, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (499, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 108, 147, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (500, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 108, 212, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (501, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 109, 36, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (502, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 109, 42, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (503, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 109, 48, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (504, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 109, 47, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (505, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 110, 13, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (506, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 110, 19, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (507, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 110, 25, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (508, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 111, 221, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (509, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 111, 220, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (510, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 111, 226, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (511, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 111, 260, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (512, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 112, 245, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (513, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 112, 242, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (514, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 112, 275, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (515, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 112, 268, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (516, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 113, 197, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (517, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 113, 191, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (518, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 113, 192, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (519, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 113, 160, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (520, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 114, 109, 18)
GO
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (521, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 114, 103, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (522, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 114, 102, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (523, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 114, 108, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (524, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 115, 186, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (525, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 115, 180, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (526, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 115, 178, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (527, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 115, 179, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (528, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 115, 208, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (529, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 115, 209, 19)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (530, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 116, 77, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (531, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 116, 78, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (532, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 116, 79, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (533, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 116, 74, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (534, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 116, 75, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (535, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 116, 76, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (536, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 117, 28, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (537, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 117, 29, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (538, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 117, 30, 17)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (539, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 118, 247, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (540, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 118, 248, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (541, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 118, 254, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (542, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 118, 246, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (543, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 118, 240, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (544, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 119, 122, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (545, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 119, 123, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (546, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 119, 124, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (547, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 119, 81, 18)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (548, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 120, 266, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (549, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 120, 272, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (550, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 120, 273, 20)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (551, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 121, 3, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (552, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 121, 9, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (553, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 121, 8, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (554, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 121, 7, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (555, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 121, 13, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (556, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 121, 14, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (557, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 122, 4, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (558, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 122, 10, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (559, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 122, 11, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (560, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 122, 5, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (561, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 122, 6, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (562, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 122, 12, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (563, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 123, 150, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (564, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 123, 156, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (565, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 123, 157, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (566, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 123, 151, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (567, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 124, 259, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (568, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 124, 253, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (569, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 124, 247, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (570, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 124, 248, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (571, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 124, 254, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (572, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 124, 255, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (573, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 125, 221, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (574, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 125, 220, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (575, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 125, 222, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (576, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 125, 223, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (577, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 125, 224, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (578, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 125, 225, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (579, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 126, 148, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (580, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 126, 147, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (581, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 126, 153, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (582, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 126, 154, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (583, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 127, 74, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (584, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 127, 80, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (585, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 127, 90, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (586, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 127, 93, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (587, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 128, 242, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (588, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 128, 251, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (589, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 128, 260, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (590, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 128, 266, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (591, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 128, 262, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (592, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 128, 234, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (593, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 129, 47, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (594, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 129, 42, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (595, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 129, 29, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (596, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 129, 28, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (597, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 130, 25, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (598, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 130, 26, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (599, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 130, 32, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (600, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 130, 38, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (601, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 130, 37, 21)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (602, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 131, 245, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (603, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 131, 239, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (604, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 131, 233, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (605, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 131, 262, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (606, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 131, 237, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (607, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 131, 292, 24)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (608, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 132, 78, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (609, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 132, 77, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (610, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 132, 76, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (611, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 132, 75, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (612, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 132, 79, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (613, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 132, 108, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (614, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 133, 111, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (615, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 133, 105, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (616, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 133, 104, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (617, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 133, 110, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (618, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 134, 89, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (619, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 134, 95, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (620, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 134, 124, 22)
GO
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (621, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 134, 122, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (622, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 134, 116, 22)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (623, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 135, 149, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (624, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 135, 155, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (625, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 135, 152, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (626, CAST(N'2024-07-13' AS Date), NULL, CAST(N'2024-07-13' AS Date), 15000, N'BOOKED', NULL, 135, 158, 23)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (627, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 136, 39, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (628, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 136, 40, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (629, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 136, 41, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (630, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 136, 42, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (631, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 137, 1, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (632, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 137, 2, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (633, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 137, 3, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (634, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 137, 4, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (635, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 137, 10, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (636, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 138, 13, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (637, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 138, 19, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (638, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 138, 20, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (639, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 138, 21, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (640, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 138, 15, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (641, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 139, 220, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (642, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 139, 221, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (643, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 139, 222, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (644, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 139, 223, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (645, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 139, 229, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (646, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 139, 235, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (647, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 140, 148, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (648, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 140, 154, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (649, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 140, 160, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (650, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 140, 161, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (651, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 140, 155, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (652, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 140, 149, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (653, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 141, 83, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (654, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 141, 77, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (655, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 141, 75, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (656, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 141, 76, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (657, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 141, 74, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (658, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 141, 80, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (659, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 142, 22, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (660, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 143, 49, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (661, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 143, 50, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (662, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 143, 51, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (663, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 144, 238, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (664, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 144, 240, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (665, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 144, 246, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (666, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 144, 245, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (667, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 145, 120, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (668, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 145, 119, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (669, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 145, 113, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (670, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 146, 152, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (671, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 146, 151, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (672, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 146, 157, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (673, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 147, 243, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (674, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 147, 237, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (675, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 147, 231, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (676, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 147, 225, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (677, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 147, 224, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (678, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 147, 230, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (679, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 148, 16, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (680, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 148, 10, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (681, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 148, 4, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (682, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 149, 77, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (683, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 149, 84, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (684, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 149, 85, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (685, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 149, 91, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (686, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 149, 97, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (687, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 150, 221, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (688, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 150, 227, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (689, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 150, 228, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (690, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 150, 222, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (691, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 150, 234, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (692, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 151, 150, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (693, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 151, 156, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (694, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 151, 149, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (695, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 151, 155, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (696, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 151, 216, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (697, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 152, 147, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (698, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 152, 153, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (699, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 152, 152, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (700, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 152, 158, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (701, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 153, 254, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (702, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 153, 255, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (703, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 153, 224, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (704, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 153, 230, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (705, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 154, 74, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (706, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 154, 80, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (707, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 154, 75, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (708, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 154, 81, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (709, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 154, 86, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (710, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 154, 87, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (711, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 155, 220, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (712, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 155, 226, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (713, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 155, 256, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (714, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 156, 245, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (715, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 156, 246, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (716, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 156, 288, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (717, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 157, 53, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (718, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 157, 24, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (719, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 157, 18, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (720, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 157, 12, 25)
GO
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (721, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 158, 92, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (722, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 158, 93, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (723, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 158, 94, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (724, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 159, 173, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (725, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 159, 171, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (726, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 159, 165, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (727, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 159, 153, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (728, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 160, 169, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (729, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 160, 170, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (730, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 160, 176, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (731, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 160, 175, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (732, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 160, 187, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (733, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 160, 193, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (734, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 161, 258, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (735, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 161, 257, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (736, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 161, 256, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (737, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 162, 189, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (738, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 162, 190, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (739, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 162, 191, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (740, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 163, 174, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (741, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 163, 180, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (742, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 163, 186, 27)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (743, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 164, 128, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (744, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 164, 129, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (745, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 164, 130, 26)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (746, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 165, 283, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (747, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 165, 284, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (748, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 165, 285, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (749, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 166, 259, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (750, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 166, 260, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (751, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 166, 261, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (752, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 166, 266, 28)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (753, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 167, 2, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (754, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 167, 8, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (755, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 167, 14, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (756, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 167, 21, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (757, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 168, 40, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (758, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 168, 41, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (759, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 168, 42, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (760, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 169, 271, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (761, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 169, 272, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (762, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 169, 273, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (763, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 170, 25, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (764, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 170, 31, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (765, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 170, 37, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (766, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 171, 113, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (767, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 171, 114, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (768, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 171, 115, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (769, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 172, 284, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (770, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 172, 291, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (771, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 172, 292, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (772, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 173, 174, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (773, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 173, 175, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (774, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 173, 172, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (775, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 173, 179, 31)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (776, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 174, 110, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (777, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 174, 111, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (778, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 174, 117, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (779, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 175, 101, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (780, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 175, 102, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (781, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 175, 144, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (782, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 175, 145, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (783, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 176, 263, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (784, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 176, 264, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (785, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 177, 282, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (786, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 177, 281, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (787, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 177, 280, 30)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (788, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 178, 265, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (789, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 178, 270, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (790, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 178, 276, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (791, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 178, 282, 32)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (792, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 179, 52, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (793, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 179, 53, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (794, CAST(N'2024-07-14' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 179, 54, 29)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (795, CAST(N'2024-07-23' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 180, 59, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (796, CAST(N'2024-07-23' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 180, 65, 25)
INSERT [dbo].[ticket] ([id], [create_at], [delete_at], [departure_date], [price], [status], [update_at], [invoiceid], [seatid], [tripid]) VALUES (797, CAST(N'2024-07-23' AS Date), NULL, CAST(N'2024-07-14' AS Date), 15000, N'BOOKED', NULL, 180, 72, 25)
SET IDENTITY_INSERT [dbo].[ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[trip] ON 

INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (1, N'09:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-11' AS Date), N'08:30', N'FIXED', N'ACTIVE', NULL, 1, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (2, N'11:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-11' AS Date), N'10:40', N'FIXED', N'ACTIVE', NULL, 1, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (3, N'15:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-11' AS Date), N'14:30', N'FIXED', N'ACTIVE', NULL, 1, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (4, N'18:02', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-11' AS Date), N'17:10', N'FIXED', N'ACTIVE', NULL, 1, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (5, N'10:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-11' AS Date), N'09:40', N'FIXED', N'ACTIVE', NULL, 2, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (6, N'12:52', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-11' AS Date), N'12:00', N'FIXED', N'ACTIVE', NULL, 2, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (7, N'16:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-11' AS Date), N'15:40', N'FIXED', N'ACTIVE', NULL, 2, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (8, N'19:07', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-11' AS Date), N'18:15', N'FIXED', N'ACTIVE', NULL, 2, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (9, N'09:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-12' AS Date), N'08:30', N'FIXED', N'ACTIVE', NULL, 1, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (10, N'11:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-12' AS Date), N'10:40', N'FIXED', N'ACTIVE', NULL, 1, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (11, N'15:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-12' AS Date), N'14:30', N'FIXED', N'ACTIVE', NULL, 1, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (12, N'18:02', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-12' AS Date), N'17:10', N'FIXED', N'ACTIVE', NULL, 1, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (13, N'10:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-12' AS Date), N'09:40', N'FIXED', N'ACTIVE', NULL, 2, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (14, N'12:52', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-12' AS Date), N'12:00', N'FIXED', N'ACTIVE', NULL, 2, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (15, N'16:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-12' AS Date), N'15:40', N'FIXED', N'ACTIVE', NULL, 2, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (16, N'19:07', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-12' AS Date), N'18:15', N'FIXED', N'ACTIVE', NULL, 2, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (17, N'09:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-13' AS Date), N'08:30', N'FIXED', N'ACTIVE', NULL, 1, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (18, N'11:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-13' AS Date), N'10:40', N'FIXED', N'ACTIVE', NULL, 1, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (19, N'15:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-13' AS Date), N'14:30', N'FIXED', N'ACTIVE', NULL, 1, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (20, N'18:02', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-13' AS Date), N'17:10', N'FIXED', N'ACTIVE', NULL, 1, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (21, N'10:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-13' AS Date), N'09:40', N'FIXED', N'ACTIVE', NULL, 2, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (22, N'12:52', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-13' AS Date), N'12:00', N'FIXED', N'ACTIVE', NULL, 2, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (23, N'16:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-13' AS Date), N'15:40', N'FIXED', N'ACTIVE', NULL, 2, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (24, N'19:07', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-13' AS Date), N'18:15', N'FIXED', N'ACTIVE', NULL, 2, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (25, N'09:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-14' AS Date), N'08:30', N'FIXED', N'ACTIVE', NULL, 1, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (26, N'11:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-14' AS Date), N'10:40', N'FIXED', N'ACTIVE', NULL, 1, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (27, N'15:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-14' AS Date), N'14:30', N'FIXED', N'ACTIVE', NULL, 1, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (28, N'18:02', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-14' AS Date), N'17:10', N'FIXED', N'ACTIVE', NULL, 1, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (29, N'10:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-14' AS Date), N'09:40', N'FIXED', N'ACTIVE', NULL, 2, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (30, N'12:52', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-14' AS Date), N'12:00', N'FIXED', N'ACTIVE', NULL, 2, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (31, N'16:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-14' AS Date), N'15:40', N'FIXED', N'ACTIVE', NULL, 2, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (32, N'19:07', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-14' AS Date), N'18:15', N'FIXED', N'ACTIVE', NULL, 2, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (33, N'09:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-15' AS Date), N'08:30', N'FIXED', N'ACTIVE', NULL, 1, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (34, N'11:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-15' AS Date), N'10:40', N'FIXED', N'ACTIVE', NULL, 1, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (35, N'15:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-15' AS Date), N'14:30', N'FIXED', N'ACTIVE', NULL, 1, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (36, N'18:02', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-15' AS Date), N'17:10', N'FIXED', N'ACTIVE', NULL, 1, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (37, N'10:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-15' AS Date), N'09:40', N'FIXED', N'ACTIVE', NULL, 2, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (38, N'12:52', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-15' AS Date), N'12:00', N'FIXED', N'ACTIVE', NULL, 2, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (39, N'16:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-15' AS Date), N'15:40', N'FIXED', N'ACTIVE', NULL, 2, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (40, N'19:07', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-15' AS Date), N'18:15', N'FIXED', N'ACTIVE', NULL, 2, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (41, N'09:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-16' AS Date), N'08:30', N'FIXED', N'ACTIVE', NULL, 1, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (42, N'11:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-16' AS Date), N'10:40', N'FIXED', N'ACTIVE', NULL, 1, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (43, N'15:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-16' AS Date), N'14:30', N'FIXED', N'ACTIVE', NULL, 1, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (44, N'18:02', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-16' AS Date), N'17:10', N'FIXED', N'ACTIVE', NULL, 1, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (45, N'10:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-16' AS Date), N'09:40', N'FIXED', N'ACTIVE', NULL, 2, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (46, N'12:52', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-16' AS Date), N'12:00', N'FIXED', N'ACTIVE', NULL, 2, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (47, N'16:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-16' AS Date), N'15:40', N'FIXED', N'ACTIVE', NULL, 2, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (48, N'19:07', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-16' AS Date), N'18:15', N'FIXED', N'ACTIVE', NULL, 2, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (49, N'09:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-17' AS Date), N'08:30', N'FIXED', N'ACTIVE', NULL, 1, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (50, N'11:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-17' AS Date), N'10:40', N'FIXED', N'ACTIVE', NULL, 1, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (51, N'15:22', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-17' AS Date), N'14:30', N'FIXED', N'ACTIVE', NULL, 1, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (52, N'18:02', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-17' AS Date), N'17:10', N'FIXED', N'ACTIVE', NULL, 1, 4)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (53, N'10:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-17' AS Date), N'09:40', N'FIXED', N'ACTIVE', NULL, 2, 1)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (54, N'12:52', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-17' AS Date), N'12:00', N'FIXED', N'ACTIVE', NULL, 2, 2)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (55, N'16:32', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-17' AS Date), N'15:40', N'FIXED', N'ACTIVE', NULL, 2, 3)
INSERT [dbo].[trip] ([id], [arrival_time], [available_seats], [create_at], [delete_at], [departure_date], [departure_time], [fixed], [status], [update_at], [route_id], [ship_id]) VALUES (56, N'19:07', 75, CAST(N'2024-07-08' AS Date), NULL, CAST(N'2024-07-17' AS Date), N'18:15', N'FIXED', N'ACTIVE', NULL, 2, 4)
SET IDENTITY_INSERT [dbo].[trip] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_2olfognc1bihuh3twr456v1jf]    Script Date: 2024-07-23 12:06:58 PM ******/
ALTER TABLE [dbo].[captain] ADD  CONSTRAINT [UK_2olfognc1bihuh3twr456v1jf] UNIQUE NONCLUSTERED 
(
	[ship_license] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_2quu4lbc1yrkcebkrve8yng3g]    Script Date: 2024-07-23 12:06:58 PM ******/
ALTER TABLE [dbo].[captain] ADD  CONSTRAINT [UK_2quu4lbc1yrkcebkrve8yng3g] UNIQUE NONCLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[captain]  WITH CHECK ADD  CONSTRAINT [FKc878hbsqdal7kqjq0dw5s79j1] FOREIGN KEY([ship_id])
REFERENCES [dbo].[ship] ([id])
GO
ALTER TABLE [dbo].[captain] CHECK CONSTRAINT [FKc878hbsqdal7kqjq0dw5s79j1]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FKoevv8h8t2qgym9s0cn7oh069b] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FKoevv8h8t2qgym9s0cn7oh069b]
GO
ALTER TABLE [dbo].[route]  WITH CHECK ADD  CONSTRAINT [FKbkglbwenihcyrbla4x1lhr45y] FOREIGN KEY([to_terminal])
REFERENCES [dbo].[station] ([id])
GO
ALTER TABLE [dbo].[route] CHECK CONSTRAINT [FKbkglbwenihcyrbla4x1lhr45y]
GO
ALTER TABLE [dbo].[route]  WITH CHECK ADD  CONSTRAINT [FKq2rwcwuutdche7aq8152luopf] FOREIGN KEY([from_terminal])
REFERENCES [dbo].[station] ([id])
GO
ALTER TABLE [dbo].[route] CHECK CONSTRAINT [FKq2rwcwuutdche7aq8152luopf]
GO
ALTER TABLE [dbo].[route_waypoints]  WITH CHECK ADD  CONSTRAINT [FKovanb583wbajxx8ew2fbjqo9p] FOREIGN KEY([station_id])
REFERENCES [dbo].[station] ([id])
GO
ALTER TABLE [dbo].[route_waypoints] CHECK CONSTRAINT [FKovanb583wbajxx8ew2fbjqo9p]
GO
ALTER TABLE [dbo].[route_waypoints]  WITH CHECK ADD  CONSTRAINT [FKr8133ripbkuwnxsdb9amfd8id] FOREIGN KEY([route_id])
REFERENCES [dbo].[route] ([id])
GO
ALTER TABLE [dbo].[route_waypoints] CHECK CONSTRAINT [FKr8133ripbkuwnxsdb9amfd8id]
GO
ALTER TABLE [dbo].[seat]  WITH CHECK ADD  CONSTRAINT [FKdrsyqmbwn4l1y2eulwrbjg9tr] FOREIGN KEY([ship_id])
REFERENCES [dbo].[ship] ([id])
GO
ALTER TABLE [dbo].[seat] CHECK CONSTRAINT [FKdrsyqmbwn4l1y2eulwrbjg9tr]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK350hccalo2enwjcyuonohf4t] FOREIGN KEY([invoiceid])
REFERENCES [dbo].[invoice] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK350hccalo2enwjcyuonohf4t]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FKq8a4h43s5daqr0ehyiulkn2po] FOREIGN KEY([tripid])
REFERENCES [dbo].[trip] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FKq8a4h43s5daqr0ehyiulkn2po]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FKsd3pwhyh8pk8ump8y4tcqje9e] FOREIGN KEY([seatid])
REFERENCES [dbo].[seat] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FKsd3pwhyh8pk8ump8y4tcqje9e]
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD  CONSTRAINT [FK7xulcor7telid5ldagkbii9r0] FOREIGN KEY([ship_id])
REFERENCES [dbo].[ship] ([id])
GO
ALTER TABLE [dbo].[trip] CHECK CONSTRAINT [FK7xulcor7telid5ldagkbii9r0]
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD  CONSTRAINT [FKeva4adpyk6glllffnw5ypj20j] FOREIGN KEY([route_id])
REFERENCES [dbo].[route] ([id])
GO
ALTER TABLE [dbo].[trip] CHECK CONSTRAINT [FKeva4adpyk6glllffnw5ypj20j]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD CHECK  (([role]='ADMIN' OR [role]='STAFF' OR [role]='USER'))
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
ALTER TABLE [dbo].[captain]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD CHECK  (([pay_method]='BANK_TRANSFER' OR [pay_method]='CASH'))
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
ALTER TABLE [dbo].[route]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
ALTER TABLE [dbo].[seat]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
ALTER TABLE [dbo].[ship]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
ALTER TABLE [dbo].[station]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD CHECK  (([fixed]='UNSTABLE' OR [fixed]='FIXED'))
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD CHECK  (([status]='NOTYET' OR [status]='BOOKED' OR [status]='MAINTENANCE' OR [status]='INPROGRESS' OR [status]='CANCELLED' OR [status]='COMPLETED' OR [status]='ACTIVE' OR [status]='INACTIVE'))
GO
/****** Object:  StoredProcedure [dbo].[FindTripByRouteAndDate]    Script Date: 2024-07-23 12:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[FindTripByRouteAndDate]
    @fromTerminalId bigint,
    @toTerminalId bigint,
    @departureDate datetime
AS
BEGIN
    SELECT DISTINCT
        t.id, 
        s.total_seats AS 'Tổng ghế', 
        t.departure_date AS 'ngay kh', 
        t.departure_time AS 'gio kh', 
        t.arrival_time AS 'gio den', 
        CASE
            WHEN @fromTerminalId = r.from_terminal THEN (select name from station where id=r.from_terminal)
            ELSE (select name from station where id=r.from_terminal)
        END AS 'from',
        CASE
            WHEN @toTerminalId = r.to_terminal THEN (select name from station where id=r.to_terminal)
            ELSE (select name from station where id=r.to_terminal)
        END AS 'to',
        CASE
            WHEN @fromTerminalId != r.from_terminal THEN (
                select station.name 
				from station inner join route_waypoints rw on station.id = rw.station_id
				where rw.route_id = r.id AND rw.station_id = @fromTerminalId
            )
            ELSE (select name from station where id=@fromTerminalId)
        END AS 'startTerminal',
        CASE
            WHEN @toTerminalId != r.to_terminal THEN (
                select station.name 
				from station inner join route_waypoints rw on station.id = rw.station_id
				where rw.route_id = r.id AND rw.station_id = @toTerminalId
            )
            ELSE (select name from station where id=@toTerminalId)
        END AS 'endTerminal',
        (SELECT COUNT(*) 
         FROM seat 
         WHERE seat.ship_id = s.id 
         AND seat.status = 'active') AS 'so ghe con lai',
		(select address_station from station where station.id = @fromTerminalId) as 'addressStart',
		(select address_station from station where station.id = @toTerminalId) as 'addressEnd'
    FROM 
        trip t 
    LEFT JOIN 
        route r ON t.route_id = r.id
    LEFT JOIN 
        ship s ON s.id = t.ship_id
    LEFT JOIN 
        route_waypoints rw ON r.id = rw.route_id
    LEFT JOIN 
        station st ON st.id = rw.station_id
    WHERE 
        t.departure_date = @departureDate
        AND (
            (r.from_terminal = @fromTerminalId or r.to_terminal = @toTerminalId)
            OR 
            EXISTS (
                SELECT 1 
                FROM route_waypoints rw1 
                JOIN route_waypoints rw2 ON rw1.route_id = rw2.route_id 
                WHERE 
                    rw1.route_id = r.id 
                    AND rw1.station_id = @fromTerminalId 
                    AND rw2.station_id = @toTerminalId 
                    AND rw1.stop_order < rw2.stop_order
            )
        );
END;
GO
