
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/16/2018 11:17:57
-- Generated from EDMX file: C:\Users\WIN\Documents\Visual Studio 2015\Projects\DLBia\DLBia\ModelBia.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Bia];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Phieu_ThuTienDaiLi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Phieu_ThuTien] DROP CONSTRAINT [FK_Phieu_ThuTienDaiLi];
GO
IF OBJECT_ID(N'[dbo].[FK_Phieu_XuatHangMatHang_Phieu_XuatHang]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Phieu_XuatHangMatHang] DROP CONSTRAINT [FK_Phieu_XuatHangMatHang_Phieu_XuatHang];
GO
IF OBJECT_ID(N'[dbo].[FK_Phieu_XuatHangMatHang_MatHang]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Phieu_XuatHangMatHang] DROP CONSTRAINT [FK_Phieu_XuatHangMatHang_MatHang];
GO
IF OBJECT_ID(N'[dbo].[FK_DaiLiLoaiDL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DaiLis] DROP CONSTRAINT [FK_DaiLiLoaiDL];
GO
IF OBJECT_ID(N'[dbo].[FK_DaiLiPhieu_XuatHang]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Phieu_XuatHang] DROP CONSTRAINT [FK_DaiLiPhieu_XuatHang];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[ThamSoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ThamSoes];
GO
IF OBJECT_ID(N'[dbo].[DaiLis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DaiLis];
GO
IF OBJECT_ID(N'[dbo].[MatHangs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MatHangs];
GO
IF OBJECT_ID(N'[dbo].[Phieu_XuatHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Phieu_XuatHang];
GO
IF OBJECT_ID(N'[dbo].[Phieu_ThuTien]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Phieu_ThuTien];
GO
IF OBJECT_ID(N'[dbo].[LoaiDLs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LoaiDLs];
GO
IF OBJECT_ID(N'[dbo].[Phieu_XuatHangMatHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Phieu_XuatHangMatHang];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int  NOT NULL,
    [UserName] nvarchar(30)  NOT NULL
);
GO

-- Creating table 'ThamSoes'
CREATE TABLE [dbo].[ThamSoes] (
    [MaTS] int IDENTITY(1,1) NOT NULL,
    [TenTS] nvarchar(30)  NOT NULL,
    [GhiChu] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DaiLis'
CREATE TABLE [dbo].[DaiLis] (
    [MaDL] int IDENTITY(1,1) NOT NULL,
    [TenDL] nvarchar(30)  NOT NULL,
    [SDT] nvarchar(20)  NOT NULL,
    [MaLoai] varchar(20)  NOT NULL,
    [DiaChi] nvarchar(50)  NOT NULL,
    [Email] nvarchar(30)  NOT NULL,
    [NgayTiepNhan] datetime  NOT NULL,
    [TienNo] int  NOT NULL,
    [LoaiDLs_MaLoai] int  NOT NULL
);
GO

-- Creating table 'MatHangs'
CREATE TABLE [dbo].[MatHangs] (
    [MaMH] int IDENTITY(1,1) NOT NULL,
    [TenMH] nvarchar(30)  NOT NULL,
    [DonViTinh] nvarchar(10)  NOT NULL,
    [SoLuong] int  NOT NULL,
    [ThanhTien] int  NOT NULL
);
GO

-- Creating table 'Phieu_XuatHang'
CREATE TABLE [dbo].[Phieu_XuatHang] (
    [MaPhieu] int IDENTITY(1,1) NOT NULL,
    [MaDL] int  NOT NULL,
    [MaMH] int  NOT NULL,
    [NgayLapPhieu] datetime  NOT NULL,
    [TongTien] int  NOT NULL,
    [SoTienTraLai] int  NOT NULL,
    [ConLai] int  NOT NULL,
    [DaiLi1_MaDL] int  NOT NULL
);
GO

-- Creating table 'Phieu_ThuTien'
CREATE TABLE [dbo].[Phieu_ThuTien] (
    [Ma_PhieuTT] int IDENTITY(1,1) NOT NULL,
    [MaDL] int  NOT NULL,
    [NgayThuTien] datetime  NOT NULL,
    [SoTienThu] int  NOT NULL,
    [DaiLis_MaDL] int  NOT NULL
);
GO

-- Creating table 'LoaiDLs'
CREATE TABLE [dbo].[LoaiDLs] (
    [MaLoai] int IDENTITY(1,1) NOT NULL,
    [TenLoai] nvarchar(30)  NOT NULL,
    [ChuThich] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Phieu_XuatHangMatHang'
CREATE TABLE [dbo].[Phieu_XuatHangMatHang] (
    [Phieu_XuatHang_MaPhieu] int  NOT NULL,
    [MatHangs_MaMH] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [MaTS] in table 'ThamSoes'
ALTER TABLE [dbo].[ThamSoes]
ADD CONSTRAINT [PK_ThamSoes]
    PRIMARY KEY CLUSTERED ([MaTS] ASC);
GO

-- Creating primary key on [MaDL] in table 'DaiLis'
ALTER TABLE [dbo].[DaiLis]
ADD CONSTRAINT [PK_DaiLis]
    PRIMARY KEY CLUSTERED ([MaDL] ASC);
GO

-- Creating primary key on [MaMH] in table 'MatHangs'
ALTER TABLE [dbo].[MatHangs]
ADD CONSTRAINT [PK_MatHangs]
    PRIMARY KEY CLUSTERED ([MaMH] ASC);
GO

-- Creating primary key on [MaPhieu] in table 'Phieu_XuatHang'
ALTER TABLE [dbo].[Phieu_XuatHang]
ADD CONSTRAINT [PK_Phieu_XuatHang]
    PRIMARY KEY CLUSTERED ([MaPhieu] ASC);
GO

-- Creating primary key on [Ma_PhieuTT] in table 'Phieu_ThuTien'
ALTER TABLE [dbo].[Phieu_ThuTien]
ADD CONSTRAINT [PK_Phieu_ThuTien]
    PRIMARY KEY CLUSTERED ([Ma_PhieuTT] ASC);
GO

-- Creating primary key on [MaLoai] in table 'LoaiDLs'
ALTER TABLE [dbo].[LoaiDLs]
ADD CONSTRAINT [PK_LoaiDLs]
    PRIMARY KEY CLUSTERED ([MaLoai] ASC);
GO

-- Creating primary key on [Phieu_XuatHang_MaPhieu], [MatHangs_MaMH] in table 'Phieu_XuatHangMatHang'
ALTER TABLE [dbo].[Phieu_XuatHangMatHang]
ADD CONSTRAINT [PK_Phieu_XuatHangMatHang]
    PRIMARY KEY CLUSTERED ([Phieu_XuatHang_MaPhieu], [MatHangs_MaMH] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DaiLis_MaDL] in table 'Phieu_ThuTien'
ALTER TABLE [dbo].[Phieu_ThuTien]
ADD CONSTRAINT [FK_Phieu_ThuTienDaiLi]
    FOREIGN KEY ([DaiLis_MaDL])
    REFERENCES [dbo].[DaiLis]
        ([MaDL])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Phieu_ThuTienDaiLi'
CREATE INDEX [IX_FK_Phieu_ThuTienDaiLi]
ON [dbo].[Phieu_ThuTien]
    ([DaiLis_MaDL]);
GO

-- Creating foreign key on [Phieu_XuatHang_MaPhieu] in table 'Phieu_XuatHangMatHang'
ALTER TABLE [dbo].[Phieu_XuatHangMatHang]
ADD CONSTRAINT [FK_Phieu_XuatHangMatHang_Phieu_XuatHang]
    FOREIGN KEY ([Phieu_XuatHang_MaPhieu])
    REFERENCES [dbo].[Phieu_XuatHang]
        ([MaPhieu])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MatHangs_MaMH] in table 'Phieu_XuatHangMatHang'
ALTER TABLE [dbo].[Phieu_XuatHangMatHang]
ADD CONSTRAINT [FK_Phieu_XuatHangMatHang_MatHang]
    FOREIGN KEY ([MatHangs_MaMH])
    REFERENCES [dbo].[MatHangs]
        ([MaMH])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Phieu_XuatHangMatHang_MatHang'
CREATE INDEX [IX_FK_Phieu_XuatHangMatHang_MatHang]
ON [dbo].[Phieu_XuatHangMatHang]
    ([MatHangs_MaMH]);
GO

-- Creating foreign key on [LoaiDLs_MaLoai] in table 'DaiLis'
ALTER TABLE [dbo].[DaiLis]
ADD CONSTRAINT [FK_DaiLiLoaiDL]
    FOREIGN KEY ([LoaiDLs_MaLoai])
    REFERENCES [dbo].[LoaiDLs]
        ([MaLoai])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DaiLiLoaiDL'
CREATE INDEX [IX_FK_DaiLiLoaiDL]
ON [dbo].[DaiLis]
    ([LoaiDLs_MaLoai]);
GO

-- Creating foreign key on [DaiLi1_MaDL] in table 'Phieu_XuatHang'
ALTER TABLE [dbo].[Phieu_XuatHang]
ADD CONSTRAINT [FK_DaiLiPhieu_XuatHang]
    FOREIGN KEY ([DaiLi1_MaDL])
    REFERENCES [dbo].[DaiLis]
        ([MaDL])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DaiLiPhieu_XuatHang'
CREATE INDEX [IX_FK_DaiLiPhieu_XuatHang]
ON [dbo].[Phieu_XuatHang]
    ([DaiLi1_MaDL]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------