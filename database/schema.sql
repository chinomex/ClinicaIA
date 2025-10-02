SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

IF OBJECT_ID('dbo.Consultas', 'U') IS NOT NULL DROP TABLE dbo.Consultas;
IF OBJECT_ID('dbo.Usuarios', 'U') IS NOT NULL DROP TABLE dbo.Usuarios;
IF OBJECT_ID('dbo.Pacientes', 'U') IS NOT NULL DROP TABLE dbo.Pacientes;
IF OBJECT_ID('dbo.Medicos', 'U') IS NOT NULL DROP TABLE dbo.Medicos;
GO

CREATE TABLE dbo.Medicos
(
    Id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    PrimerNombre NVARCHAR(100) NOT NULL,
    SegundoNombre NVARCHAR(100) NULL,
    ApellidoPaterno NVARCHAR(100) NOT NULL,
    ApellidoMaterno NVARCHAR(100) NULL,
    Cedula NVARCHAR(50) NOT NULL,
    Telefono NVARCHAR(30) NULL,
    Especialidad NVARCHAR(150) NULL,
    Email NVARCHAR(256) NOT NULL,
    Activo BIT NOT NULL DEFAULT (1),
    FechaCreacion DATETIME2(0) NOT NULL DEFAULT (SYSUTCDATETIME())
);
GO

CREATE TABLE dbo.Pacientes
(
    Id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    PrimerNombre NVARCHAR(100) NOT NULL,
    SegundoNombre NVARCHAR(100) NULL,
    ApellidoPaterno NVARCHAR(100) NOT NULL,
    ApellidoMaterno NVARCHAR(100) NULL,
    Telefono NVARCHAR(30) NULL,
    Activo BIT NOT NULL DEFAULT (1),
    FechaCreacion DATETIME2(0) NOT NULL DEFAULT (SYSUTCDATETIME())
);
GO

CREATE TABLE dbo.Usuarios
(
    Id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    Correo NVARCHAR(256) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(64) NOT NULL,
    NombreCompleto NVARCHAR(200) NOT NULL,
    IdMedico INT NULL,
    Activo BIT NOT NULL DEFAULT (1),
    FechaCreacion DATETIME2(0) NOT NULL DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT FK_Usuarios_Medicos FOREIGN KEY (IdMedico) REFERENCES dbo.Medicos (Id)
);
GO

CREATE TABLE dbo.Consultas
(
    Id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    IdMedico INT NOT NULL,
    IdPaciente INT NOT NULL,
    Sintomas NVARCHAR(MAX) NULL,
    Recomendaciones NVARCHAR(MAX) NULL,
    Diagnostico NVARCHAR(MAX) NULL,
    CONSTRAINT FK_Consultas_Medicos FOREIGN KEY (IdMedico) REFERENCES dbo.Medicos (Id),
    CONSTRAINT FK_Consultas_Pacientes FOREIGN KEY (IdPaciente) REFERENCES dbo.Pacientes (Id)
);
GO

IF OBJECT_ID('dbo.spRegistrarUsuario', 'P') IS NOT NULL DROP PROCEDURE dbo.spRegistrarUsuario;
GO
CREATE PROCEDURE dbo.spRegistrarUsuario
    @Correo NVARCHAR(256),
    @Password NVARCHAR(200),
    @NombreCompleto NVARCHAR(200),
    @IdMedico INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PasswordHash NVARCHAR(64) = CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', @Password), 2);

    INSERT INTO dbo.Usuarios (Correo, PasswordHash, NombreCompleto, IdMedico)
    VALUES (@Correo, @PasswordHash, @NombreCompleto, @IdMedico);
END;
GO

IF OBJECT_ID('dbo.spValidarUsuario', 'P') IS NOT NULL DROP PROCEDURE dbo.spValidarUsuario;
GO
CREATE PROCEDURE dbo.spValidarUsuario
    @Correo NVARCHAR(256),
    @Password NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PasswordHash NVARCHAR(64) = CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', @Password), 2);

    SELECT TOP (1)
        u.Id,
        u.Correo,
        u.NombreCompleto,
        u.Activo
    FROM dbo.Usuarios AS u
    WHERE u.Correo = @Correo
      AND u.PasswordHash = @PasswordHash
      AND u.Activo = 1;
END;
GO
