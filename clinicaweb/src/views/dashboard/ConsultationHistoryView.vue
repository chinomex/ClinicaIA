<template>
  <div class="space-y-6">
    <div class="rounded-3xl bg-white/5 p-6 shadow-2xl shadow-black/20 ring-1 ring-white/10">
      <div class="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
        <div>
          <h2 class="font-display text-2xl font-semibold text-white">Historial de consultas</h2>
          <p class="mt-1 text-sm text-slate-300">
            Consulta las atenciones realizadas recientemente y mantén actualizado el seguimiento de tus pacientes.
          </p>
        </div>
        <label class="flex items-center gap-3 rounded-full border border-white/10 bg-slate-900/60 px-4 py-2 text-sm text-slate-200 focus-within:border-brand-300 focus-within:ring-2 focus-within:ring-brand-300">
          <span class="hidden md:inline">Buscar</span>
          <input v-model="filters.query" type="search" class="w-full bg-transparent text-white focus:outline-none" placeholder="Nombre del paciente" />
        </label>
      </div>
    </div>

    <div class="rounded-3xl bg-white/5 p-6 shadow-2xl shadow-black/20 ring-1 ring-white/10">
      <table class="min-w-full divide-y divide-white/10 text-sm text-slate-200">
        <thead>
          <tr class="text-left uppercase tracking-[0.3em] text-xs text-slate-400">
            <th class="px-4 py-3">Fecha</th>
            <th class="px-4 py-3">Paciente</th>
            <th class="px-4 py-3">Médico</th>
            <th class="px-4 py-3">Diagnóstico</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="consulta in filteredConsultations"
            :key="consulta.id"
            class="border-b border-white/5 last:border-none hover:bg-white/5"
          >
            <td class="px-4 py-3">{{ consulta.fecha }}</td>
            <td class="px-4 py-3 font-medium text-white">{{ consulta.paciente }}</td>
            <td class="px-4 py-3">{{ consulta.medico }}</td>
            <td class="px-4 py-3">{{ consulta.diagnostico }}</td>
          </tr>
          <tr v-if="filteredConsultations.length === 0">
            <td colspan="4" class="px-4 py-6 text-center text-sm text-slate-400">
              No hay registros que coincidan con tu búsqueda.
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, reactive } from 'vue'

interface ConsultaResumen {
  id: number
  fecha: string
  paciente: string
  medico: string
  diagnostico: string
}

const consultas: ConsultaResumen[] = [
  {
    id: 1,
    fecha: '12/01/2025',
    paciente: 'Luis Fernández',
    medico: 'Dr. Carlos Ramírez',
    diagnostico: 'Hipertensión controlada',
  },
  {
    id: 2,
    fecha: '09/01/2025',
    paciente: 'María Camacho',
    medico: 'Dra. Lucía Herrera',
    diagnostico: 'Seguimiento pediátrico',
  },
  {
    id: 3,
    fecha: '05/01/2025',
    paciente: 'Andrés Ortega',
    medico: 'Dr. Juan Gómez',
    diagnostico: 'Dermatitis atópica',
  },
]

const filters = reactive({
  query: '',
})

const filteredConsultations = computed(() => {
  const value = filters.query.trim().toLowerCase()
  if (!value) {
    return consultas
  }

  return consultas.filter((consulta) =>
    [consulta.paciente, consulta.medico, consulta.diagnostico].some((field) =>
      field.toLowerCase().includes(value),
    ),
  )
})
</script>
