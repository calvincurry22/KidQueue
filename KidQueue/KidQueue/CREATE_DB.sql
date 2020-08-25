USE [master]
GO

IF db_id('KidQueue') IS NULL
	CREATE DATABASE KidQueue
GO 

USE [KidQueue]
GO

DROP TABLE IF EXISTS [User];
DROP TABLE IF EXISTS [Daycare];
DROP TABLE IF EXISTS [UserType];
DROP TABLE IF EXISTS [Child];
DROP TABLE IF EXISTS [Parent];
DROP TABLE IF EXISTS [Waitlist];
GO

CREATE TABLE [User] (
  [Id] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [FirstName] varchar(30) NOT NULL,
  [LastName] varchar(30) NOT NULL,
  [Email] varchar(70) NOT NULL,
  [Password] varchar(100) NOT NULL,
  [FirebaseUserId] varchar(50) NOT NULL,
  [UserTypeId] int NOT NULL

  CONSTRAINT UQ_FirebaseUserId UNIQUE(FirebaseUserId)
)
GO

CREATE TABLE [Daycare] (
  [Id] int PRIMARY KEY NOT NULL,
  [Name] varchar(100) NOT NULL,
  [Address] varchar(300) NOT NULL,
  [City] varchar(50) NOT NULL,
  [State] varchar(2) NOT NULL,
  [ZipCode] int NOT NULL,
  [AdminUserId] int NOT NULL
)
GO

CREATE TABLE [UserType] (
  [Id] int PRIMARY KEY NOT NULL,
  [Name] varchar(10) NOT NULL
)
GO

CREATE TABLE [Child] (
  [Id] int PRIMARY KEY NOT NULL,
  [FirstName] varchar(30) NOT NULL,
  [LastName] varchar(30) NOT NULL,
  [Birthdate] datetime,
  [ListAddDate] datetime NOT NULL,
  [DaycareId] int NOT NULL,
  [WaitListId] int NOT NULL
)
GO

CREATE TABLE [Parent] (
  [Id] int PRIMARY KEY NOT NULL,
  [FirstName] varchar(30) NOT NULL,
  [LastName] varchar(30) NOT NULL,
  [ChildId] int NOT NULL,
  [Email] varchar(100) NOT NULL,
  [Phone] int NOT NULL,
  [DaycareId] int NOT NULL,
  [WaitListId] int NOT NULL
)
GO

CREATE TABLE [WaitList] (
  [Id] int PRIMARY KEY NOT NULL,
  [Name] varchar(30) NOT NULL,
  [DaycareId] int NOT NULL
)
GO

ALTER TABLE [Parent] ADD CONSTRAINT FK_Parent_Daycare FOREIGN KEY ([DaycareId]) REFERENCES [Daycare] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [Child] ADD CONSTRAINT FK_Child_Daycare FOREIGN KEY ([DaycareId]) REFERENCES [Daycare] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [Parent] ADD CONSTRAINT FK_Parent_Child FOREIGN KEY ([ChildId]) REFERENCES [Child] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [WaitList] ADD CONSTRAINT FK_Waitlist_Daycare FOREIGN KEY ([DaycareId]) REFERENCES [Daycare] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [User] ADD CONSTRAINT FK_User_UserType FOREIGN KEY ([UserTypeId]) REFERENCES [UserType] ([Id])
GO

ALTER TABLE [Daycare] ADD CONSTRAINT FK_Daycare_User FOREIGN KEY ([AdminUserId]) REFERENCES [User] ([Id]) ON Delete CASCADE
GO
