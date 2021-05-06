USE [Tarot]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 5/6/2021 11:40:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[NewID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[NewID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[NewCategories]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[OnlinePaying]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 5/6/2021 11:40:54 PM ******/
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
	[TopHot] [varchar](50) NULL,
	[ViewCount] [int] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 5/6/2021 11:40:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTags](
	[ProductID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[NameTag] [nvarchar](500) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductTags] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[Publisher]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[RegisterStudent]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[Stores]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 5/6/2021 11:40:54 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 5/6/2021 11:40:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Gender] [bit] NULL,
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
SET IDENTITY_INSERT [dbo].[NewCategories] ON 

INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N' Tìm hiểu về Tarot', NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N' Cảm Nhận Về Bộ Bài', NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N' Spread Trải Bài', NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N' Top Bộ Bài Nổi Bật', NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Ẩn Chính', NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Wands', NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (8, N'Ý Nghĩa 78 Lá Bài Tarot', CAST(N'2021-05-06' AS Date), NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (9, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Cups', NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (10, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Pentacles', NULL, NULL, 1)
INSERT [dbo].[NewCategories] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (11, N'Ý Nghĩa Lá Bài Tarot Trong Bộ Swords', NULL, NULL, 1)
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
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'Thanh Toán Trực Tiếp ', CAST(N'2021-05-06' AS Date), NULL, 1)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'ATM Banking', NULL, NULL, 1)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Ví Điện Tử Momo', NULL, NULL, 1)
INSERT [dbo].[PaymentMethod] ([ID], [Name], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'PayPal', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ID], [CategoryName], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'Bài Tarot ', CAST(N'2021-05-06' AS Date), NULL, 1)
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
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [CreatedDate], [CreatedBy], [Status]) VALUES (35, 2, 7, N'78 Tarot Mythical', N'Bao gồm: 78 Lá bài + Sách hướng dẫn.', N'Bộ bài 78 Tarot Mythical mời gọi bạn bước vào thế giới thần thoại, trong đó có cả những truyền thuyết về các vị thần, sinh vật huyền bí hay những câu chuyện kỳ bí khác. Nếu bạn đã từng sở hữu những phiên bản trước, chắc chắn bạn sẽ không thể bỏ qua được phiên bản đặc biệt này.', NULL, N'/DataImage/images/Tarot-BaiHiem/78-Tarot-Mythical-Tarot.jpg', NULL, CAST(1300000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [CategoryID], [PublisherID], [ProductName], [Description], [Detail], [QuantitySold], [Image], [PromotionPrice], [Price], [TopHot], [ViewCount], [CreatedDate], [CreatedBy], [Status]) VALUES (36, 2, 7, N'78 Tarot Carnival: Cirque du Tarot', N'Bao gồm: 78 Lá bài + Sách hướng dẫn.', N'Dựa trên ý tưởng về một tựa bài Tarot gồm 78 lá do 78 họa sĩ đã từng vẽ Tarot hay theo trường phái hội họa có liên quan đến Tarot nổi tiếng thế giới cùng cộng tác, dự án series 78 Tarot ra đời với nhiều phiên bản mang chủ đề khác nhau. 78 Tarot Carnival là bộ bài thứ ba thuộc series này, mang chủ đề về các sự kiện lễ hội trên thế giới và được phát hành giới hạn trong năm 2016. Có nhiều họa sĩ nổi tiếng tham gia vào quá trình xây dựng artwork của bộ bài độc đáo này, tiêu biểu là Paulina Cassidy, Jasmine Becket-Griffith (Oracle of Shadows and Lights)… Cũng như các phiên bản 78 Tarot khác, Carnival về cơ bản cũng tuân theo hệ thống biểu tượng và hình ảnh của Rider Waite Smith. Sách booklet đi kèm cung cấp mô tả khá chi tiết về ý nghĩa mỗi lá bài, kết nối rất tốt đến hệ thống Tarot truyền thống và xóa nhòa mối lo các lá bài thiếu sự đồng bộ (do được vẽ bởi nhiều người khác nhau). Người dùng cũng có thể chọn thêm cuốn sách companion được phát hành rời, đem đến những thông tin giải nghĩa cụ thể hơn cho bộ bài, đồng thời cũng là một cuốn artbook tuyệt đẹp cho những ai yêu thích nghệ thuật.', NULL, N'/DataImage/images/Tarot-BaiHiem/78-Tarot-Carnival-Tarot.jpg', NULL, CAST(1300000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'Bài Hiếm', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Bài Mini', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'Văn Hóa & Nghệ Thuật', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'Bài Có Mạ Cạnh', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Manga & Comic', NULL, NULL, 1)
INSERT [dbo].[ProductTypes] ([ID], [TypeName], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'Gay & LGBT', NULL, NULL, 1)
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

INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'admin', N'202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, N'admin181200084@gmail.com', N'0999885568', CAST(N'2021-04-30' AS Date), NULL, 1)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [Status]) VALUES (8, N'namnguyen68', N'202cb962ac59075b964b07152d234b70', N'Nam', NULL, N'Bạch Mai, Hai Bà Trưng, Hà Nội', N'nam68@gmail.com', N'0998877885', CAST(N'2021-04-30' AS Date), NULL, 1)
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
