USE [ECommerceDB]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [uniqueidentifier] NOT NULL,
	[AdresDescription] [nvarchar](300) NULL,
	[Member_Id] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Name] [nvarchar](300) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Parent_Id] [int] NULL,
	[Description] [nvarchar](250) NULL,
	[AddedDate] [datetime] NULL,
	[ModifedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](250) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Surname] [nvarchar](25) NULL,
	[Email] [nvarchar](60) NOT NULL,
	[Password] [nvarchar](60) NOT NULL,
	[Bio] [nvarchar](300) NULL,
	[ProfileImageName] [nvarchar](250) NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[MemberType] [int] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageReplies]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageReplies](
	[Id] [uniqueidentifier] NOT NULL,
	[Text] [nvarchar](300) NOT NULL,
	[MessageId] [uniqueidentifier] NOT NULL,
	[Member_Id] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_MessageReplies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [uniqueidentifier] NOT NULL,
	[Subject] [nvarchar](60) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ToMemberId] [int] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [tinyint] NOT NULL,
	[Order_Id] [uniqueidentifier] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Status] [nchar](10) NULL,
	[Description] [nvarchar](250) NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.06.2021 16:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[IsContinued] [bit] NOT NULL,
	[StarPoint] [int] NOT NULL,
	[StarGivenMemberCount] [int] NOT NULL,
	[ProductImageName] [nvarchar](250) NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Category_Id] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Addresses] ([Id], [AdresDescription], [Member_Id], [AddedDate], [ModifiedDate], [Name]) VALUES (N'b8c31410-6622-4584-8077-3fc9ffe2df94', N'emniyet evleri mahallesi', 1, CAST(N'2021-06-21T17:22:40.937' AS DateTime), NULL, N'evim')
