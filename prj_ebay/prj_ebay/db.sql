USE [master]
GO
/****** Object:  Database [prj_ebay]    Script Date: 10/28/2024 12:46:05 AM ******/
CREATE DATABASE [prj_ebayy]
GO

USE [prj_ebayy]
GO
CREATE TABLE [dbo].[Carts](
	[customer_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/28/2024 12:46:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 10/28/2024 12:46:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[fback_id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[rated_star] [int] NULL,
	[feedback_content] [nvarchar](max) NULL,
	[feedback_image] [varchar](max) NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
	[date] [datetime] NULL,
	[avatar_user] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[fback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 10/28/2024 12:46:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/28/2024 12:46:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/28/2024 12:46:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[customer_name] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](500) NULL,
	[note] [nvarchar](500) NULL,
	[order_datetime] [datetime] NULL,
	[total_cost] [int] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK__Orders__3213E83FE25DA28F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/28/2024 12:46:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[unitprice] [int] NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](4000) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsImages]    Script Date: 10/28/2024 12:46:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsImages](
	[product_id] [int] NULL,
	[image_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/28/2024 12:46:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](1000) NULL,
	[fullName] [nvarchar](100) NULL,
	[address] [nvarchar](500) NULL,
	[phone] [nvarchar](20) NULL,
	[avatar] [nvarchar](max) NULL,
	[role] [varchar](20) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK__Users__3213E83F7CE4DECE] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Clothes')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Electronics')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Healthy&Beauty')
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Book,Movies&Music')
INSERT [dbo].[Categories] ([id], [name]) VALUES (5, N'Watches')
INSERT [dbo].[Categories] ([id], [name]) VALUES (6, N'Motors')
INSERT [dbo].[Categories] ([id], [name]) VALUES (7, N'Pets')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [url]) VALUES (1, N'./images/book11.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (2, N'./images/book12.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (3, N'./images/book21.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (4, N'./images/book22.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (5, N'./images/clo11.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (6, N'./images/clo12.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (7, N'./images/clo13.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (8, N'./images/clo21.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (9, N'./images/clo22.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (10, N'./images/clo23.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (11, N'./images/elec11.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (12, N'./images/elect12.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (13, N'./images/elect13.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (14, N'./images/elec21.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (15, N'./images/elect22.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (16, N'./images/elec23.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (17, N'./images/elec31.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (18, N'./images/elec32.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (19, N'./images/elec41.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (20, N'./images/elec42.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (21, N'./images/helthy11.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (22, N'./images/helthy12.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (23, N'./images/helthy13.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (24, N'./images/helthy21.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (25, N'./images/helthy22.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (26, N'./images/helthy23.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (27, N'./images/motor11.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (28, N'./images/motor12.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (29, N'./images/motor13.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (30, N'./images/motor14.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (31, N'./images/motor15.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (32, N'./images/motor2.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (33, N'./images/motor22.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (34, N'./images/motor23.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (35, N'./images/motor3.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (36, N'./images/motor32.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (37, N'./images/motor33.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (38, N'./images/pet11.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (39, N'./images/pet12.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (40, N'./images/pet13.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (41, N'./images/pet21.png')
INSERT [dbo].[Images] ([id], [url]) VALUES (42, N'./images/pet22.png')
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (1, 7, 2, 4)
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (1, 14, 3, 24)
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (2, 6, 1, 3)
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (2, 15, 1, 6)
INSERT [dbo].[OrderDetails] ([order_id], [product_id], [quantity], [price]) VALUES (3, 6, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [customer_id], [customer_name], [email], [phone], [address], [note], [order_datetime], [total_cost], [status]) VALUES (1, 3, N'Nguyễn Văn An', N'nva@gmail.com', N'0123123123', N'Hà Nội', N'', CAST(N'2024-10-27T23:46:21.690' AS DateTime), 28, N'completed')
INSERT [dbo].[Orders] ([id], [customer_id], [customer_name], [email], [phone], [address], [note], [order_datetime], [total_cost], [status]) VALUES (2, 3, N'Nguyễn Văn An', N'nva@gmail.com', N'0123123123', N'Hà Nội', N'', CAST(N'2024-10-27T23:47:06.930' AS DateTime), 9, N'processing')
INSERT [dbo].[Orders] ([id], [customer_id], [customer_name], [email], [phone], [address], [note], [order_datetime], [total_cost], [status]) VALUES (3, 3, N'Nguyễn Văn An', N'nva@gmail.com', N'0123123123', N'Hà Nội', N'', CAST(N'2024-10-27T23:48:33.227' AS DateTime), 3, N'pending')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (1, N'1976 Harley-Davidson FLH ELECTRA', 4300, 10, N' A vehicle is considered used if it has been registered and issued a title. Used vehicles have had at least one previous owner. The condition of the exterior, interior and engine can vary depending on the vehicle''s history. See the seller''s listing for full details and description of any imperfections', 6)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (2, N'1978 BMW R-Series', 6400, 10, N'This 1978 BMW R100RS is finished in the ultra-rare factory Gold Metallic (046) and a very unique ownership history.



A fascinating ownership history & story!  It’s incredible how personal and meaningful gifts can reflect someone’s achievements and relationships.  This motorcycle was first purchased by the world famous musician Billy Joel, as a gift for his late archivist, Jeffery Schock.  ', 6)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (3, N'1966 Suzuki T20 / X6', 7500, 10, N'This classic 1966 Suzuki T20 / X6 Hustler is a must-have for any motorcycle enthusiast. With a vibrant red exterior and 250cc engine size, 6 speed transmission, this bike is sure to turn heads. The vehicle title is clean and the mileage is at 12557, making it a great option for collectors or riders alike. This Suzuki is perfect for those looking for a unique and stylish addition to their collection.', 6)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (4, N'Apple Macbook Air MLY33LL/A 2022 M2 ', 699, 10, N'This device has been certified by our industry-leading mobile diagnostic software to be 100% fully ', 2)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (5, N'Lenovo IdeaPad 1i 14" (256GB Storage, Intel i3 12th Gen)', 299, 10, N'An item in excellent condition with minimal or no signs of wear. It will have a broken or no factory', 2)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (6, N'3X Tempered Glass Screen Protector For iPhone 16', 3, 1000, N'Seller assumes all responsibility for this listing.
', 2)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (7, N'2 USB C Female to USB a Male Port Converter Adapter', 2, 1000, N'This is Type-C female to USB male connector. 2 x type-C female to usb male adapter. This is a universal adapter. Bullet Point Small and easy to carry.', 2)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (8, N'Comfort Colors C1717 Adult Cotton Short Sleeves Crew', 32, 1000, N'Free shipping', 1)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (9, N'Pro Club Men''s Heavyweight Cotton', 8, 1000, NULL, 1)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (10, N'Tarte Double Duty Beauty Shape Tape Concealer', 15, 1000, NULL, 3)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (11, N'New 1.0oz/ 30g 4 in 1 Biomimic Foundation', 14, 1000, NULL, 3)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (12, N'The Simple Path
', 7, 1000, N'Please (read) the information and condition as well as read Item disclosures of the book below', 4)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (13, N'The Frozen River A GMA Book Club Pick', 7, 1000, N'Please (read) the information and condition as well as read Item disclosures of the book below', 4)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (14, N'Dog Coat Waterproof', 8, 1000, NULL, 7)
INSERT [dbo].[Products] ([id], [name], [unitprice], [quantity], [description], [category_id]) VALUES (15, N'Puppy Dog Velvet Pajamas Pullover Plush Jumpsuit', 6, 1000, NULL, 7)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (12, 1)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (12, 2)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (13, 3)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (13, 4)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (8, 5)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (8, 6)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (8, 7)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (9, 8)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (9, 9)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (9, 10)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (4, 11)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (4, 12)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (4, 13)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (5, 14)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (5, 15)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (5, 16)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (6, 17)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (6, 18)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (7, 19)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (7, 20)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (10, 21)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (10, 22)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (10, 23)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (11, 24)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (11, 25)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (11, 26)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (1, 27)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (1, 28)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (1, 29)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (1, 30)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (1, 31)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (2, 32)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (2, 33)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (2, 34)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (3, 35)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (3, 36)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (3, 37)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (14, 38)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (14, 39)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (14, 40)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (15, 41)
INSERT [dbo].[ProductsImages] ([product_id], [image_id]) VALUES (15, 42)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userId], [email], [password], [fullName], [address], [phone], [avatar], [role], [active]) VALUES (1, N'admin@gmail.com', N'1', N'Admin', NULL, NULL, NULL, N'admin', 1)
INSERT [dbo].[Users] ([userId], [email], [password], [fullName], [address], [phone], [avatar], [role], [active]) VALUES (2, N'staff@gmail.com', N'1', N'Staff', NULL, NULL, NULL, N'staff', 1)
INSERT [dbo].[Users] ([userId], [email], [password], [fullName], [address], [phone], [avatar], [role], [active]) VALUES (3, N'nva@gmail.com', N'1', N'Nguyễn Văn Ann', N'Hà Nội', N'0123123123', NULL, N'user', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK__Carts__customer___2F10007B] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK__Carts__customer___2F10007B]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__35BCFE0A] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__order__35BCFE0A]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__customer__32E0915F] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__customer__32E0915F]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[ProductsImages]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[Images] ([id])
GO
ALTER TABLE [dbo].[ProductsImages]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
USE [master]
GO
ALTER DATABASE [prj_ebay] SET  READ_WRITE 
GO
