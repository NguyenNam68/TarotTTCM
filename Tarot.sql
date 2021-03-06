USE [Tarot]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 5/12/2021 11:24:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NewID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/12/2021 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[NewCategories]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NewID] [int] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_NewCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [ntext] NULL,
	[NewCategoryID] [int] NOT NULL,
	[Image] [varchar](500) NULL,
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
/****** Object:  Table [dbo].[OnlinePaying]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlinePaying](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Method] [int] NOT NULL,
	[NamePay] [nvarchar](500) NULL,
	[NameAccount] [nvarchar](500) NULL,
	[CodeAccount] [varchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Image] [varchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_OnlinePaying] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [date] NULL,
	[TotalMoney] [decimal](18, 0) NULL,
	[CustomerID] [varchar](50) NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](500) NULL,
	[ShipEmail] [nvarchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 5/12/2021 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 5/12/2021 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PublisherID] [int] NOT NULL,
	[ProductName] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
	[Detail] [nvarchar](max) NULL,
	[QuantitySold] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Price] [decimal](18, 0) NULL,
	[TopHot] [bit] NOT NULL,
	[ViewCount] [int] NULL,
	[LikeCount] [int] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[NameTag] [nvarchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](500) NULL,
	[CategoryID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 5/12/2021 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[RegisterStudent]    Script Date: 5/12/2021 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[Statistical]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistical](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Revenue] [decimal](18, 0) NULL,
	[TotalUser] [int] NULL,
	[TotalOrder] [int] NULL,
	[TotalSell] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Statistical] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameStore] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[TimeOpen] [nvarchar](500) NULL,
	[Phone] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 5/12/2021 11:24:27 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 5/12/2021 11:24:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Gender] [bit] NOT NULL,
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
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Content], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'Nguyễn Việt Nam', N'nam68@gmail.com', N'0906082000', N'Sản phẩm của các bạn rất tuyệt vời!', NULL, NULL, 0)
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Content], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Triệu Lệ Dĩnh', N'ledinh@gmail.com', N'0999998888', N'Sản phẩm đẹp, tôi rất thích phong cách làm việc và sản phẩm của các bạn!', NULL, NULL, 0)
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Content], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'Dương Mịch', N'duongmich@gmail.com', N'0933336666', N'Sản phẩm đẹp như hình ảnh, nhưng giao hàng hơi chậm!
', NULL, NULL, 0)
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Content], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'Cúc Tịnh Y', N'tinhy@gmail.com', N'0988881111', N'Sản phẩm không được như ý muốn của tôi', NULL, NULL, 0)
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [Content], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Hoàng Linh Lan', N'linhlan@gmail.com', N'0989898866', N'Tuyệt vời', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[NewCategories] ON 

INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N' Tìm hiểu về Tarot', 1, NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N' Cảm Nhận Về Bộ Bài', 1, NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N' Spread Trải Bài', 1, NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N' Top Bộ Bài Nổi Bật', 1, NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Ẩn Chính', 2, NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Wands', 2, NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (9, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Cups', 2, NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (10, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Pentacles', 2, NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [NewID], [CreatedDate], [CreatedBy], [Status]) VALUES (11, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Swords', 2, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[NewCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (1, N'Lớp Học Tarot Từ Cơ Bản Đến Chuyên Nghiệp Ở Việt Nam', N'Ở Việt Nam có lớp học tarot nào tốt? Khóa học tarot của Cộng Đồng Tarot Việt Nam: Tổ chức theo lịch định kỳ tại Wichita Tarot Café (Tp. Hồ Chí Minh) từ năm 2016 đến nay. Khóa học kết hợp online và trực tiếp với giáo trình do Tarot Việt Nam biên soạn, cung cấp cho học viên kiến thức về chuẩn bài tarot Rider Waite Smith, lịch sử và các biến thể của tarot. Có khóa nâng cao dành cho học [...]', 2, NULL, CAST(N'2021-05-06' AS Date), NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (2, N'Có Nên Học Xem Bói Bài Trước Khi Sử Dụng Bộ Bài Tarot?', N'Có Cần Thiết Học Xem Bói Bài Tarot? Dù xuất phát điểm cuộc sống của một người có ra sao, thì họ đều có một tiềm năng để phát triển theo hướng tích cực. Bàii tarot sẽ khai mở nguồn năng lượng trong trực giác và sự sáng suốt (wisdom) trong mỗi con người. Làm chủ và kiểm soát được thế giới nội tâm sẽ giúp bạn xây dựng nên khả năng vượt qua những thử thách xảy ra trong [...]', 2, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (3, N'Ứng Dụng Đọc Sách Hướng Dẫn Tarot Trên Di Động', N'Ứng dụng đọc sách hướng dẫn Tarot trên hệ điều hành iOS Ứng dụng đọc sách hướng dẫn Tarot trên hệ điều hành Android  ', 2, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (4, N'Tổng Quan Bài Tarot Dành Cho Người Mới Bắt Đầu', N'Chào mừng bạn đã đến với Mystic House Tarot Shop, địa điểm duy nhất tại Việt Nam có tư cách pháp nhân chuyên cung cấp các loại bài Tarot, Oracle, Lenormand… nhập khẩu và phụ kiện Tarot chính hãng! Bài viết ngắn này sẽ cung cấp cho bạn một cái nhìn tổng quan bài Tarot dành cho người mới bắt đầu. Đây là lần đầu tiên bạn biết đến bài Tarot và Mystic House Tarot Shop phải không? Chắc hẳn [...]', 2, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/6747-border-borderless-Tara-O%E2%80%99Connor.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (5, N'Lớp Học Tarot Cho Người Mới Bắt Đầu', N'Khóa Học Tarot Online – “Giải Mã Bói Bài tarot” Cho Người Chưa Biết Gì! – lớp học tarot cho người mới bắt đầu: tự học giải được bài tarot chỉ sau 10 giờ học – Khóa học tarot cấp tốc được tổ chức theo hình thức học tarot online tại HocTarot (https://hoctarot.com/) – Dự án khơi nguồn huyền học cho người Việt. Đây là khóa học hướng dẫn các bạn cách tiếp cận với bài tarot, giúp phát triển khả năng đọc hiểu [...]', 2, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/cach-hoi-bai-tarot.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (6, N'Chọn Bài Tarot hay Oracle Để Tìm Câu Trả Lời Tốt Hơn', N'CHỌN BÀI TAROT HAY ORACLE ĐỂ TÌM CÂU TRẢ LỜI TỐT HƠN? __ Laura Clark – Soul-Wise Living __ Sự khác biệt giữa bài Tarot và Oracle là gì? Và sử dụng loại nào thì nhận được câu trả lời cũng như khả năng hiểu biết hiệu quả hơn? Nhiều người đã nêu những câu hỏi tương tự như vậy với tôi. Để trả lời được những câu hỏi đó, bạn cần phải có một nền tảng kiến thức tốt về [...]', 2, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/B%C3%A0i-Oracle-b%C3%A0i-b%C3%B3i.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (7, N'Sự Khác Biệt Giữa Bài Tarot và Bài Oracle', N'SỰ KHÁC BIỆT GIỮA BÀI TAROT VÀ BÀI ORACLE? __ Kate – Tha Daily Tarot Girl __ Chắc hẳn ai trong số các bạn cũng đều đã biết đến bài Tarot, nhưng không hẳn ai cũng đều từng nghe về bài Oracle.  Vậy hai loại bài này có giống nhau không? Hay chúng hoàn toàn khác nhau? Và giữa Tarot với Oracle thì nên dùng loại nào? Đây là những câu hỏi mà tôi rất thường xuyên được nhờ giải đáp. Để [...]', 2, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/Tarot-va-Oracle.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (8, N'Những Điều Không Nên Hỏi Khi Bói Bài Tarot', N'Lá bài Tarot có thể trả lời mọi thứ ư? Bạn chỉ cần nghĩ về vấn đề đó, rút bài ra và bạn sẽ nhận được đáp án, tuyệt! Sai! Bài Tarot thực ra chỉ để hướng dẫn và giúp bạn hiểu rõ những khúc mắc và các mối bận tâm, vì vậy có những điều bạn không nên hỏi Tarot. 11 Câu hỏi không được hỏi khi bói toán Tarot 1. Liệu người tình của tôi sẽ bỏ vợ chứ? Hoặc bất [...]', 2, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/tarot-reading.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (9, N'Cảm Nhận Bộ Bài Fountain Tarot – Sắc Sảo Và Mơ Hồ Thông Qua Thế Giới Hình Học', N'Fountain Tarot – Sắc Sảo Và Mơ Hồ Thông Qua Thế Giới Hình Học Fountain Tarot là một bộ bài tarot gồm 79 lá được hình dung thông qua thế giới hình học, văn hóa mạng, nghệ thuật và tâm linh. Các nhà sáng tạo bộ bài nhắm đến việc nắm bắt những niềm vui và nỗi buồn trong cuộc sống và tôn vinh trạng thái ‘nhất thể’ thông qua những bức tranh sơn dầu của Jonathan Saiz. Tác giả: Jonathan [...]', 3, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/Fountain-Tarot-cam-nhan-1.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (10, N'Fairy Tale Lenormand – Bài Tiên Tri Từ Thế Giới Cổ Tích', N'Fairy Tale Lenormand – Bài Tiên Tri Từ Thế Giới Cổ Tích Fairy Tale Lenormand là bộ bài 38 lá, kết hợp các biểu tượng Lenormand với chủ đề truyện cổ tích. Nó bao gồm 36 lá Lenormand tiêu chuẩn (kèm hai lá phụ Lady và Gentleman). Bộ bài là tác phẩm của Lisa Hunt. Tác giả: Lisa Hunt, Arwen Lynch NXB: US Games 2016 Đánh giá: Bonnie Cehovet Dịch: Mystic House Fairy Tale Lenormand “là bộ bài truyền thống 36 lá, với hai lá phụ là [...]', 3, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/Bo-bai-Fairy-Tale-Lenormand-1.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (11, N'Pagan Otherworlds Tarot – Bộ Bài Đơn Giản Nhưng Tinh Tế Trong Từng Chi Tiết', N'Pagan Otherworlds Tarot – Bộ Bài Đơn Giản Nhưng Tinh Tế Trong Từng Chi Tiết Pagan Otherworlds Tarot là bộ bài chất lượng cao về mọi mặt, từ hình minh họa đến chất lượng in. Nó bao gồm 84 lá – có thêm một lá Ẩn chính và năm lá ‘Luna’ độc đáo – với các minh họa đơn giản nhưng mạnh mẽ mang cảm giác nghệ thuật thời Phục Hưng. Tác giả: Peter Dunham, Linnea Gits NXB: Uusi 2016 Đánh giá: Edmund Zebrowski Dịch: [...]', 3, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/Bo-bai-Pagan-Otherworlds-Tarot-3.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (12, N'Universal Goddess Tarot – Sự Dẫn Dắt Tâm Linh Của Các Nữ Thần', N'Universal Goddess Tarot – Sự Dẫn Dắt Tâm Linh Của Các Nữ Thần Bộ Universal Goddess Tarot mô tả 78 nữ thần từ nhiều nền văn hóa trên khắp thế giới, mỗi lá đại diện cho một khía cạnh về phụ nữ, thiên nhiên và thần thánh. Tác giả: Maria Caratti, Antonella Platano NXB: Lo Scarabeo 2006 Đánh giá: Rachel Dịch: Mystic House Tôi rất vui khi được nói về một trong những bộ bài mình yêu thích trong bài viết này. Universal Goddess Tarot là [...]', 3, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/Bo-bai-Universal-Goddess-Tarot-1.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (13, N'Trải Bài Phỏng Vấn Bộ Bài Mới', N'Khi “rước” một bộ bài Tarot mới về, việc đầu tiên là phỏng vấn em ấy. Sau đây là một trải bài đơn giản 6 lá được cung cấp bởi Aeclectic Tarot, cho phép bạn gặp gỡ và hiểu về bộ bài của mình. Trải bài sẽ giúp bạn khám phá điểm mạnh cũng như điểm yếu, cá tính của bộ bài. Đây cũng sẽ thể hiện cách bộ bài có thể giúp bạn phát triển, trở thành một [...]

', 4, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/trai-bai-phong-van.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (14, N'Cách Thức Đọc Trải Bài Năm Lá', N'Trải bài Tarot có nhiều kiểu khác nhau được sử dụng để đặt lá bài ứng với một câu hỏi đã được xác định. Sau khi câu hỏi được chọn lọc và diễn đạt rõ ràng, một bước rất quan trọng tiếp theo đó là hiểu được ý nghĩa của lá bài tương ứng ở từng vị trí. Con số 5 đặc biệt liên quan đến quan điểm cá nhân nhất quán tạo khác biệt giữa người với người. Chúng [...]', 4, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/doc-trai-bai-tarot-5-la.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (15, N'Cách Đọc Bài Tarot Một Lá', N'Tarot có nguồn gốc từ thế kỷ 15th vốn ban đầu được xem là một trò chơi ở những vùng đất thuộc Châu Âu. Những lá bài Tarot này không được sử dụng phổ biến để bói tiên tri mãi đến cuối thế kỷ 18th. Ngày nay, Tarot được biết đến nhiều nhất cho mục đích này. Chúng cũng là nguồn cảm hứng cho nhiều tác phẩm văn học và nghệ thuật khác nhau. Một trong những điều quan trọng [...]', 4, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/il_fullxfull.301861089.jpg', NULL, NULL, NULL, 1)
INSERT [dbo].[News] ([ID], [Title], [Content], [NewCategoryID], [Image], [CreatedDate], [CreatedBy], [ViewCount], [Status]) VALUES (16, N'Cách Thức Đọc Trải Bài Ba Lá', N'Trải bài ba lá là một trải bài rất cơ bản. Trải bài này là một lựa chọn tuyệt vời cho những người mới bắt đầu học Tarot sử dụng để luyện tập và để đọc cho chính họ hoặc cho người khác. Trải bài ba lá cũng tối ưu khi bạn cần một câu trả lời nhanh cho một câu hỏi không quá phức tạp. Bài viết này sẽ đưa đến bạn một số mẫu trải bài ba lá [...]', 4, N'/DataImage/images/B%C3%A0i%20Vi%E1%BA%BFt/trai-bai-ba-la.png', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[OnlinePaying] ON 

INSERT [dbo].[OnlinePaying] ([ID], [Method], [NamePay], [NameAccount], [CodeAccount], [Address], [Image], [CreatedDate], [CreatedBy], [Status]) VALUES (1, 2, N'Ngân hàng Ngoại thương Việt Nam – VIETCOMBANK', N'Vũ Mạnh Đức', N'0333 205 999 444', N'Vietcombank Thăng Long', N'/DataImage/images/OnlinePaying/bank_vcb.png', CAST(N'2021-05-06' AS Date), NULL, 1)
INSERT [dbo].[OnlinePaying] ([ID], [Method], [NamePay], [NameAccount], [CodeAccount], [Address], [Image], [CreatedDate], [CreatedBy], [Status]) VALUES (2, 2, N'Ngân hàng Kỹ Thương Việt Nam – TECHCOMBANK', N'Vũ Mạnh Đức', N'900 111 15818 999', N'Techcombank Ngọc Khánh', N'/DataImage/images/OnlinePaying/bank_tcb.png', NULL, NULL, 1)
INSERT [dbo].[OnlinePaying] ([ID], [Method], [NamePay], [NameAccount], [CodeAccount], [Address], [Image], [CreatedDate], [CreatedBy], [Status]) VALUES (3, 2, N'Ngân hàng Á Châu – ACB', N'Nguyễn Văn Khánh', N'7999 9999', N'PGD Định Công', N'/DataImage/images/OnlinePaying/bank_acb.png', NULL, NULL, 1)
INSERT [dbo].[OnlinePaying] ([ID], [Method], [NamePay], [NameAccount], [CodeAccount], [Address], [Image], [CreatedDate], [CreatedBy], [Status]) VALUES (4, 2, N'Ngân hàng Sài Gòn Thương Tín – SACOMBANK', N'Nguyễn Văn Khánh', N'6666 7777 888', N'PGD Tân Mai', N'/DataImage/images/OnlinePaying/bank_scb.png', NULL, NULL, 1)
INSERT [dbo].[OnlinePaying] ([ID], [Method], [NamePay], [NameAccount], [CodeAccount], [Address], [Image], [CreatedDate], [CreatedBy], [Status]) VALUES (5, 2, N'Ngân hàng NN & PT Nông thôn Việt Nam – AGRIBANK', N'Nguyễn Việt Nam', N'6666 225 656 877', N'Agribank Hà Nội', N'/DataImage/images/OnlinePaying/bank_agri.png', NULL, NULL, 1)
INSERT [dbo].[OnlinePaying] ([ID], [Method], [NamePay], [NameAccount], [CodeAccount], [Address], [Image], [CreatedDate], [CreatedBy], [Status]) VALUES (6, 2, N'Ngân Hàng Công Thương Việt Nam – Vietinbank', N'Nguyễn Việt Nam', N'1122 3339 4545', N'PGD Lạc Trung', N'/DataImage/images/OnlinePaying/bank_vtb.png', NULL, NULL, 1)
INSERT [dbo].[OnlinePaying] ([ID], [Method], [NamePay], [NameAccount], [CodeAccount], [Address], [Image], [CreatedDate], [CreatedBy], [Status]) VALUES (7, 3, N'Ví điện tử – MoMo', N'Nguyễn Việt Nam', N'0955898888', NULL, N'/DataImage/images/OnlinePaying/bank_mo.png', NULL, NULL, 1)
INSERT [dbo].[OnlinePaying] ([ID], [Method], [NamePay], [NameAccount], [CodeAccount], [Address], [Image], [CreatedDate], [CreatedBy], [Status]) VALUES (8, 4, N'PayPal', N'Nguyễn Việt Nam', N'namnguyen68@gmail.com', NULL, N'/DataImage/images/OnlinePaying/bank_paypal.png', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[OnlinePaying] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [TotalMoney], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (4, CAST(N'2021-05-11' AS Date), NULL, NULL, N'Nam', N'0906082000', N'Tam Trinh, Hoàng Mai, Hà Nội', N'namzoe2018@gmail.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [TotalMoney], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (5, CAST(N'2021-05-12' AS Date), NULL, NULL, N'Nam', N'0906082000', N'Tam Trinh, Hoàng Mai, Hà Nội', N'namzoe2018@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (39, 4, 1, CAST(1100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (45, 5, 1, CAST(1000000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'Thanh Toán Trực Tiếp ', CAST(N'2021-05-06' AS Date), NULL, 1)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'ATM Banking', NULL, NULL, 1)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Ví Điện Tử Momo', NULL, NULL, 1)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'PayPal', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'Bài Tarot ', CAST(N'2021-05-09' AS Date), NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Bài Lenormand', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'Bài Oracle', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'Thảo Mộc', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Đá Runes', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'Con Lắc', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (8, N'Đá Thanh Tẩy', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (9, N'Khăn Trải', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (10, N'Hộp Gỗ', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (11, N'Bài Tây - Playing Cards', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (12, N'Túi Tarot ', CAST(N'2021-05-09' AS Date), NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (13, N'Sách Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (14, N'Phụ kiện Tarot', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (15, N'Bài I Ching', NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (17, N'Combo Giá Tốt', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (35, 2, 7, N'78 Tarot Mythical', N'Bao gồm: 78 Lá bài + Sách hướng dẫn.', N'Bộ bài 78 Tarot Mythical mời gọi bạn bước vào thế giới thần thoại, trong đó có cả những truyền thuyết về các vị thần, sinh vật huyền bí hay những câu chuyện kỳ bí khác. Nếu bạn đã từng sở hữu những phiên bản trước, chắc chắn bạn sẽ không thể bỏ qua được phiên bản đặc biệt này.', NULL, N'/DataImage/images/Tarot-BaiHiem/78-Tarot-Mythical-Tarot.jpg', NULL, CAST(1300000 AS Decimal(18, 0)), 0, 10, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (36, 2, 7, N'78 Tarot Carnival: Cirque du Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn.', N'Dựa trên ý tưởng về một tựa bài Tarot gồm 78 lá do 78 họa sĩ đã từng vẽ Tarot hay theo trường phái hội họa có liên quan đến Tarot nổi tiếng thế giới cùng cộng tác, dự án series 78 Tarot ra đời với nhiều phiên bản mang chủ đề khác nhau. 78 Tarot Carnival là bộ bài thứ ba thuộc series này, mang chủ đề về các sự kiện lễ hội trên thế giới và được phát hành giới hạn trong năm 2016. Có nhiều họa sĩ nổi tiếng tham gia vào quá trình xây dựng artwork của bộ bài độc đáo này, tiêu biểu là Paulina Cassidy, Jasmine Becket-Griffith (Oracle of Shadows and Lights)… Cũng như các phiên bản 78 Tarot khác, Carnival về cơ bản cũng tuân theo hệ thống biểu tượng và hình ảnh của Rider Waite Smith. Sách booklet đi kèm cung cấp mô tả khá chi tiết về ý nghĩa mỗi lá bài, kết nối rất tốt đến hệ thống Tarot truyền thống và xóa nhòa mối lo các lá bài thiếu sự đồng bộ (do được vẽ bởi nhiều người khác nhau). Người dùng cũng có thể chọn thêm cuốn sách companion được phát hành rời, đem đến những thông tin giải nghĩa cụ thể hơn cho bộ bài, đồng thời cũng là một cuốn artbook tuyệt đẹp cho những ai yêu thích nghệ thuật.', NULL, N'/DataImage/images/Tarot-BaiHiem/78-Tarot-Carnival-Tarot.jpg', NULL, CAST(1300000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (37, 2, 7, N'Manhua Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn (tiếng Hoa)', N'78 lá bài Tarot huyền bí được tái hiện hoàn hảo dưới lăng kính của thế giới Manhua – truyện tranh Trung Hoa. Không hoàn toàn dựa theo một bộ truyện hay phim ảnh cụ thể như nhiều tựa bài tương tự, Manhua Tarot thể hiện phong cách tự do trong khi vẫn mô phỏng hoàn hảo chuyến hành trình của The Fool theo hệ thống Rider Waite Smith. Chỉ cần là một người đam mê truyện tranh châu Á (manga/manhua/manhwa), bạn sẽ dễ dàng nắm bắt được ý nghĩa của mỗi lá bài. Manhua Tarot đi kèm sách companion tiếng Hoa in màu đẹp mắt, cung cấp thông tin chi tiết về mỗi lá bài và các dạng trải bài đề xuất. 78 lá bài được thiết kế theo phong cách luminescence, bề mặt ánh lên bảy sắc màu tuyệt đẹp, và mặt sau được phủ một lớp chống trầy và chống nước nhẹ.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Manhua-Tarot.jpg', NULL, CAST(650000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (38, 2, 6, N'Paulina Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Paulina Tarot là tựa bài Tarot thứ hai của họa sĩ nổi tiếng Paulina Cassidy – đồng tác giả của bộ bài Joie de Vivre Tarot. Mặc dù có cùng phong cách vẽ đặc trưng như Joie de Vivre, tuy nhiên Paulia Tarot gợi đến mức độ trưởng thành cao hơn với các nhân vật thể hiện nhiều sắc thái hơn so với tổng thể vui nhộn, tích cực của Joie de Vivre. Hệ thống hình ảnh của Paulina Tarot có chiều sâu và phức tạp cùng mức độ chi tiết rất cao, và được vẽ bằng chất liệu màu nước với những gam màu lặng bao phủ tổng thể. Bối cảnh trong bộ bài được khắc họa trong một thế giới thần tiên siêu thực mang âm hưởng của thời đại Victoria pha trộn với phong cách hoạt hình của Tim Burton (nghệ sĩ, đạo diễn các bộ phim lừng danh thế giới như The Night Before Christmas, Corpse Bride…). Thế giới thiên nhiên vừa huyền diệu vừa có phần kỳ quái của Paulina Tarot có thể dễ dàng mê hoặc bất cứ ánh mắt nào. Sách booklet đi kèm bộ bài cung cấp lượng thông tin rất chi tiết, bao gồm nghĩa ngược và xuôi. Theo Paulina Cassidy, bà mất 18 tháng để hoàn thành bộ bài này. Cho dù là người dùng mới bắt đầu hay đã có kinh nghiệm nhưng muốn tìm kiếm một tựa bài có thể đem lại cho bản thân những suy niệm sâu sắc hơn, Paulina Tarot sẽ luôn là lựa chọn hợp lý.', NULL, N'/DataImage/images/Tarot-Beginner/Paulina-Tarot.jpg', NULL, CAST(650000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (39, 2, 7, N'Anima Mundi Tarot', N'Bao gồm: 78 lá bài + Sách hướng dẫn', N'Anima Mundi có nghĩa là “Thế giới linh hồn” được dịch từ tiếng Latin. Việc áp dụng chữ Latin làm cho bộ bài thêm phần đặc sắc hơn và có nhiều góc nhìn mới mẻ hơn. Thoạt nhìn thoáng qua thì bạn có cảm tưởng rằng bộ bài Anima Mundi Tarot nói về thế giới động vật thông thường, nhưng thật sự bộ bài này đã áp dụng rất thành công yếu tố động vật vào ý nghĩa từng lá bài Tarot. Áp dụng theo chuẩn Rider Waite Smith, bạn như bước vào thế giới linh hồn huyền bí, nơi đó đem đến cho bạn nội lực mạnh mẽ.

Đến với Anima Mundi Tarot, bạn sẽ được kết nối chính mình với thế giới linh hồn, trao gửi sức mạnh của mình cho Vũ Trụ. Hãy thả lỏng bản thân, đón nhận thông điệp từ chính thế giới linh hồn ấy gửi đến cho bạn.

Bộ bài Anima Mundi Tarot gồm 78 lá bài, sử dụng loại giấy 350gsm được mạ vàng cạnh cực kỳ cứng cáp, đem lại một trải nghiệm hoàn hảo cho người dùng.', NULL, N'/DataImage/images/Tarot-BaiHiem/Anima-Mundi-Tarot.jpg', NULL, CAST(1100000 AS Decimal(18, 0)), 0, NULL, NULL, CAST(N'2021-05-09' AS Date), NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (40, 2, 7, N'Dark Mansion Tarot', N'Bao gồm: 79 Lá bài', N'Dark Mansion Tarot là một tựa bài cực kỳ đặc biệt lấy cảm hứng từ những nhân vật trong tòa lâu đài đen tối. Mỗi lá bài được thể hiện rõ ràng tất cả những hình ảnh trong một khung cảnh nào đó của tòa lâu đài. Bộ bài được vẽ bởi Magdelena Kaczan – một họa sĩ tài ba người Phần Lan. Với đường nét nghệ thuật theo phong cách hoạt hình, ẩn giấu trong đó là chút đen tối, huyền bí, bộ bài thật sự đã đem lại một nguồn cảm hứng mới cho những người xem bài trên khắp thế giới. Tất cả mọi thứ từ màu sắc, khung viền, thần thái của các nhân vật, hoàn cảnh trong bộ bài đều được diễn đạt rất xuất sắc, bộ bài xứng đáng được nằm trong danh sách những bộ bài Tarot đẹp nhất trong những năm gần đây.

Bộ bài Dark Mansion Tarot theo chuẩn Rider Waite Tarot giúp cho bộ bài trở nên dễ sử dụng hơn với những người mới bắt đầu với bộ môn Tarot. Bộ bài bao gồm 79 lá bài kích thước chuẩn 7 x 12 cm, cạnh bài được mạ đen giúp bộ bài toát lên vẻ huyền bí. Toàn bộ bộ bài được đóng trong một hộp giấy rất đẹp!', NULL, N'/DataImage/images/Tarot-BaiHiem/Dark-Mansion-Tarot.jpg', NULL, CAST(1600000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (41, 2, 7, N'Blue Birds Tarot', N'Bao gồm: 22 Lá bài', N'Tựa bài 22 lá sáng tác bởi hai họa sĩ người Nhật Bản, Tadahiko Kawaguchi và Mikami Maki khắc họa phong cách hình ảnh huyền bí siêu thực dựa trên nhiều lĩnh vực, và kết hợp giữa nghệ thuật của phương Đông và phương Tây. Thông qua màu sắc và thần thái dựa, hình mẫu các nhân vật trên 22 lá bài được mô tả khéo léo và giàu ý nghĩa, ví dụ The Empress nữ tính và dồi dào sức sống, trong khi The Devil làm liên tưởng mạnh mẽ đến sự sa ngã, buông xuôi. Phong cách siêu thực biến Blue Birds Tarot trở thành tựa bài tự do và thoáng trong giải nghĩa, và do đó sẽ là một lựa chọn tuyệt vời dành cho những reader chuyên nghiệp hay bất cứ ai muốn trải nghiệm một cảm giác mới mẻ và không bó buộc với Tarot.', NULL, N'/DataImage/images/Tarot-BaiHiem/Blue-Birds-Tarot.jpg', NULL, CAST(1000000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (42, 2, 7, N'BlueDogRose Tarot', N'Bao gồm: 78 Lá bài', N'BlueDogRose Tarot là một tựa bài khác của Nakisha VanderHoeven về chủ đề động vật. Các loại động vật xuất hiện trong bộ bài này là những loài sống hoặc được nuôi trong môi trường gia đình, như cá, chim, mèo nhà, chó nhà… Những hình ảnh gần gũi, đời thường mô tả đầy đủ những biểu hiệu, cung bậc cảm xúc, thói quen đặc trưng của từng loài và vẫn căn theo chuẩn bài Rider Waite Smith, giúp bộ bài trở thành một lựa chọn hoàn hảo cho những ai muốn tìm kiếm một bộ bài nhẹ nhàng, gần gũi và dễ sử dụng, đặc biệt là những ai yêu mến các loài động vật gia đình.', NULL, N'/DataImage/images/Tarot-BaiHiem/Blue-Dog-Rose-Tarot.jpg', NULL, CAST(900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (43, 2, 7, N'Enchanted Tarot – Anniversary Edition', N'Bao gồm: 78 Lá bài + Sách hướng dẫn lớn', N'Bộ bài Enchanted Tarot – Anniversary Edition là phiên bản kỷ niệm lần thứ 25 của bộ bài kể từ lần phát hành đầu tiên năm 1992. Bộ bài hiện đã bán được hơn 250,000 bản và được dịch ra 14 ngôn ngữ trên toàn thế giới. Bộ bài Enchanted Tarot dành cho những ai yêu thích những điều kỳ ảo, những câu chuyện thần tiên. Trải nghiệm 78 lá bài của The Enchanted Tarot cũng là trải nghiệm một hành trình tìm đến điều huyền diệu. Từng chi tiết trên mỗi lá bài được chăm chút kỹ lưỡng với phong cách thiết kế trên vải đầy tài hoa của Amy Zerner, tạo thành một công cụ để tự vấn và tìm kiếm câu trả lời hiệu quả, làm cho tâm hồn ta tỏa sáng từ sâu bên trong và tìm thấy con đường đến với Giác Ngộ. Sách hướng dẫn đi kèm bộ bài cung cấp nội dung ý nghĩa từng lá bài cùng những thông tin, lời khuyên hữu ích về cách giải bài, một số trải bài phù hợp.

Bộ bài Enchanted Tarot – Anniversary Edition được đóng trong một hộp giấy rất cầu kỳ. Lá bài được mạ chi tiết như những bức tranh thêu bằng chỉ vàng.', NULL, N'/DataImage/images/Tarot-BaiHiem/Enchanted-Tarot-Anniversary-Edition-Tarot.jpg', NULL, CAST(900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (44, 2, 1, N'First Tarot', N'Bao gồm: 22 Lá bài + Sách hướng dẫn', N'Đúng với tên gọi, tông màu sáng và phong cách hình ảnh có phần đơn giản của First Tarot khiến cho bộ bài này dễ dàng được liên tưởng đến sự dễ hiểu, và phù hợp cho người mới bắt đầu tiếp cận với Tarot. Cũng giống như nhiều bộ bài từ Nhật Bản khác, First Tarot chỉ gồm 22 lá ẩn chính. Hệ thống biểu tượng của First Tarot được xây dựng dựa theo chuẩn bài truyền thống Rider Waite Smith, với sách hướng dẫn (tiếng Nhật) trình bày chi tiết ý nghĩa từng lá bài. First Tarot toát lên sự tích cực và tươi sáng, vì vậy bộ bài này sẽ phù hợp với việc đưa ra định hướng và lời khuyên cho những vấn đề gây “đau đầu”. Với rất nhiều tài liệu về Rider Waite Smith sẵn có, bạn sẽ không quá khó khăn trong việc tìm hiểu ý nghĩa các lá bài của First Tarot.', NULL, N'/DataImage/images/Tarot-BaiHiem/First-Tarot.jpg', NULL, CAST(1000000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (45, 2, 7, N'Japanese Folklore Festival Tarot', N'Bao gồm: 22 Lá bài', N'Là một trong những cái nôi văn hóa phương Đông, kho tàng những câu chuyện truyền thuyết và dân gian của Nhật Bản là rất lớn. Japanese Folklore Festival Tarot là tựa bài lấy cảm hứng từ những câu chuyện này, trong không khí lễ hội mùa hè truyền thống đặc trưng của quốc gia này. Cũng như hầu hết tựa bài từ Nhật Bản khác, Japanese Folklore Festival Tarot chỉ gồm 22 lá ẩn chính nhưng được thiết kế chỉn chu, đẹp mắt. Những nhân vật trong bộ bài mặc dù vẫn được xây dựng theo chuẩn bài truyền thống Rider Waite Smith, nhưng được thay thế bằng các nhân vật tương ứng trong những câu chuyện thần thoại của Nhật Bản, ví dụ như Amenouzume đại diện cho The Magician, Himiki hóa thân thành The Empress… Nếu yêu thích những bộ bài mang màu sắc phương Đông huyền bí, thì Japanese Folklore Festival Tarot là bộ bài dành cho bạn.', NULL, N'/DataImage/images/Tarot-BaiHiem/Japanese-Folklore-Festival-Tarot.jpg', NULL, CAST(1000000 AS Decimal(18, 0)), 0, NULL, NULL, CAST(N'2021-05-09' AS Date), NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (46, 2, 7, N'Japanese Folklore Tarot', N'Bao gồm: 22 Lá bài', N'Là một trong những cái nôi văn hóa phương Đông, kho tàng những câu chuyện truyền thuyết và dân gian của Nhật Bản là rất lớn. Japanese Folklore Tarot là tựa bài lấy cảm hứng từ những câu chuyện này. Cũng như hầu hết tựa bài từ Nhật Bản khác, Japanese Folklore Tarot chỉ gồm 22 lá ẩn chính nhưng được thiết kế chỉn chu, đẹp mắt. Những nhân vật trong bộ bài mặc dù vẫn được xây dựng theo chuẩn bài truyền thống Rider Waite Smith, nhưng được thay thế bằng các nhân vật tương ứng trong những câu chuyện thần thoại của Nhật Bản, ví dụ như Amenouzume đại diện cho The Magician, Himiki hóa thân thành The Empress… Japanese Myth Tarot là một cách truyền tải văn hóa Nhật Bản thông minh khác của người nhật, bên cạnh manga, anime và những lễ hội dân gian. Nếu yêu thích những bộ bài mang màu sắc phương Đông huyền bí, thì Japanese Folklore Tarot là bộ bài dành cho bạn.', NULL, N'/DataImage/images/Tarot-BaiHiem/Japanese-Folklore-Tarot.jpg', NULL, CAST(1000000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (47, 2, 7, N'Lunatic Tarot', N'Bao gồm: 80 Lá bài + 2 Lá Evan Yi Feng + Sách hướng dẫn', N'The Lunatic Tarot là bộ bài gốc Châu Á của họa sĩ Evan Lee gồm 78 lá bài với hình ảnh các nhân vật tả thực đầy nghệ thuật và mềm mại trên nền tông màu ngả nâu vàng. Hình ảnh các lá bài tương ứng theo chuẩn Rider Waite Smith. Lunatic Tarot khắc họa hình ảnh của các cô gái trẻ có nét mặt ngây thơ, những chàng trai quý phái và kể cả những hình ảnh khá gợi cảm của cả hai phái. Trong làn sương mờ ảo, có đôi chút trầm buồn, hình ảnh các nhân vật ẩn hiện vừa lôi cuốn lại phần nào khiến người khác phải ngại ngần khi tiếp xúc, nhưng sau cùng thì ít ai có thể thoát được sức hút khó cưỡng đó.

Phiên bản size chuẩn và có tên lá bài in bằng 3 ngôn ngữ: tiếng Anh, tiếng Nga và tiếng Hoa.', NULL, N'/DataImage/images/Tarot-BaiHiem/Lunatic-Tarot.jpg', NULL, CAST(1600000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (48, 2, 4, N'Minchiate Etruria (Limited Edition)', N'Bao gồm: 97 Lá Bài + Sách hướng dẫn nhỏ', N'Minchiate Etruria là bộ bài thứ ba trong series bài cổ Anima Antiqua series (Ancient soul series) của nhà xuất bản Lo Scarabeo (Ý). Đây là phiên bản tiền thân của tarot hiện đại và được xem là một trong những bộ bài đầu tiên từng kết hợp cả chiêm tinh học trong hệ thống luận giải. Gồm 97 lá bài được tái tạo lại từ các bản vẽ của bộ bài gốc lần đầu xuất hiện ở Florence (Ý) những năm 1800. Bề mặt các lá bài được thiết kế và hoàn thiện theo kiểu cũ, không cán màng để lưu giữ trọn vẹn sự hoài cổ khi cầm bộ bài trên tay. Cùng với các tựa bài khác cùng series là Tarot Egyptiens và Tarocchino Mitelli, Minchiate Etruria xứng đáng có mặt trong bộ sưu tập của bất cứ ai.', NULL, N'/DataImage/images/Tarot-BaiHiem/Minchiate-Etruria-Tarot.jpg', NULL, CAST(900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (49, 2, 7, N'Neon Moon Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn nhỏ', N'Bộ bài Neon Moon Tarot lấy bối cảnh thế giới ảo tương lai nhưng các nguyên mẫu và chủ đề vẫn nằm trong khuôn khổ Rider Waite Smith. Hình ảnh lá bài dùng gam màu hồng dạ quang, kích thích mạnh mẽ trực giác của bạn khi thực hiện giải bài. Trong thế giới ảo của tương lai, bạn sẽ thấy tương tác cuộc sống thật ít ỏi, thay vào đó là công nghệ cao (high-tech, low-life), AI, cyborgs.

Các bộ ẩn phụ được thay đổi cùng với các lá bài hoàng gia để phản ánh tốt hơn chủ đề của bộ bài này:

Swords thành Arms
Wands thành Wires
Cups thành Vials
Pentacles thành Zent
Page thành Apprentice
Knight thành Agent
Queen thành Supervisor
King thành Executive', NULL, N'/DataImage/images/Tarot-BaiHiem/Neon-Moon-Tarot.jpg', NULL, CAST(1100000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (50, 2, 7, N'Seventh Sphere Tarot de Marseille', N'Bao gồm: 78 lá bài', N'Bộ bài Seventh Sphere Tarot de Marseille theo phong cách hiện đại với các chi tiết trên bề mặt lá bài được mạ màu vàng hồng (rose gold), và hình ảnh được phối màu rực rỡ in trên chất liệu nhựa. Bộ bài được khuyến khích dùng kết hợp với Seventh Sphere Lenormand deck.

Trong thế giới mới, bộ bài Tarot điển hình nhất được biết đến là Rider Waite Smith Tarot, với rất nhiều phiên bản khác nhau được tạo ra dựa theo chuẩn này. Các bộ bài chuẩn Rider Waite Smith được thiết kế cho mục đích bói toán, và hình ảnh lá bài là phản chiếu của những nguyên mẫu này – vốn được mã hoá bằng hệ thống biểu tượng huyền học. Tuy nhiên, trước đó rất lâu đã tồn tại một chuẩn bài cơ bản hơn được sử dụng rất phổ biến tại Châu Âu – được biết với tên Tarot de Marseille. Bắt đầu như một trò chơi bài, bộ ẩn phụ bên trong Tarot de Marseille phản ánh các nguyên mẫu không dựa trên hình ảnh, mà thay vào đó là bản năng của bạn, vốn hiểu biết của bạn về các bộ ẩn và nguyên tố, cũng như kiến thức về số học.

Việc giải bài với chuẩn Tarot de Marseille do đó mang nhiều sắc thái cá nhân hơn là sử dụng một bộ bài chuẩn Rider Waite Smith.

Tương tự các bộ bài được phát hành bởi Labyrinthos Academy, bộ bài Seventh Sphere Tarot de Marseille không kèm theo sách, thay vào đó là ứng dụng hướng dẫn sử dụng cùng tên trên Appstore (iOS) và Play Store (Android). ', NULL, N'/DataImage/images/Tarot-BaiHiem/Seventh-Sphere-Tarot-de-Marseille-Tarot.jpg', NULL, CAST(1400000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (51, 2, 7, N'Starchild Tarot', N'Bao gồm: 79 Lá bài + Sách hướng dẫn', N'Bộ bài Starchild Tarot của họa sĩ Danielle Noel được xem là một sự bất ngờ ngoài mong đợi dành cho cộng đồng, với phong cách độc đáo và gợi ý nghĩa sâu sắc. Mô phỏng bầu trời, thiên hà và những vì sao dựa trên những quan điểm về chiêm tinh, hình học cổ xưa, Starchild Tarot như một “làn gió mát” giữa hàng loạt những tựa bài Tarot xuất sắc khác khi gợi lên cho người dùng cảm giác bay bổng, êm dịu và nhẹ nhàng. Bộ bài được đánh giá cao ở khía cạnh ứng dụng chữa lành tâm hồn, suy niệm và phản ánh bản thân. Những tông màu rực rỡ trên các lá bài được phủ lên một lớp màu retro trắng sáng cổ điển, biến Starchild Tarot trở thành lựa chọn tuyệt vời cho những ai muốn tìm kiếm một bộ bài Tarot với chủ đề tích cực, tươi sáng và giàu ý nghĩa.', NULL, N'/DataImage/images/Tarot-BaiHiem/StarChild-Tarot.jpg', NULL, CAST(1300000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (52, 2, 7, N'Tarat Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'TaRat Tarot là một bộ bài kích cỡ nhỏ dễ thương, được vẽ bằng màu nước, vẽ về những chú chuột trắng như những nhân vật Tarot. Phong cách bài tương tự với bộ bài trước đó, Rabbit Tarot của cùng tác giả Nakisha.', NULL, N'/DataImage/images/Tarot-BaiHiem/Tarat-Tarot.jpg', NULL, CAST(900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (53, 2, 7, N'Tarot Cat-Rot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Tarot Cat-Rot là bộ bài tự phát hành của nữ họa sĩ người Bỉ, được in thủ công và phát hành giới hạn bởi chính tác giả.

Tarot Cat-Rot là một thế giới đầy sắc màu ngộ nghĩnh của chú mèo Pookie và những người bạn đáng yêu của chú. Hình ảnh của Pookie được Maria lấy cảm hứng từ chú mèo Ba tư của cô, với khuôn mặt không biểu cảm và đôi lông mày luôn nhếch lên tạo cho chú một vẻ ngây thơ hiền lành.

Bộ bài theo chuẩn Rider Waite Smith truyền thống. Với tông nền màu xanh ngọc mát dịu, hoa lá đơn giản, cùng những biểu hiện cảm xúc đáng yêu của Pookie, bộ bài Cat-rot Tarot luôn mang đến cho người đọc một cảm giác nhẹ nhàng, thanh bình dù trải bài có xuất hiện những lá bài tiêu cực như The Tower hay 10 of Swords đi chăng nữa.', NULL, N'/DataImage/images/Tarot-BaiHiem/Tarot-Cat-Rot.jpg', NULL, CAST(900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (54, 2, 7, N'Tarot Decoratif', N'Bao gồm: 78 Lá bài + Sách hướng dẫn + Túi', N'Là xuất phẩm mới nhất của họa sĩ Tarot chuyên phong cách digital huyền thoại Ciro Marchetti, bộ bài Tarot Decoratif được phát hành giới hạn và được nhắm đến những người sưu tầm. Cũng như nhiều bộ bài khác cùng tác giả như Tarot of Dreams, Legacy of the Divine Tarot hay The Gilded Tarot, Tarot Decoratif khắc họa một thế giới đa màu sắc, rực rỡ ánh sáng và có chiều sâu, đặc biệt nổi trội là câu chuyện mà tác giả muốn truyền tải. Bộ bài được thiết kế theo chuẩn Marseilles kết hợp với Rider Waite Smith, với hình ảnh 22 lá ẩn chính được chọn lựa và khắc họa kỹ lưỡng dựa trên hàng trăm nguồn tham khảo. Chỉ cần đã từng tiếp xúc với một trong hai chuẩn bài này trước đây, bất kỳ ai cũng có thể tìm thấy mối liên kết dễ dàng với Tarot Decoratif. Bộ bài đi kèm với một file hướng dẫn định dạng pdf, và túi đựng thiết kế riêng. Với đẳng cấp của tác giả và sức quyến rũ của artwork bộ bài, Tarot Decoratif xứng đáng xuất hiện trong bộ sưu tập của bất kỳ ai. Hãy nhanh tay khi bạn còn có thể sở hữu!', NULL, N'/DataImage/images/Tarot-BaiHiem/Tarot-Decoratif-Tarot.jpg', NULL, CAST(2200000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (55, 2, 7, N'Tarot of Japanese Fairy Tales', N'Bao gồm: 78 Lá bài + Sách hướng dẫn (tiếng Nhật)', N'Khi nhắc đến thế giới những câu chuyện cổ tích, thần thoại phong phú trên thế giới, không thể bỏ qua Nhật Bản. Khác với dạng cổ tích phương Tây, cổ tích Nhật Bản giàu đậm màu sắc huyền bí, tâm linh và bí ẩn hơn hẳn. Tarot of Japanese Fairy Tales được xây dựng mô phỏng theo những câu chuyện quen thuộc đó của đất nước mặt trời mọc. Bộ bài có hệ thống hình ảnh dựa theo cấu trúc của Rider Waite Smith, với những biến thể độc đáo phù hợp với nội dung từng câu chuyện cũng như trí tưởng tượng của tác giả. Nếu đã từng đọc qua truyện tranh Nhật hay tìm hiểu về nền văn hóa, lịch sử và dân gian của Nhật Bản, bạn có thể nhanh chóng nhận ra ý nghĩa của từng lá bài. Tarot of Japanese Fairy Tales có phiên bản kèm sách companion chi tiết và bản kèm sách booklet rút gọn (tiếng Nhật).', NULL, N'/DataImage/images/Tarot-BaiHiem/Tarot-of-Japanese-Fairy-Tales.jpg', NULL, CAST(1400000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (56, 2, 7, N'Victorian Romantic Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn nhỏ', N'Bộ bài Victorian Romantic Tarot là một trong những bộ bài đẹp nhất và đáng sử dụng nhất, vốn danh tiếng đến từ phong cách nghệ thuật, khả năng dễ cảm thụ và chiều sâu ý nghĩa của hình ảnh. Bộ bài được xuất bản lần đầu vào năm 2006 ấn tượng với giải “Deck of the Year” do cộng đồng Aeclectic Tarot Forum bầu chọn. Phiên bản thứ ba của bộ bài này được mạ vàng các chi tiết trên bề mặt lá bài một cách rất tinh xảo và sang trọng.

Các thay đổi chính ở bộ bài Victorian Romantic Tarot third edition này:

– HAI lá bài The Devil, gồm một Devil “rất đáng yêu” và một lá Devil “quyến rũ” mới dựa trên hình ảnh của danh hoạ Albert Maignan.

– HAI lá bài Lovers, đây là truyền thống của NXB Baba Studio khi kèm các phiên bản lá Lovers của phiên bản trước vào phiên bản mới nhất, gồm một lá Lovers từ tranh của Dante và Beatrice, và một lá Lovers mới dựa trên hình ảnh của danh hoạ Hans Makart. Đây là một lá bài rất truyền cảm hứng, với một cặp đôi đang quấn vào nhau!

Bộ bài Victorian Romantic Tarot là công trình tái dựng lại các bức tranh nghệ thuật thời Victoria thế kỷ XIX, các bức tranh này được chọn lọc để tự kể câu chuyện của mình, khơi gợi được trực giác của người đọc bài trong một phiên trải bài.', NULL, N'/DataImage/images/Tarot-BaiHiem/Victorian-Romantic-Tarot.jpg', NULL, CAST(1900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (57, 2, 6, N'Winged Spirit Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Hình tượng các linh hồn mang đôi cánh trên lưng đóng vai trò như những sứ giả truyền tin của thượng đế luôn là một đề tài cổ xưa nhưng chưa bao giờ lỗi thời khi đã xuất hiện trong rất nhiều sách vở, câu chuyện từ đời này sang đời khác. Nhiều tôn giáo nói về các linh hồn này như những thiên thần kết nối giữa thực tế và hư không. Winged Spirit Tarot là tựa bài khắc họa vẻ đẹp hoàn mỹ lẫn sự bí ẩn của các thiên thần nói chung và những linh hồn mang đôi cánh nói riêng. Các nhân vật trong 78 lá bài dưới nét vẽ theo phong cách Tân cổ điển (Neoclassic) của David Sexton trong hình hài và hành động như những nhân vật trong hệ thống hình ảnh và biểu tượng của Tarot truyền thống trở nên thật nổi bật và sống động trên phông nền xám trắng. Bộ bài toát lên một không khí vừa bí ẩn, vừa đẹp lại vừa có chút gì đó đáng sợ. Sách booklet đi kèm cung cấp những thông tin chi tiết về ý nghĩa mỗi lá bài và đem đến một số kiến thức về các câu chuyện truyền thuyết, thần thoại… liên quan đến hình ảnh các lá bài.', NULL, N'/DataImage/images/Tarot-BaiHiem/Winged-Spirit-Tarot.jpg', NULL, CAST(1000000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (58, 2, 3, N'Bonefire Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Cùng bước vào cuộc hành trình thú vị thông qua 78 lá bài Bonefire Tarot được vẽ tay một cách sinh động và rực rỡ lấy cảm hứng từ những hình xăm trường phái cổ xưa của Sailor Jerry Collins. Bộ bài theo truyền thống Rider Waite Smith và cuốn sách hướng dẫn đi kèm theo phong cách dành cho những con người muốn nghiêm túc dấn thân khám phá cuộc sống. Sách miêu tả những biểu tượng và từ khoá quan trọng một cách trực quan, để bạn có thể xem bài được bằng trực giác và giác ngộ được hành trình của riêng mình.

Bộ bài Bonefire Tarot được trang bị để giải quyết bất kỳ vấn đề gì – thế giới vi mô đến vũ trụ vĩ mô – các lá Ẩn Chính mô tả những nhân vật nguyên mẫu đóng vai trò quan trọng trong cuộc sống chúng ta như những khía cạnh của chính bản thân chúng ta hoặc những tình huống mà chúng ta buộc phải đối mặt. Những lá Ẩn Phụ cho chúng ta những cái nhìn riêng liên quan đến chi tiết của cuộc sống. Cùng với giải nghĩa chi tiết về biểu tượng, sách cũng bao gồm ba trải bài đơn giản, và hướng dẫn cách sử dụng bộ bài. Bộ bài Bonefire Tarot hé lộ cho chúng ta những sự thật vĩnh cửu thông qua sự vô tận của Tarot.', NULL, N'/DataImage/images/Tarot-BaiLa/Bonefire-Tarot.jpg', NULL, CAST(1000000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (59, 2, 4, N'Color Your Tarot', N'Bao gồm: 22 Lá bài', N'Mọi người khắp nơi đang cảm thấy thư giãn và niềm vui từ hoạt động tô màu tranh. Bộ bài Color Your Tarot 22 lá Ẩn Chính của Rider Waite được thiết kế dùng để tô màu được, bạn có thể tô màu hoặc trang trí các lá bài theo cách của bạn. Hành động tô màu là cách tuyệt vời để học tập và tiếp thu các biểu tượng truyền thống của tarot trong trạng thái sáng tạo và thiền định của tâm trí. Hãy để tính cách trẻ thơ của bạn trỗi dậy và cái tôi cao (Higher Self) của bạn hướng dẫn bạn đến một trải nghiệm tarot ấn tượng khó có thể quên được.', NULL, N'/DataImage/images/Tarot-BaiLa/Color-Your-Tarot.jpg', NULL, CAST(700000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (60, 2, 7, N'Corona Tarot', N'Bao gồm: 78 lá bài', N'Corona Tarot của Steve Speer khắc họa lại bức tranh toàn cảnh về đại dịch lớn nhất trong năm 2020 – đại dịch virus Corona vẫn đang gây ảnh hưởng đáng sợ đến thế giới. Mặc dù ở Việt Nam, có thể bạn không thấy rõ mức độ nguy hiểm của dịch nhưng ở nước ngoài, các ca nhiễm ngày một tăng lên và vẫn chưa có dấu hiệu giảm xuống. Nhiệm vụ của bộ bài này cũng là một thông điệp truyền đạt đến chúng ta trong việc phòng chống dịch bệnh, đồng thời lên án và châm biếm những vấn đề thuộc về kinh tế – chính trị của nước Mỹ trong thời điểm dịch bệnh. 

Hãy hiểu rằng đây không phải là một bộ bài dành cho những ai đang quá nghiêm túc với vấn đề dịch bệnh, vì có thể bạn sẽ cảm thấy khó chịu với những sự thật quá đỗi trần trụi mà Steve Speer vạch trần. Corona Tarot thật sự là một bộ bài mang tính thời sự, lại có bước tiến đột phá mạnh mẽ khỏi những giới hạn thông thường, ở đó không còn là những khuôn khổ giả dối mà chỉ có sự thật, sự thật và sự thật. Tuy nhiên, bộ bài không hẳn là để phê phán mà nó còn thể hiện những mặt tốt đẹp về tình yêu thương, đùm bọc lẫn nhau giữa con người trong mùa dịch, cách để phòng dịch và những góc nhìn tích cực nhất mà không phải ai cũng hiểu hoàn toàn. Corona Tarot mang thông điệp đa chiều chứ không nghiêng về một bên nào cả, và bộ bài thật sự xứng đáng được vinh danh như một liều thuốc tinh thần bổ dưỡng dành cho các Tarot Reader giữa mùa đại dịch này. Bộ bài giữ nguyên hệ thống RWS giúp bạn dễ tiếp cận, đồng thời cũng là một cách hay để truyền đạt tư tưởng về dịch Corona. 

Bộ bài Corona Tarot bao gồm 79 lá bài (78 lá bài + 1 lá bài Fool Bonus) và sách hướng dẫn dạng file pdf: https://rb.gy/f2nprd. ', NULL, N'/DataImage/images/Tarot-BaiLa/Corona-Tarot.jpg', NULL, CAST(1300000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (61, 2, 4, N'Golden Tarot of Klimt – Pocket Edition', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Golden Tarot of Klimt phiên bản kích thước nhỏ 4.4 x 8 cm

Họa sĩ nổi tiếng người Áo Gustav Klimt rất nổi tiếng vào thế kỷ 20 với những tác phẩm hội họa theo phong cách hiện đại được đánh giá cao. Họa sĩ Atanassov – đồng tác giả của Golden Botticelli Tarot và Mantegna Tarot – đã lấy cảm hứng từ những tác phẩm của danh họa Gustav Klimt và tạo nên bộ bài Golden Tarot of Klimt đầy màu sắc, lộng lẫy và gợi cảm. Hình ảnh 78 lá bài có điểm nhấn là các mảng màu mosaic và những dải in vàng dập nổi tạo chiều sâu, mô tả tình yêu, cái chết, sự gợi cảm và cả tái sinh. Hệ thống kiến giải của bộ bài được căn cứ theo tiêu chuẩn Rider Waite Smith truyền thống. Đây là tựa bài dành cho bất cứ ai yêu thích nghệ thuật Châu Âu nói chung và phong cách hội họa của Gustav Klimt nói riêng.', NULL, N'/DataImage/images/Tarot-BaiLa/Golden-Tarot-of-Klimt-Pocket-Edition.jpg', NULL, CAST(550000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (62, 2, 1, N'Good Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Tác giả Colette Baron-Reid với hơn 30 năm kinh nghiệm xem bài Tarot, cô dùng bài truyền thống như một nguồn hướng dẫn trực giác. Nhưng giờ đây với bộ bài The Good Tarot, cô đã đưa vào chuẩn truyền thống một luồng gió mới, với những bộ Ẩn và ý nghĩa lá bài tập trung vào việc chuyển đổi và phát triển cá nhân.

Dựa trên hệ thống bói toán đã có cách đây từ nhiều thế kỷ, bộ bài The Good Tarot có cấu trúc tâm linh vừa đơn giản, vừa hiện đại, mang đến trang thái tích cực. 78 lá bài trong Good Tarot là những khía cạnh nguyên mẫu của trải nghiệm con người mà chúng ta bắt gặp trong chính bản thân mình, hoặc với những người khác. Các bộ ẩn của The Good Tarot là bốn nguyên tố, với Air (Khí) đại diện cho bộ Swords truyền thống, Water (Nước) thay thế cho bộ Cups, Earth cho bộ Pentacles, và cho Wands với Fire (Lửa). Một khác biệt đáng kể so với bộ bài Tarot truyền thống là các thông điệp của lá bài tất cả đều được viết như những câu khích lệ tích cực ở thì hiện tại, thay vì dự đoán tương lai, các hướng dẫn, hoặc cảnh báo. Người sử dụng bài đúng cách có thể hòa hợp dòng chảy năng lượng của mình một cách tức thời.

“Ai cũng đều muốn được hướng dẫn trong những lúc mông lung, như một tia sáng xuyên qua màn đêm tối. Bộ bài The Good Tarot đặc biệt hữu ích khi bạn cảm thấy hụt hẫng, mong muốn xác thực về phương hướng bạn đang đến, vốn liên quan đến những kết quả mà bạn đã lựa chọn, hoặc tìm kiếm hiểu biết lớn hơn trong hoàn cảnh của mình. Bộ bài giúp bạn nhận biết được nhiều dạng sự thật và thấy được ánh sáng lẫn trong bóng đêm để bạn có thể tỏa sáng hơn.” Colette', NULL, N'/DataImage/images/Tarot-BaiLa/Good-Tarot.jpg', NULL, CAST(800000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (63, 2, 7, N'Mathematics Tarot', N'Bao gồm: 81 Lá bài', N'Mathematics Tarot – Bộ bài kỳ diệu thông qua Toán và Vật Lý Học.

Bộ bài Mathematics Tarot được biên soạn từ thư viện tài liệu khổng lồ các công thức và biểu đồ toán, giải nghĩa các nguyên mẫu Tarot thông qua lăng kính toán học và vật lý học. Hình ảnh trên lá bài rất thoáng và giản dị, với một số chi tiết được minh hoạ màu sắc. Bộ bài Mathematics Tarot có kích thước bỏ túi (5 x 7 cm) nên dễ dàng xào bài với những đôi bàn tay nhỏ nhắn. Bộ bài gồm 78 lá tiêu chuẩn và 3 lá bổ sung thêm.

Bộ bài Mathematics Tarot thích hợp với những người đam mê Tarot và Toán học, và những nhà Toán học đang bị hấp dẫn bởi sự kỳ diệu của Tarot.', NULL, N'/DataImage/images/Tarot-BaiLa/Mathematics-Tarot.jpg', NULL, CAST(1100000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (64, 2, 3, N'Tarot Wheel', N'Bao gồm: Bàn xoay + Sách hướng dẫn', N'The Tarot Wheel: Hệ Thống Bói Toán Dễ Dàng và Nhanh Chóng
Bàn xoay Tarot Wheel – một phương tiện tiên tri mới lạ. Dựa theo kiến thức và các nguyên tắc từ chuẩn bài Rider Waite Tarot – một bộ bài lâu đời và phổ biến nhất trên thế giới, bàn xoay Tarot Wheel giúp cho việc giải Tarot trở nên dễ dàng, vui vẻ và thú vị hơn. Đặc biệt, phương tiện này phù hợp với mọi lứa tuổi và đem lại hiệu quả tương tự như một bộ bài Tarot thực thụ. Chỉ vài bước thực hiện đơn giản, quay bàn xoay và để số phận quyết định quân bài dành cho bạn. Chỉ cần tìm hiểu một số thông tin từ quân bài đó mà không cần phải nghiên cứu rườm rà. Hãy đặt từng câu hỏi và quay bàn xoay Tarot Wheel, kết hợp những thông tin bạn nhận được và bạn sẽ biết được câu trả lời dành cho mình là gì. ', NULL, N'/DataImage/images/Tarot-BaiLa/Tarot-Wheel.jpg', NULL, CAST(800000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (65, 2, 4, N'Universal Transparent Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Là tựa bài dựa theo Universal Tarot – phiên bản biến thể từ Rider-Waite Tarot của nhà xuất bản Lo Scarabeo, Universal Transparent Tarot đem đến cho người sử dụng một trải nghiệm hoàn toàn mới mẻ với lá bài bằng nhựa trong và cách sử dụng độc đáo. Bạn sẽ không phải bận tâm đến những nguyên tắc bất di bất dịch trong việc sử dụng Tarot truyền thống, vì trải bài của Universal Tarot yêu cầu người sử dụng phải chồng các lá bài lên nhau (tối đa 6 lá) để tạo thành một bức tranh khảm (mosaic), từ đó tìm ra những thông điệp về khát vọng, lựa chọn và hành vi của chính bản thân mình; do đó, sức sáng tạo của Universal Transparent Tarot luôn là vô hạn. Hãy tự xây dựng nên cuộc hành trình khám phá bản thân của chính mình, chiêm nghiệm quá khứ, biến đổi hiện tại, và xây dựng tương lai theo ý bạn mong muốn. Bộ bài do tác giả Roberto de Angelis sáng tạo theo cảm hứng từ bộ bài bằng nhựa nổi tiếng nhất thế giới là Transparent Tarot, và đi kèm booklet hướng dẫn.', NULL, N'/DataImage/images/Tarot-BaiLa/Universal-Transparent-Tarot.jpg', NULL, CAST(750000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (66, 2, 4, N'Vice Versa Tarot Kit', N'Bao gồm: 78 Lá bài + Sách hướng dẫn lớn', N'Ý tưởng sáng tạo về hình ảnh bài Tarot dựa trên những khoảnh khắc, diễn biến và góc nhìn khác của từng lá bài theo Rider Waite Smith hiện đã không còn quá xa lạ, với những đại diện như bộ bài After Tarot, Tarot of the New Visions… Vice Versa Tarot cũng là một tựa bài vô cùng sáng tạo khi không thể hiện một mặt sau cố định, mà khắc họa hình ảnh cả hai mặt của mỗi lá bài, mô phỏng hai góc nhìn trước và sau trong cùng một lá bài. Ý tưởng táo bạo này làm cho Vice Versa Tarot trở thành bộ bài đậm chất mới mẻ, phá cách và giàu ý nghĩa.

Với phong cách “hai trong một” như hai mặt của một đồng tin, 78 lá bài Vice Versa Tarot sẽ gợi lên nhiều hướng suy luận cho người dùng hơn hẳn một bộ bài thông thường, với năng lượng giống như sự hòa quyện giữa ngày và đêm. Bộ bài có sách companion đi kèm, mô tả rõ ràng câu chuyện liên quan đến từng lá bài.', NULL, N'/DataImage/images/Tarot-BaiLa/Viceversa-Tarot.jpg', NULL, CAST(850000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (67, 2, 6, N'Zolar’s Astrological Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Một bộ bài 4 in 1 bao gồm 56 lá bài theo chuẩn Rider Waite Smith. 22 lá bài Ẩn Chính và 32 biểu tượng chiêm tinh xuất hiện ở mỗi mặt của lá bài, ở mặt ngược lại gồm 56 lá bài Ẩn Phụ. Bộ bài Zolar’s Astrological Tarot cũng bao gồm những biểu tượng bài Tây dùng để chơi.', NULL, N'/DataImage/images/Tarot-BaiLa/Zolars-Astrological-Tarot.jpg', NULL, CAST(650000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (68, 2, 5, N'Gilded Tarot Royale', N'Bao gồm: 78 Lá bài + Sách hướng dẫn nhỏ', N'Nếu bạn là một fan cuồng của tác giả kiêm họa sĩ Ciro Marchetti, chắc bạn cũng đã sử dụng qua bộ Gilded Tarot. Thật may mắn vì sau bao nhiêu năm tháng, tác giả Ciro Marchetti đã bán lại bản quyền bộ bài Gilded Tarot Royale – một phiên bản khác đặc biệt hơn của Gilded Tarot. Nếu như trước đây, phiên bản tự in của tác giả là bản có viền thì ở phiên bản của Llewellyn, bộ bài Gilded Tarot Royale được thiết kế không viền, nhìn khác biệt và đẹp đẽ hơn. Bộ bài đưa bạn vào thế giới diệu kỳ, mang đậm chất vừa cổ điển vừa hiện đại với nét vẽ vô cùng đặc trưng của Ciro – nét vẽ kỹ thuật số. Hãy tự khám phá chính mình thông qua những lá bài này nhé. 

Bộ bài Gilded Tarot Royale bao gồm 78 lá bài và sách hướng dẫn.', NULL, N'/DataImage/images/Tarot-Beginner/Gilded-Tarot-Royale-2-booklet.jpg', NULL, CAST(700000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (69, 2, 7, N'Good Karma Tarot', N'Bao gồm: 78 lá bài + Sách hướng dẫn', N'Dễ sử dụng, trực quan, thiết thực, toàn diện về mặt kiến thức và đặc biệt là truyền tải đến thông điệp cực kỳ tích cực, Good Karma Tarot sẽ đem đến cho bạn những trải nghiệm mang tính “tích đức”. Đúng với tên gọi, Good Karma Tarot là một “kim chỉ nam” dành cho những ai muốn luyện tập và thực hành Tarot căn bản. Bạn sẽ được chỉ dẫn để lắng nghe bản chất lương thiện, trong sạch của mình kêu gọi bạn sống một cuộc sống tích cực, tươi đẹp và hạnh phúc. Khi đó, bạn sẽ thu hút những người/điều tốt đẹp và “tích đức” thật nhiều, tận hưởng một cuộc sống hoàn hảo do chính bạn tạo ra. Hãy để những năng lượng tích cực được lan tỏa để bạn làm thật nhiều việc tốt, góp phần giúp ích cho đời nhé.

Bộ bài Good Karma Tarot bao gồm 78 lá bài và sách hướng dẫn 128 trang. ', NULL, N'/DataImage/images/Tarot-Beginner/Good-Karma-Tarot.jpg', NULL, CAST(850000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (70, 2, 4, N'Heaven and Earth Tarot Kit', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Muốn tạo nên một bộ bài Tarot độc đáo, ý tưởng mới mẻ vượt qua hệ tiêu chuẩn chưa hẳn là một cách hay vì nếu quá khó để tiếp cận, sẽ không thể thu hút được người dùng. Họa sĩ Jack Sephiroth hiểu rõ về vấn đề này, nên đã chọn hướng đi an toàn đó là tạo nên một bộ bài hoàn toàn theo chuẩn Rider Waite Smith cơ bản, nhưng lại tập trung đầu tư thật chỉnh chu vào đồ họa.

Heaven and Earth Tarot vẫn như những tựa bài Tarot khác, vẫn cực kỳ dễ tiếp cận, dành cho mọi đối tượng, dù bạn có là người mới bắt đầu, đã sử dụng lâu hoặc muốn sưu tầm, bộ bài này luôn luôn là lựa chọn hoàn hảo. Tuy nhiên, điểm đặc biệt ở Heaven and Earth Tarot chính là nét đồ họa quá đỗi xuất sắc, tạo nên cảm giác hùng vĩ, nội lực và nâng cấp giá trị của bộ bài lên một tầm cao mới. Khi nhìn vào Heaven and Earth Tarot, bạn sẽ cảm giác như bước vào thế giới thần thoại, nét vẽ vừa chi tiết vừa huyền ảo sẽ đem lại cho bạn hứng thú muốn khám phá tất cả tri thức trong bộ bài. Ngoài ra, bộ bài còn vận dụng các kiến thức về chiêm tinh, Kabbalah và nguyên tố sẽ giúp bạn mở rộng kiến thức ngoài Tarot.

Bộ bài Heaven and Earth Tarot Kit bao gồm 78 lá bài và sách hướng dẫn lớn. ', NULL, N'/DataImage/images/Tarot-Beginner/Heaven-and-Earth-Tarot-Kit.jpg', NULL, CAST(900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (71, 2, 6, N' RWS Tarot', N'Bao gồm: 78 lá bài + Sách hướng dẫn', N'RWS Tarot Deck là phiên bản tiếp theo thuộc hệ thống Rider Waite Tarot, sử dụng bảng màu phối với tông nhẹ nhàng, tinh tế cùng với viền trắng ngà tao nhã. Vẫn giữ nguyên bản vẽ của họa sĩ Pamela từ năm 1909, mặt sau được thiết kế với biểu tượng của Magician cùng với 4 nguyên tố đối xứng có thể cho bạn xào bài xuôi ngược. Mọi chi tiết đều được giữ nguyên với bản vẽ gốc nhằm bảo tồn nét nghệ thuật của họa sĩ. 

RWS Tarot Deck là một tựa bài cổ điển và có lẽ là bộ bài được biết đến nhiều nhất trong thế giới Tarot nói chung và phương Tây nói riêng. Đây được xem là bộ bài định nghĩa lại tiêu chuẩn của bài Tarot cũng như trở thành chuẩn mực cho trên 90% bộ bài Tarot đang lưu hành hiện tại với đặc trưng khác biệt so với chuẩn bài Marseilles trước đó là toàn bộ 78 lá bài đều được vẽ hình. Nữ họa sĩ Pamela Colman-Smith là người khắc họa nên 78 lá bài dựa trên hệ thống phân tích ý nghĩa và sự ủy nhiệm của Arthur Edward Waite – người khai sinh ra chuẩn bài Rider Waite Smith. RWS Tarot Deck là bộ bài dành cho mọi đối tượng sử dụng kể cả người mới học Tarot lẫn những reader chuyên nghiệp. Hầu hết reader chuyên nghiệp trên thế giới đều cho rằng bất cứ ai tìm hiểu về Tarot cũng đều phải sở hữu một bộ bài RWS Tarot Deck hoặc một trong các biến thể của bộ bài này. Bộ bài đi kèm sách booklet rút gọn từ cuốn sách Pictorial Key to Tarot của Arthur Edward Waite – được xem là cuốn sách chuyên sâu về Tarot đầu tiên trên thế giới; ngoài ra người dùng có thể dễ dàng tìm thấy hàng trăm đầu sách khác về bộ bài RWS Tarot Deck và chuẩn bài truyền thống Rider Waite Smith trên thị trường.

Bộ bài RWS Tarot Deck bao gồm 78 lá bài và sách hướng dẫn nhỏ (booklet) 36 trang.', NULL, N'/DataImage/images/Tarot-Beginner/RWS-Tarot.jpg', NULL, CAST(650000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (72, 2, 7, N'Seventh Sphere Rider Waite Smith Tarot', N'Bao gồm: 78 lá bài + Tờ giấy hướng dẫn', N'Bộ bài Seventh Sphere Rider Waite Smith Tarot là tựa bài tiếp nối thành công từ phiên bản cùng tên nhưng lần này, phong cách của bộ bài lại chọn theo hệ chuẩn Rider Waite Smith – dành cho mọi đối tượng muốn học Tarot căn bản với thiết kế đậm nét hiện đại. Với phong cách in mạ chi tiết trên bề mặt lá bài lẫn cạnh bài được mạ xanh ngọc holographic, cộng thêm hình ảnh được phối màu rực rỡ in trên chất liệu nhựa, Seventh Sphere Rider Waite Smith Tarot sẽ là một bộ bài tuyệt vời cả lần hình thức lẫn chất lượng. 

Có thể nói hiện tại những bộ bài đến từ nhà sản xuất Labyrinthos đều cực kỳ hoàn hảo, từ chất liệu nhựa giúp cho lá bài trở nên cứng cáp hơn cho đến lớp mạ sang chảnh, nâng tầm đẳng cấp Reader. Seventh Sphere Rider Waite Smith Tarot không kèm theo sách, thay vào đó là ứng dụng hướng dẫn sử dụng cùng tên trên Appstore (iOS) và Play Store (Android).

Bộ bài Seventh Sphere Rider Waite Smith Tarot  bao gồm 78 lá bài và tờ giấy hướng dẫn nhỏ kèm trong hộp bài. ', NULL, N'/DataImage/images/Tarot-Beginner/Seventh-Sphere-Rider-Waite-Smith-Tarot.jpg', NULL, CAST(1400000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (73, 2, 6, N'Smith Waite Deluxe Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn.', N'Bộ bài Tarot đột phá về tính nghệ thuật và có khả năng chuyển đổi cao của Pamela Colman Smith với hình ảnh minh họa đầy đủ cho các lá bài Ẩn phụ được vẽ năm 1909 dưới sự hướng dẫn của Arthur Edward Waite. Bộ bài Smith Waite Tarot đã trở thành tiêu chuẩn cho hầu hết bộ bài đương đại. Phiên bản Smith Waite Deluxe Tarot số lượng giới hạn này thiết kế các lá bài mạ vàng cạnh, mặt sau lá bài dập nổi vàng các họa tiết hoa bách hợp với hình thoi cổ điển trên nền màu xanh lá, màu ưa thích của Pamela.

Đi kèm cùng bộ bài Smith Waite Deluxe Tarot này là một cuốn sách Magic and Meaning in the Smith-Waite Tarot 74 trang được mạ vàng cạnh trang sách, viết bởi Sasha Graham. Sasha mang đến một cách tiếp cận mới mẻ và hiện đại cho việc giải mã các biểu tượng huyền bí của Tarot. Cô đưa ra các lời khuyên dễ hiểu để phát triển các kỹ năng giải bài với những hướng dẫn hữu ích về cách đặt những câu hỏi. Những dòng mô tả sâu sắc và sống động của cô làm nổi bật sự kỳ diệu và tính biểu tượng của mỗi lá bài. Sách có những sơ đồ trải bài độc đáo cho việc đưa ra quyết định gồm trải Soulmate Spread, Chakra Spread, và Stairway Spreads.

Sasha Graham là tác giả của bộ bài Tarot of Haunted House và Dark Wood Tarot và những tựa sách về Tarot bao gồm Complete Book of the Rider-Waite-Smith Tarot, 365 Tarot Spreads, Tarot Fundamentals.', NULL, N'/DataImage/images/Tarot-Beginner/Smith-Waite-Deluxe-Tarot.jpg', NULL, CAST(1500000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (74, 2, 4, N'Tarot Illuminati Deck', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Bộ bài Tarot Illuminati Deck là một chuyến hành trình khai phá tìm đến sự khai sáng, giác ngộ. Trên con đường đó chúng ta sẽ được phát triển, lớn lên, vượt qua các thử thách, và đạt đến tiềm năng to lớn nhất của bản thân. Bộ bài 78 lá thiết kế theo phong cách kỹ thuật số đầy sinh động. Mỗi lá bài được khắc họa rất nhiều chi tiết phức tạp tô điểm bởi những gam màu bão hòa. Hệ thống hình ảnh của Tarot Illuminati đi theo Rider Waite Smith và là sự kết hợp giữa vẻ đẹp nghệ thuật, chiều sâu biểu tượng, và sức sống của trực giác, soi ấm tâm hồn và giải phóng suy nghĩ. Đúng như tên gọi, bộ bài là công cụ giúp bạn soi sáng con đường để tìm đến những mục tiêu sống cao cả cũng như tận hưởng một cuộc sống đủ đầy đích thực.

Tarot Illuminati Deck là phiên bản rút gọn từ bản kit với một số điều chỉnh nhỏ: lá bài có viền đen, không mạ vàng cạnh, sách hướng dẫn nhỏ đi kèm.', NULL, N'/DataImage/images/Tarot-Beginner/Tarot-Illuminati-Deck.jpg', NULL, CAST(700000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (75, 2, 7, N'True Heart Intuitive Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn.', N'Khi bạn có cảm hứng và muốn truyền đạt chúng cho tất cả mọi người, bạn chắc chắn sẽ thực hiện được, vì khi đó trực giác và con tim của bạn đã được chuyển hóa trở nên chân thật và tràn ngập niềm tin yêu và chia sẻ hơn. Đó chính là thông điệp tuyệt vời mà True Heart Intuitive Tarot dành cho tất cả người yêu thích Tarot. 

Được sáng lập bởi Rachel True – nữ diễn viên nổi tiếng với những vai diễn trong The Craft, Half Baked và Nowhere. Thực chất, Rachel True đã dùng Tarot từ rất lâu, trước khi cô nhận vai diễn trong The Craft. Giờ đây, cô tập trung nghiên cứu Tarot chuyên sâu và cho ra đời True Heart Intuitive Tarot như một sản phẩm để đời của mình, đồng thời muốn đem đến nguồn năng lượng tích cực và tri thức đã gặt hái được trong thời gian qua. Trong bộ bài này, Rachel chia sẻ cuộc sống của mình từ những trải nghiệm trong Hollywood, đồng thời những lá bài của cô cũng mang một ý nghĩa nào đó về hành trình trở thành diễn viên của cô. Đúng với tên gọi, True Heart Intuitive Tarot không hướng dẫn chúng ta cách để dự báo tương lai, vì đối với Rachel True, tương lai dựa trên năng lượng hiện tại và phát triển nên kết quả ứng với cách ta tác động ở hiện tại. Chính vì vậy, bộ bài đưa ra nhiều tri thức về cách thấu hiểu thực tại, thay đổi nội tâm, giúp ta đưa ra những quyết định đúng đắn – ứng với những sự thật trong chính trái tim của ta. 

Bộ bài True Heart Intuitive Tarot bao gồm 78 lá bài và sách hướng dẫn chi tiết. ', NULL, N'/DataImage/images/Tarot-Beginner/True-Heart-Intuitive-Tarot.jpg', NULL, CAST(800000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (76, 2, 7, N'Fate/Flower Tarot', N'Bao gồm: 79 Lá bài + 1 Cuốn Album + 1 Túi xách bằng vải', N'Khi bạn đã vượt qua hành trình gian nan của Tarot Fate/Journey, giờ là lúc bạn cần phải ngồi xuống, tận hưởng những giây phút chữa lành thông qua hành trình diệu kỳ đến từ Fate Flower Tarot. 

Fate/Flower Tarot tựa như đóa hoa tươi đẹp mà cuộc đời này ban tặng cho bạn, khơi gợi cho bạn những ký ức đẹp đẽ, vui tươi và tích cực. Vẫn tiếp tục chọn phong cách art nouveau để tôn vinh vẻ đẹp của các nhân vật trong loạt phim nổi tiếng Fate, Fate/Flower Tarot là tuyệt phẩm mới nhất sau sự ra mắt cực kỳ thành công của Fate/Journey Tarot. Điểm đặc biệt của Fate/Flower Tarot mà chắc chắn sẽ thu hút bạn đó là bộ bài tập trung diễn giải các lá bài dựa trên hệ thống tiêu chuẩn Rider Waite Smith – hướng đến sự đơn giản trong việc tiếp cận, học tập và thực hành liên kết ý nghĩa các lá bài thông qua phim lẫn Tarot. Mỗi lá bài là một loài hoa gắn liền với ý nghĩa biểu tượng đến từ các nhân vật trong Fate, tạo nên sự đa dạng về mặt hình ảnh lẫn thông điệp tinh tế, nhẹ nhàng và chữa lành. Fate/Flower Tarot sẽ là một món quà ý nghĩa dành cho những bạn yêu thích Fate và mong muốn tìm kiếm một bộ bài để bắt đầu hành trình học Tarot của mình. 

Bộ bài Fate Flower Tarot bao gồm 79 lá bài (78 lá bài + 1 lá The Fool thêm) được mạ holographic ánh cầu vồng.', NULL, N'/DataImage/images/Tarot-MaCanh/Fate-Flower-Tarot.jpg', NULL, CAST(900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (77, 2, 7, N'Arcana Iris Sacra Tarot', N'Bao gồm: 78 lá bài', N'Arcana Iris Sacra Tarot là một siêu phẩm từ đồ họa cho đến hình thức đến từ Tina Gong – tác giả của bộ bài Luminous Spirit Tarot, bộ đôi Golden Thread Tarot – Golden Thread Lenormand và bộ đôi Seventh Sphere Tarot – Seventh Sphere Lenormand. Arcana Iris Sacra dịch ra có nghĩa là “Bí ẩn cầu vồng thiêng liêng” (Mysteries of the Sacred Rainbow) – đó là lý do vì sao xuyên suốt bộ bài này, bạn sẽ luôn thấy hình ảnh cầu vồng xuất hiện trên từng lá bài. Bộ bài được thiết kế dựa trên hệ thống của Golden Dawn, bao gồm Kabbalah và Chiêm Tinh Học. Nếu bạn là người hứng thú khám phá những bí ẩn huyền học của Golden Dawn, bộ bài Arcana Iris Sacra Tarot này sẽ là lựa chọn hoàn hảo nhằm giúp bạn có nhiều góc nhìn khác biệt và mới lạ hơn trong việc học tập và chiêm nghiệm. Bộ bài Arcana Iris Sacra Tarot sử dụng màu sắc để phân biệt các nguyên tố và ý nghĩa của từng lá bài. Cạnh lá bài được mạ vàng trên nền giấy 350 gsm khiến bộ bài này xứng đáng cho một chỗ trong bộ sưu tập của bạn.

Bộ bài Arcana Iris Sacra Tarot bao gồm 78 lá bài. Ý nghĩa từng lá bài và hướng dẫn sử dụng sẽ được tìm thấy ở ứng dụng cùng tên trên Appstore.', NULL, N'/DataImage/images/Tarot-MaCanh/Arcana-Iris-Sacra-Tarot.jpg', NULL, CAST(1400000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (78, 2, 7, N'Broken Mirror Tarot (Fourth Edition)', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'“Hãy vén màn số phận thông qua những mảnh gương vỡ”

Broken Mirror Tarot lấy cảm hứng từ nghệ thuật trang trí lăng kính theo dạng những mảnh vỡ đầy màu sắc, tạo nên nhiều hình ảnh đẹp về Chúa, về Đức Mẹ và các Thiên Thần thường thấy trong các nhà thờ. Để tôn vinh nét nghệ thuật này, Broken Mirror Tarot đem đến cho bạn một hành trình khám phá tương lai, vén màn số phận, giải mã những bí ẩn xoay quanh cuộc sống của bạn. Về mặt hình ảnh, Broken Mirror Tarot vẫn sử dụng hệ thống tiêu chuẩn Rider-Waite-Smith để bạn dễ tiếp cận với những lá bài trong thời gian đầu tiên, tuy nhiên chiều sâu về mặt hình dung lẫn ý nghĩa của bộ bài đem lại cho bạn những giá trị về góc nhìn cuộc sống, về sứ mệnh bản thân lẫn tương lai. Broken Mirror Tarot sẽ là một món quà thật đặc biệt dành cho những bạn yêu thích nét nghệ thuật trang trí lăng kính lẫn muốn sở hữu một trong những tựa bài đẹp xuất sắc làm mưa làm gió trên Kickstarter một thời gian dài. 

Broken Mirror Tarot bao gồm 78 lá bài được mạ cạnh bạc tráng gương holographic ánh cầu vồng và một quyển hướng dẫn nhỏ. ', NULL, N'/DataImage/images/Tarot-MaCanh/Broken-Mirror-Tarot.jpg', NULL, CAST(1300000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (79, 2, 7, N'Destiny Deck – The Art of Tarot', N'Bao gồm: 80 Lá bài + Sách PDF', N'Destiny Deck – The Art of Tarot là một bộ bài có thể được sánh ngang với Soul Cards Tarot phiên bản hồng về chất lượng sản phẩm lẫn hình ảnh. Tuy nhiên, ở bộ bài này lại có sự tỉ mỉ, chăm chút hơn về phần ý nghĩa biểu tượng. Tác giả Lisa Santine đã rất xuất sắc trong việc khẳng định rằng bộ bài của cô thực sự là một tác phẩm nghệ thuật hiện đại có thể đem đến sự thông thái và trí tuệ đến cho người dùng. 

Destiny Deck – The Art of Tarot cũng là một bộ bài đã gọi vốn thành công trên Kickstarter vào năm 2020 này, điều này cho thấy được rất nhiều người ủng hộ tác phẩm tuyệt vời của cô. Tiếp tục phát triển giống như những bộ bài khác, Destiny Deck vẫn chọn phong cách tối giản, vận dụng nhiều biểu tượng hình học, chiêm tinh, động vật, ký hiệu Kabbalah vào từng lá bài. Ngoài ra, trên mỗi lá bài sẽ có ghi chú thêm hai từ khóa để giúp bạn dễ dàng thực hành học tập và giải bài, vì bộ bài sử dụng biểu tượng là chính nên việc học sẽ khá khó khăn, chính vì vậy mà tác giả chọn thêm từ khóa như một cách gợi ý thêm cho bạn dùng. Destiny Deck – The Art of Tarot thật sự là một bộ bài rất tinh tế khi chọn mạ vàng trên cạnh bài lẫn một số chi tiết đặc trưng trên bề mặt lá bài, mục đích là để bộ bài thêm phần óng ánh, nâng cấp giá trị nghệ thuật của bộ bài. Đây chắc chắn sẽ là một bộ bài rất đáng để sở hữu!

Bộ bài Destiny Deck – The Art of Tarot bao gồm 80 lá bài (78 lá bài + 2 lá bài Goddess) và sách hướng dẫn dạng file pdf.', NULL, N'/DataImage/images/Tarot-MaCanh/Destiny-Deck-The-Art-of-Tarot.jpg', NULL, CAST(1400000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (80, 2, 1, N'Fairy Tarot Cards', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Thần tiên (fairy) là những thiên thần trong tự nhiên luôn hỗ trợ con người trong việc giải quyết các vấn đề trong cuộc sống, bao gồm cải thiện sự tự tin trong việc tạo ra khác biệt tích cực cho thế giới. Fairy Tarot Cards của nữ họa sĩ nổi tiếng với các tựa bài Tarot và Oracle về thiên thần – Doreen Virtue – cùng Radleigh Valentine gồm 78 lá bài lộng lẫy được tạo nên nhằm mục đích giúp bạn nhận ra được chiếc vương miện vô hình của chính mình, và thỏa mãn những mục đích sống chính đáng. Fairy Tarot được gọi là “bộ bài của lòng tự tôn”, với tên các lá bài và lời nói trích dẫn luôn thấm nhuần ý kiến này. Trí tuệ của thần tiên thông qua hình ảnh trên từng lá bài và những thông tin được cung cấp trong sách companion đi kèm sẽ giúp bạn tìm thấy chính mình trong sự huyền bí của Thánh thần.

Fairy Tarot Cards cũng được coi là một bộ bài bổ trợ tuyệt vời cho Angel Tarot – tựa bài Tarot nổi tiếng không kém khác của Doreen Virtue.', NULL, N'/DataImage/images/Tarot-MaCanh/Fairy-Tarot-Cards.jpg', NULL, CAST(800000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (81, 2, 7, N'Oriens Tarot – Mini Edition', N'Bao gồm: 78 lá bài', N'Bộ bài Oriens Tarot – Mini Edition kích thước 5 x 9 cm có cạnh mạ bạc Holographic.

Một bộ bài hoàn hảo chính là khi nó được ra mắt, bộ bài đó phải đem đến nhiều giá trị tinh thần lẫn hiện thực. Và Oriens Tarot đã làm được điều đó khi chọn chủ đề về thế giới động vật để miêu tả về hành trình thức tỉnh tâm linh thông qua các trải nghiệm huyền diệu, tựa như đang bước vào khu vườn sinh vật kỳ bí tại một hệ vũ trụ nào đó.

Đã từng gọi vốn thành công trên Kickstarter và đạt được chứng chỉ bảo vệ rừng FSC, Oriens Tarot miêu tả một thế giới đầy màu sắc với rất nhiều loài động vật quen thuộc như Thiên Nga, Thỏ, Rùa Biển, Chim Cánh Cụt, Chuột, Cá Heo, Nai, Sói, Gấu Trúc,… được kết hợp dựa trên các biểu tượng huyền học của Tarot và xuyên suốt bộ bài là ngập tràn hình ảnh không gian vũ trụ tuyệt đẹp và hùng vĩ. Oriens Tarot xứng đáng được vinh danh vì đã tạo nên sức đột phá với chất lượng sản phẩm tuyệt vời, kèm theo đó là thông điệp tích cực mà bộ bài muốn đem lại. Oriens Tarot chứa đựng nhiều ý nghĩa về động vật, về tầm quan trọng của thế giới động vật đối với con người và còn ngầm khẳng định rằng chúng xứng đáng được yêu thương và bảo vệ, đó là lý do vì sao Oriens Tarot nhận được chứng chỉ FSC.

Oriens Tarot được nâng cấp với phiên bản thứ hai cực chất, mạ đỏ maroon cạnh bài, với chất giấy 330gsm được sử dụng là loại lõi đen vốn rất đắt tiền. Nghe đến đây thôi cũng có thể thấy được mức độ đầu tư của tác giả dành cho bộ bài này rồi chứ nhỉ?!

Tham khảo phiên bản chuẩn kích thước 7 x 12 cm: Oriens Tarot

Sách hướng dẫn nhỏ có thể download được trên website tác giả.', NULL, N'/DataImage/images/Tarot-MaCanh/Oriens-Tarot.jpg', NULL, CAST(900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (82, 2, 1, N'Shadowland Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Chúng ta có thể chọn chối bỏ phần bóng tối (shadow) nhưng hãy hiểu rằng, bóng tối chính là một phần trong cuộc sống, là phần khuyết bên trong mỗi con người. Đối mặt với phần bóng tối đồng nghĩa với việc bạn chọn thấu hiểu mặt bị che giấu của bản thân, chọn khám phá thế giới của những điều đen tối nhất mà bạn chưa từng biết đến. Chào mừng bạn đã đến với Shadowland Tarot – nơi trú ngụ của những sinh vật huyền bí, ma quỷ, linh hồn và còn hàng tá những thứ khác núp đằng sau màn đêm ấy. Shadowland Tarot không đem đến cho bạn cảm giác sợ hãi đen tối, chúng muốn bạn phải thích nghi với bóng tối, nhìn thấu được những điều mà bấy lâu nay bạn đã không thể thấy/chưa muốn thấy. Shadowland Tarot muốn đem đến thông điệp cho bạn về những sự thật hiển nhiên trong cuộc sống, những hình tượng xác ướp, ma cà rồng, nhện, dơi, quạ, bù nhìn, hình nhân, ma quỷ sẽ hình tượng hóa những ý nghĩa sâu sắc về bản thân, về thế giới quan và cả những câu chuyện trong cuộc sống. Hãy để vùng đất đen tối này khai sáng bạn theo cách riêng của họ. 

Bộ bài Shadowland Tarot bao gồm 78 lá bài và sách hướng dẫn. ', NULL, N'/DataImage/images/Tarot-MaCanh/Shadowland-Tarot.jpg', NULL, CAST(1100000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (83, 2, 7, N' Silhouettes Tarot 1st Edition', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Phiên bản đầu tiên của Silhouettes Tarot, bộ bài với artwork siêu thực phá cách đã gây tiếng vang lớn trên toàn thế giới của tác giả Masa September. Đây là phiên bản Sihouettes Tarot duy nhất có mạ cạnh bạc. Bộ bài gợi lên cảm giác như tham gia vào hành trình của một giấc mơ, nơi lằn ranh của hư thực bị xóa nhòa, nơi “tĩnh” và “động” giao thoa, nơi chủ thể chuyển động duy nhất cũng chỉ là cái bóng của người hay vật, trên nền màu sắc được phân bổ khéo léo. Tổng thể bộ bài gợi nhớ đến phong cách chiếu bóng  ở thế kỷ 18, với ảnh hưởng mạnh mẽ từ Lotte Reiniger. Không cần quá nhiều sự cầu kỳ để mỗi lá bài toát lên rõ nét nguồn năng lượng nhảy múa trong tâm trí người sử dụng. Hãy đánh thức tầng sâu của các giác quan trong con người mình, và lắng nghe cũng như quan sát xem thế giới hư ảo lấp lánh đó sẽ trao cho bạn điều gì?', NULL, N'/DataImage/images/Tarot-MaCanh/Silhouettes-Tarot.jpg', NULL, CAST(1200000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (84, 2, 7, N'Tarot of Unknown Shadows (2nd Edition)', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Bộ bài Tarot of Unknown Shadows (phiên bản 2) là một đại diện đầy bí ẩn từ studio Dark Synevyr. Bộ bài 78 lá mô phỏng theo hệ thống Rider Waite Smith với tông màu trầm gợi cảm giác u tịch. Có nhiều yếu tố giống với bộ bài lừng danh Tyldwick Tarot, Taort of Unknown Shadows được phát hành với chất lượng giấy và mạ vàng các chi tiết, tạo sự tương phản và tăng tính nghệ thuật cũng như tạo ra chiều sâu trong hình ảnh. Bộ bài có kèm theo một sách hướng dẫn khá chi tiết. Phiên bản đầu tiên ra mắt năm 2019 đã nhanh chóng hết hàng chỉ trong thời gian ngắn.', NULL, N'/DataImage/images/Tarot-MaCanh/Tarot-of-Unknown-Shadows.jpg', NULL, CAST(1100000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (85, 2, 7, N'Uncommon Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Tarot thường chọn diễn tả những khía cạnh mang tính tâm linh và huyền học nhiều hơn vì những đặc điểm đó sẽ tạo nên độ kỳ bí, thú vị và mang giá trị khám phá đến cho bộ bài. Tuy nhiên, nhiều biểu tượng không có nghĩa là mang lại tác dụng ngâm cứu lâu dài, đôi lúc chúng ta chỉ cần một bộ bài mà ý nghĩa biểu tượng vừa đơn giản, vừa khác lạ so với các kiểu bài thông thường. Và từ đó, The Uncommon Tarot ra đời để đi ngược lại với các hệ thống thông thường đó.

Đúng với tên gọi, The Uncommon Tarot là một bộ bài mang phong cách ghép tranh độc đáo với nhiều hình ảnh từ các nền văn hóa khác nhau hòa nhập làm một. Chúng ta sẽ được trải nghiệm theo nhiều phong tục tập quán, màu da, giới tính, chủng tộc và tôn giáo khác nhau, thông qua những kiến thức lâu dài về Tarot đến từ Shaheen Miro. The Uncommon Tarot dành cho mọi thời đại, vì nó chính là thời đại – diễn đạt ý nghĩa của Tarot theo cách khác biệt, ứng với từng xu hướng của mỗi thời đại. Shaheen Miro mong muốn đem đến những trải nghiệm mang tính lịch sử, giúp chúng ta đón nhận những di sản mà ông cha ta đã để lại thông qua từng thời kỳ, đó là lý do mà The Uncommon Tarot được ra đời, nhằm đánh dấu một thời kỳ huy hoàng của từng nền văn hóa. 

Bộ bài The Uncommon Tarot bao gồm 78 lá bài được mạ bạc óng ánh.', NULL, N'/DataImage/images/Tarot-MaCanh/Uncommon-Tarot.jpg', NULL, CAST(800000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (86, 2, 4, N'Traditional Manga Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Traditional Manga Tarot là sự kết hợp giữa những lá bài Rider Waite Smith truyền thống với phong cách Manga truyền thống được thể hiện một cách tài tình bởi họa sỹ Shou Xueting. Văn hóa Manga từ lâu đã là một nét đặc trưng của đất nước xứ hoa anh đào, mức độ phổ biến đã lan rộng khắp thế giới, điển hình như Mystical Manga Tarot được khắc họa bởi nghệ sĩ người Pháp – Rann. Và với Traditional Manga Tarot, nghệ sĩ Shou Xueting đã phát triển từ một bộ bài Tarot cơ bản trở nên phong phú về mặt hình thức, sáng tạo về mặt ý nghĩa, giàu tưởng tượng từ nghệ thuật Manga, kết hợp với các biểu tượng huyền học đã làm bộ bài trở nên độc đáo hơn bao giờ hết. Nếu bạn đã từng sở hữu các bộ bài theo phong cách Manga, bộ bài này nên nằm trong bộ sưu tập của bạn ngay và luôn!

Bộ bài Traditional Manga Tarot bao gồm 78 lá bài và sách hướng dẫn mini kèm trong hộp đựng bài.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Traditional-Manga-Tarot.jpg', NULL, CAST(700000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (87, 2, 4, N'Epic Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Bộ bài Epic Tarot với đầy đủ sắc thái và độ sâu nghĩa sẽ giúp bạn khám phá những bí ẩn vũ trụ thông qua hình ảnh nghệ thuật thú vị dựa trên chuẩn Rider Waite Smith. Hãy tiếp cận phương pháp dựa trên hình ảnh mới mẻ này để bước vào hành trình của gã khờ vốn phá vỡ những nguyên tắc và mở tâm hồn ra với những kết nối mới theo các câu truyện trong mỗi lá bài. Với bốn thuộc tính nguyên tố và mùa, những lá bài này sẽ giải phóng năng lượng tâm linh và thiền định của tarot.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Epic-Tarot.jpg', NULL, CAST(700000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (88, 2, 7, N'Bossa Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Một cái tên gây tò mò và đầy thú vị trong giới Tarot! Bossa Tarot là một hương vị mới lạ, với hình ảnh đậm nét đặc trưng xứ sở chùa vàng, bộ bài này sẽ đem đến cho bạn những trải nghiệm mới mẻ về Tarot. Được sáng tác bởi 3 người trẻ tuổi tài năng (2 họa sĩ và 1 tác giả), Bossa Tarot tựa như một khúc nhạc dịu êm, như rót mật vào tai người và kéo bạn bước vào một thế giới đầy mới lạ. Bossa được lấy từ trong Bossa Nova, tức là “Làn sóng mới mẻ”, bộ bài đã được thiết kế song ngữ Thái – Anh, tập trung vào nét đồ họa màu sắc tươi tắn, dùng từ khóa cụ thể để giúp cho bạn có thể hiểu rõ ý nghĩa của những lá bài. Đây là cách mà tác giả muốn đưa đến cho bạn sự thoải mái khi sử dụng, không bị gò bó trong những khuôn khổ của Tarot hiện hành. 

Bộ bài bao gồm 78 lá bài chuẩn Rider Waite, pha lẫn một chút nét độc đáo từ chuẩn Thoth. Hình ảnh đơn giản, phù hợp cho cả người mới bắt đầu với người đã sử dụng lâu năm. ', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Bossa-Tarot.jpg', NULL, CAST(1200000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (89, 2, 4, N'Bix Tarot', N'Bao gồm: 79 Lá bài + Sách hướng dẫn', N'Bộ bài Bix Tarot lấy cảm hứng từ chú thỏ Bix – nhân vật được sáng tạo bởi Pierluigi Balducci, họa sĩ người Ý nổi tiếng với những dự án lớn trong ngành quảng cáo và xuất bản. Với ngoại hình thú vị cùng tính cách vui nhộn và tinh quái, thỏ trắng Bix đã xuất hiện ở rất nhiều loại hình nghệ thuật khác nhau trong suốt 20 năm qua. Giữa năm 2019, Pierluigi Balducci tái hiện lại hình ảnh này thông qua bộ bài đầy tính sáng tạo là Bix Tarot. Hãy cùng hòa mình vào chuyến phiêu lưu vô cùng hấp dẫn của chú thỏ vui nhộn này và trải nghiệm sự mới mẻ trong mỗi lá bài. Bix Tarot bao gồm 79 lá bài diễn tả hành trình cuộc sống đầy màu sắc, đáng yêu của Bix. Đây là bộ bài không thể thiếu trong bộ sưu tập Tarot của bạn. ', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Bix-Tarot.jpg', NULL, CAST(700000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (90, 2, 7, N'Jewelrincess of Fairytale Tarot', N'Bao gồm: 22 Lá bài + Sách hướng dẫn (Tiếng Hoa)', N'Jewelrincess of Fairytale Tarot là sự kết hợp của các nhận vật Công chúa Jewel (Jewel Princess) trong bộ bài 22 lá với thiết kế hình bát giác độc đáo, đem đến một làn gió mới trong giới tarot. Mỗi lá bài được phác họa dựa trên hình tượng nhân vật Jewel Princess trong bối cảnh của một câu chuyện cổ tích quen thuộc, ví dụ Alice in Wonderland ở lá The Fool, Peter Pan ở lá Magician, Cinderella ở lá Chariot, hay Cô Bé Quàng Khăn Đỏ ở lá Hermit… Bộ bài còn có sự kết hợp với các hình mẫu Chiêm tinh và loại đá quý trượng trưng cho tháng sinh (birthstone), thể hiện qua màu sắc rực rỡ rất riêng ở mỗi lá. Đối với những reader giàu kinh nghiệm, có khả năng sử dụng tốt một bộ bài 22 lá thì Jewelrincess of Fairytale Tarot là một lựa chọn xuất sắc. Bên cạnh đó nếu bạn yêu thích phong cách artwork anime và các tựa bài vui tươi, rực rõ, thì đây cũng là một lựa chọn thú vị.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Jewelrincess-of-Fairytale-Tarot.jpg', NULL, CAST(1500000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (91, 2, 4, N'Manga Tarot – Pocket Edition', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Manga Tarot phiên bản kích thước nhỏ 4.4 x 8 cm

Trong suốt thời gian dài, manga (phong cách nghệ thuật truyện tranh Nhật Bản) đã không chỉ còn là đặc trưng riêng của văn hóa Nhật Bản, mà đã lan rộng khắp thế giới và thu hút sự chú ý cũng như tình cảm của đông đảo mọi người. Việc có những bộ bài Tarot ứng dụng theo phong cách manga cũng trở thành một điều bình thường. Trong số đó, The Manga Tarot của nhà xuất bản Lo Scarabeo (do các họa sĩ Riccardo Minetti và Anna Lazzarini thực hiện) là một trong những tựa bài tiêu biểu nhất. Hệ thống hình ảnh của The Manga Tarot là sự kết hợp giữa hệ tư tưởng phương Tây với nghệ thuật manga, với hệ thống biểu tượng dễ nhận biết. Phong cách manga không bị lạm dụng mà ngược lại, được ứng dụng vừa đủ, khiến bộ bài không hề mất đi chất “Tây” trong khi vẫn có thể khiến bất cứ ai yêu thích phong cách này khó rời mắt. Khác biệt thú vị nhất so với chuẩn Rider Waite Smith là sự thay đổi giới tính các nhân vật – ví dụ nam trong chuẩn truyền thống sẽ trở thành nữ trong The Manga Tarot và ngược lại –  dựa trên ý tưởng về Âm/Dương trong văn hóa phương Đông và quan điểm cho rằng trong mọi người nam luôn có tính nữ và trong mỗi người nữ vẫn có tính nam. Sự phá cách này khuyến khích người dùng bứt phá khỏi những chuẩn mực thông thường, và tự mình xây dựng hệ thống kiến giải mới vượt xa khỏi những gì đã làm trước đây. Các ký tự chữ Hoa in trên mỗi lá bài tượng trưng cho các mùa của từng nhóm ẩn phụ. Sách booklet đi kèm cung cấp một trải bài về mối quan hệ bên cạnh ý nghĩa mỗi lá bài.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Manga-Tarot-Pocket-Edition.jpg', NULL, CAST(550000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (92, 2, 7, N'Neon Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Hiếm khi có một bộ bài nào mang đậm nét văn hóa phương Đông đến thế! Đúng với tên gọi, The Neon Tarot sử dụng nét đồ họa với nhiều tông màu neon sặc sỡ, chồng chéo với nhau tạo nên một bức tranh hoàn hảo, mặc dù đôi lúc nhìn vào sẽ có cảm giác nhức mắt. The Neon Tarot miêu tả một triều đại phương Đông cổ xưa với rất nhiều nhân vật quen thuộc như Samurai, Ninja, Vua, Hoàng hậu, các linh hồn và những người đại diện cho nhiều tầng lớp khác nhau trong thời kỳ đó. Bộ bài khai thác những mặt tối trong mỗi con người nhưng được khắc họa với màu neon – biểu thị cho sự khai sáng ở mức cao nhất, khẳng định về những nỗi đau, tội lỗi, tiêu cực đều có thể nhìn nhận thông qua góc nhìn “màu mè” đến đáng sợ hơn. The Neon Tarot vừa khiến cho bạn cảm thấy sợ hãi nhưng một cách nào đó, bạn sẽ quen dần với tông màu của bộ bài, lâu ngày sẽ nhanh chóng thích nghi, dễ dàng sử dụng hơn. 

Bộ bài Neon Tarot bao gồm 78 lá bài và sách hướng dẫn.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Neon-Tarot.jpg', NULL, CAST(1400000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (93, 2, 7, N'Pastel Unicorn Tarot', N'Bao gồm: 78 lá bài', N'Pastel Unicorn Tarot mang đậm nét văn hóa Nhật Bản và chứa đựng nhiều thông điệp tích cực, đáng yêu. Bộ bài xoay quanh hành trình khám phá thế giới nhiệm màu của chú kỳ lân tinh nghịch, và chú sẽ dẫn dắt bạn tìm hiểu về những bí ẩn trong thế giới này. Bạn sẽ sớm yêu thích Pastel Unicorn Tarot vì hình ảnh bộ bài tập trung chủ yếu vào màu hồng phấn, luôn gợi mở sự hồn nhiên, vui vẻ và đón nhận những điều tốt đẹp đến cho cuộc sống này. Bộ bài vẫn giữ nguyên hệ thống tiêu chuẩn Rider Waite Smith để giúp các bạn dễ dàng nắm bắt kiến thức và thực hành luyện tập trải bài. 

Bộ bài Pastel Unicorn Tarot bao gồm 78 lá bài.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Pastel-Unicorn-Tarot.jpg', NULL, CAST(1600000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (94, 2, 7, N'Star Spinner Tarot', N'Bao gồm: 81 Lá bài + Sách hướng dẫn', N'Hãy để những vì sao dẫn lối bạn, và từ đó, bạn sẽ tự dệt những vì sao ấy để dẫn lối cho những người khác. Đó là thông điệp mà The Star Spinner Tarot muốn đem đến cho bạn. Hãy bước vào thế giới đầy màu sắc để cùng chơi đùa với các nàng tiên, trải nghiệm những niềm vui, hạnh phúc đến từ những vì sao soi sáng cả hành trình thức tỉnh tâm linh của bạn. Đối với The Star Spinner Tarot, không có gì là không thể, hình ảnh cũng như thông điệp của bộ bài đang gửi gắm đến bạn niềm tin rằng mọi thứ rồi sẽ tốt đẹp, và bạn cũng chính là người dệt vì sao – gặt hái niềm tin cho bản thân và đem đến hy vọng cho những người đang lạc lối ngoài kia. 

The Star Spinner Tarot được thiết kế dựa hoàn toàn theo chuẩn Rider Waite Smith Tarot, dễ dàng cho những bạn bắt đầu học Tarot. Hình ảnh lại mang nét hiện tại, mới mẻ và đa dạng với những câu chuyện về thần tiên, thần thoại và cổ tích. Bộ bài hoàn toàn phù hợp với người mới bắt đầu hay cả những Tarot Reader lâu năm. Trải nghiệm với The Star Spinner Tarot sẽ không làm bạn thất vọng đâu!

Bộ bài Star Spinner Tarot bao gồm 81 lá bài (4 The Lovers với nhiều góc nhìn hơn về cách thể hiện tình yêu)  và sách hướng dẫn 160 trang.

Đây là bộ bài hoàn hảo dành cho những ai đang tìm kiếm một cách tiếp cận Tarot mới mẻ, hiện đại, độc đáo hay ủng hộ phong trào LGBTQ+.

Tác giả Trungles (Trung Le Nguyen) là một họa sỹ người Mỹ gốc Việt. Các tác phẩm của anh theo chủ đề các câu truyện Do Thái, truyện cổ tích và LGBTQ+. Anh từng cộng tác với tạp chí và studio gồm Oni Press, Boom! Studios, Limerence Press, và Image Comics cũng như trang blog The Nerds of Color và kênh Asian America.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Star-Spinner-Tarot.jpg', NULL, CAST(750000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (95, 2, 5, N'Witchling Academy Tarot', N'Bao gồm: 78 lá bài + Sách hướng dẫn', N'Chào mừng các phù thủy tập sự đã đến với học viện Phù Thủy! Hành trình của các bạn sẽ bắt đầu từ đây, bạn là một trong những người đã lựa chọn con đường này, chắc chắn những điều tốt đẹp sẽ đến với bạn. Ở đây, bạn sẽ cùng cô phù thủy nhỏ Charlie và những người bạn đáng yêu cùng nhau trải qua các bài học phép thuật, vượt qua những trở ngại và phát triển bản thân để trở thành một phù thủy tài ba. Witchling Academy Tarot mang âm hưởng anime tạo sự gần gũi, đáng yêu cùng với việc vận dụng hệ thống Rider Waite Smith đem lại sự dễ dàng trong việc sử dụng. Bộ bài hỗ trợ đầy đủ ý nghĩa và các cách học tập bùa chú, thông qua cuốn sách Witchling Academy Handbook kèm trong hộp bài sẽ hỗ trợ bạn đầy đủ mọi kiến thức bạn cần. Witchling Academy Tarot mang đến cho bạn một hành trình tuyệt vời với lối kể chuyện dễ thương, thích hợp với mọi đối tượng yêu thích Tarot. 

Bộ bài Witchling Academy Tarot bao gồm 78 lá bài và sách hướng dẫn 100 trang.', NULL, N'/DataImage/images/Tarot-Manga%26Comic/Witchling-Academy-Tarot.jpg', NULL, CAST(800000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (96, 2, 7, N'Cat Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Mèo luôn là nguồn cảm hứng bất tận để các tác giả có thể khai thác ý tưởng và làm nên những bộ bài Tarot – Oracle. Cat Tarot đem đến một làn gió mới cho những bộ bài Tarot về mèo, xứng đáng nằm trong top những bộ bài nên sở hữu trong bộ sưu tập bài của mình. Cat Tarot có chút tương đồng với những bộ bài trước đó nhưng với nét vẽ dễ thương, mang âm hưởng hiện đại, màu sắc hài hòa và đặc biệt là vẫn giữ theo chuẩn Rider Waite Tarot.

Sách hướng dẫn 108 trang cung cấp đầy đủ giải nghĩa tất cả lá bài. Điểm đặc biệt của bộ bài này chính là tác giả Julia Smillie đã rất khôn khéo khi lồng vào nhiều chi tiết, đặc biệt về tập tính của loài mèo, vào từng lá bài, để nó vừa thể hiện ý nghĩa lá bài vừa giúp ta có thêm nhiều kiến thức về loài mèo. Ngoài ra tác giả còn giải thích rất nhiều về “vì sao loài mèo lại xuất hiện trên trái đất này?”. Bạn có cảm thấy muốn sở hữu bộ bài Cat Tarot dễ thương này không?', NULL, N'/DataImage/images/Tarot-SinhVatHB/Cat-Tarot.jpg', NULL, CAST(750000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (97, 2, 7, N'Dragon Tarot (CICO Books)', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Đối với nhiều người, Rồng là một loài sinh vật mạnh mẽ và quyền lực trong thế giới giả tưởng và những câu chuyện cổ tích. Và thế giới Rồng sẽ được tái hiện lại trong bộ bài The Dragon Tarot nhằm mang đến cho chúng ta những trải nghiệm tiên tri mới lạ. Bộ bài Dragon Tarot của CICO Books gồm 78 lá bài dựa theo chuẩn Marseille, có sách hướng dẫn chi tiết cho từng lá bài. ', NULL, N'/DataImage/images/Tarot-SinhVatHB/Dragon-Oracle-CICO.jpg', NULL, CAST(700000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (98, 2, 7, N'Dreaming Cat Tarot', N'Bao gồm: 78 Lá bài', N'Những tựa bài đến từ đất nước xứ sở hoa anh đào luôn đem lại cảm giác cực kỳ đáng yêu và gần gũi bởi lẽ văn hóa Manga/Anime đã quá quen thuộc tại Việt Nam. Dreaming Cat Tarot là một trong số những bộ bài đại diện cho nước Nhật, được đầu tư kỹ lưỡng với đầy đủ 78 lá bài theo hệ chuẩn Rider Waite Smith (do một số bộ bài bên Nhật thường chỉ được thiết kế 22 lá Ẩn Chính) với hộp cứng cáp, gọn gàng. Dreaming Cat Tarot đem đến cho bạn một thế giới của các loài mèo dễ thương, chúng tạo nên những phép màu nhằm dẫn dắt bạn bước vào thế giới giấc mơ đầy dịu dàng, tinh tế. Bộ bài hoàn toàn phù hợp với người mới bắt đầu sử dụng Tarot, hoặc dành cho những tín đồ cuồng mèo và muốn sưu tầm thật nhiều những tựa bài xinh đẹp về mèo. Nếu bạn thật sự muốn khởi đầu bằng sự định hướng đến từ các “boss” dễ thương vô đối này thì hãy thử tự thưởng cho mình Dreaming Cat Tarot nha.', NULL, N'/DataImage/images/Tarot-SinhVatHB/Dreaming-Cat-Tarot.jpg', NULL, CAST(1600000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (99, 2, 6, N'Herbcrafter’s Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Có bạn nào cực đam mê với những kiến thức về pha chế cây cỏ, hoa lá hay sử dụng thảo dược để phục vụ cho mục đích riêng không? Bộ bài Herbcrafter’s Tarot sẽ giúp bạn thỏa mãn được điều này. Mỗi lá bài trong bộ này sẽ là một loài thảo mộc nào đó và tác giả cũng sẽ đưa ra những công dụng đặc biệt của thảo dược này. Bạn sẽ như được bước vào một thế giới đầy hoa lá, cây cỏ, một thế giới thực vật đa dạng đang ở trước mắt bạn. Việc vận dụng ý nghĩa lá bài vào các công thức thảo dược cũng đã cho thấy được sự nghiên cứu kỹ càng và lòng tôn vinh những bậc thầy bào chế thuốc của tác giả. Bạn vừa có thể sử dụng như một phương tiện kết nối tâm linh, đồng thời cũng có thể học tập tri thức để tự chữa lành cho bản thân.

Bộ bài Herbcrafter’s Tarot gồm 78 lá theo chuẩn Rider Waite Smith và được đặt theo tên các loài thảo mộc, hoa, cây cỏ kèm theo cuốn sách 124 trang chứa dựng đầy đủ kiến thức về thảo dược. ', NULL, N'/DataImage/images/Tarot-SinhVatHB/Herbcrafters-Tarot.jpg', NULL, CAST(800000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (100, 2, 7, N'Lost Forest Tarot', N'Bao gồm: 80 Lá bài + Tờ hướng dẫn', N'Lost Forest Tarot xứng đáng là môt siêu phẩm khi không chỉ đẹp về hình thức mà cả về nội dung cũng được đầu tư cực kỳ kỹ lưỡng.

Thế giới trong Lost Forest Tarot sẽ mở ra một hành trình tìm kiếm cội nguồn của chúng ta. Lost Forest Tarot lấy cảm hứng từ cảm giác phiêu lưu được tìm thấy trong nhiều tác phẩm giả tưởng, cộng với những thông tin về các loài sinh vật trong Sách Đỏ lẫn tri thức tâm lý học của Carl Jung, bạn sẽ hiểu rõ hơn về những tầng nội tâm sâu thẳm trong mình, đồng thời nắm bắt được những “điểm mù” ẩn náu trong tiềm thức – một cách ẩn dụ nhằm đại diện cho hành trình đến khu rừng bí ẩn bị lãng quên từ lâu trong The Lost Forest.

Lost Forest Tarot trở lại của phiên bản 2 sau thành công từ việc gọi vốn trên Kickstarter vào năm 2020, với số lượng giới hạn 1000 bộ. Phiên bản này sẽ có 80 lá với 2 lá bài bonus là “The Ascended” và “The Faceless”. Phần hộp cũng được thiết kế lại với phần chữ bạc nổi bật trên nền đen huyền bí. Bên cạnh đó, dự án này còn được cấp chứng chỉ bảo vệ môi trường bởi tổ chức Hemlock’s “Zero” Carbon Neutrality. Đây là một dự án góp phần nâng cao ý thức của chúng ta với các vấn đề tồn tại trong môi trường tự nhiên.', NULL, N'/DataImage/images/Tarot-SinhVatHB/Lost-Forest-Tarot.jpg', NULL, CAST(2200000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (101, 2, 7, N'Mythical Creatures Tarot (Limited Edition)', N'Bao gồm: 79 Lá bài + Sách hướng dẫn', N'Nếu bạn đã từng bỏ lỡ cơ hội sở hữu bộ bài Mythical Creatures Tarot phiên bản đơn màu (2005) thì giờ đây, bạn chắc chắn sẽ sở hữu được bộ bài này phiên bản mới nhất của năm 2020. Đây được xem là một phiên bản cải tiến, hoàn toàn độc lạ với chất lượng in ấn đậm chất Baba Studio. Tất cả những lá bài trong Mythical Creatures Tarot đã được khoác thêm một chiếc áo đầy màu sắc, với lớp mạ trên hoa văn của từng lá bài đem đến nét đặc trưng mà không phải bộ bài nào cũng có thể có được. Hiện nay, Baba Studio là nhà sản xuất đầu tiên đạt được thành công vang dội với những tựa bài có chất lượng in được mạ mặt bài như Alice Tarot và Tarot of Prague, giờ đây Mythical Creatures Tarot đã bước lên một đẳng cấp mới để sánh ngang với những bộ bài này, đem đến những trải nghiệm Tarot mới lạ cho người dùng. 

Bộ bài Mythical Creatures Tarot được thiết kế dựa trên hình tượng những sinh vật huyền bí trong nhiều nền văn hóa khác nhau, có thể ở đâu đó trong ký ức của bạn cũng đã từng biết được những sinh vật này. Từ những nhân vật đơn giản nhất như kỳ lân và người khổng lồ cho đến những nhân vật ít người biết đến như Irish Amadán, Rebus,… Nếu bạn là một người yêu thích các câu chuyện thần thoại, muốn khám phá thêm ý nghĩa của những sinh vật huyền bí đằng sau các lá bài Tarot thì đây chính là bộ bài cực kỳ phù hợp dành cho bạn. 

Bộ bài Mythical Creatures Tarot bao gồm 78 lá bài và được tặng kèm thêm một lá bài 3 of Cups, với chất lượng giấy in cứng cáp 330 gsm, mặt hoa văn sang chảnh và quý phái. Bài có kèm sách hướng dẫn nhỏ.

Bạn có thể lựa chọn mua thêm sách hướng dẫn lớn với giá 500,000đ', NULL, N'/DataImage/images/Tarot-SinhVatHB/Mythical-Creatures-Tarot.jpg', NULL, CAST(4999000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (102, 2, 5, N'Otherkin Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Otherkin Tarot – Một tuyệt tác mới lại xuất hiện dưới nhãn tên Siolo Thompson – tác giả của ba bộ bài cực kỳ nổi tiếng được rất nhiều bạn yêu thích: Linestrider Tarot, Hedgewitch Botanical Oracle và Scrying Ink Lenormand. Với tác phẩm lần này hứa hẹn có thể sẽ làm mưa làm gió trong giới Tarot, đem lại một màu sắc mới lạ nhưng lại rất đỗi quen thuộc. Nếu bạn đã là một fan của bộ Linestrider Tarot thì chắc chắn bộ Otherkin Tarot này sẽ không làm bạn thất vọng. Chủ đề lần này là dẫn dắt bạn bước vào một thế giới đan xen giữa thực và ảo, giữa loài người và động vật, vừa lạ lẫm vừa thân thuộc (Other và Kin).

Bạn sẽ bắt gặp nhiều hình ảnh nhân hóa đầy ấn tượng, như hình ảnh chú sư tử mang trên mình một cơ thể cường tráng của một người đàn ông đang ngồi trên ngai vàng của mình (lá The Emperor). Hay hình ảnh loài cú thông thái đang đứng trên chồng sách (lá The Hierophant), và còn rất nhiều loài động vật khác nữa. Sử dụng nét vẽ màu nước trên nền trắng luôn là một phong cách đặc biệt của Siolo Thompson, cô đã đem đến một làn gió mới mẻ về hội họa nhưng vẫn giữ được nét truyền thống Rider Waite Smith – phù hợp với người mới bắt đầu và Tarot Reader lâu năm. Những vệt ố màu trên lá bài cũng là một nét độc lạ, khiến cho bộ bài tưởng như bị lem nhưng không phải như vậy. Hãy tự mình khám phá thế giới trong Otherkin Tarot nhé!', NULL, N'/DataImage/images/Tarot-SinhVatHB/Otherkin-Tarot.jpg', NULL, CAST(850000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (103, 2, 7, N'Stitch Rabbit Tarot', N'Bao gồm: 22 Lá bài + Sách hướng dẫn (tiếng Hàn)', N'Stitch Rabbit Tarot là một bộ bài rất dễ thương đến từ Hàn Quốc. Nhân vật chính là một chú thỏ may trên hành trình quen thuộc của Chàng Khờ trong hệ thống tarot truyền thống. Bộ bài gồm 22 lá bài Ẩn Chính với phong cách chibi đáng yêu, đem lại nguồn năng lượng tươi sáng tích cực cho người sử dụng.', NULL, N'/DataImage/images/Tarot-SinhVatHB/Stitch-Rabbit-Tarot.jpg', NULL, CAST(650000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (104, 2, 7, N'Weird Cat Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Bạn đã từng thích những chú mèo huyền bí trong Mystical Cats Tarot? Hay bạn cũng đã từng trải nghiệm cuộc sống ngày thường của những chú mèo trong Cat Tarot? Với The Weird Cat Tarot, bạn sẽ có thêm một bộ bài Tarot về những chú mèo vũ trụ, với nhiều hình ảnh dễ thương, đáng yêu và đặc biệt là “cực kỳ quái dị”. Gabrielle Kash đã khắc họa hình tượng mèo với nhiều màu sắc khác nhau kèm theo đôi mắt to tròn, đứng giữa không gian vũ trụ vừa tạo nét gần gũi, thân thiện vừa dễ tiếp cận. Nếu bạn là một người yêu mèo, chắc chắn bạn sẽ rất thích bộ này.

Bộ bài Weird Cat Tarot bao gồm 78 lá bài và sách hướng dẫn. Các lá bài được mạ cạnh màu hồng.

', NULL, N'/DataImage/images/Tarot-SinhVatHB/Weird-Cat-Tarot.jpg', NULL, CAST(1300000 AS Decimal(18, 0)), 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (107, 2, 4, N'Celtic Tarot – Pocket Edition', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Celtic Tarot phiên bản kích thước nhỏ 4.4 x 8 cm

Các truyền thuyết thời đại Celtic cũng như bản thân bài Tarot luôn đem lại mối liên kết với thế giới tâm linh/tinh thần cho con người xét trên mọi khía cạnh cuộc sống hàng ngày. The Celtic Tarot là sự tổng hợp từ những bí ẩn trong truyền thuyết Celtic, trí tuệ của Tarot truyền thống, và nghệ thuật tinh tế từ hai họa sỹ lừng danh Gaudenzi và Tenuta cùng phối hợp để tạo thành bộ bài tinh tế dành cho việc chiêm nghiệm và bói toán. Những câu chuyện, truyền thuyết và lịch sử thời Celtic được phác họa xuyên suốt bộ bài, đặc biệt là bộ ẩn chính, đưa người dùng về một trong những thời kỳ nổi bật nhất lịch sử nhân loại.', NULL, N'/DataImage/images/Tarot-Mini/Celtic-Tarot-Pocket-Edition.jpg', NULL, CAST(550000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (108, 2, 5, N' Everyday Witch Tarot – Mini Edition', N'Bao gồm: 78 lá bài', N'Everyday Witch Tarot – Mini Edition phiên bản kích thước nhỏ 4.5 x 7 cm, không kèm sách.

Everyday Witch Tarot là một bộ bài tarot thú vị, thực tế và dễ sử dụng dành cho mỗi phù thủy. Những hình ảnh hấp dẫn kết nối với những câu giải nghĩa đơn giản đủ để tạo thành một bộ bài tarot trong hành trang của bất kỳ ai muốn học hỏi và luyện tập xem tarot. Dựa trên chuẩn Rider Waite Tarot truyền thống nhưng được cập nhật dành cho những phù thủy hiện đại bận rộn, bộ bài Everyday Witch Tarot này có một bầu không khí tuyệt vời trong khi vẫn được chuyên hóa cho công việc nghiêm túc: đưa ra những câu trả lời cho những câu hỏi khắc nghiệt từ cuộc sống.

Tác giả Deborah Blake đã đưa phương pháp tiếp cận thân thiện cho người dùng tarot để tạo ra một trải nghiệm tarot vốn tập trung vào những điều tích cực.

Everyday Witch Tarot sẽ là công cụ tiên tri ưa thích cho những phù thủy nghiêm túc.', NULL, N'/DataImage/images/Tarot-Mini/Everyday-Witch-Tarot.jpg', NULL, CAST(399000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (109, 2, 4, N'Tarot of White Cats – Pocket Edition', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Tarot of White Cats phiên bản kích thước nhỏ 4.4 x 8 cm', NULL, N'/DataImage/images/Tarot-Mini/Tarot-of-White-Cats-Pocket-Edition.jpg', NULL, CAST(550000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (110, 2, 6, N'Wonderland Tarot – Tin Edition', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Hãy tham gia bữa tiệc trà điên loạn cùng các nhân vật đáng yêu của Lewis Carroll trong bộ bài The Wonderland Tarot, bao gồm The Mad Hatter (Fool), Alice (High Priestess), Humpty Dumpty (Sun), the White Rabbit (Judgement) và toàn bộ nhân vật khác. Nghệ thuật tuyệt vời của Morgana Abbey tôn lên sự kính trọng với phong cách vẽ tay thời Victoria của Sir John Tenniel, họa sỹ phiên bản đầu tiên của sách Alice Lạc Vào Xứ Sở Thần Tiên (Alice’s Adventures in Wonderland). Trong bộ bài Tarot tuyệt đẹp này, bộ Ẩn Phụ dùng hình ảnh chim hồng hạc (flamingos) cho bộ Swords, lọ tiêu (peppermills) cho bộ Staves (Wands), mũ (hats) cho bộ Cups, và con hàu (oysters) cho bộ Coins (Pentacles). Theo tinh thần của truyện Alice, như một cái gật đầu của Queen of Hearts, các dấu hiệu của bài tây (playing cards) được bổ sung thêm cho các lá bộ Ẩn Phụ, để bộ bài Wonderland Tarot – Tin Edition có thể được sử dụng cho việc chơi bài truyền thống cũng như xem tarot. Bộ bài kích thước cầm tay (pocket) đựng trong một hộp thiếc và một sách hướng dẫn 56 trang.

Lưu ý từ tác giả bộ bài Chris Abbey & Morgana Abbey 2016: “Có nhiều thay đổi theo năm tháng, và bộ bài này vẫn giữ một kỷ niệm đẹp cho chúng ta. Nếu bạn biết bộ bài trước đây, chúng tôi hi vọng việc thấy lại nó sẽ mang lại bạn nụ cười lần nữa. Nếu đây là lần đầu bạn bắt gặp bộ bài, chúng tôi hi vọng nó sẽ khiến bạn nở nụ cười. Cám ơn những bạn đã ủng hộ trước đây và tất cả những người mới đến.”', NULL, N'/DataImage/images/Tarot-Mini/Wonderland-Tarot-Tin-Edition.jpg', NULL, CAST(550000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (111, 2, 7, N'Fantastic Menagerie Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn nhỏ', N'Một trong những nhà sản xuất làm nên các tựa bài cực kỳ tuyệt vời về chất lượng lẫn hình thức, luôn luôn được săn đón mỗi khi ra mắt một sản phẩm nào đó, chúng ta có thể nói đến Baba Studio. Các tựa bài như Bohemian Gothic Tarot, Tarot of Prague, Alice Tarot hay Mythical Creatures Tarot đều đã làm nên tên tuổi cho Baba Studio.

Trong đó không thể không nhắc đến Fantastic Menagerie Tarot – một tựa bài đã từng được in vào năm 2006 nhưng đã ngừng một thời gian, và giờ đây bộ bài này đã được in lại. Bộ bài Fantastic Menagerie Tarot là tập hợp những loài động vật kỳ ảo được nhân hóa tạo nên những hình mẫu của biểu tượng huyền học, hình ảnh trong bộ bài được dựa trên bản vẽ gốc xuất hiện vào thế kỷ 19 của họa sĩ người Pháp J.J.Grandville. Đúng với tên gọi, Fantastic Menagerie Tarot mang đến một thế giới hài hước, dí dỏm và đầy màu sắc với nhiều sự kiện được khắc họa đầy châm biếm nhưng vẫn ẩn chứa những thông điệp từ Tarot. Bộ bài chọn sử dụng hệ thống Rider-Waite-Smith để giúp chúng ta dễ dàng liên kết với hình ảnh cũng như biểu tượng mà các lá bài đem lại, việc học tập và nghiên cứu cũng từ đó mà thoải mái hơn. The Fantastic Menagerie Tarot sẽ đem đến cho bạn những trải nghiệm vui nhộn và đáng yêu cùng với chất lượng in ấn đặc trưng của Baba Studio – in mạ màu nổi trên một số chi tiết của lá bài. 

Bộ bài The Fantastic Menagerie Tarot bao gồm 78 lá bài và sách hướng dẫn nhỏ đi kèm. Ngoài ra, bạn cũng có thể mua thêm sách hướng dẫn chi tiết dài 256 trang được bán riêng.', NULL, N'/DataImage/images/Tarot-VH%26NT/Fantastic-Menagerie-Tarot.jpg', NULL, CAST(1900000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (112, 2, 6, N'Napo Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Bất kỳ một bộ bài Tarot nào sinh ra cũng đều đem lại những giá trị cốt lõi về mọi khía cạnh cảm thụ về cuộc sống. Có thể bộ bài đó sẽ đem đến những giá trị về đồ họa đặc sắc, giá trị về văn hóa đất nước, giá trị sử dụng về mặt giải mã tâm lý và kết nối Vũ Trụ. Chúng ta sẽ luôn tìm được những giá trị xoay quanh một bộ bài. 

Napo Tarot được sinh ra để truyền đạt 2 giá trị cốt lõi: giá trị về cuộc sống và giá trị về văn hóa. Napo Tarot dựa trên nền văn hóa, lịch sử, thần thoại hay những câu chuyện cổ tích Argentina, bộ bài còn thể hiện xuất sắc về phần hình ảnh đầy màu sắc sặc sỡ, đem lại nguồn cảm hứng về một đất nước Argentina xinh đẹp. Napo Tarot sử dụng chính tên của họa sĩ người Argentina – ông Napo để đặt tên cho bộ bài – cách đơn giản nhất để đánh dấu nét đặc trưng của bộ bài. Napo Tarot chỉ dẫn chúng ta về những liên kết giữa con người với Vũ Trụ, về lòng biết ơn và trân trọng nền văn hóa cổ xưa, và biết đâu chính bạn cũng sẽ hiểu thêm về nền văn hóa Argentine vĩ đại này. Điểm đặc biệt ở Napo Tarot chính là kết hợp song ngữ Tiếng Tây Ban Nha – Tiếng Anh trong cùng một hình ảnh, mang tính văn hóa đa dạng để dễ dàng tiếp cận với mọi đối tượng hơn. 

Bộ bài Napo Tarot bao gồm 78 lá bài và sách hướng dẫn 52 trang. ', NULL, N'/DataImage/images/Tarot-VH%26NT/Napo-Tarot.jpg', NULL, CAST(650000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [LikeCount], [CreatedDate], [CreatedBy], [Status]) VALUES (113, 3, 4, N'Gregory Scott Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn', N'Nếu bạn là một Youtuber và muốn có một bộ bài Tarot riêng dành cho mình, hãy cứ hiện thực hóa ước mơ đó, hãy giống Gregory Scott! Thật thú vị khi có một bộ bài được đặt đúng với tên thật của mình, Gregory Scott Tarot là tựa bài Tarot đến từ tác giả cùng tên – Gregory Scott, vốn là một Youtuber luôn đem đến những trải bài định hướng mỗi tháng trên kênh của mình, ông còn là một giáo viên tuyệt vời hướng dẫn về Tarot. Thông điệp mà ông muốn gửi gắm đến người sử dụng thông qua bộ bài này chính là hãy luôn luôn tích cực trong tư tưởng và không ngừng học hỏi trên hành trình chinh phục tri thức Tarot này. Gregory Scott Tarot được minh họa bởi nghệ sĩ Davide Corsi, hình ảnh nhẹ nhàng, đơn giản để tiếp cận, cực kỳ phù hợp cho người mới bắt đầu. Có thể vẻ hộp đựng bên ngoài của Gregory Scott Tarot không mấy bắt mắt nhưng những thông điệp tiềm ẩn trong từng lá bài thì không thể hiểu theo cách thông thường được. Nét vẽ đột phá, nhiều tầng nghĩa thú vị, bộ bài chắc chắn sẽ mở rộng kiến thức về Tarot trong bạn.  

Bộ bài Gregory Scott Tarot bao gồm 78 lá bài và sách hướng dẫn mini kèm trong hộp đựng bài.

Tham khảo thêm bộ bài cùng họa sỹ David Corsi: Pictorial Key Tarot, Vice Versa Tarot', NULL, N'/DataImage/images/Tarot-VH%26NT/Gregory-Scott-Tarot.jpg', NULL, CAST(700000 AS Decimal(18, 0)), 0, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTags] ON 

INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (2, 37, 6, N'Manga & Comic,', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (3, 35, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (4, 35, 5, N'Bài Có Mạ Cạnh', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (5, 36, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (6, 38, 16, N'Beginner', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (7, 39, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (8, 39, 5, N'Bài Có Mạ Cạnh', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (9, 39, 14, N'Sinh Vật Huyền Bí', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (10, 40, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (11, 40, 10, N'Dark & Gothic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (12, 41, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (13, 41, 6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (14, 42, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (15, 42, 14, N'Sinh Vật Huyền Bí', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (16, 43, 5, N'Bài Có Mạ Cạnh', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (17, 43, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (18, 44, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (19, 45, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (21, 45, 6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (22, 46, 6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (23, 46, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (24, 47, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (25, 47, 6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (26, 48, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (27, 48, 4, N'Văn Hóa & Nghệ Thuật', CAST(N'2021-05-10' AS Date), NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (28, 48, 15, N'Huyền Học', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (30, 49, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (31, 49, 6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (32, 50, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (33, 50, 5, N'Bài Có Mạ Cạnh', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (34, 51, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (35, 51, 4, N'Văn Hóa & Nghệ Thuật', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (36, 52, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (37, 52, 14, N'Sinh Vật Huyền Bí', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (38, 53, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (39, 53, 6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (40, 53, 14, N'Sinh Vật Huyền Bí', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (41, 54, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (42, 55, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (43, 55, 4, N'Văn Hóa & Nghệ Thuật', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (44, 56, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (45, 56, 5, N'Bài Có Mạ Cạnh', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (46, 57, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (47, 57, 9, N'God, Angel & Fairy', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (48, 58, 12, N'Bài Lạ', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (49, 58, 10, N'Dark & Gothic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (50, 59, 12, N'Bài Lạ', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (51, 60, 12, N'Bài Lạ', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (52, 61, 3, N'Bài Mini', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (53, 61, 12, N'Bài Lạ', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (54, 61, 5, N'Bài Có Mạ Cạnh', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (55, 62, 12, N'Bài Lạ', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (56, 62, 9, N'God, Angel & Fairy', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (57, 63, 2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (58, 63, 12, N'Bài Lạ', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (59, 107, 3, N'Bài Mini', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (60, 107, 4, N'Văn Hóa & Nghệ Thuật', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (61, 108, 3, N'Bài Mini', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (62, 110, 3, N'Bài Mini', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (63, 110, 6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (64, 111, 4, N'Văn Hóa & Nghệ Thuật', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (65, 111, 6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (66, 112, 4, N'Văn Hóa & Nghệ Thuật', NULL, NULL, 1)
INSERT [dbo].[ProductTags] ([ID], [ProductID], [TypeID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (67, 113, 4, N'Văn Hóa & Nghệ Thuật', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductTags] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'Bài Hiếm', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Bài Mini', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'Văn Hóa & Nghệ Thuật', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'Bài Có Mạ Cạnh', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Manga & Comic', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'Gay & LGBT', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (9, N'God, Angel & Fairy', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (10, N'Dark & Gothic', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (11, N'Pagan & Wiccan', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (12, N'Bài Lạ', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (13, N'Tình Yêu & 18+', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (14, N'Sinh Vật Huyền Bí', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (15, N'Huyền Học', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (16, N'Beginner', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (17, N'Sale off', 2, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (18, N'Thiên Nhiên', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (19, N'Những Bộ Bài Nên Sử Dụng', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (20, N'Định Hướng Tổng Hợp', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (21, N'Thế Giới Thần Tiên', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (22, N'Bóng Tối và Phù Phép', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (23, N'Chữa Lành', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (24, N'Tôn Giáo & Thiền Định', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (25, N'Động Vật', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (26, N'Dành Cho Người Mới', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (27, N'Tinh Thể, Năng Lượng & Luân Xa', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (28, N'Thông Điệp Từ Vũ Trụ', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (29, N'Thần Thoại', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (30, N'Ngôn Ngữ Cổ Xưa & Chiêm Tinh', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (31, N'Hành Trình Cuộc Sống', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (32, N'Tình Yêu & Các Mối Quan Hệ', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (33, N'Thiên Thần', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (34, N'Bài Clow', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (35, N'Truyền Cảm Hứng', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (36, N'Bài Tiên Tri', 4, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (37, N'Con Lắc Lo Scarabeo', 7, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (38, N'Mặt Dây Chuyền & Con Lắc', 7, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (39, N'Đá thanh tẩy bài Tarot', 8, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (40, N'Đá thanh tẩy đặc biệt', 8, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (41, N'Đá thanh tẩy hình trụ', 8, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (42, N'Sách Huyền Học Khác', 13, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (43, N'Sách Tarot Tiếng Việt', 13, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (44, N'Sách Bùa Chú, Nghi Thức, Thuật Phù Thủy', 13, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (45, N'Sách Học Tarot', 13, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (46, N'Sách Sơ Đồ Trải Bài Tarot', 13, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (47, N'Sách Học Lenormand', 13, NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CategoryID], [CreatedDate], [CreatedBy], [Status]) VALUES (48, N'Phụ Kiện Khác', 14, NULL, NULL, 1)
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
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([ID], [NameStore], [Address], [TimeOpen], [Phone], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'Cửa hàng chính', N'SỐ 32 NGÁCH 31 NGÕ 14 PHÁO ĐÀI LÁNG LÁNG THƯỢNG, ĐỐNG ĐA, HÀ NỘI', N'09:30 – 20:00', N'0977.070.151 / 0937.313.998', CAST(N'2021-05-06' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([ID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'bai tarot', NULL, NULL, 1)
INSERT [dbo].[Tags] ([ID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'boi bai tarot', NULL, NULL, 1)
INSERT [dbo].[Tags] ([ID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'bài tarot cổ', NULL, NULL, 1)
INSERT [dbo].[Tags] ([ID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'bài tarot là gì', NULL, NULL, 1)
INSERT [dbo].[Tags] ([ID], [NameTag], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'bài tarot đẹp', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'admin', N'202cb962ac59075b964b07152d234b70', NULL, 1, NULL, N'admin181200084@gmail.com', N'0999885568', CAST(N'2021-04-30' AS Date), NULL, 1)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [Status]) VALUES (8, N'namnguyen68', N'202cb962ac59075b964b07152d234b70', N'Nguyễn Việt Nam', 1, N'Bạch Mai, Hai Bà Trưng, Hà Nội', N'nam68@gmail.com', N'0998877885', CAST(N'2021-04-30' AS Date), NULL, 1)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [Status]) VALUES (9, N'namnguyen', N'202cb962ac59075b964b07152d234b70', N'Nam', 1, N'Ngọc Khánh', NULL, N'0988881111', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
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
ALTER TABLE [dbo].[Publisher] ADD  CONSTRAINT [DF_Publisher_Status_1]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ((0)) FOR [Status]
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
ALTER TABLE [dbo].[OnlinePaying]  WITH CHECK ADD  CONSTRAINT [FK_OnlinePaying_PaymentMethod] FOREIGN KEY([Method])
REFERENCES [dbo].[PaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[OnlinePaying] CHECK CONSTRAINT [FK_OnlinePaying_PaymentMethod]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Publisher] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Publisher]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_ProductTags_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_ProductTags_Products]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_ProductTags_ProductTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ProductTypes] ([ID])
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_ProductTags_ProductTypes]
GO
ALTER TABLE [dbo].[ProductTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProductTypes_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([ID])
GO
ALTER TABLE [dbo].[ProductTypes] CHECK CONSTRAINT [FK_ProductTypes_ProductCategories]
GO
