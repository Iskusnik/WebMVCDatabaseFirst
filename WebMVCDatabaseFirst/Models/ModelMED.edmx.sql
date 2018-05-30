
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/30/2018 19:03:12
-- Generated from EDMX file: C:\Users\IskusnikXD\Documents\Visual Studio 2015\Projects\WebMVCDatabaseFirst\WebMVCDatabaseFirst\Models\ModelMED.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [medWeb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_MedCardIllness_MedCard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MedCardIllness] DROP CONSTRAINT [FK_MedCardIllness_MedCard];
GO
IF OBJECT_ID(N'[dbo].[FK_MedCardIllness_Illness]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MedCardIllness] DROP CONSTRAINT [FK_MedCardIllness_Illness];
GO
IF OBJECT_ID(N'[dbo].[FK_MedCardDocRecord]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DocRecordSet] DROP CONSTRAINT [FK_MedCardDocRecord];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorDocRecord]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DocRecordSet] DROP CONSTRAINT [FK_DoctorDocRecord];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorFreeTime]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FreeTimeSet] DROP CONSTRAINT [FK_DoctorFreeTime];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientWorkTime]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkTimeSet] DROP CONSTRAINT [FK_PatientWorkTime];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorWorkTime]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkTimeSet] DROP CONSTRAINT [FK_DoctorWorkTime];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientMedCard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonSet_Patient] DROP CONSTRAINT [FK_PatientMedCard];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonDocuments]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonSet] DROP CONSTRAINT [FK_PersonDocuments];
GO
IF OBJECT_ID(N'[dbo].[FK_Doctor_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonSet_Doctor] DROP CONSTRAINT [FK_Doctor_inherits_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_Patient_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonSet_Patient] DROP CONSTRAINT [FK_Patient_inherits_Person];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[PersonSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonSet];
GO
IF OBJECT_ID(N'[dbo].[MedCardSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MedCardSet];
GO
IF OBJECT_ID(N'[dbo].[IllnessSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IllnessSet];
GO
IF OBJECT_ID(N'[dbo].[DocRecordSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DocRecordSet];
GO
IF OBJECT_ID(N'[dbo].[FreeTimeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FreeTimeSet];
GO
IF OBJECT_ID(N'[dbo].[WorkTimeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkTimeSet];
GO
IF OBJECT_ID(N'[dbo].[DocumentsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DocumentsSet];
GO
IF OBJECT_ID(N'[dbo].[PersonSet_Doctor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonSet_Doctor];
GO
IF OBJECT_ID(N'[dbo].[PersonSet_Patient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonSet_Patient];
GO
IF OBJECT_ID(N'[dbo].[MedCardIllness]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MedCardIllness];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PersonSet'
CREATE TABLE [dbo].[PersonSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FIO] nvarchar(max)  NOT NULL,
    [Nation] nvarchar(max)  NULL,
    [BirthDate] datetime  NOT NULL,
    [BirthPlace] nvarchar(max)  NULL,
    [LivePlace] nvarchar(max)  NULL,
    [Pol] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MedCardSet'
CREATE TABLE [dbo].[MedCardSet] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'IllnessSet'
CREATE TABLE [dbo].[IllnessSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DocRecordSet'
CREATE TABLE [dbo].[DocRecordSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MedCard_Id] int  NOT NULL,
    [Doctor_Id] int  NOT NULL
);
GO

-- Creating table 'FreeTimeSet'
CREATE TABLE [dbo].[FreeTimeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartTime] datetime  NOT NULL,
    [Doctor_Id] int  NOT NULL
);
GO

-- Creating table 'WorkTimeSet'
CREATE TABLE [dbo].[WorkTimeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartTime] datetime  NOT NULL,
    [Patient_Id] int  NOT NULL,
    [Doctor_Id] int  NOT NULL
);
GO

-- Creating table 'DocumentsSet'
CREATE TABLE [dbo].[DocumentsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Number] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'PersonSet_Doctor'
CREATE TABLE [dbo].[PersonSet_Doctor] (
    [Job] nvarchar(max)  NOT NULL,
    [Insurance] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'PersonSet_Patient'
CREATE TABLE [dbo].[PersonSet_Patient] (
    [OMS] nvarchar(max)  NOT NULL,
    [Blood] nvarchar(max)  NULL,
    [Id] int  NOT NULL,
    [MedCard_Id] int  NOT NULL
);
GO

-- Creating table 'MedCardIllness'
CREATE TABLE [dbo].[MedCardIllness] (
    [MedCard_Id] int  NOT NULL,
    [Illness_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'PersonSet'
ALTER TABLE [dbo].[PersonSet]
ADD CONSTRAINT [PK_PersonSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MedCardSet'
ALTER TABLE [dbo].[MedCardSet]
ADD CONSTRAINT [PK_MedCardSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'IllnessSet'
ALTER TABLE [dbo].[IllnessSet]
ADD CONSTRAINT [PK_IllnessSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DocRecordSet'
ALTER TABLE [dbo].[DocRecordSet]
ADD CONSTRAINT [PK_DocRecordSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FreeTimeSet'
ALTER TABLE [dbo].[FreeTimeSet]
ADD CONSTRAINT [PK_FreeTimeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'WorkTimeSet'
ALTER TABLE [dbo].[WorkTimeSet]
ADD CONSTRAINT [PK_WorkTimeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DocumentsSet'
ALTER TABLE [dbo].[DocumentsSet]
ADD CONSTRAINT [PK_DocumentsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PersonSet_Doctor'
ALTER TABLE [dbo].[PersonSet_Doctor]
ADD CONSTRAINT [PK_PersonSet_Doctor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PersonSet_Patient'
ALTER TABLE [dbo].[PersonSet_Patient]
ADD CONSTRAINT [PK_PersonSet_Patient]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [MedCard_Id], [Illness_Id] in table 'MedCardIllness'
ALTER TABLE [dbo].[MedCardIllness]
ADD CONSTRAINT [PK_MedCardIllness]
    PRIMARY KEY CLUSTERED ([MedCard_Id], [Illness_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MedCard_Id] in table 'MedCardIllness'
ALTER TABLE [dbo].[MedCardIllness]
ADD CONSTRAINT [FK_MedCardIllness_MedCard]
    FOREIGN KEY ([MedCard_Id])
    REFERENCES [dbo].[MedCardSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Illness_Id] in table 'MedCardIllness'
ALTER TABLE [dbo].[MedCardIllness]
ADD CONSTRAINT [FK_MedCardIllness_Illness]
    FOREIGN KEY ([Illness_Id])
    REFERENCES [dbo].[IllnessSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MedCardIllness_Illness'
CREATE INDEX [IX_FK_MedCardIllness_Illness]
ON [dbo].[MedCardIllness]
    ([Illness_Id]);
GO

-- Creating foreign key on [MedCard_Id] in table 'DocRecordSet'
ALTER TABLE [dbo].[DocRecordSet]
ADD CONSTRAINT [FK_MedCardDocRecord]
    FOREIGN KEY ([MedCard_Id])
    REFERENCES [dbo].[MedCardSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MedCardDocRecord'
CREATE INDEX [IX_FK_MedCardDocRecord]
ON [dbo].[DocRecordSet]
    ([MedCard_Id]);
GO

-- Creating foreign key on [Doctor_Id] in table 'DocRecordSet'
ALTER TABLE [dbo].[DocRecordSet]
ADD CONSTRAINT [FK_DoctorDocRecord]
    FOREIGN KEY ([Doctor_Id])
    REFERENCES [dbo].[PersonSet_Doctor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorDocRecord'
CREATE INDEX [IX_FK_DoctorDocRecord]
ON [dbo].[DocRecordSet]
    ([Doctor_Id]);
GO

-- Creating foreign key on [Doctor_Id] in table 'FreeTimeSet'
ALTER TABLE [dbo].[FreeTimeSet]
ADD CONSTRAINT [FK_DoctorFreeTime]
    FOREIGN KEY ([Doctor_Id])
    REFERENCES [dbo].[PersonSet_Doctor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorFreeTime'
CREATE INDEX [IX_FK_DoctorFreeTime]
ON [dbo].[FreeTimeSet]
    ([Doctor_Id]);
GO

-- Creating foreign key on [Patient_Id] in table 'WorkTimeSet'
ALTER TABLE [dbo].[WorkTimeSet]
ADD CONSTRAINT [FK_PatientWorkTime]
    FOREIGN KEY ([Patient_Id])
    REFERENCES [dbo].[PersonSet_Patient]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientWorkTime'
CREATE INDEX [IX_FK_PatientWorkTime]
ON [dbo].[WorkTimeSet]
    ([Patient_Id]);
GO

-- Creating foreign key on [Doctor_Id] in table 'WorkTimeSet'
ALTER TABLE [dbo].[WorkTimeSet]
ADD CONSTRAINT [FK_DoctorWorkTime]
    FOREIGN KEY ([Doctor_Id])
    REFERENCES [dbo].[PersonSet_Doctor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorWorkTime'
CREATE INDEX [IX_FK_DoctorWorkTime]
ON [dbo].[WorkTimeSet]
    ([Doctor_Id]);
GO

-- Creating foreign key on [MedCard_Id] in table 'PersonSet_Patient'
ALTER TABLE [dbo].[PersonSet_Patient]
ADD CONSTRAINT [FK_PatientMedCard]
    FOREIGN KEY ([MedCard_Id])
    REFERENCES [dbo].[MedCardSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientMedCard'
CREATE INDEX [IX_FK_PatientMedCard]
ON [dbo].[PersonSet_Patient]
    ([MedCard_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'DocumentsSet'
ALTER TABLE [dbo].[DocumentsSet]
ADD CONSTRAINT [FK_DocumentsPerson]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[PersonSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentsPerson'
CREATE INDEX [IX_FK_DocumentsPerson]
ON [dbo].[DocumentsSet]
    ([Person_Id]);
GO

-- Creating foreign key on [Id] in table 'PersonSet_Doctor'
ALTER TABLE [dbo].[PersonSet_Doctor]
ADD CONSTRAINT [FK_Doctor_inherits_Person]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[PersonSet]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'PersonSet_Patient'
ALTER TABLE [dbo].[PersonSet_Patient]
ADD CONSTRAINT [FK_Patient_inherits_Person]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[PersonSet]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------