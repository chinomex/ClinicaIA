<template>
  <div class="rounded-3xl bg-white/5 p-8 shadow-2xl shadow-black/20 ring-1 ring-white/10">
    <h2 class="font-display text-2xl font-semibold text-white">Registrar nueva consulta</h2>
    <p class="mt-2 text-sm text-slate-300">
      Completa la siguiente información para programar una nueva consulta. Todos los campos marcados con * son obligatorios.
    </p>

    <form class="mt-8 grid gap-6 md:grid-cols-2" @submit.prevent="handleSubmit">
      <label class="flex flex-col space-y-2 text-sm">
        <span class="font-semibold text-slate-200">Médico *</span>
        <input
          v-model="form.medico"
          type="text"
          class="rounded-2xl border border-white/10 bg-slate-900/60 px-4 py-3 text-white focus:border-brand-300 focus:outline-none focus:ring-2 focus:ring-brand-300"
          placeholder="Nombre completo del médico"
          required
        />
      </label>

      <label class="flex flex-col space-y-2 text-sm">
        <span class="font-semibold text-slate-200">Paciente *</span>
        <input
          v-model="form.paciente"
          type="text"
          class="rounded-2xl border border-white/10 bg-slate-900/60 px-4 py-3 text-white focus:border-brand-300 focus:outline-none focus:ring-2 focus:ring-brand-300"
          placeholder="Nombre completo del paciente"
          required
        />
      </label>

      <label class="flex flex-col space-y-2 text-sm md:col-span-2">
        <span class="font-semibold text-slate-200">Síntomas *</span>
        <textarea
          v-model="form.sintomas"
          rows="4"
          class="rounded-2xl border border-white/10 bg-slate-900/60 px-4 py-3 text-white focus:border-brand-300 focus:outline-none focus:ring-2 focus:ring-brand-300"
          placeholder="Describe los síntomas del paciente"
          required
        ></textarea>
      </label>

      <label class="flex flex-col space-y-2 text-sm md:col-span-2">
        <span class="font-semibold text-slate-200">Diagnóstico preliminar</span>
        <textarea
          v-model="form.diagnostico"
          rows="3"
          class="rounded-2xl border border-white/10 bg-slate-900/60 px-4 py-3 text-white focus:border-brand-300 focus:outline-none focus:ring-2 focus:ring-brand-300"
          placeholder="Ingresa un diagnóstico inicial"
        ></textarea>
      </label>

      <label class="flex flex-col space-y-2 text-sm md:col-span-2">
        <span class="font-semibold text-slate-200">Recomendaciones</span>
        <textarea
          v-model="form.recomendaciones"
          rows="3"
          class="rounded-2xl border border-white/10 bg-slate-900/60 px-4 py-3 text-white focus:border-brand-300 focus:outline-none focus:ring-2 focus:ring-brand-300"
          placeholder="Indica recomendaciones para el paciente"
        ></textarea>
      </label>

      <div class="md:col-span-2">
        <button
          type="submit"
          class="inline-flex w-full items-center justify-center rounded-full bg-brand-500 px-5 py-3 text-sm font-semibold text-white transition hover:bg-brand-400 focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-300"
        >
          Guardar consulta
        </button>
      </div>
    </form>

    <p v-if="showConfirmation" class="mt-6 rounded-2xl bg-emerald-500/10 px-4 py-3 text-sm font-medium text-emerald-200">
      Consulta registrada correctamente. Puedes revisarla en el historial.
    </p>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'

type FormState = {
  medico: string
  paciente: string
  sintomas: string
  diagnostico: string
  recomendaciones: string
}

const initialState: FormState = {
  medico: '',
  paciente: '',
  sintomas: '',
  diagnostico: '',
  recomendaciones: '',
}

const form = reactive<FormState>({ ...initialState })
const showConfirmation = ref(false)

const resetForm = () => {
  Object.assign(form, initialState)
}

const handleSubmit = () => {
  showConfirmation.value = true
  window.setTimeout(() => {
    showConfirmation.value = false
  }, 4000)

  resetForm()
}
</script>
