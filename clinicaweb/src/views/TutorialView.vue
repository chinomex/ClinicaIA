<template>
  <div class="relative">
    <div class="absolute inset-0 -z-10 bg-[radial-gradient(circle_at_top,_rgba(45,212,191,0.15),_transparent_65%)]"></div>
    <header class="mx-auto max-w-5xl px-6 py-16 text-center">
      <p class="text-sm font-medium uppercase tracking-[0.4em] text-brand-200">Guía del portal</p>
      <h1 class="mt-4 font-display text-4xl font-semibold text-white sm:text-5xl">Tutorial para aprovechar la Clínica Digital</h1>
      <p class="mt-6 text-base text-slate-300">
        Conoce cada sección del portal para navegar con confianza, gestionar tus consultas y coordinar a tu equipo clínico sin complicaciones.
      </p>
      <div class="mt-8 flex flex-wrap items-center justify-center gap-4 text-sm">
        <RouterLink
          to="/register"
          class="inline-flex items-center justify-center rounded-full bg-brand-500 px-6 py-3 font-semibold text-white shadow-lg shadow-brand-500/20 transition hover:-translate-y-0.5 hover:bg-brand-400 focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-300"
        >
          Crear una cuenta
        </RouterLink>
        <RouterLink
          to="/login"
          class="inline-flex items-center justify-center rounded-full border border-white/20 px-6 py-3 font-semibold text-white/80 transition hover:border-white/40 hover:text-white focus:outline-none focus-visible:ring-2 focus-visible:ring-white/40"
        >
          Iniciar sesión
        </RouterLink>
      </div>
    </header>

    <main class="mx-auto max-w-5xl space-y-16 px-6 pb-24">
      <section class="rounded-3xl bg-slate-900/70 p-10 shadow-2xl shadow-black/30 ring-1 ring-white/10">
        <h2 class="font-display text-3xl font-semibold text-white">Introducción al portal</h2>
        <p class="mt-4 text-base text-slate-300">
          La plataforma de la Clínica Integral Aurora centraliza la gestión médica en un entorno seguro. Una vez que te registras y verificas tu cuenta, podrás acceder al dashboard para agendar consultas, consultar historiales clínicos y administrar al personal.
        </p>
        <div class="mt-6 grid gap-4 sm:grid-cols-2">
          <div class="rounded-2xl bg-white/5 p-6">
            <p class="text-sm font-semibold uppercase tracking-[0.35em] text-brand-200">Acceso rápido</p>
            <p class="mt-3 text-sm text-slate-200">Utiliza tu correo electrónico y contraseña para ingresar. Si olvidaste tu clave, recupera el acceso desde la opción “¿Olvidaste tu contraseña?”.</p>
          </div>
          <div class="rounded-2xl bg-white/5 p-6">
            <p class="text-sm font-semibold uppercase tracking-[0.35em] text-brand-200">Seguridad</p>
            <p class="mt-3 text-sm text-slate-200">Tu información está protegida con sesiones cifradas. Recuerda cerrar sesión desde el panel lateral al terminar.</p>
          </div>
        </div>
      </section>

      <section class="space-y-6">
        <header class="space-y-3">
          <p class="text-sm font-medium uppercase tracking-[0.4em] text-brand-200">Recorrido por el dashboard</p>
          <h2 class="font-display text-3xl font-semibold text-white">Secciones principales</h2>
          <p class="text-base text-slate-300">
            El dashboard está organizado para que encuentres rápidamente lo que necesitas. Cada módulo está acompañado de estadísticas en tiempo real y accesos directos.
          </p>
        </header>

        <div class="grid gap-8 md:grid-cols-2">
          <article class="flex flex-col justify-between rounded-3xl bg-slate-900/70 p-8 shadow-xl shadow-black/30 ring-1 ring-white/10">
            <div class="space-y-3">
              <span class="inline-flex w-max items-center gap-2 rounded-full bg-brand-500/20 px-4 py-1 text-xs font-semibold text-brand-100">Resumen general</span>
              <h3 class="font-display text-2xl font-semibold text-white">Panorama clínico</h3>
              <p class="text-sm text-slate-300">
                Visualiza tus próximas citas, notificaciones relevantes y las tareas pendientes del equipo. Ideal para comenzar la jornada con claridad.
              </p>
            </div>
            <RouterLink
              to="/dashboard"
              class="mt-6 inline-flex items-center gap-2 text-sm font-semibold text-brand-200 transition hover:text-brand-100"
            >
              Ir al dashboard
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-4 w-4" fill="none" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
              </svg>
            </RouterLink>
          </article>

          <article class="flex flex-col justify-between rounded-3xl bg-slate-900/70 p-8 shadow-xl shadow-black/30 ring-1 ring-white/10">
            <div class="space-y-3">
              <span class="inline-flex w-max items-center gap-2 rounded-full bg-brand-500/20 px-4 py-1 text-xs font-semibold text-brand-100">Crear consultas</span>
              <h3 class="font-display text-2xl font-semibold text-white">Registrar nuevas atenciones</h3>
              <p class="text-sm text-slate-300">
                Completa la información del paciente, añade notas clínicas y adjunta estudios. El sistema envía confirmaciones automáticas para que no haya ausencias.
              </p>
            </div>
            <p class="mt-6 text-xs uppercase tracking-[0.4em] text-brand-200">Acceso desde Dashboard &gt; Consultas</p>
          </article>

          <article class="flex flex-col justify-between rounded-3xl bg-slate-900/70 p-8 shadow-xl shadow-black/30 ring-1 ring-white/10">
            <div class="space-y-3">
              <span class="inline-flex w-max items-center gap-2 rounded-full bg-brand-500/20 px-4 py-1 text-xs font-semibold text-brand-100">Historial</span>
              <h3 class="font-display text-2xl font-semibold text-white">Seguimiento integral</h3>
              <p class="text-sm text-slate-300">
                Consulta antecedentes, resultados y notas de evolución. Utiliza los filtros avanzados para localizar registros por paciente, médico o especialidad.
              </p>
            </div>
            <p class="mt-6 text-xs uppercase tracking-[0.4em] text-brand-200">Dashboard &gt; Consultas &gt; Historial</p>
          </article>

          <article class="flex flex-col justify-between rounded-3xl bg-slate-900/70 p-8 shadow-xl shadow-black/30 ring-1 ring-white/10">
            <div class="space-y-3">
              <span class="inline-flex w-max items-center gap-2 rounded-full bg-brand-500/20 px-4 py-1 text-xs font-semibold text-brand-100">Administración</span>
              <h3 class="font-display text-2xl font-semibold text-white">Equipo y directorio</h3>
              <p class="text-sm text-slate-300">
                Administra usuarios administrativos y médicos. Actualiza roles, especialidades y datos de contacto en minutos.
              </p>
            </div>
            <p class="mt-6 text-xs uppercase tracking-[0.4em] text-brand-200">Dashboard &gt; Administración</p>
          </article>
        </div>
      </section>

      <section class="rounded-3xl bg-gradient-to-br from-brand-500/20 via-transparent to-indigo-500/10 p-10 shadow-2xl shadow-black/30 ring-1 ring-brand-500/30">
        <h2 class="font-display text-3xl font-semibold text-white">Consejos para colaborar en equipo</h2>
        <ul class="mt-6 space-y-4 text-sm text-slate-200">
          <li class="flex items-start gap-3">
            <span class="mt-1 inline-flex h-6 w-6 items-center justify-center rounded-full bg-white/10 text-xs font-semibold text-brand-100">1</span>
            <p>Mantén actualizados los datos de pacientes para que cada consulta cuente con antecedentes precisos.</p>
          </li>
          <li class="flex items-start gap-3">
            <span class="mt-1 inline-flex h-6 w-6 items-center justify-center rounded-full bg-white/10 text-xs font-semibold text-brand-100">2</span>
            <p>Comparte el acceso con tu staff de recepción mediante el catálogo de usuarios y define permisos personalizados.</p>
          </li>
          <li class="flex items-start gap-3">
            <span class="mt-1 inline-flex h-6 w-6 items-center justify-center rounded-full bg-white/10 text-xs font-semibold text-brand-100">3</span>
            <p>Revisa el historial de consultas antes de cada visita para identificar tratamientos activos y pruebas pendientes.</p>
          </li>
        </ul>
      </section>

      <section class="rounded-3xl bg-slate-900/70 p-10 shadow-2xl shadow-black/30 ring-1 ring-white/10">
        <h2 class="font-display text-3xl font-semibold text-white">¿Necesitas soporte adicional?</h2>
        <p class="mt-4 text-base text-slate-300">
          Desde el apartado <strong>Ayuda</strong> del dashboard encontrarás guías rápidas, respuestas a preguntas frecuentes y la opción de contactar al equipo de soporte técnico.
        </p>
        <div class="mt-6 flex flex-wrap gap-4 text-sm">
          <RouterLink
            to="/dashboard/ayuda"
            class="inline-flex items-center justify-center rounded-full bg-white/10 px-6 py-3 font-semibold text-white transition hover:bg-white/20 focus:outline-none focus-visible:ring-2 focus-visible:ring-white/40"
          >
            Abrir la sección de ayuda
          </RouterLink>
          <a
            href="mailto:soporte@clinicaaurora.mx"
            class="inline-flex items-center justify-center rounded-full border border-white/15 px-6 py-3 font-semibold text-white/80 transition hover:border-white/40 hover:text-white focus:outline-none focus-visible:ring-2 focus-visible:ring-white/30"
          >
            Contactar soporte
          </a>
        </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { RouterLink } from 'vue-router'
</script>