INSERT [dbo].[Addresses] ([Id], [AdresDescription], [Member_Id], [AddedDate], [ModifiedDate], [Name]) VALUES (N'cf3e15f0-e875-4e06-898f-8cba6a1d33b4', N'Beyoğlu,Mersus Bilişim', 1, CAST(N'2021-06-21T17:22:58.550' AS DateTime), CAST(N'2021-06-21T17:23:05.540' AS DateTime), N'işim')
INSERT [dbo].[Addresses] ([Id], [AdresDescription], [Member_Id], [AddedDate], [ModifiedDate], [Name]) VALUES (N'6a05b8ab-0942-40b1-be5a-ef1fc490410a', N'Tokat', 3, CAST(N'2021-06-22T14:15:17.580' AS DateTime), NULL, N'ev adresim')
INSERT [dbo].[Addresses] ([Id], [AdresDescription], [Member_Id], [AddedDate], [ModifiedDate], [Name]) VALUES (N'361b4fa5-769d-4e80-993a-f4802a2d8a6b', N'örnek adres', 2, CAST(N'2021-06-21T21:49:47.747' AS DateTime), NULL, N'evim')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (4, N'Tablet', 33, NULL, CAST(N'2019-03-28T21:52:36.090' AS DateTime), CAST(N'2019-03-28T21:52:36.090' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (5, N'Bilgisayar', 33, NULL, CAST(N'2019-03-28T21:52:45.980' AS DateTime), CAST(N'2019-03-28T21:52:45.980' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (6, N'Telefon', 33, NULL, CAST(N'2019-03-28T21:52:54.700' AS DateTime), CAST(N'2019-03-28T21:52:54.700' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (8, N'Kulaklık', 35, N'Soft drinks, coffees, teas, beers, and ales', CAST(N'2021-06-19T12:00:47.837' AS DateTime), CAST(N'2021-06-19T12:00:47.837' AS DateTime), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (9, N'Televizyon', 33, N'Sweet and savory sauces, relishes, spreads, and seasonings', CAST(N'2021-06-19T12:00:47.837' AS DateTime), CAST(N'2021-06-19T12:00:47.837' AS DateTime), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (10, N'Aksesuar', NULL, N'Desserts, candies, and sweet breads', CAST(N'2021-06-19T12:00:47.837' AS DateTime), CAST(N'2021-06-19T12:00:47.837' AS DateTime), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (11, N'Ayakkabı', 10, N'Cheeses', CAST(N'2021-06-19T12:00:47.837' AS DateTime), CAST(N'2021-06-19T12:00:47.837' AS DateTime), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (12, N'Çanta', 10, N'Breads, crackers, pasta, and cereal', CAST(N'2021-06-19T12:00:47.837' AS DateTime), CAST(N'2021-06-19T12:00:47.837' AS DateTime), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (13, N'Fular', 10, N'Prepared meats', CAST(N'2021-06-19T12:00:47.837' AS DateTime), CAST(N'2021-06-19T12:00:47.837' AS DateTime), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (14, N'Parfüm', NULL, N'Dried fruit and bean curd', CAST(N'2021-06-19T12:00:47.837' AS DateTime), CAST(N'2021-06-19T12:00:47.837' AS DateTime), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (33, N'Elektronik', NULL, NULL, CAST(N'2021-06-19T00:00:00.000' AS DateTime), CAST(N'2021-06-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Parent_Id], [Description], [AddedDate], [ModifedDate], [IsDeleted]) VALUES (35, N'Teknolojik Aksesuar', NULL, NULL, CAST(N'2021-06-19T00:00:00.000' AS DateTime), CAST(N'2021-06-19T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Text], [Member_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (1, N'Ucuz ve kaliteli', 1, 19, CAST(N'2021-06-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Comments] ([Id], [Text], [Member_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (3, N'Fiyatını hakeden bir ürün', 2, 18, CAST(N'2021-06-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Comments] ([Id], [Text], [Member_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (4, N'Güzel başarılı', 2, 19, CAST(N'2021-06-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Comments] ([Id], [Text], [Member_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (5, N'Satıcı güzel paketlemişti', 1, 18, CAST(N'2021-06-21T13:40:35.970' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Name], [Surname], [Email], [Password], [Bio], [ProfileImageName], [AddedDate], [ModifiedDate], [MemberType]) VALUES (1, N'Zeynep', N'İnan', N'zeynp.inan3269@gmail.com', N'123456', NULL, N'images/upload/zey.jpeg', CAST(N'2021-06-17T00:00:00.000' AS DateTime), CAST(N'2021-06-21T14:24:24.497' AS DateTime), 10)
INSERT [dbo].[Members] ([Id], [Name], [Surname], [Email], [Password], [Bio], [ProfileImageName], [AddedDate], [ModifiedDate], [MemberType]) VALUES (2, N'Canan', N'Serper', N'serpercanan@gmail.com', N'canan', NULL, N'images/upload/9bcdbdad-6db5-4abd-b675-d09d3ab3d9b6.jpg', CAST(N'2021-06-19T20:39:43.860' AS DateTime), CAST(N'2021-06-21T14:45:22.633' AS DateTime), 0)
INSERT [dbo].[Members] ([Id], [Name], [Surname], [Email], [Password], [Bio], [ProfileImageName], [AddedDate], [ModifiedDate], [MemberType]) VALUES (3, N'Aysu', N'Sarı', N'aysusari@gmail.com', N'12345', NULL, NULL, CAST(N'2021-06-22T14:14:14.097' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'e7a5ab37-77b1-455e-9a89-17cfa0bdff02', CAST(83.86 AS Decimal(8, 2)), 1, 0, N'3b76390d-7a4f-4c15-b197-69b0045993ed', 19, CAST(N'2021-06-21T18:22:11.177' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'7490f2c7-18a8-4596-8eb3-221a283745ff', CAST(1287.00 AS Decimal(8, 2)), 3, 0, N'c92430ae-f5c3-4a02-8f3d-76e560957790', 21, CAST(N'2021-06-21T20:29:03.940' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'6dc2761b-20db-415b-a07e-49286be52325', CAST(175.00 AS Decimal(8, 2)), 1, 0, N'45436087-5723-49a7-9161-8b4b31af4364', 18, CAST(N'2021-06-21T18:32:25.997' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'9e24ecdc-ae97-431f-b066-5c80de857b48', CAST(175.00 AS Decimal(8, 2)), 1, 0, N'b7c90038-89d9-45e4-ba9b-c9d63913bf7a', 18, CAST(N'2021-06-21T21:49:53.883' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'ed365d90-641c-4848-a609-662e5d9a8c8c', CAST(160.00 AS Decimal(8, 2)), 1, 0, N'2a385530-e5f5-4b98-8b05-e9ae12b73556', 10, CAST(N'2021-06-21T21:09:47.130' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'8b930055-a79c-4232-b43c-7f69f48ace6a', CAST(1500.00 AS Decimal(8, 2)), 1, 0, N'e995d3cf-796d-48f3-a970-0d8ca708c3a9', 8, CAST(N'2021-06-21T18:21:36.940' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'a86aa619-5a7c-4642-bcfd-855aef4de836', CAST(429.00 AS Decimal(8, 2)), 1, 0, N'd210980d-a108-4a58-8fdc-c7aa32c41440', 21, CAST(N'2021-06-21T21:57:15.657' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'e759e94b-816a-4e26-ba68-8ce2bcf1c7e1', CAST(1500.00 AS Decimal(8, 2)), 1, 0, N'34d1aa05-7111-4d19-aec5-f81fbae465d0', 8, CAST(N'2021-06-21T18:37:42.023' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'47a3b9d5-cf9e-4d81-8a03-9f94be425b81', CAST(1500.00 AS Decimal(8, 2)), 1, 0, N'b7c90038-89d9-45e4-ba9b-c9d63913bf7a', 8, CAST(N'2021-06-21T21:49:53.880' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'650f1972-5088-4ebd-853f-aa50891e5aa7', CAST(12499.00 AS Decimal(8, 2)), 1, 0, N'3b76390d-7a4f-4c15-b197-69b0045993ed', 17, CAST(N'2021-06-21T18:22:11.177' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'883ff457-f680-44e9-a9cb-ac70409e1269', CAST(100.00 AS Decimal(8, 2)), 1, 0, N'ba1caaf3-303c-4222-a414-0bdc96e077d3', 1, CAST(N'2021-06-22T14:15:22.970' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'49b1c5db-6c16-495d-ac4b-be12e99fc76a', CAST(320.00 AS Decimal(8, 2)), 2, 0, N'3b76390d-7a4f-4c15-b197-69b0045993ed', 10, CAST(N'2021-06-21T18:22:11.177' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'9c4705a3-18e5-4f7d-9695-c0313edaf135', CAST(1500.00 AS Decimal(8, 2)), 1, 0, N'2a385530-e5f5-4b98-8b05-e9ae12b73556', 8, CAST(N'2021-06-21T21:09:47.130' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'7d274f56-757b-41c2-afb4-c84b48dbbb9b', CAST(800.00 AS Decimal(8, 2)), 5, 0, N'45436087-5723-49a7-9161-8b4b31af4364', 10, CAST(N'2021-06-21T18:32:25.997' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'4a5c42dc-2906-4c30-92db-c8612cd5e4d2', CAST(160.00 AS Decimal(8, 2)), 1, 0, N'34d1aa05-7111-4d19-aec5-f81fbae465d0', 10, CAST(N'2021-06-21T18:37:42.023' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'4ecd05c9-9902-422f-bba1-c8a32a0d8b79', CAST(100.00 AS Decimal(8, 2)), 1, 0, N'7647e598-48ad-475a-8cbc-4b6478c77f41', 1, CAST(N'2021-06-22T13:37:47.340' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'f70aeb72-8d43-429b-ab98-d1cdfb676949', CAST(83.86 AS Decimal(8, 2)), 1, 0, N'45436087-5723-49a7-9161-8b4b31af4364', 19, CAST(N'2021-06-21T18:32:25.997' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'8dcf392e-7e62-4431-af3d-d42a0d7439aa', CAST(150.00 AS Decimal(8, 2)), 1, 0, N'2a385530-e5f5-4b98-8b05-e9ae12b73556', 11, CAST(N'2021-06-21T21:09:47.133' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'4fcf67c2-ceb3-4b25-8af9-e3067944dfa2', CAST(429.00 AS Decimal(8, 2)), 1, 0, N'fe605184-19fd-4eea-8533-6429b3ea875e', 21, CAST(N'2021-06-22T12:23:00.487' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'e5736dfb-6701-4c15-95a1-e73234a2474c', CAST(320.00 AS Decimal(8, 2)), 2, 0, N'e123a868-1486-4857-915a-a52aa1bcce90', 10, CAST(N'2021-06-22T15:37:32.923' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'09fe13c9-f29e-48e8-bfbc-f1c416fa18a2', CAST(160.00 AS Decimal(8, 2)), 1, 0, N'7647e598-48ad-475a-8cbc-4b6478c77f41', 10, CAST(N'2021-06-22T13:37:47.343' AS DateTime), NULL)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Quantity], [Discount], [Order_Id], [Product_Id], [AddedDate], [ModifiedDate]) VALUES (N'ff743572-311c-40dd-8756-f8295061d03c', CAST(175.00 AS Decimal(8, 2)), 1, 0, N'fe605184-19fd-4eea-8533-6429b3ea875e', 18, CAST(N'2021-06-22T12:23:00.487' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'ba1caaf3-303c-4222-a414-0bdc96e077d3', 3, N'Tokat', N'SV        ', NULL, CAST(N'2021-06-22T14:15:22.970' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'e995d3cf-796d-48f3-a970-0d8ca708c3a9', 1, N'emniyet evleri mahallesi', N'SV        ', NULL, CAST(N'2021-06-21T18:21:36.940' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'7647e598-48ad-475a-8cbc-4b6478c77f41', 2, N'örnek adres', N'SV        ', NULL, CAST(N'2021-06-22T13:37:47.340' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'fe605184-19fd-4eea-8533-6429b3ea875e', 2, N'örnek adres', N'SV        ', NULL, CAST(N'2021-06-22T12:23:00.487' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'3b76390d-7a4f-4c15-b197-69b0045993ed', 1, N'Beyoğlu,Mersus Bilişim', N'SV        ', NULL, CAST(N'2021-06-21T18:22:11.177' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'c92430ae-f5c3-4a02-8f3d-76e560957790', 1, N'Beyoğlu,Mersus Bilişim', N'SV        ', NULL, CAST(N'2021-06-21T20:29:03.940' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'45436087-5723-49a7-9161-8b4b31af4364', 1, N'Beyoğlu,Mersus Bilişim', N'SV        ', NULL, CAST(N'2021-06-21T18:32:25.997' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'e123a868-1486-4857-915a-a52aa1bcce90', 1, N'emniyet evleri mahallesi', N'SV        ', NULL, CAST(N'2021-06-22T15:37:32.923' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'd210980d-a108-4a58-8fdc-c7aa32c41440', 2, N'örnek adres', N'SV        ', NULL, CAST(N'2021-06-21T21:57:15.657' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'b7c90038-89d9-45e4-ba9b-c9d63913bf7a', 2, N'örnek adres', N'SV        ', NULL, CAST(N'2021-06-21T21:49:53.880' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'2a385530-e5f5-4b98-8b05-e9ae12b73556', 1, N'emniyet evleri mahallesi', N'SV        ', NULL, CAST(N'2021-06-21T21:09:47.130' AS DateTime), NULL)
INSERT [dbo].[Orders] ([Id], [Member_Id], [Address], [Status], [Description], [AddedDate], [ModifiedDate]) VALUES (N'34d1aa05-7111-4d19-aec5-f81fbae465d0', 1, N'emniyet evleri mahallesi', N'SV        ', NULL, CAST(N'2021-06-21T18:37:42.020' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (1, N'iphone 5s', N'iphone telefon', CAST(100.00 AS Decimal(8, 2)), 1, 0, 0, N'images/upload/Product/ab6ba0be-7e44-4b47-89e7-24603974c1e1.jpg', 98, CAST(N'2021-06-17T00:00:00.000' AS DateTime), NULL, 6, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (8, N'Lenovo IdeaPad Intel Core i5 ', N'8250U 8GB 1TB + 240GB SSD Radeon 530 Windows 10 Home 15.6" Taşınabilir Bilgisayar 81BT0028TXS', CAST(1500.00 AS Decimal(8, 2)), 1, 0, 0, N'images/upload/Product/1.jpg', 96, CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (10, N'Omuz Çantası', N'Siyah Omuz Çantası', CAST(160.00 AS Decimal(8, 2)), 1, 0, 0, N'images/upload/Product/2.jpg', 88, CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL, 12, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (11, N'OKMORE Siyah Kafa Üstü Telefon Oyun Kulaklığı', N'OKMORE Siyah Kafa Üstü Telefon Oyun Kulaklığı Extra Bass Stereo 3899extrabass', CAST(150.00 AS Decimal(8, 2)), 1, 2, 5, N'images/upload/Product/3.jpg', 149, CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL, 8, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (15, N'Samsung Galaxy Tab A7 SM-T500 Wi-Fi 3 GB 32 GB 10.4" Tablet', N'2 YIL ORİJİNAL SAMSUNG TÜRKİYE GARANTİLİ', CAST(1490.00 AS Decimal(8, 2)), 1, 4, 2, N'images/upload/Product/4.jpg', 120, CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (17, N'75'''' Smart 4K Ultra HD TV 75U9500', N'75 İnç / 189 Ekran
4K Ultra HD (3840 x 2160)', CAST(12499.00 AS Decimal(8, 2)), 1, 3, 5, N'images/upload/Product/5.jpg', 59, CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL, 9, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (18, N'Future Design Güneş Gözlüğü UN1196SYGM', N'Yeni Sezon Street Style Unisex Tasarım Güneş Gözlüğü', CAST(175.00 AS Decimal(8, 2)), 1, 5, 21, N'images/upload/Product/6.jpg', 55, CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (19, N'Gob London Kadın Beyaz Sneaker 1021-105-0010_1003', N'Gob London Kadın Beyaz Sneaker 1021-105-0010_1003', CAST(83.86 AS Decimal(8, 2)), 1, 4, 25, N'images/upload/Product/7.jpg', 44, CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL, 11, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (20, N'Desenli Saten Kadın Bandana', N'60 x 60', CAST(22.99 AS Decimal(8, 2)), 1, 3, 18, N'images/upload/Product/8.jpg', 50, CAST(N'2021-06-19T00:00:00.000' AS DateTime), NULL, 13, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (21, N'Mugler Alien Kadin Eau De Parfum 30 ml 3439600056907
', N'Thierry Mugler Alien Edp 30 MlSizi her gün olağanüstü olmaya davet eden gizemli bir parfüm: ALIEN. ', CAST(429.00 AS Decimal(8, 2)), 1, 5, 34, N'images/upload/Product/9.jpg', 30, CAST(N'2021-06-19T00:00:00.000' AS DateTime), NULL, 14, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsContinued], [StarPoint], [StarGivenMemberCount], [ProductImageName], [UnitsInStock], [AddedDate], [ModifiedDate], [Category_Id], [IsDeleted]) VALUES (25, N'Avon Incandessence Edp 50ml Kadın Parfüm 8681298900146', N'Koku ailesi: Oryantal-Çiçeksi.', CAST(59.90 AS Decimal(8, 2)), 1, 5, 63, N'images/upload/Product/10.jpg', 80, CAST(N'2021-06-19T00:00:00.000' AS DateTime), NULL, 14, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Members]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([Parent_Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Members]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[MessageReplies]  WITH CHECK ADD  CONSTRAINT [FK_MessageReplies_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[MessageReplies] CHECK CONSTRAINT [FK_MessageReplies_Members]
GO
ALTER TABLE [dbo].[MessageReplies]  WITH CHECK ADD  CONSTRAINT [FK_MessageReplies_Messages] FOREIGN KEY([MessageId])
REFERENCES [dbo].[Messages] ([Id])
GO
ALTER TABLE [dbo].[MessageReplies] CHECK CONSTRAINT [FK_MessageReplies_Messages]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
