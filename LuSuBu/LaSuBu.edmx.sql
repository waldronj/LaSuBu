
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 03/31/2013 00:06:29
-- Generated from EDMX file: H:\Programming\GitHub\LaSuBu\LuSuBu\LaSuBu.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LaSuBu];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TransactionTransItems]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransItems] DROP CONSTRAINT [FK_TransactionTransItems];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ContentManagements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContentManagements];
GO
IF OBJECT_ID(N'[dbo].[StoreItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StoreItems];
GO
IF OBJECT_ID(N'[dbo].[Transactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transactions];
GO
IF OBJECT_ID(N'[dbo].[TransItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransItems];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ContentManagements'
CREATE TABLE [dbo].[ContentManagements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PageName] nvarchar(max)  NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [Headline] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StoreItems'
CREATE TABLE [dbo].[StoreItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ItemName] nvarchar(max)  NOT NULL,
    [Cost] nvarchar(20)  NULL,
    [Description] nvarchar(max)  NULL,
    [ImageURL] nvarchar(max)  NULL
);
GO

-- Creating table 'Transactions'
CREATE TABLE [dbo].[Transactions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CustomerName] nvarchar(max)  NOT NULL,
    [Amount] nvarchar(20)  NULL,
    [Token] nvarchar(max)  NULL,
    [PayerID] nvarchar(max)  NULL,
    [Date] datetime  NOT NULL,
    [Phone] nvarchar(20)  NULL,
    [Address] nvarchar(150)  NULL,
    [City] nvarchar(150)  NULL,
    [Zip] nvarchar(20)  NULL,
    [State] nvarchar(100)  NULL,
    [Email] nvarchar(250)  NULL,
    [ReferenceId] nvarchar(max)  NULL,
    [Status] nvarchar(20)  NULL
);
GO

-- Creating table 'TransItems'
CREATE TABLE [dbo].[TransItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Size] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [TransactionId] int  NOT NULL,
    [Qty] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ContentManagements'
ALTER TABLE [dbo].[ContentManagements]
ADD CONSTRAINT [PK_ContentManagements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StoreItems'
ALTER TABLE [dbo].[StoreItems]
ADD CONSTRAINT [PK_StoreItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [PK_Transactions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TransItems'
ALTER TABLE [dbo].[TransItems]
ADD CONSTRAINT [PK_TransItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TransactionId] in table 'TransItems'
ALTER TABLE [dbo].[TransItems]
ADD CONSTRAINT [FK_TransactionTransItems]
    FOREIGN KEY ([TransactionId])
    REFERENCES [dbo].[Transactions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionTransItems'
CREATE INDEX [IX_FK_TransactionTransItems]
ON [dbo].[TransItems]
    ([TransactionId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------