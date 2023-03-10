USE [master]
GO
/****** Object:  Database [Wallet]    Script Date: 2/21/2023 3:29:09 AM ******/
CREATE DATABASE [Wallet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wallet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Wallet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wallet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Wallet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Wallet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wallet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wallet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wallet] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wallet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wallet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wallet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wallet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wallet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wallet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wallet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wallet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wallet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wallet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wallet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wallet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wallet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wallet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wallet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wallet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wallet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wallet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wallet] SET  MULTI_USER 
GO
ALTER DATABASE [Wallet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wallet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wallet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wallet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wallet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wallet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Wallet] SET QUERY_STORE = OFF
GO
USE [Wallet]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/21/2023 3:29:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 2/21/2023 3:29:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[IdCuenta] [int] IDENTITY(1,1) NOT NULL,
	[NumeCuen] [nvarchar](max) NULL,
	[TipoCuen] [nvarchar](max) NULL,
	[SaldInic] [float] NOT NULL,
	[Estado] [bit] NOT NULL,
	[ClienteId] [int] NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 2/21/2023 3:29:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[IdMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[TipoMovi] [nvarchar](max) NULL,
	[Valor] [float] NOT NULL,
	[Saldo] [float] NOT NULL,
	[ClienteId] [int] NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[IdMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 2/21/2023 3:29:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Genero] [nvarchar](max) NULL,
	[Edad] [int] NOT NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Contrasena] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230221070523_v1.0.0', N'5.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230221073358_nueva', N'5.0.3')
GO
SET IDENTITY_INSERT [dbo].[Cuentas] ON 

INSERT [dbo].[Cuentas] ([IdCuenta], [NumeCuen], [TipoCuen], [SaldInic], [Estado], [ClienteId]) VALUES (1, N'478758', N'Ahorro', 2000, 1, 5)
INSERT [dbo].[Cuentas] ([IdCuenta], [NumeCuen], [TipoCuen], [SaldInic], [Estado], [ClienteId]) VALUES (2, N'225487', N'Corriente', 100, 1, 6)
INSERT [dbo].[Cuentas] ([IdCuenta], [NumeCuen], [TipoCuen], [SaldInic], [Estado], [ClienteId]) VALUES (3, N'495878', N'Ahorros', 0, 1, 7)
INSERT [dbo].[Cuentas] ([IdCuenta], [NumeCuen], [TipoCuen], [SaldInic], [Estado], [ClienteId]) VALUES (4, N'496825', N'Ahorros', 540, 1, 6)
SET IDENTITY_INSERT [dbo].[Cuentas] OFF
GO
SET IDENTITY_INSERT [dbo].[Movimientos] ON 

INSERT [dbo].[Movimientos] ([IdMovimiento], [Fecha], [TipoMovi], [Valor], [Saldo], [ClienteId]) VALUES (1, CAST(N'2022-10-02T00:00:00.0000000' AS DateTime2), N'Ahorro', 5000, 2000, 5)
INSERT [dbo].[Movimientos] ([IdMovimiento], [Fecha], [TipoMovi], [Valor], [Saldo], [ClienteId]) VALUES (2, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'Corriente', 300, 100, 6)
INSERT [dbo].[Movimientos] ([IdMovimiento], [Fecha], [TipoMovi], [Valor], [Saldo], [ClienteId]) VALUES (3, CAST(N'2021-09-03T00:00:00.0000000' AS DateTime2), N'Ahorros', 700, 0, 7)
SET IDENTITY_INSERT [dbo].[Movimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([Id], [Nombre], [Genero], [Edad], [Direccion], [Telefono], [Discriminator], [Contrasena], [Estado]) VALUES (5, N'Jose Lema', N'Masculino', 23, N'Otavalo sn y principal', N'098254785', N'', 1234, 1)
INSERT [dbo].[Personas] ([Id], [Nombre], [Genero], [Edad], [Direccion], [Telefono], [Discriminator], [Contrasena], [Estado]) VALUES (6, N'Marianela Montalvo', N'Femenino', 50, N'Amazonas y NNUU', N'097548965', N'', 5678, 1)
INSERT [dbo].[Personas] ([Id], [Nombre], [Genero], [Edad], [Direccion], [Telefono], [Discriminator], [Contrasena], [Estado]) VALUES (7, N'Juan Osorio', N'13 junio y equinoccial', 24, N'Masculino', N'098874587', N'', 1245, 1)
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
/****** Object:  Index [IX_Cuentas_ClienteId]    Script Date: 2/21/2023 3:29:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Cuentas_ClienteId] ON [dbo].[Cuentas]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movimientos_ClienteId]    Script Date: 2/21/2023 3:29:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Movimientos_ClienteId] ON [dbo].[Movimientos]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_Personas_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Personas] ([Id])
GO
ALTER TABLE [dbo].[Cuentas] CHECK CONSTRAINT [FK_Cuentas_Personas_ClienteId]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Personas_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Personas] ([Id])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Personas_ClienteId]
GO
USE [master]
GO
ALTER DATABASE [Wallet] SET  READ_WRITE 
GO
