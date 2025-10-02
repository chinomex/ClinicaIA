<template>
  <div class="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950">
    <div class="mx-auto flex max-w-7xl gap-10 px-6 py-12">
      <aside class="w-full max-w-xs space-y-6 rounded-3xl bg-slate-900/80 p-8 shadow-2xl shadow-black/40 ring-1 ring-white/10">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm font-medium uppercase tracking-[0.3em] text-brand-200">Panel</p>
            <p class="mt-1 font-display text-2xl font-semibold text-white">Dashboard</p>
          </div>
          <span class="rounded-full bg-brand-500/20 px-3 py-1 text-xs font-semibold text-brand-100">En línea</span>
        </div>

        <nav class="space-y-6 text-sm text-slate-200">
          <div>
            <p class="mb-3 text-xs font-semibold uppercase tracking-[0.4em] text-slate-400">Consultas</p>
            <ul class="space-y-2">
              <li>
                <button
                  type="button"
                  class="w-full rounded-2xl bg-white/5 px-4 py-3 text-left font-semibold text-white transition hover:bg-white/10 focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-300"
                >
                  Crear consultas
                </button>
              </li>
              <li>
                <button
                  type="button"
                  class="w-full rounded-2xl bg-white/5 px-4 py-3 text-left font-semibold text-white transition hover:bg-white/10 focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-300"
                >
                  Historial consultas
                </button>
              </li>
            </ul>
          </div>

          <div>
            <p class="mb-3 text-xs font-semibold uppercase tracking-[0.4em] text-slate-400">Administración</p>
            <ul class="space-y-2">
              <li>
                <button
                  type="button"
                  class="w-full rounded-2xl bg-white/5 px-4 py-3 text-left font-semibold text-white transition hover:bg-white/10 focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-300"
                >
                  Catálogo de Usuarios
                </button>
              </li>
              <li>
                <button
                  type="button"
                  class="w-full rounded-2xl bg-white/5 px-4 py-3 text-left font-semibold text-white transition hover:bg-white/10 focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-300"
                >
                  Catálogo de Médicos
                </button>
              </li>
            </ul>
          </div>
        </nav>

        <button
          type="button"
          class="inline-flex w-full items-center justify-center rounded-full border border-white/20 px-5 py-3 text-sm font-semibold text-white transition hover:border-white/40 hover:text-white focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-300"
          @click="handleLogout"
        >
          Cerrar sesión
        </button>
      </aside>

      <section class="flex-1 space-y-8">
        <header class="rounded-3xl bg-slate-900/70 p-8 shadow-2xl shadow-black/30 ring-1 ring-white/10">
          <p class="text-sm font-medium uppercase tracking-[0.4em] text-brand-200">Bienvenido</p>
          <h1 class="mt-3 font-display text-4xl font-semibold text-white">
            Hola {{ displayName }}, nos alegra verte de nuevo
          </h1>
          <p class="mt-4 max-w-2xl text-sm text-slate-300">
            Desde aquí puedes gestionar tus consultas, dar seguimiento a tratamientos y administrar el directorio clínico. Selecciona una opción del menú para comenzar.
          </p>
        </header>

        <div class="grid gap-6 md:grid-cols-2">
          <article class="rounded-3xl bg-white/5 p-6 shadow-xl shadow-black/20 ring-1 ring-white/10">
            <h2 class="font-display text-xl font-semibold text-white">Próximas consultas</h2>
            <p class="mt-3 text-sm text-slate-300">Aún no tienes consultas agendadas para esta semana. Programa una nueva consulta para mantenerte al día con tu salud.</p>
          </article>
          <article class="rounded-3xl bg-white/5 p-6 shadow-xl shadow-black/20 ring-1 ring-white/10">
            <h2 class="font-display text-xl font-semibold text-white">Resumen rápido</h2>
            <ul class="mt-4 space-y-3 text-sm text-slate-200">
              <li class="flex items-center justify-between rounded-2xl bg-white/5 px-4 py-3">
                <span>Citas completadas este mes</span>
                <span class="font-semibold text-white">3</span>
              </li>
              <li class="flex items-center justify-between rounded-2xl bg-white/5 px-4 py-3">
                <span>Pacientes en seguimiento activo</span>
                <span class="font-semibold text-white">8</span>
              </li>
              <li class="flex items-center justify-between rounded-2xl bg-white/5 px-4 py-3">
                <span>Alertas pendientes</span>
                <span class="font-semibold text-white">0</span>
              </li>
            </ul>
          </article>
        </div>
      </section>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const router = useRouter()
const authStore = useAuthStore()

const displayName = computed(() => {
  const fullName = authStore.userFullName?.trim()
  if (fullName) {
    return fullName
  }

  const email = authStore.userEmail
  if (email && email.includes('@')) {
    const namePart = email.split('@')[0]
    if (namePart) {
      return namePart.charAt(0).toUpperCase() + namePart.slice(1)
    }
  }

  return 'Paciente'
})

const handleLogout = () => {
  authStore.logout()
  router.push('/')
}
</script>
