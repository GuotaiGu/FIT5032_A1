
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/15/2019 16:07:29
-- Generated from EDMX file: C:\Users\guguo\source\repos\FIT5032_A1\Models\Chinese_Restaurant_Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Chinese_Restaurant_Database];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CustomerSeat_Booking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Seat_Booking] DROP CONSTRAINT [FK_CustomerSeat_Booking];
GO
IF OBJECT_ID(N'[dbo].[FK_FoodSeat_Booking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Seat_Booking] DROP CONSTRAINT [FK_FoodSeat_Booking];
GO
IF OBJECT_ID(N'[dbo].[FK_SeatSeat_Booking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Seat_Booking] DROP CONSTRAINT [FK_SeatSeat_Booking];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Seats]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Seats];
GO
IF OBJECT_ID(N'[dbo].[Seat_Booking]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Seat_Booking];
GO
IF OBJECT_ID(N'[dbo].[Foods]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Foods];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [UserId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Seats'
CREATE TABLE [dbo].[Seats] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Availablity] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Seat_Booking'
CREATE TABLE [dbo].[Seat_Booking] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CustomerId] int  NOT NULL,
    [FoodId] int  NOT NULL,
    [SeatId] int  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Cost] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Foods'
CREATE TABLE [dbo].[Foods] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [Stock] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Seats'
ALTER TABLE [dbo].[Seats]
ADD CONSTRAINT [PK_Seats]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Seat_Booking'
ALTER TABLE [dbo].[Seat_Booking]
ADD CONSTRAINT [PK_Seat_Booking]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Foods'
ALTER TABLE [dbo].[Foods]
ADD CONSTRAINT [PK_Foods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'Seat_Booking'
ALTER TABLE [dbo].[Seat_Booking]
ADD CONSTRAINT [FK_CustomerSeat_Booking]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerSeat_Booking'
CREATE INDEX [IX_FK_CustomerSeat_Booking]
ON [dbo].[Seat_Booking]
    ([CustomerId]);
GO

-- Creating foreign key on [FoodId] in table 'Seat_Booking'
ALTER TABLE [dbo].[Seat_Booking]
ADD CONSTRAINT [FK_FoodSeat_Booking]
    FOREIGN KEY ([FoodId])
    REFERENCES [dbo].[Foods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FoodSeat_Booking'
CREATE INDEX [IX_FK_FoodSeat_Booking]
ON [dbo].[Seat_Booking]
    ([FoodId]);
GO

-- Creating foreign key on [SeatId] in table 'Seat_Booking'
ALTER TABLE [dbo].[Seat_Booking]
ADD CONSTRAINT [FK_SeatSeat_Booking]
    FOREIGN KEY ([SeatId])
    REFERENCES [dbo].[Seats]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SeatSeat_Booking'
CREATE INDEX [IX_FK_SeatSeat_Booking]
ON [dbo].[Seat_Booking]
    ([SeatId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------