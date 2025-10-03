# Frontend web de ClinicaIA

Aplicación SPA desarrollada con **Vue 3 + Vite** para la gestión operativa de una clínica.
Incluye autenticación, panel administrativo y flujos para registrar consultas médicas.

## Características principales

- Enrutamiento protegido con `vue-router` y guardas basadas en sesión.
- Manejo centralizado del estado de autenticación con **Pinia**.
- Formularios modulares para crear consultas y administrar catálogos de usuarios y médicos.
- Consumo de la API de ClinicaIA mediante un cliente Axios configurado en `src/lib/api.ts`.

## Requisitos

- Node.js 20 o superior.
- npm (se instala con Node.js).
- Acceso a la API en ejecución (por defecto `https://localhost:7149`).

## Configuración

1. Instala dependencias:

   ```bash
   npm install
   ```

2. Ajusta la URL base de la API si es necesario. Puedes modificar la función
   `getDefaultBaseUrl()` en [`src/lib/api.ts`](src/lib/api.ts) o crear una instancia
   personalizada de Axios antes de iniciar sesión.

3. Crea un archivo `.env.local` si deseas sobrescribir variables de Vite, por ejemplo:

   ```bash
   VITE_API_BASE_URL=https://mi-servidor:7149
   ```

   Luego actualiza `apiClient` para leer la variable (`import.meta.env.VITE_API_BASE_URL`).

## Comandos disponibles

| Comando            | Descripción                                                    |
| ------------------ | -------------------------------------------------------------- |
| `npm run dev`      | Servidor de desarrollo en `http://localhost:5173`.             |
| `npm run build`    | Genera la versión optimizada para producción en `dist/`.       |
| `npm run preview`  | Sirve la build de producción para validación manual.           |
| `npm run lint`     | Ejecuta ESLint con la configuración del proyecto.              |

## Estructura relevante

- `src/router/`: definición de rutas y guardas de navegación.
- `src/stores/auth.ts`: store de autenticación con operaciones de login/logout.
- `src/views/`: vistas principales (login, registro, dashboard y secciones internas).
- `src/lib/api.ts`: cliente Axios que centraliza las llamadas a la API REST.

## Autenticación y flujo de trabajo

1. El usuario inicia sesión desde `/login`; el store `useAuthStore` invoca `POST /api/auth/login`.
2. Una sesión válida habilita el acceso a `/dashboard` y sus rutas hijas protegidas.
3. En el dashboard se pueden crear consultas, revisar historial y administrar catálogos.
4. El cierre de sesión limpia el estado en Pinia y redirige a la vista de login.

Para más detalles sobre los servicios disponibles consulta la [documentación de la API](../CliniaApi/README.md).
