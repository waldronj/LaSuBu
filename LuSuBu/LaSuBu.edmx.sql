
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 03/23/2013 16:23:18
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

IF OBJECT_ID(N'[dbo].[FK_OrderItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Items1] DROP CONSTRAINT [FK_OrderItem];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionsOrders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders1] DROP CONSTRAINT [FK_TransactionsOrders];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ContentManagements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContentManagements];
GO
IF OBJECT_ID(N'[dbo].[Items1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Items1];
GO
IF OBJECT_ID(N'[dbo].[Orders1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders1];
GO
IF OBJECT_ID(N'[dbo].[StoreItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StoreItems];
GO
IF OBJECT_ID(N'[dbo].[Transactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transactions];
GO
IF OBJECT_ID(N'[LaSuBuStoreContainer].[TransactionStatus]', 'U') IS NOT NULL
    DROP TABLE [LaSuBuStoreContainer].[TransactionStatus];
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

-- Creating table 'Items1'
CREATE TABLE [dbo].[Items1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Size] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [OrderId] int  NOT NULL
);
GO

-- Creating table 'Orders1'
CREATE TABLE [dbo].[Orders1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TransactionsId] int  NOT NULL
);
GO

-- Creating table 'StoreItems'
CREATE TABLE [dbo].[StoreItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ItemName] nvarchar(max)  NOT NULL,
    [Cost] decimal(38,0)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [ImageURL] nvarchar(max)  NULL
);
GO

-- Creating table 'Transactions'
CREATE TABLE [dbo].[Transactions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CustomerName] nvarchar(max)  NOT NULL,
    [Amount] decimal(2,0)  NOT NULL,
    [RefenceID] nvarchar(max)  NOT NULL,
    [Token] nvarchar(max)  NOT NULL,
    [PayerID] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Phone] nvarchar(max)  NULL,
    [Address] nvarchar(max)  NULL,
    [City] nvarchar(max)  NULL,
    [Zip] nvarchar(max)  NULL,
    [State] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [TransactionStatu_id] int  NOT NULL,
    [TransactionStatu_Description] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'TransactionStatus'
CREATE TABLE [dbo].[TransactionStatus] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(50)  NOT NULL
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

-- Creating primary key on [Id] in table 'Items1'
ALTER TABLE [dbo].[Items1]
ADD CONSTRAINT [PK_Items1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders1'
ALTER TABLE [dbo].[Orders1]
ADD CONSTRAINT [PK_Orders1]
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

-- Creating primary key on [id], [Description] in table 'TransactionStatus'
ALTER TABLE [dbo].[TransactionStatus]
ADD CONSTRAINT [PK_TransactionStatus]
    PRIMARY KEY CLUSTERED ([id], [Description] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OrderId] in table 'Items1'
ALTER TABLE [dbo].[Items1]
ADD CONSTRAINT [FK_OrderItem]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Orders1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItem'
CREATE INDEX [IX_FK_OrderItem]
ON [dbo].[Items1]
    ([OrderId]);
GO

-- Creating foreign key on [TransactionsId] in table 'Orders1'
ALTER TABLE [dbo].[Orders1]
ADD CONSTRAINT [FK_TransactionsOrders]
    FOREIGN KEY ([TransactionsId])
    REFERENCES [dbo].[Transactions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionsOrders'
CREATE INDEX [IX_FK_TransactionsOrders]
ON [dbo].[Orders1]
    ([TransactionsId]);
GO

-- Creating foreign key on [TransactionStatu_id], [TransactionStatu_Description] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [FK_TransactionTransactionStatu]
    FOREIGN KEY ([TransactionStatu_id], [TransactionStatu_Description])
    REFERENCES [dbo].[TransactionStatus]
        ([id], [Description])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionTransactionStatu'
CREATE INDEX [IX_FK_TransactionTransactionStatu]
ON [dbo].[Transactions]
    ([TransactionStatu_id], [TransactionStatu_Description]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------