USE [Tarot]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[Price] [decimal](18, 0) NULL,
	[PaymentID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[NewID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[NewID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](500) NULL,
	[Phone] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Feedback_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewCategories]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_NewCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [ntext] NULL,
	[NewCategoryID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[ViewCount] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[CategoryID] [int] NOT NULL,
	[PublisherID] [int] NOT NULL,
	[ProductName] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
	[Detail] [nvarchar](max) NULL,
	[QuantitySold] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Price] [decimal](18, 0) NULL,
	[TopHot] [nvarchar](500) NULL,
	[ViewCount] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterStudent]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterStudent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](500) NOT NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_RegisterStudent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameTag] [nvarchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/4/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](500) NULL,
	[Phone] [nvarchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'Thanh Toán Trực Tiếp', NULL, NULL, 0)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'ATM Banking', NULL, NULL, 0)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Ví Điện Tử Momo', NULL, NULL, 0)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'PayPal', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'Sản phẩm mới', CAST(N'2021-05-04' AS Date), NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'Bài Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Bài Lenormand', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'Bài Oracle', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'Thảo Mộc', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Đá Runes', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'Con Lắc', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (8, N'Đá Thanh Tẩy', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (9, N'Khăn Trải', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (10, N'Hộp Gỗ', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (11, N'Bài Tây - Playing Cards', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (12, N'Túi Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (13, N'Sách Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (14, N'Phụ kiện Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (15, N'Bài I Ching', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (16, N'Chưa phân loại', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (17, N'Combo Giá Tốt', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'Bài Mới', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Bài Mini', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'Văn Hóa & Nghệ Thuật', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'Bài Có Mạ Cạnh', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'Gay & LGBT', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (8, N'Top 10', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (9, N'God, Angel & Fairy', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (10, N'Dark & Gothic', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (11, N'Pagan & Wiccan', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (12, N'Bài Lạ', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (13, N'Tình Yêu & 18+', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (14, N'Sinh Vật Huyền Bí', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (15, N'Huyền Học', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (16, N'Beginner', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (17, N'Sale off', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (18, N'Thiên Nhiên', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (19, N'Những Bộ Bài Nên Sử Dụng', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (20, N'Định Hướng Tổng Hợp', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (21, N'Thế Giới Thần Tiên', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (22, N'Bóng Tối và Phù Phép', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (23, N'Chữa Lành', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (24, N'Tôn Giáo & Thiền Định', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (25, N'Động Vật', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (26, N'Dành Cho Người Mới', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (27, N'Tinh Thể, Năng Lượng & Luân Xa', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (28, N'Thông Điệp Từ Vũ Trụ', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (29, N'Thần Thoại', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (30, N'Ngôn Ngữ Cổ Xưa & Chiêm Tinh', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (31, N'Hành Trình Cuộc Sống', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (32, N'Tình Yêu & Các Mối Quan Hệ', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (33, N'Thiên Thần', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (34, N'Bài Clow', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (35, N'Truyền Cảm Hứng', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (36, N'Bài Tiên Tri', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (37, N'Con Lắc Lo Scarabeo', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (38, N'Mặt Dây Chuyền & Con Lắc', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (39, N'Đá thanh tẩy bài Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (40, N'Đá thanh tẩy đặc biệt', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (41, N'Đá thanh tẩy hình trụ', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (42, N'Sách Huyền Học Khác', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (43, N'Sách Tarot Tiếng Việt', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (44, N'Sách Bùa Chú, Nghi Thức, Thuật Phù Thủy', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (45, N'Sách Học Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (46, N'Sách Sơ Đồ Trải Bài Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (47, N'Sách Học Lenormand', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (48, N'Phụ Kiện Khác', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (49, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'NXB Hay House', NULL, NULL, 1)
INSERT [dbo].[Publisher] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'NXB Blue Angel', NULL, NULL, 1)
INSERT [dbo].[Publisher] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'NXB Schiffer', NULL, NULL, 1)
INSERT [dbo].[Publisher] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'NXB Lo Scarabeo', NULL, NULL, 1)
INSERT [dbo].[Publisher] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'NXB Llewellyn', NULL, NULL, 1)
INSERT [dbo].[Publisher] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'NXB US Games Systems', NULL, NULL, 1)
INSERT [dbo].[Publisher] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'NXB Khác & Tự Phát Hành', NULL, NULL, 1)
INSERT [dbo].[Publisher] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (8, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'admin', N'202cb962ac59075b964b07152d234b70', NULL, NULL, N'admin181200084@gmail.com', N'0999885568', CAST(N'2021-04-30' AS Date), NULL, 1)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [Status]) VALUES (8, N'namnguyen68', N'202cb962ac59075b964b07152d234b70', N'Nam', N'Bạch Mai, Hai Bà Trưng, Hà Nội', N'nam68@gmail.com', N'0998877885', CAST(N'2021-04-30' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[PaymentMethod] ADD  CONSTRAINT [DF_PaymentMethod_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategories] ADD  CONSTRAINT [DF_ProductCategories_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_QuantitySold]  DEFAULT ((0)) FOR [QuantitySold]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_PromotionPrice]  DEFAULT ((0)) FOR [PromotionPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Publisher] ADD  CONSTRAINT [DF_Publisher_Status_1]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_PaymentMethod] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_PaymentMethod]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[ContentTag]  WITH CHECK ADD  CONSTRAINT [FK_ContentTag_News] FOREIGN KEY([NewID])
REFERENCES [dbo].[News] ([ID])
GO
ALTER TABLE [dbo].[ContentTag] CHECK CONSTRAINT [FK_ContentTag_News]
GO
ALTER TABLE [dbo].[ContentTag]  WITH CHECK ADD  CONSTRAINT [FK_ContentTag_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[ContentTag] CHECK CONSTRAINT [FK_ContentTag_Tags]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_NewCategories] FOREIGN KEY([NewCategoryID])
REFERENCES [dbo].[NewCategories] ([ID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_NewCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ProductTypes] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Publisher] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Publisher]
GO
