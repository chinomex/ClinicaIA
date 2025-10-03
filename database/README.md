# Base de datos de ClinicaIA

Este directorio contiene el script `schema.sql` para preparar la base de datos SQL Server que
utiliza la plataforma ClinicaIA. Incluye la creación de tablas, inserción de datos de ejemplo y
procedimientos almacenados necesarios para la API.

## Contenido del script

1. **Limpieza inicial**: elimina tablas existentes (`Consultas`, `Usuarios`, `Pacientes`, `Medicos`) para
   permitir la recreación del esquema en entornos de desarrollo.
2. **Tablas principales**:
   - `Medicos`: catálogo de personal médico con información de contacto y especialidad.
   - `Pacientes`: registro de pacientes activos.
   - `Usuarios`: credenciales de acceso asociadas opcionalmente a médicos.
   - `Consultas`: historial de consultas médicas vinculadas a médicos y pacientes.
3. **Datos semilla**: inserta 10 médicos, 10 pacientes y cuentas de usuario con contraseñas hashed.
4. **Procedimientos almacenados**:
   - `spRegistrarUsuario` y `spValidarUsuario` para el manejo de cuentas.
   - `spGuardarMedico` y `spObtenerMedicos` para operaciones CRUD de médicos.
   - `spRegistrarConsulta` y `spObtenerConsultasHistorial` para administrar consultas clínicas.

## Requisitos

- SQL Server 2019 o superior.
- Permisos para crear bases de datos, tablas y procedimientos almacenados.

## Pasos para desplegar

1. Crea la base de datos vacía (por ejemplo `ClinicaIA`).
2. Ejecuta el script `schema.sql` en el contexto de esa base de datos mediante SQL Server
   Management Studio, Azure Data Studio o `sqlcmd`:

   ```bash
   sqlcmd -S <SERVIDOR> -d ClinicaIA -U <USUARIO> -P <PASSWORD> -i schema.sql
   ```

3. Verifica que las tablas, datos semilla y stored procedures se hayan creado correctamente.
4. Actualiza la cadena de conexión en la API para apuntar a esta base de datos.

## Mantenimiento

- Ejecuta nuevamente el script cuando necesites restablecer el ambiente de desarrollo.
- Para entornos productivos, elimina las secciones de `DROP TABLE` o adapta el script a migraciones
  controladas.
- Considera crear usuarios SQL con privilegios limitados para las aplicaciones cliente.
