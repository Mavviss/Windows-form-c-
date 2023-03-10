USE [master]
GO
/****** Object:  Database [QLST_Mini]    Script Date: 31/07/2022 11:08:07 SA ******/
CREATE DATABASE [QLST_Mini]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLST_Mini', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLST_Mini.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLST_Mini_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLST_Mini_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLST_Mini] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLST_Mini].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLST_Mini] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLST_Mini] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLST_Mini] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLST_Mini] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLST_Mini] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLST_Mini] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLST_Mini] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLST_Mini] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLST_Mini] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLST_Mini] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLST_Mini] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLST_Mini] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLST_Mini] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLST_Mini] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLST_Mini] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLST_Mini] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLST_Mini] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLST_Mini] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLST_Mini] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLST_Mini] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLST_Mini] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLST_Mini] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLST_Mini] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLST_Mini] SET  MULTI_USER 
GO
ALTER DATABASE [QLST_Mini] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLST_Mini] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLST_Mini] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLST_Mini] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLST_Mini] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLST_Mini] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLST_Mini] SET QUERY_STORE = OFF
GO
USE [QLST_Mini]
GO
/****** Object:  UserDefinedFunction [dbo].[SelectLoaiSPDel]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[SelectLoaiSPDel] (@Maloaisp int)
returns int
as
begin

	declare @row int = (select COUNT(*) from dbo.dbSanPham  where  Maloai = @Maloaisp and TrangThaiSP= 1)
	
	return @row

end
GO
/****** Object:  Table [dbo].[dbCT_HoaDon]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbCT_HoaDon](
	[MaHD] [char](9) NOT NULL,
	[MaSP] [int] NOT NULL,
	[soluong] [int] NULL,
	[DonGia] [float] NOT NULL,
	[TrangThaiHD] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbHoaDon]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbHoaDon](
	[MaHD] [char](9) NOT NULL,
	[MaKH] [char](9) NULL,
	[MaNV] [char](9) NOT NULL,
	[NgayNhap] [date] NULL,
	[TongTien] [float] NOT NULL,
	[TrangThaiHD] [bit] NULL,
 CONSTRAINT [PK_dbHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbKhachHang]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbKhachHang](
	[MaKH] [char](9) NOT NULL,
	[HoTenKh] [nvarchar](50) NOT NULL,
	[Sdt] [varchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[GioiTinh] [nvarchar](9) NULL,
	[TrangthaiKH] [bit] NULL,
 CONSTRAINT [PK_dbKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbLoaiSP]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbLoaiSP](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TrangThaiLSP] [bit] NULL,
 CONSTRAINT [PK_dbLoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbLuong]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbLuong](
	[manv] [char](9) NOT NULL,
	[LuongCB] [float] NOT NULL,
	[luongThuong] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbNhaCC]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbNhaCC](
	[MaNCC] [int] NOT NULL,
	[TenNCC] [nvarchar](max) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[TrangThaiNCC] [bit] NULL,
 CONSTRAINT [PK_dbNhaCC] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbQuanTri]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbQuanTri](
	[MaNV] [char](9) NOT NULL,
	[TenTK] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[ngaytao] [datetime] NOT NULL,
	[trangthai] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbSanPham]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbSanPham](
	[MaSp] [char](9) NOT NULL,
	[Maloai] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[TenSP] [nvarchar](max) NOT NULL,
	[NgayNhap] [date] NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[TrangThaiSP] [bit] NULL,
 CONSTRAINT [PK_dbSanPham] PRIMARY KEY CLUSTERED 
(
	[MaSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 31/07/2022 11:08:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [char](9) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](3) NOT NULL,
	[CMND] [char](9) NOT NULL,
	[ChuVu] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[Luong] [float] NOT NULL,
	[NgSinh] [date] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[dbCT_HoaDon] ([MaHD], [MaSP], [soluong], [DonGia], [TrangThaiHD]) VALUES (N'8        ', 2, NULL, 10000, 1)
INSERT [dbo].[dbCT_HoaDon] ([MaHD], [MaSP], [soluong], [DonGia], [TrangThaiHD]) VALUES (N'6        ', 2, NULL, 20000, 1)
INSERT [dbo].[dbCT_HoaDon] ([MaHD], [MaSP], [soluong], [DonGia], [TrangThaiHD]) VALUES (N'HD207001 ', 154976671, 17, 11000, 1)
INSERT [dbo].[dbCT_HoaDon] ([MaHD], [MaSP], [soluong], [DonGia], [TrangThaiHD]) VALUES (N'HD207001 ', 893504951, 7, 12000, 1)
INSERT [dbo].[dbCT_HoaDon] ([MaHD], [MaSP], [soluong], [DonGia], [TrangThaiHD]) VALUES (N'HD207004 ', 923126565, 3, 9000, 1)
INSERT [dbo].[dbCT_HoaDon] ([MaHD], [MaSP], [soluong], [DonGia], [TrangThaiHD]) VALUES (N'HD207004 ', 893504951, 5, 12000, 1)
INSERT [dbo].[dbCT_HoaDon] ([MaHD], [MaSP], [soluong], [DonGia], [TrangThaiHD]) VALUES (N'HD207005 ', 331321467, 0, 10000, 1)
INSERT [dbo].[dbCT_HoaDon] ([MaHD], [MaSP], [soluong], [DonGia], [TrangThaiHD]) VALUES (N'HD207006 ', 331321467, 10, 10000, 1)
GO
INSERT [dbo].[dbHoaDon] ([MaHD], [MaKH], [MaNV], [NgayNhap], [TongTien], [TrangThaiHD]) VALUES (N'4        ', N'3        ', N'5        ', CAST(N'2022-09-27' AS Date), 12000, 0)
INSERT [dbo].[dbHoaDon] ([MaHD], [MaKH], [MaNV], [NgayNhap], [TongTien], [TrangThaiHD]) VALUES (N'5        ', N'2        ', N'4        ', CAST(N'2022-07-10' AS Date), 20000, 0)
INSERT [dbo].[dbHoaDon] ([MaHD], [MaKH], [MaNV], [NgayNhap], [TongTien], [TrangThaiHD]) VALUES (N'6        ', N'1        ', N'4        ', CAST(N'2022-07-20' AS Date), 120000, 0)
INSERT [dbo].[dbHoaDon] ([MaHD], [MaKH], [MaNV], [NgayNhap], [TongTien], [TrangThaiHD]) VALUES (N'8        ', N'3        ', N'6        ', CAST(N'2022-07-20' AS Date), 250000, 0)
INSERT [dbo].[dbHoaDon] ([MaHD], [MaKH], [MaNV], [NgayNhap], [TongTien], [TrangThaiHD]) VALUES (N'HD207001 ', N'KH2771441', N'         ', CAST(N'2022-07-20' AS Date), 271000, 1)
INSERT [dbo].[dbHoaDon] ([MaHD], [MaKH], [MaNV], [NgayNhap], [TongTien], [TrangThaiHD]) VALUES (N'HD207004 ', N'KH2771441', N'         ', CAST(N'2022-07-20' AS Date), 87000, 1)
INSERT [dbo].[dbHoaDon] ([MaHD], [MaKH], [MaNV], [NgayNhap], [TongTien], [TrangThaiHD]) VALUES (N'HD207005 ', N'KH2771441', N'         ', CAST(N'2022-07-20' AS Date), 0, 1)
INSERT [dbo].[dbHoaDon] ([MaHD], [MaKH], [MaNV], [NgayNhap], [TongTien], [TrangThaiHD]) VALUES (N'HD207006 ', N'KH2771441', N'         ', CAST(N'2022-07-20' AS Date), 100000, 1)
GO
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH0730191', N'Phát Đạt', N'0395626262', CAST(N'2000-03-12' AS Date), N'65 Trần Hưng Đạo, Quận 5', N'Nam', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH1172271', N'Nguyễn Thị Yến Thư', N'0965312334', CAST(N'2001-05-10' AS Date), N'Ấp thị 2,TT Mỹ  Luông, An Giang', N'Nữ', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH2172271', N'Nguyễn Ngọc Yến Thư', N'0965373232', CAST(N'2004-06-24' AS Date), N'quận Tân Phú, thành phố HCM', N'Nữ', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH2271921', N'nguyễn hải đăng', N'0399440575', CAST(N'2022-07-19' AS Date), N'10/10 phường 15 bình thạnh', N'Nữ', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH2771441', N'Phạm hải Đăng', N'0342781163', CAST(N'2002-03-23' AS Date), N'41 Đường số 2 , phường an lạc A , Quận Bình Tân', N'Nam', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH2871440', N'Nguyễn Hòa Đồng', N'0399440578', CAST(N'2002-07-19' AS Date), N'65 Huỳnh Thúc Kháng, Quận 1', N'Nam', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH2971446', N'Trần Hồng Yến', N'0585781236', CAST(N'2002-09-09' AS Date), N'160/11/3 Phường 15 , Quận Bình Thạnh', N'Nữ', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH2972274', N'Nguyễn Trần Trung Trực', N'0764453763', CAST(N'2001-07-22' AS Date), N'985 quang trung, quận Gò Vấp, thành phố Hồ Chí Minh', N'Nam', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH3071444', N'Nguyễn Minh Đạt', N'0903645655', CAST(N'2002-09-06' AS Date), N'78-80-82, Hoàng Hoa Thám, Phường 12, Tân Bình, Thành phố Hồ Chí Minh 700000', N'Nam', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH3072275', N'Phạm Hữu Tín', N'0733981677', CAST(N'2001-07-22' AS Date), N'27/19 Cộng hòa, quận Tân Bình, thành phố Hồ Chí Minh', N'Nam', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH3171441', N'Cao Phát Đạt', N'0907331930', CAST(N'2002-09-15' AS Date), N'203 Nguyễn Thượng Hiền, Phường 6, Bình Thạnh, Thành phố Hồ Chí Minh', N'Nam', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH3271441', N'Ty Thy', N'0903265656', CAST(N'2000-02-02' AS Date), N'2B Đ. Bến Phú Lâm, Phường 9, Quận 6, Thành phố Hồ Chí Minh', N'Nam', 1)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH3371443', N'Huỳnh Quang', N'0342781163', CAST(N'2000-02-02' AS Date), N' 241 Lê Quang Định, P. 7, Quận Bình Thạnh, TP. HCM', N'Nam', 0)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH3371444', N'Nguyễn Quang Huy', N'0369794845', CAST(N'2000-04-16' AS Date), N'6 Võ Oanh (Đường D3 Cũ), P.25, Bình Thạnh', N'Nam', 0)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH5730193', N'Nhật Vượn', N'0392958484', CAST(N'2000-02-02' AS Date), N'41 đường số 2 an lạc A Bình Tân', N'Nam', 0)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH5972265', N'Trần Trọng Cát', N'0961553884', CAST(N'2003-03-03' AS Date), N'65 Hoàng hoa Thám, quận Tân Bình, thành phố Hồ Chí Minh', N'Nữ', 0)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH6722718', N'Phạm Thị Chang', N'0927585423', CAST(N'2000-06-08' AS Date), N'23 CMTT, quận 3, thành phố HCM', N'Nữ', 0)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH7722741', N'Trần Đình Huy', N'0843243234', CAST(N'2002-06-13' AS Date), N'63 Trần Phú, thành phố Hồ Chí Minh', N'Nam', 0)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH8722736', N'Nguyễn Thị Lan', N'0306205645', CAST(N'2002-06-22' AS Date), N'179 Huỳnh Thúc Kháng, quận 1, thành phố Hồ Chí Minh', N'Nữ', 0)
INSERT [dbo].[dbKhachHang] ([MaKH], [HoTenKh], [Sdt], [NgaySinh], [DiaChi], [GioiTinh], [TrangthaiKH]) VALUES (N'KH9722753', N'Trần Thị Hoa ', N'0861457458', CAST(N'2002-06-22' AS Date), N'36/20 bạch đằng, Phường 2, quận Tân Bình, thành phố HCM', N'Nữ', 0)
GO
INSERT [dbo].[dbLoaiSP] ([MaLoai], [TenLoai], [TrangThaiLSP]) VALUES (1, N'Nước', 1)
INSERT [dbo].[dbLoaiSP] ([MaLoai], [TenLoai], [TrangThaiLSP]) VALUES (2, N'Đồ gia dụng', 1)
INSERT [dbo].[dbLoaiSP] ([MaLoai], [TenLoai], [TrangThaiLSP]) VALUES (3, N'Thực phẩm', 1)
INSERT [dbo].[dbLoaiSP] ([MaLoai], [TenLoai], [TrangThaiLSP]) VALUES (4, N'Đồ ăn nhanh', 0)
INSERT [dbo].[dbLoaiSP] ([MaLoai], [TenLoai], [TrangThaiLSP]) VALUES (5, N'Hóa Chất', 0)
INSERT [dbo].[dbLoaiSP] ([MaLoai], [TenLoai], [TrangThaiLSP]) VALUES (6, N'Nhu Yếu Phẩm', 1)
GO
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (1001, N'Big C TRƯỜNG CHINH', N'1/1 Trường Chinh, Phường Tây Thạnh, Quận Tân Phú, TP. Hồ Chí Minh', N'0285438678', 1)
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (1132, N'Công ty Phân phối hàng tiêu dùng Phú Hương', N'20 Đường Núi Thành, Phường 13, Tân Bình, Hồ Chí Minh 70000', N'0903012238', 1)
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (2001, N'BigC An Lạc', N'1231 Quốc lộ 1A, Khu Phố 5, Phường Bình Trị Đông B, Quận Bình Tân, TP. Hồ Chí Minh', N' 028387067', 1)
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (2002, N'Hệ thống phân phối sỉ và lẻ SONG ANH', N'60 đường TTH20, khu phố 1A, Quận 12, Thành phố Hồ Chí Minh', N'0708478596', 1)
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (2721, N'LOTTE Mart Quận Tân Bình', N' 20 Cộng Hòa, Phường 4, Tân Bình, Thành phố Hồ Chí Minh', N'0283948905', 1)
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (3026, N'CTI Supply', N'52 Huỳnh Thiện Lộc, Hoà Thanh, Tân Phú, Thành phố Hồ Chí Minh 70000', N'0235645666', 1)
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (3301, N'DC Tân Uyên', N'Tổ 1, khu phố 5 - Phường Uyên Hưng - Thị xã Tân Uyên - Bình Dương', N'0223656456', 1)
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (3695, N'Timperland', N'Đường DT746 Bình Chánh, P. Khánh Bình, TX Tân Uyên, tỉnh Bình Dương', N'0399441266', 1)
INSERT [dbo].[dbNhaCC] ([MaNCC], [TenNCC], [DiaChi], [SDT], [TrangThaiNCC]) VALUES (3964, N'Bông Mai', N'237 Xô Viết Nghệ Tĩnh, Phường 17,Quận Bình Thạnh', N'0366578196', 1)
GO
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'599202249', N'ahyeah147', N'201510510521333632082362244972230467030', CAST(N'2022-07-21T23:27:53.787' AS DateTime), 1)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'338202243', N'tuyethoa', N'2721352213108178921626921914914193403475', CAST(N'2022-07-21T23:28:35.780' AS DateTime), 0)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'433202222', N'thaonhu', N'1419414912741120147721232171431684825010019', CAST(N'2022-07-21T23:29:35.187' AS DateTime), 1)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'172202222', N'hoadong', N'1419414912741120147721232171431684825010019', CAST(N'2022-07-21T23:29:53.880' AS DateTime), 1)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'988202225', N'haidang', N'1419414912741120147721232171431684825010019', CAST(N'2022-07-21T23:30:12.967' AS DateTime), 1)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'269202256', N'thaibao', N'1419414912741120147721232171431684825010019', CAST(N'2022-07-21T23:30:29.250' AS DateTime), 1)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'75202252 ', N'hongyen', N'1419414912741120147721232171431684825010019', CAST(N'2022-07-21T23:30:59.610' AS DateTime), 1)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'851202218', N'honghuong', N'1419414912741120147721232171431684825010019', CAST(N'2022-07-21T23:31:23.637' AS DateTime), 0)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'58420223 ', N'tuyetnhi', N'1419414912741120147721232171431684825010019', CAST(N'2022-07-21T23:31:39.373' AS DateTime), 1)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'491202211', N'binhtrong', N'2352255391451241871612381628842610062116', CAST(N'2022-07-22T07:25:57.077' AS DateTime), 0)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'96720229 ', N'nhanvien', N'3244185981728979115075721453575112', CAST(N'2022-07-30T14:25:29.627' AS DateTime), 0)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'24202236 ', N'phamdang812', N'3244185981728979115075721453575112', CAST(N'2022-07-30T18:53:59.113' AS DateTime), 1)
INSERT [dbo].[dbQuanTri] ([MaNV], [TenTK], [MatKhau], [ngaytao], [trangthai]) VALUES (N'398202254', N'phamdang', N'3244185981728979115075721453575112', CAST(N'2022-07-30T18:50:00.667' AS DateTime), 1)
GO
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'000659556', 4, 3695, N'Gà Sốt Me', CAST(N'2022-07-30' AS Date), 20000, 200, 0)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'069786646', 4, 3695, N'Gà chiên', CAST(N'2022-07-07' AS Date), 12000, 156, 0)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'112312123', 1, 1001, N'Nước lọc tinh khiết', CAST(N'2022-07-07' AS Date), 20000, 2000, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'142341234', 2, 3964, N'Chảo chóng dính', CAST(N'2022-07-07' AS Date), 36000, 170, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'154976671', 1, 3026, N'OLong Tea plus +', CAST(N'2022-07-14' AS Date), 11000, 1000, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'163151351', 4, 1001, N'Gà Chiên', CAST(N'2022-07-30' AS Date), 120000, 159, 0)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'331321467', 1, 1132, N'Nước tăng lực string vàng', CAST(N'2022-07-14' AS Date), 10000, 100, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'564546563', 3, 2721, N'Chả lụa chay ', CAST(N'2022-07-20' AS Date), 37000, 40, 0)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'589570646', 2, 2002, N'Chổi lau nhà thông minh', CAST(N'2022-03-03' AS Date), 400000, 12, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'632654545', 4, 1001, N'Gà Chiên Không Cay', CAST(N'2022-07-30' AS Date), 12000, 120, 0)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'643574567', 1, 3695, N'Nước cam vắt', CAST(N'2022-03-03' AS Date), 20000, 400, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'716298376', 4, 3695, N'Gà Chiên Cay', CAST(N'2022-07-30' AS Date), 20000, 150, 0)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'786567465', 3, 1132, N'Miến Phú Hương', CAST(N'2022-07-20' AS Date), 12000, 600, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'789076573', 3, 2721, N'Bò viên bịch 500g', CAST(N'2021-12-30' AS Date), 47000, 130, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'893504951', 1, 3026, N'Twister', CAST(N'2022-07-14' AS Date), 12000, 90, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'896789786', 2, 3301, N'quạt máy hơi nước ', CAST(N'2021-12-30' AS Date), 460000, 15, 1)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'923126565', 1, 3964, N'TEPPY', CAST(N'2022-07-14' AS Date), 9000, 100, 0)
INSERT [dbo].[dbSanPham] ([MaSp], [Maloai], [MaNCC], [TenSP], [NgayNhap], [DonGia], [SoLuong], [TrangThaiSP]) VALUES (N'945694590', 4, 3301, N'Mì ly modern ', CAST(N'2022-02-25' AS Date), 13000, 60, 0)
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'599202249', N'Pham Hải Đăng', N'Nam', N'352734679', N'Nhân viên', N'0342781163', 100000, CAST(N'2000-02-03' AS Date), N'Bình tân', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'338202243', N'Nguyễn Thị Tuyết Hoa', N'Nữ', N'357536841', N'Nhân viên', N'0399440578', 200000, CAST(N'2002-10-10' AS Date), N'Ấp thị 2 Thị Trấn Mỹ Luông, tỉnh An Giang', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'433202222', N'Trần Thị Thảo Như', N'Nữ', N'357536656', N'Nhân viên', N'0399440465', 2100000, CAST(N'2002-12-06' AS Date), N'Ấp thị 2 Thị Trấn Mỹ Luông, tỉnh An Giang', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'172202222', N'Nguyễn Hòa Đồng ', N'Nam', N'357536645', N'Admin', N'0399440121', 2100000, CAST(N'2002-02-13' AS Date), N'65 Huỳnh Thúc Kháng, Quận 1, Thành Phố Hồ Chí Minh', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'988202225', N'Phạm Hải Đăng', N'Nam', N'357834679', N'Admin', N'0342781163', 21000000, CAST(N'2002-03-23' AS Date), N'41 Đường số 2, An Lạc A, Quận Bình Tân, Thành Phố Hồ Chí Minh', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'269202256', N'Nguyễn Thái Bảo', N'Nam', N'357834674', N'Nhân viên', N'0907334646', 21000, CAST(N'2002-03-27' AS Date), N'41 Đường số 2, An Lạc A, Quận Bình Tân, Thành Phố Hồ Chí Minh', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'75202252 ', N'Trần Hồng Yến', N'Nam', N'357834641', N'Nhân viên', N'0907455616', 21000000, CAST(N'2002-09-09' AS Date), N'Ấp thị 1, Thị trấn Mỹ Luông, Tỉnh An Giang', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'851202218', N'Lâm Hồng Hương', N'Nữ', N'359195262', N'Quản Lý', N'0585781236', 230000, CAST(N'2022-07-24' AS Date), N'Long Tân, Chợ Mới, Tỉnh An Giang', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'58420223 ', N'Nguyễn Thị Tuyết Nhi', N'Nữ', N'359231611', N'Nhân viên', N'0585781235', 2300000, CAST(N'2022-07-24' AS Date), N'Long Tân, Chợ Mới, Tỉnh An Giang', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'491202211', N'Trần Bình Trọng', N'Nam', N'312677883', N'Nhân viên', N'0876356472', 1200000, CAST(N'2004-01-28' AS Date), N'45 Trần Quang Khải, quận 3, thành phố Hồ Chí Minh', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'96720229 ', N'nhanvien', N'Nam', N'352734611', N'Nhân viên', N'0154646546', 1000000, CAST(N'2000-02-02' AS Date), N'admin', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'398202254', N'admin', N'Nam', N'983271489', N'Admin', N'0399440578', 10000000, CAST(N'2000-02-02' AS Date), N'admin', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'694202251', N'phạm hải hòa', N'Nam', N'352734679', N'Nhân viên', N'0342781163', 100000, CAST(N'2000-02-09' AS Date), N'41 đường số 2 an lạc a bình tân', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'613202222', N'nguyễn hòa', N'Nam', N'357216774', N'Nhân viên', N'0942781163', 10000000, CAST(N'2000-02-27' AS Date), N'41 đường số 2 bình tân', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'158202252', N'Huỳnh Quang', N'Nam', N'357268919', N'Nhân viên', N'0399440578', 100000, CAST(N'2000-02-02' AS Date), N'41 đường số 2 ac lạc a bình tân', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'730202245', N'phạm hải ', N'Nam', N'352756465', N'Admin', N'0372656262', 100000, CAST(N'2000-02-02' AS Date), N'41 đường số 2 an lạc a bình tân', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'580202247', N'Nguyễn Hoa', N'Nam', N'352736899', N'Nhân viên', N'0399440578', 1000000, CAST(N'2000-02-19' AS Date), N'An Lạc A, Bình Tân', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'962202249', N'Tuyết Hoa', N'Nam', N'352743165', N'Admin', N'0399440578', 1000000, CAST(N'2000-02-02' AS Date), N'41 đường số 2 , Bình Trị Đông B, Quận Bình Tân', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'676202222', N'Khánh Duy', N'Nam', N'352734679', N'Admin', N'0342781163', 500000, CAST(N'2000-02-02' AS Date), N'262 Quang Trung, Quận Gò Vấp', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'21920225 ', N'Phạm hòa', N'Nam', N'352734679', N'Admin', N'0342781163', 10000000, CAST(N'2000-02-02' AS Date), N'262  Quang Trung, Gò Vấp', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'508202257', N'Phạm Trung', N'Nam', N'352979531', N'Nhân viên', N'0379596262', 100000, CAST(N'2000-02-02' AS Date), N'262 An Lạc A, Bình Tân', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'643202239', N'Hòa Đồng', N'Nam', N'352768991', N'Admin', N'0399440578', 1000000000, CAST(N'2000-02-09' AS Date), N'61 Quang Trung, Gò Vấp', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'244202225', N'Quách Kiến Đức', N'Nam', N'357294615', N'Admin', N'0585789116', 100000, CAST(N'2000-02-02' AS Date), N'65 Huỳnh Thúc Kháng, Quận 1', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'20620226 ', N'Dương Quốc Phong', N'Nam', N'352734694', N'Admin', N'0956267445', 10000, CAST(N'2000-02-04' AS Date), N'217 Nguyễn Văn Cừ, Quận 5', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'877202243', N'Khương Tẩu Nam', N'Nam', N'359121351', N'Nhân viên', N'0585168761', 100000, CAST(N'2000-02-02' AS Date), N'217 Nguyễn Văn Cừ, quận 5', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'284202257', N'Thanh Trúc', N'Nam', N'352764131', N'Admin', N'0399465456', 10000, CAST(N'2000-02-02' AS Date), N'65 Trần Hưng Đạo , Quận 5', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'384202223', N'Thanh Trúc', N'Nam', N'357261654', N'Nhân viên', N'0585732135', 100000, CAST(N'2000-02-02' AS Date), N'65 Trần Hưng Đạo, Quận 1', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'723202256', N'Dương Hải Hoàng', N'Nam', N'352721516', N'Admin', N'0399446613', 100000, CAST(N'2000-02-02' AS Date), N'217 Trần Hưng Đạo, Quận 5', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'356202210', N'Dương Quốc Phong', N'Nam', N'352734616', N'Admin', N'0389165465', 1000000, CAST(N'2000-02-02' AS Date), N'217 Nguyễn Văn Cừ, Quận 5', 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [CMND], [ChuVu], [SDT], [Luong], [NgSinh], [DiaChi], [TrangThai]) VALUES (N'24202236 ', N'Khương Tẩu Nam', N'Nam', N'389416416', N'Admin', N'0165465465', 1000000, CAST(N'2000-02-02' AS Date), N'Bình tân ', 1)
GO
ALTER TABLE [dbo].[dbCT_HoaDon] ADD  CONSTRAINT [DF_dbCT_HoaDon_TrangThaiHD]  DEFAULT ((1)) FOR [TrangThaiHD]
GO
ALTER TABLE [dbo].[dbHoaDon] ADD  CONSTRAINT [DF_dbHoaDon_TrangThaiHD]  DEFAULT ((1)) FOR [TrangThaiHD]
GO
ALTER TABLE [dbo].[dbKhachHang] ADD  CONSTRAINT [DF_dbKhachHang_TrangthaiKH]  DEFAULT ((1)) FOR [TrangthaiKH]
GO
ALTER TABLE [dbo].[dbLoaiSP] ADD  CONSTRAINT [DF_dbLoaiSP_TrangThaiLSP]  DEFAULT ((1)) FOR [TrangThaiLSP]
GO
ALTER TABLE [dbo].[dbNhaCC] ADD  CONSTRAINT [DF_dbNhaCC_TrangThaiNCC]  DEFAULT ((1)) FOR [TrangThaiNCC]
GO
ALTER TABLE [dbo].[dbQuanTri] ADD  CONSTRAINT [DF_dbQuanTri_trangthai]  DEFAULT ((1)) FOR [trangthai]
GO
ALTER TABLE [dbo].[dbSanPham] ADD  CONSTRAINT [DF_dbSanPham_NgayNhap]  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[dbSanPham] ADD  CONSTRAINT [DF_dbSanPham_TrangThaiSP]  DEFAULT ((1)) FOR [TrangThaiSP]
GO
ALTER TABLE [dbo].[dbCT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_dbCT_HoaDon_dbHoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[dbHoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[dbCT_HoaDon] CHECK CONSTRAINT [FK_dbCT_HoaDon_dbHoaDon]
GO
ALTER TABLE [dbo].[dbHoaDon]  WITH NOCHECK ADD  CONSTRAINT [FK_dbHoaDon_dbKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[dbKhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[dbHoaDon] NOCHECK CONSTRAINT [FK_dbHoaDon_dbKhachHang]
GO
ALTER TABLE [dbo].[dbSanPham]  WITH NOCHECK ADD  CONSTRAINT [FK_dbSanPham_dbLoaiSP] FOREIGN KEY([Maloai])
REFERENCES [dbo].[dbLoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[dbSanPham] NOCHECK CONSTRAINT [FK_dbSanPham_dbLoaiSP]
GO
ALTER TABLE [dbo].[dbSanPham]  WITH NOCHECK ADD  CONSTRAINT [FK_dbSanPham_dbNhaCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[dbNhaCC] ([MaNCC])
GO
ALTER TABLE [dbo].[dbSanPham] NOCHECK CONSTRAINT [FK_dbSanPham_dbNhaCC]
GO
/****** Object:  StoredProcedure [dbo].[CreateMAHD]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CreateMAHD]
 @ngay int, @thang int, @nam  int
as
Select COUNT(MaHD) + 1 from dbHoaDon where DAY(NgayNhap) = @ngay and MONTH(NgayNhap) = @thang and YEAR(NgayNhap) = @nam
GO
/****** Object:  StoredProcedure [dbo].[DelHangHoa]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[DelHangHoa]
@masp nvarchar(50)
as
begin
    update dbSanPham set TrangThaiSP=0 where MaSp = @masp
end
GO
/****** Object:  StoredProcedure [dbo].[DelHD]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[DelHD] 

@maHD varchar(9)

as
begin
    update dbHoaDon set TrangthaiHD = 0 where MaHD=@maHD
end
GO
/****** Object:  StoredProcedure [dbo].[DelKH]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DelKH] 

@makh varchar(50)
as
begin
    update dbKHACHHANG set TrangthaiKH = 0 where MaKH=@makh
end
GO
/****** Object:  StoredProcedure [dbo].[DelLoai]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DelLoai] 
@maloai int 
as
begin
		update dbLoaiSP set TrangThaiLSP = 0 where dbo.SelectLoaiSPDel(@maloai)=0 and MaLoai =@maloai

end
GO
/****** Object:  StoredProcedure [dbo].[DelNHACC]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DelNHACC] 

@Manhacc varchar(50)
as
begin
    update dbNhaCC set TrangThaiNCC = 0 where MaNCC=@Manhacc
end
GO
/****** Object:  StoredProcedure [dbo].[delNhanVien]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[delNhanVien]

@manv varchar (9)
as 
begin
 update NhanVien set TrangThai =0 where MaNV =@manv
  update dbQuanTri set trangthai =0 where MaNV =@manv
 end
GO
/****** Object:  StoredProcedure [dbo].[DelTaiKhoan]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DelTaiKhoan] 
@MaNV char(9)
as
begin
    update  dbQuanTri set trangthai = 0 where MaNV = @MaNV
end
GO
/****** Object:  StoredProcedure [dbo].[DoiMatKhau]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoiMatKhau] 

@MaNV varchar(9),@matkhau varchar(50)
as
begin
    update dbQuanTri set MatKhau=@matkhau where MaNV =@MaNV
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCTHD]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[InsertCTHD]

@MaHD char(9),  @MaSP int,  @soluong int, @dongia float
as
begin

    insert into dbCT_HoaDon ( MaHD,  MaSP,   soluong, dongia) values (@MaHD,  @MaSP,  @soluong, @dongia)

end
GO
/****** Object:  StoredProcedure [dbo].[InsertHD]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[InsertHD]

@MaHD char(9),  @MaKH char(9),  @maNV char(9), @NgayNhap date, @TongTien float
as
begin

    insert into dbHoaDon(MaHD,  MaKH,   maNV, NgayNhap, TongTien) values (@MaHD,  @MaKH, @maNV, @NgayNhap, @TongTien)

end
GO
/****** Object:  StoredProcedure [dbo].[InsertKH]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertKH]

@maKH varchar(9), @HoTenKH nvarchar(200),  @NgaySinh date,  @SDT varchar(50),  @DiaChi nvarchar(MAX), @gioitinh nvarchar(9)
as
begin

    insert into dbKhachHang(makh,HoTenKH,NgaySinh,SDT,DiaChi,GioiTinh) values (@maKH, @HoTenKH,@NgaySinh,@SDT,@DiaChi,@gioitinh)

end
GO
/****** Object:  StoredProcedure [dbo].[InsertLoaiSanPham]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertLoaiSanPham]

@maloai int , @tenloai nvarchar(50)
as
begin

       insert into dbLoaiSP (MaLoai,TenLoai) values (@maloai, @tenloai)
end 
GO
/****** Object:  StoredProcedure [dbo].[InsertNHACC]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertNHACC]

@MaNhacc varchar(9), @tennhacc nvarchar(200), @DiaChi nvarchar(MAX),   @SDT varchar(50)
as
begin

    insert into dbNhaCC(MaNCC, TenNCC, DiaChi, SDT) values (@MaNhacc, @tennhacc, @DiaChi, @SDT)

end
GO
/****** Object:  StoredProcedure [dbo].[InsertNhanVien]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertNhanVien]


@MaNV char(9), @TenNV nvarchar(50), @GioiTinh nvarchar(10), @CM char(9), @ChuVu nvarchar(50), @SDT char(10), @Luong float, @NgSinh date, @DiaChi nvarchar(max)

as
begin

    insert into NhanVien(MaNV,TenNV,GioiTinh,CMND,ChuVu,SDT,Luong,NgSinh,DiaChi,TrangThai) values(@MaNV, @TenNV, @GioiTinh,@CM,@ChuVu,@SDT,@Luong,@NgSinh,@DiaChi,1)
						

end
GO
/****** Object:  StoredProcedure [dbo].[InsertSanPham]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertSanPham]

@MASP varchar(9), @MANCC int ,@MALOAI int, @TENSP nvarchar(200),  @NGAYNHAP date,  @DONGIA float(50),  @SOLUONG int
as
begin
    insert into dbSanPham ( MaSp, MaNCC, Maloai, TenSP, NgayNhap, DonGia, SoLuong) values (@MASP, @MANCC, @MALOAI, @TENSP,@NGAYNHAP, @DONGIA, @SOLUONG)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertTaiKhoan]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertTaiKhoan] 
@MaNV char(9), @TenTk nvarchar(50), @MatKhau varchar(50)
as
begin
    insert into dbQuanTri (MaNV,TenTK,MatKhau,ngaytao,trangthai) values (@MaNV, @TenTk, @MatKhau,GETDATE(),1)
end
GO
/****** Object:  StoredProcedure [dbo].[SearchHangHoa]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchHangHoa]
@key nvarchar(50)
as
begin
select * from dbSanPham sp  , dbNhaCC ncc , dbLoaiSP L where sp.MaNCC =ncc.MaNCC and sp.Maloai = L.MaLoai  and
		   TrangThaiSP =1 and
( 
			MaSp like '%'+ @key +'%' or
			L.TenLoai like '%' + @key +'%' or
			ncc.TenNCC like '%' +@key + '%' or
			TenSP like '%'+@key +'%'	or
			DonGia like '%'+@key +'%' or
			SoLuong like '%'+@key +'%' or
			NgayNhap like '%'+@key +'%'
			
)

order by MaSp
end
GO
/****** Object:  StoredProcedure [dbo].[SearchHoaDon]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SearchHoaDon]
@key nvarchar(50)
as
begin
select * from  dbHoaDon where TrangThaiHD = 1 and

(
	MaHD like '%'+@key+'%' or
	MaKH like '%'+@key+'%' or
	MaNV like '%'+@key+'%' or
	NgayNhap like '%'+@key+'%' or
	TongTien like '%'+@key+'%' 
)
order by MaHD
end
GO
/****** Object:  StoredProcedure [dbo].[SearchKhachHang]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchKhachHang]
@key nvarchar(50)
as
begin
select * from dbKhachHang where TrangthaiKH = 1 and
( 
			MaKH like '%'+ @key +'%' or
			HoTenKh like '%' + @key +'%' or
			Sdt like '%' +@key + '%' or
			NgaySinh like '%'+@key +'%'	or
			DiaChi like '%'+@key +'%' or
			GioiTinh like '%'+@key +'%' 	
)

order by MaKH
end
GO
/****** Object:  StoredProcedure [dbo].[SearchMaLoai]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchMaLoai]
@key nvarchar(50)
as
begin
select * from  dbLoaiSP where TrangThaiLSP = 1 and

(
	TenLoai like '%'+@key+'%' or
	MaLoai like '%'+@key +'%' 
)
order by MaLoai
end
GO
/****** Object:  StoredProcedure [dbo].[SearchNCC]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchNCC]
@key nvarchar(50)
as
begin
select * from dbNhaCC where TrangThaiNCC =1 and( MaNCC like '%'+ @key +'%' or
TenNCC like '%' + @key +'%' or
DiaChi like '%' +@key + '%' or
SDT like '%'+@key +'%')
order by MaNCC
end
GO
/****** Object:  StoredProcedure [dbo].[SearchNhanVien]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchNhanVien]
@key nvarchar(50)
as
begin
select * from NhanVien  where TrangThai=1  and
		   
( 
			MaNV like '%'+ N'+@key'+ +'%' or
			TenNV like '%'+N'+@key'+'%' or
			GioiTinh like '%' +@key + '%' or
			CMND like '%'+@key +'%'	or
			ChuVu like '%'+@key +'%' or
			SDT like '%'+@key +'%' or
			Luong like '%'+@key +'%' or
			NgSinh like '%'+@key +'%' or
			DiaChi like '%'+@key +'%' 
			
)

order by MaNV
end
GO
/****** Object:  StoredProcedure [dbo].[SearchTaiKhoan]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchTaiKhoan]
@key nvarchar(50)
as
begin
select * from  dbQuanTri where trangthai = 1 and

(
	MaNV like '%'+@key+'%' or
	TenTK like '%'+@key +'%' or
	ngaytao like '%'+@key +'%' 

)
order by MaNV
end
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCTHD]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SelectAllCTHD] 
@key nvarchar(50)
as
begin
    select * from dbCT_HoaDon where TrangThaiHD = 1;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectAllHD]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SelectAllHD] 
@key nvarchar(50)
as
begin
    select * from dbHoaDon where TrangThaiHD = 1;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectAllKH]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectAllKH] 
@key nvarchar(50)
as
begin
    select * from dbKhachHang where TrangthaiKH = 1;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectCTHD]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SelectCTHD]
--MaHD, MaSP, soluong, DonGia
@key char(9)
as
begin

    select * from dbCT_HoaDon

end
GO
/****** Object:  StoredProcedure [dbo].[SelectHangHoa]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectHangHoa] 
@key nvarchar(50)
as
begin
    select * from dbSanPham where TrangThaiSP = @key;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectKHdeleted]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectKHdeleted] 
@key nvarchar(50)
as
begin
    update dbKhachHang set TrangthaiKH =1 where TrangthaiKH =0;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectLoaiSP]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[SelectLoaiSP] 
@key nvarchar(50)
as
begin
    select * from dbLoaiSP where TrangThaiLSP = @key;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectNHACC]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectNHACC] 
@key nvarchar(50)
as
begin
    select * from dbNhaCC where TrangThaiNCC = @key;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectNhanVien]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectNhanVien] 
@key nvarchar(50)
as
begin
    select * from NhanVien where TrangThai = 1;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectSP]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectSP] 
@key nvarchar(50)
as
begin
    select MaSP,TenSP from dbSanPham where TrangThaiSP = 1;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectTaiKhoanNV]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectTaiKhoanNV] 
@key nvarchar(50)
as
begin
    select * from dbQuanTri where trangthai = @key;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectTenLoai]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[SelectTenLoai] 
@key nvarchar(50)
as
begin
    select TenLoai from dbLoaiSP where TrangThaiLSP = @key;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectTK]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectTK] 
@MK nvarchar(100), @TK nvarchar(100)
as
begin
    select MaNV  ,ChucVu from dbQuanTri  where TenTK =@TK and MatKhau =@MK and trangthai =1 
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateLoaiSanPham]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateLoaiSanPham]

@maloai int , @tenloai nvarchar(50)
as
begin

       update dbLoaiSP set TenLoai= @tenloai where MaLoai = @maloai
end 
GO
/****** Object:  StoredProcedure [dbo].[UpdateNHACC]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateNHACC] 

@MaNhacc varchar(9), @tennhacc nvarchar(200), @DiaChi nvarchar(MAX),   @SDT varchar(50)
as
begin
    update dbNhaCC set TenNCC=@tennhacc, DiaChi=@DiaChi, SDT=@SDT where MaNCC=@MaNhacc
end
GO
/****** Object:  StoredProcedure [dbo].[UPDATENhanVien]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UPDATENhanVien]


@MaNV char(9), @TenNV nvarchar(50), @GioiTinh nchar(3), @CM char(9), @ChuVu nvarchar(50), @SDT int, @Luong float, @NgSinh date, @DiaChi nvarchar(max)

as
begin

   update  NhanVien set TenNV =@TenNV,GioiTinh=@GioiTinh,CMND=@CM,ChuVu=@ChuVu,SDT=@SDT,Luong=@Luong,NgSinh=@NgSinh,DiaChi =@DiaChi where MaNV=@MaNV
						

end
GO
/****** Object:  StoredProcedure [dbo].[UpdateSanPham]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateSanPham] 

@MASP varchar(9), @MANCC int ,@MALOAI int, @TENSP nvarchar(200),  @NGAYNHAP date,  @DONGIA float(50),  @SOLUONG int
as
begin

    update dbSanPham set   MaNCC = @MANCC, Maloai = @MALOAI, TenSP = @TENSP, NgayNhap = @NGAYNHAP, DonGia =@DONGIA, SoLuong=@SOLUONG where MaSp =@MASP

end
GO
/****** Object:  StoredProcedure [dbo].[UpdateTaiKhoan]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateTaiKhoan] 
@MaNV char(9), @TenTk nvarchar(50), @MatKhau varchar(50)
as
begin
    update  dbQuanTri set TenTK=@TenTk,MatKhau=@MatKhau where MaNV=@MaNV
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatetKH]    Script Date: 31/07/2022 11:08:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdatetKH] 

@maKH varchar(9), @HoTenKH nvarchar(200), @NgaySinh datetime,  @SDT varchar(50),  @DiaChi nvarchar(MAX),@GioiTinh nvarchar(9)
as
begin
    update dbKhachHang set HoTenKH=@HoTenKH,NgaySinh=@NgaySinh,SDT=@SDT,DiaChi=@DiaChi,GioiTinh=@GioiTinh where MaKH=@makh
end
GO


alter proc [dbo].[SelectCTHD]
--MaHD, MaSP, soluong, DonGia
@key char(9)
as
begin

    select * from dbCT_HoaDon where Mahd=@key

end