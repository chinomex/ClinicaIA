# API de ClinicaIA

Servicio REST desarrollado con **ASP.NET Core 8** y **Entity Framework Core** para exponer los
recursos de médicos, pacientes, consultas y autenticación de usuarios.

## Arquitectura y tecnologías

- ASP.NET Core minimal hosting (`Program.cs`).
- Entity Framework Core con `DbContext` `ClinicaIaContext` y uso de procedimientos almacenados.
- Swagger (Swashbuckle) disponible en entorno de desarrollo.
- CORS configurable mediante `appsettings.json` (`Cors:AllowedOrigins`).

## Requisitos previos

- [.NET SDK 8](https://dotnet.microsoft.com/en-us/download).
- Instancia de SQL Server con el esquema `ClinicaIA` creado desde [`database/schema.sql`](../database/schema.sql).
- Actualizar la cadena de conexión `ConnectionStrings:ClinicaIa` en `appsettings.json` o
  `appsettings.Development.json` con los datos de tu servidor.

## Ejecución local

1. Restaura dependencias y compila:

   ```bash
   dotnet restore CliniaApi.sln
   dotnet build CliniaApi.sln
   ```

2. Ejecuta la API en modo desarrollo:

   ```bash
   dotnet run --project CliniaApi/CliniaApi
   ```

   Por defecto escucha en `https://localhost:7149` y `http://localhost:5203` (ajustable en `launchSettings.json`).

3. Accede a Swagger en `https://localhost:7149/swagger` para explorar y probar los endpoints.

## Endpoints principales

| Recurso                     | Método | Ruta                                | Descripción                                                |
| --------------------------- | ------ | ----------------------------------- | ---------------------------------------------------------- |
| Autenticación               | POST   | `/api/auth/login`                   | Valida credenciales (correo + contraseña) y devuelve datos del usuario. |
| Médicos                     | GET    | `/api/medicos`                      | Lista de médicos activos (usa `spObtenerMedicos`).         |
| Médicos                     | GET    | `/api/medicos/{id}`                 | Obtiene detalle de un médico.                             |
| Médicos                     | POST   | `/api/medicos`                      | Crea un médico nuevo mediante `spGuardarMedico`.           |
| Médicos                     | PUT    | `/api/medicos/{id}`                 | Actualiza un médico existente.                            |
| Médicos                     | DELETE | `/api/medicos/{id}`                 | Desactiva (soft delete) a un médico.                      |
| Pacientes                   | GET    | `/api/pacientes`                    | Lista de pacientes activos ordenados alfabéticamente.     |
| Consultas                   | GET    | `/api/consultas/historial`          | Recupera el historial usando `spObtenerConsultasHistorial`.|
| Consultas                   | POST   | `/api/consultas`                    | Registra una consulta con `spRegistrarConsulta`.          |

> Consulta los controladores en [`CliniaApi/Controllers`](CliniaApi/CliniaApi/Controllers) para revisar todas las acciones disponibles.

## Consideraciones de seguridad

- Las contraseñas se almacenan como hash SHA-256 (`PasswordHasher`).
- Habilita HTTPS redirigiendo el tráfico y configurando certificados válidos en producción.
- Ajusta el origen permitido de CORS para evitar solicitudes no autorizadas.

## Migraciones y base de datos

Este proyecto está diseñado para trabajar con los procedimientos y tablas definidos en
[`database/schema.sql`](../database/schema.sql). Si deseas administrar la base de datos con EF Core
migrations, deberás agregar las migraciones correspondientes y desactivar las llamadas a stored
procedures según tus necesidades.
