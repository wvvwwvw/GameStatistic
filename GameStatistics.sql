USE [GameStatistics]
GO
/****** Object:  Table [dbo].[AnalystRec]    Script Date: 10.12.2023 08:19:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalystRec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Recommendations] [varchar](max) NOT NULL,
 CONSTRAINT [PK_AnalystRec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 10.12.2023 08:19:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](50) NOT NULL,
	[Last_name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platform_type]    Script Date: 10.12.2023 08:19:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platform_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlatformName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Platform_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type]    Script Date: 10.12.2023 08:19:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.12.2023 08:19:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Platform] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 10.12.2023 08:19:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Client_ID] [int] NOT NULL,
	[Sale_date] [date] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnalystRec] ON 

INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (1, CAST(N'2023-12-02' AS Date), N'Улучшите производительность вашего персонала.')
INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (2, CAST(N'2023-12-04' AS Date), N'Организуйте тренинги для повышения навыков команды.')
INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (3, CAST(N'2023-11-13' AS Date), N'Оптимизируйте бизнес-процессы для экономии времени и ресурсов.')
INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (4, CAST(N'2023-11-21' AS Date), N'Обратите внимание на потребности клиентов и адаптируйтесь.')
INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (5, CAST(N'2023-11-11' AS Date), N'Исследуйте рынок для поиска новых возможностей.')
INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (6, CAST(N'2023-11-24' AS Date), N'Внедрите новые технологии для повышения эффективности.')
INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (7, CAST(N'2023-12-10' AS Date), N'Добавить новые игры')
INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (8, CAST(N'2023-12-10' AS Date), N'Добавить новых клиентов')
INSERT [dbo].[AnalystRec] ([ID], [Date], [Recommendations]) VALUES (9, CAST(N'2023-12-10' AS Date), N'Удалить неуктуальные игры')
SET IDENTITY_INSERT [dbo].[AnalystRec] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (1, N'John', N'Doe', N'john.doe@example.com', N'+1 (555) 555-5555')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (2, N'Jane', N'Smith', N'jane.smith@example.com', N'+1 (555) 555-5556')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (3, N'Michael', N'Johnson', N'michael.johnson@example.com', N'+1 (555) 555-5557')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (4, N'John', N'Doe', N'johndoe@gmail.com', N'123-456-7890')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (5, N'Jane', N'Smith', N'janesmith@gmail.com', N'456-789-0123')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (6, N'Michael', N'Johnson', N'michaeljohnson@gmail.com', N'789-012-3456')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (7, N'Emily', N'Williams', N'emilywilliams@gmail.com', N'012-345-6789')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (8, N'Daniel', N'Brown', N'danielbrown@gmail.com', N'345-678-9012')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (9, N'Olivia', N'Jones', N'oliviajones@gmail.com', N'678-901-2345')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (10, N'William', N'Garcia', N'williamgarcia@gmail.com', N'901-234-5678')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (11, N'Sophia', N'Martinez', N'sophiamartinez@gmail.com', N'234-567-8901')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (12, N'David', N'Rodriguez', N'davidrodriguez@gmail.com', N'567-890-1234')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (13, N'Isabella', N'Hernandez', N'isabellahernandez@gmail.com', N'890-123-4567')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (14, N'James', N'Lopez', N'jameslopez@gmail.com', N'345-678-9012')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (15, N'Emma', N'Gonzalez', N'emmagonzalez@gmail.com', N'678-901-2345')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (16, N'Benjamin', N'Wilson', N'benjaminwilson@gmail.com', N'901-234-5678')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (17, N'Ava', N'Anderson', N'avaanderson@gmail.com', N'234-567-8901')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (18, N'Mason', N'Taylor', N'masontaylor@gmail.com', N'567-890-1234')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (19, N'Evelyn', N'Thomas', N'evelythomas@gmail.com', N'890-123-4567')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (20, N'Jacob', N'Moore', N'jacobmoore@gmail.com', N'123-456-7890')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (21, N'Harper', N'Jackson', N'harperjackson@gmail.com', N'456-789-0123')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (22, N'Ethan', N'White', N'ethanwhite@gmail.com', N'789-012-3456')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (23, N'Amelia', N'Harris', N'ameliaharris@gmail.com', N'012-345-6789')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (24, N'John', N'Doe', N'john.doe@email.com', N'123-456-7890')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (25, N'Jane', N'Smith', N'jane.smith@email.com', N'987-654-3210')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (26, N'Michael', N'Johnson', N'michael.johnson@email.com', N'555-123-4567')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (27, N'Emily', N'Davis', N'emily.davis@email.com', N'111-222-3333')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (28, N'David', N'Brown', N'david.brown@email.com', N'444-555-6666')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (29, N'Sarah', N'Miller', N'sarah.miller@email.com', N'777-888-9999')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (30, N'Matthew', N'Wilson', N'matthew.wilson@email.com', N'101-202-3030')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (31, N'Olivia', N'Martinez', N'olivia.martinez@email.com', N'404-505-6060')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (32, N'Daniel', N'Hernandez', N'daniel.hernandez@email.com', N'707-808-9090')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (33, N'Ava', N'Garcia', N'ava.garcia@email.com', N'123-456-7890')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (34, N'Ethan', N'Lopez', N'ethan.lopez@email.com', N'987-654-3210')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (35, N'Sophia', N'Gonzalez', N'sophia.gonzalez@email.com', N'555-123-4567')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (36, N'Alexander', N'Perez', N'alexander.perez@email.com', N'111-222-3333')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (37, N'Isabella', N'Torres', N'isabella.torres@email.com', N'444-555-6666')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (38, N'James', N'Rivera', N'james.rivera@email.com', N'777-888-9999')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (39, N'Mia', N'Collins', N'mia.collins@email.com', N'101-202-3030')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (40, N'Benjamin', N'Turner', N'benjamin.turner@email.com', N'404-505-6060')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (41, N'Charlotte', N'Cooper', N'charlotte.cooper@email.com', N'707-808-9090')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (42, N'Henry', N'Reed', N'henry.reed@email.com', N'123-456-7890')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (43, N'Amelia', N'Bailey', N'amelia.bailey@email.com', N'987-654-3210')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (44, N'Настя', N'Ерина', N'nerina@mail.com', N'89881865870')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (45, N'Amber', N'Lee', N'alee@gmail.com', N'879')
INSERT [dbo].[Clients] ([ID], [First_name], [Last_name], [Email], [Phone]) VALUES (46, N'Alice', N'Jhon', N'alicej@mail.com', N'67788')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Platform_type] ON 

INSERT [dbo].[Platform_type] ([ID], [PlatformName]) VALUES (1, N'PC')
INSERT [dbo].[Platform_type] ([ID], [PlatformName]) VALUES (2, N'Console')
INSERT [dbo].[Platform_type] ([ID], [PlatformName]) VALUES (3, N'Mobile')
INSERT [dbo].[Platform_type] ([ID], [PlatformName]) VALUES (4, N'VR')
INSERT [dbo].[Platform_type] ([ID], [PlatformName]) VALUES (5, N'Event')
SET IDENTITY_INSERT [dbo].[Platform_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_type] ON 

INSERT [dbo].[Product_type] ([ID], [TypeName]) VALUES (1, N'Game')
INSERT [dbo].[Product_type] ([ID], [TypeName]) VALUES (2, N'Entartainment')
SET IDENTITY_INSERT [dbo].[Product_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (2, N'Genshin Impact', 1, CAST(199.00 AS Decimal(10, 2)), N' ', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (6, N'Red Dead Redemption 2', 2, CAST(59.99 AS Decimal(10, 2)), N'Experience the life of an outlaw in the wild west.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (7, N'The Sims 4', 1, CAST(39.99 AS Decimal(10, 2)), N'Create and control people in a virtual world.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (8, N'Fortnite', 1, CAST(0.00 AS Decimal(10, 2)), N'Battle to be the last one standing in this popular online game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (9, N'Assassin"s Creed Odyssey', 1, CAST(49.99 AS Decimal(10, 2)), N'Embark on an epic journey in ancient Greece.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (10, N'NBA 2K20', 2, CAST(59.99 AS Decimal(10, 2)), N'Play as your favorite NBA team and players in this basketball simulation game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (11, N'Angry Birds 2', 3, CAST(0.00 AS Decimal(10, 2)), N'Launch birds at pigs in this addictive mobile game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (12, N'PlayStation 5', 2, CAST(499.99 AS Decimal(10, 2)), N'Experience next-gen gaming with the latest PlayStation console.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (13, N'Xbox Series X', 2, CAST(499.99 AS Decimal(10, 2)), N'Power your dreams with the most powerful Xbox console ever.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (14, N'iPhone 11', 3, CAST(699.00 AS Decimal(10, 2)), N'Experience the power of Apple”s latest smartphone.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (15, N'Samsung Galaxy S20', 3, CAST(999.00 AS Decimal(10, 2)), N'Discover the ultimate smartphone for gaming and entertainment.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (16, N'HTC Vive', 4, CAST(599.00 AS Decimal(10, 2)), N'Immerse yourself in virtual reality with this high-end VR headset.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (17, N'PlayStation VR', 4, CAST(299.99 AS Decimal(10, 2)), N'Experience gaming like never before with PlayStation”s virtual reality headset.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (18, N'E3 Gaming Expo VIP Pass', 5, CAST(999.00 AS Decimal(10, 2)), N'Get exclusive access to all areas and events at the E3 Gaming Expo.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (19, N'World of Warcraft', 1, CAST(14.99 AS Decimal(10, 2)), N'Enter the world of Azeroth and join thousands of players in this MMORPG.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (20, N'Overwatch', 1, CAST(39.99 AS Decimal(10, 2)), N'Join the fight for the future in this team-based shooter.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (21, N'Tetris', 3, CAST(0.00 AS Decimal(10, 2)), N'Arrange falling blocks to clear lines and score points in this classic puzzle game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (22, N'Fruit Ninja VR', 4, CAST(14.99 AS Decimal(10, 2)), N'Slice fruit with precision in virtual reality.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (23, N'Just Dance 2020', 2, CAST(39.99 AS Decimal(10, 2)), N'Dance to your favorite songs with this popular rhythm game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (24, N'Google Stadia', 1, CAST(129.00 AS Decimal(10, 2)), N'Play your favorite games on any screen without a console.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (25, N'Amazon Luna', 1, CAST(5.99 AS Decimal(10, 2)), N'Subscribe to access a library of games and play instantly on supported devices.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (26, N'Animal Crossing: New Horizons', 2, CAST(59.99 AS Decimal(10, 2)), N'Create your own paradise on a deserted island in this relaxing simulation game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (27, N'Among Us', 1, CAST(4.99 AS Decimal(10, 2)), N'Work together to complete tasks on a spaceship while impostors try to take over.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (28, N'Clash of Clans', 3, CAST(0.00 AS Decimal(10, 2)), N'Build your village and train your troops to battle with millions of players worldwide.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (29, N'Poke?mon Sword and Shield', 2, CAST(59.99 AS Decimal(10, 2)), N'Embark on a new adventure in the Galar region and catch new Poke?mon.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (30, N'Star Wars: Squadrons', 1, CAST(39.99 AS Decimal(10, 2)), N'Pilot iconic starfighters in multiplayer space battles.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (31, N'Farming Simulator 19', 1, CAST(24.99 AS Decimal(10, 2)), N'Build and manage your own farm in this realistic simulation game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (32, N'FIFA World Cup', 5, CAST(199.00 AS Decimal(10, 2)), N'Experience the excitement of the FIFA World Cup live at the stadium.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (33, N'Comic-Con International Pass', 5, CAST(149.00 AS Decimal(10, 2)), N'Join fans from all over the world at the ultimate comic and pop culture event.', 2)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (34, N'The Legend of Zelda: Breath of the Wild', 2, CAST(59.99 AS Decimal(10, 2)), N'Embark on a journey to save Hyrule in this open-world adventure.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (35, N'Pac-Man', 3, CAST(0.00 AS Decimal(10, 2)), N'Guide Pac-Man through mazes to eat all the dots and avoid ghosts.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (36, N'Roblox', 3, CAST(0.00 AS Decimal(10, 2)), N'Play and create games with friends in this user-generated online gaming platform.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (37, N'Resident Evil VII: Biohazard VR', 4, CAST(29.99 AS Decimal(10, 2)), N'Experience survival horror in virtual reality as you explore a derelict plantation mansion.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (38, N'Madden NFL21', 2, CAST(59.99 AS Decimal(10, 2)), N'Take control of your favorite NFL teams and players in this football simulation game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (39, N'League of Legends', 1, CAST(0.00 AS Decimal(10, 2)), N'Join millions of players in the world”s largest online gaming community.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (40, N'Apex Legends', 1, CAST(0.00 AS Decimal(10, 2)), N'Squad up and compete to be the last one standing in this free-to-play battle royale game.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (41, N'Minecraft Dungeons', 1, CAST(29.99 AS Decimal(10, 2)), N'Fight your way through an all-new action-adventure game inspired by classic dungeon crawlers.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (42, N'Guitar Hero Live', 2, CAST(39.99 AS Decimal(10, 2)), N'Experience the thrill of playing live in front of real crowds with Guitar Hero.', 1)
INSERT [dbo].[Products] ([ID], [Name], [Platform], [Price], [Description], [Type]) VALUES (43, N'Beat Saber', 4, CAST(29.99 AS Decimal(10, 2)), N'Immerse yourself in a virtual reality rhythm game.', 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (2, 30, 8, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (3, 26, 21, CAST(N'2023-01-12' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (4, 26, 29, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (5, 40, 34, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (6, 18, 3, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (7, 6, 10, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (8, 16, 7, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (9, 2, 1, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (10, 28, 4, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (11, 9, 26, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (12, 22, 6, CAST(N'2023-08-10' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (13, 27, 30, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (14, 18, 23, CAST(N'2023-02-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (15, 7, 18, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (16, 11, 34, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (17, 21, 31, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (18, 23, 22, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (19, 8, 43, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (20, 16, 31, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (21, 20, 12, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (22, 37, 3, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (23, 29, 3, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (24, 33, 11, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (25, 32, 4, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (26, 2, 42, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (27, 13, 30, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (28, 6, 36, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (29, 2, 12, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (30, 39, 26, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (31, 15, 37, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (32, 9, 10, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (33, 2, 32, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (34, 39, 33, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (35, 24, 43, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (36, 10, 18, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (37, 40, 32, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (38, 37, 24, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (39, 12, 25, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (40, 25, 26, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (41, 40, 31, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (42, 15, 18, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (43, 11, 39, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (44, 35, 21, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (45, 17, 9, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (46, 7, 2, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (47, 28, 39, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (48, 16, 37, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (49, 43, 30, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (50, 14, 9, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (51, 32, 28, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (52, 41, 21, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (53, 20, 29, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (54, 43, 18, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (55, 36, 37, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (56, 25, 42, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (57, 39, 40, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (58, 29, 9, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (59, 43, 19, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (60, 37, 1, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (61, 29, 26, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (62, 36, 31, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (63, 7, 6, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (64, 43, 33, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (65, 43, 31, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (66, 12, 14, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (67, 31, 33, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (68, 10, 37, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (69, 21, 16, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (70, 42, 36, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (71, 43, 17, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (72, 37, 33, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (73, 26, 20, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (74, 29, 4, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (75, 34, 11, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (76, 20, 3, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (77, 22, 37, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (78, 32, 7, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (79, 7, 25, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (80, 32, 31, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (81, 41, 23, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (82, 39, 24, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (83, 40, 23, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (84, 40, 24, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (85, 14, 23, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (86, 42, 39, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (87, 21, 33, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (88, 16, 43, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (89, 18, 12, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (90, 19, 2, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (91, 26, 28, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (92, 9, 1, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (93, 20, 36, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (94, 30, 36, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (95, 27, 41, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (96, 37, 12, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (97, 29, 32, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (98, 27, 4, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (99, 31, 5, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (100, 39, 11, CAST(N'2023-12-19' AS Date))
GO
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (101, 37, 28, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (102, 2, 6, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (103, 13, 3, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (104, 23, 41, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (105, 9, 39, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (106, 7, 38, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (107, 6, 39, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (108, 42, 41, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (109, 19, 17, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (110, 36, 35, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (111, 18, 29, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (112, 19, 40, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (113, 32, 10, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (114, 23, 34, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (115, 41, 20, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (116, 9, 6, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (117, 41, 13, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (118, 20, 11, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (119, 26, 42, CAST(N'2023-02-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (120, 23, 10, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Sales] ([ID], [Product_ID], [Client_ID], [Sale_date]) VALUES (121, 23, 9, CAST(N'2023-08-19' AS Date))
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Platform_type] FOREIGN KEY([Platform])
REFERENCES [dbo].[Platform_type] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Platform_type]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Product_type] FOREIGN KEY([Type])
REFERENCES [dbo].[Product_type] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Product_type]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Clients] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Clients]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Products]
GO
