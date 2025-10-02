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
    FechaCreacion DATETIME2(0) NOT NULL DEFAULT (SYSUTCDATETIME())
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

INSERT INTO dbo.Medicos (PrimerNombre, SegundoNombre, ApellidoPaterno, ApellidoMaterno, Cedula, Telefono, Especialidad, Email)
VALUES
    (N'Carlos', N'Andrés', N'Ramírez', N'González', N'MED001', N'555-0101', N'Cardiología', N'carlos.ramirez@clinica.com'),
    (N'Lucía', NULL, N'Herrera', N'Mendoza', N'MED002', N'555-0102', N'Pediatría', N'lucia.herrera@clinica.com'),
    (N'Juan', N'Pablo', N'Gómez', N'Ríos', N'MED003', N'555-0103', N'Dermatología', N'juan.gomez@clinica.com'),
    (N'Ana', N'Laura', N'Salinas', N'Cano', N'MED004', N'555-0104', N'Ginecología', N'ana.salinas@clinica.com'),
    (N'Roberto', NULL, N'Cárdenas', N'López', N'MED005', N'555-0105', N'Neurología', N'roberto.cardenas@clinica.com'),
    (N'Sofía', N'Isabel', N'Morales', N'Quintero', N'MED006', N'555-0106', N'Oncología', N'sofia.morales@clinica.com'),
    (N'Marco', N'Antonio', N'Silva', N'Campos', N'MED007', N'555-0107', N'Traumatología', N'marco.silva@clinica.com'),
    (N'Elena', NULL, N'Pérez', N'Valdez', N'MED008', N'555-0108', N'Endocrinología', N'elena.perez@clinica.com'),
    (N'Diego', N'Armando', N'Navarro', N'Ibáñez', N'MED009', N'555-0109', N'Oftalmología', N'diego.navarro@clinica.com'),
    (N'Valeria', N'Noemí', N'Blanco', N'Serrano', N'MED010', N'555-0110', N'Psiquiatría', N'valeria.blanco@clinica.com');
GO

INSERT INTO dbo.Pacientes (PrimerNombre, SegundoNombre, ApellidoPaterno, ApellidoMaterno, Telefono)
VALUES
    (N'Luis', N'Alberto', N'Fernández', N'Ruiz', N'555-0201'),
    (N'María', N'José', N'Camacho', N'López', N'555-0202'),
    (N'Andrés', NULL, N'Ortega', N'Peña', N'555-0203'),
    (N'Fernanda', N'Paola', N'Martínez', N'Ramos', N'555-0204'),
    (N'Javier', N'Enrique', N'Castillo', N'Galván', N'555-0205'),
    (N'Patricia', NULL, N'Aguilar', N'Soto', N'555-0206'),
    (N'Ignacio', N'Leonel', N'Reyes', N'Duarte', N'555-0207'),
    (N'Liliana', N'Beatriz', N'Chávez', N'Carrillo', N'555-0208'),
    (N'Hugo', NULL, N'Moreno', N'Sandoval', N'555-0209'),
    (N'Daniela', N'Carolina', N'Pineda', N'Rosales', N'555-0210');
GO

INSERT INTO dbo.Usuarios (Correo, PasswordHash, NombreCompleto, IdMedico)
VALUES
    (N'carlos.admin@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Carlos Andrés Ramírez González', NULL),
    (N'lucia.admin@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Lucía Herrera Mendoza', NULL),
    (N'juan.admin@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Juan Pablo Gómez Ríos', NULL),
    (N'ana.admin@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Ana Laura Salinas Cano', NULL),
    (N'roberto.admin@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Roberto Cárdenas López', NULL),
    (N'sofia.medico@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Sofía Isabel Morales Quintero', 6),
    (N'marco.medico@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Marco Antonio Silva Campos', 7),
    (N'elena.medico@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Elena Pérez Valdez', 8),
    (N'diego.medico@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Diego Armando Navarro Ibáñez', 9),
    (N'valeria.medico@clinica.com', N'A109E36947AD56DE1DCA1CC49F0EF8AC9AD9A7B1AA0DF41FB3C4CB73C1FF01EA',
     N'Valeria Noemí Blanco Serrano', 10);
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
