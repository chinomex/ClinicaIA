<template>
  <div class="space-y-8">
    <section class="rounded-3xl bg-slate-900/80 p-8 shadow-2xl shadow-black/30 ring-1 ring-white/10">
      <h2 class="font-display text-3xl font-semibold text-white">Centro de ayuda</h2>
      <p class="mt-4 text-sm text-slate-300">
        Encuentra orientación sobre cada sección del portal y obtén recomendaciones para resolver dudas frecuentes. Puedes volver a esta guía en cualquier momento desde el menú lateral.
      </p>
    </section>

    <section class="grid gap-6 lg:grid-cols-2">
      <article class="rounded-3xl bg-white/5 p-6">
        <h3 class="font-display text-2xl font-semibold text-white">Resumen general</h3>
        <p class="mt-3 text-sm text-slate-300">
          Revisa un panorama de tus actividades: próximas citas, alertas y recordatorios. Mantén tu agenda alineada con tu equipo consultando este apartado al comenzar el día.
        </p>
        <ul class="mt-4 space-y-2 text-sm text-slate-300">
          <li>• Estadísticas clave de productividad semanal.</li>
          <li>• Lista de pacientes pendientes de seguimiento.</li>
          <li>• Accesos rápidos a crear consulta y revisar historial.</li>
        </ul>
      </article>

      <article class="rounded-3xl bg-white/5 p-6">
        <h3 class="font-display text-2xl font-semibold text-white">Consultas &gt; Crear</h3>
        <p class="mt-3 text-sm text-slate-300">
          Registra una nueva atención capturando los datos del paciente, motivo de consulta y tratamiento propuesto. Adjunta archivos clínicos para que el expediente permanezca completo.
        </p>
        <ul class="mt-4 space-y-2 text-sm text-slate-300">
          <li>• Plantilla estructurada para notas médicas.</li>
          <li>• Recordatorios automáticos por correo y SMS.</li>
          <li>• Integración con el historial clínico del paciente.</li>
        </ul>
      </article>

      <article class="rounded-3xl bg-white/5 p-6">
        <h3 class="font-display text-2xl font-semibold text-white">Consultas &gt; Historial</h3>
        <p class="mt-3 text-sm text-slate-300">
          Explora todas las atenciones anteriores filtrando por fecha, médico o especialidad. Ideal para revisar evoluciones, tratamientos y resultados de laboratorio.
        </p>
        <ul class="mt-4 space-y-2 text-sm text-slate-300">
          <li>• Descarga reportes en PDF con un clic.</li>
          <li>• Marca consultas como destacadas para seguimiento rápido.</li>
          <li>• Registra notas adicionales posteriores a la cita.</li>
        </ul>
      </article>

      <article class="rounded-3xl bg-white/5 p-6">
        <h3 class="font-display text-2xl font-semibold text-white">Administración</h3>
        <p class="mt-3 text-sm text-slate-300">
          Gestiona cuentas de usuarios administrativos y médicos. Define roles, especialidades y horarios de atención para mantener sincronizado al equipo clínico.
        </p>
        <ul class="mt-4 space-y-2 text-sm text-slate-300">
          <li>• Control de permisos para proteger la información sensible.</li>
          <li>• Historial de cambios para auditorías internas.</li>
          <li>• Directorio actualizado para canalizar pacientes rápidamente.</li>
        </ul>
      </article>
    </section>

    <section class="rounded-3xl bg-slate-900/80 p-8 shadow-2xl shadow-black/30 ring-1 ring-white/10">
      <h3 class="font-display text-2xl font-semibold text-white">¿Sigues con dudas?</h3>
      <div class="mt-4 space-y-3 text-sm text-slate-300">
        <p>• Consulta el tutorial completo del portal desde la página principal en el apartado &quot;Tutorial&quot;.</p>
        <p>• Envía un correo a <a class="text-brand-200 underline transition hover:text-brand-100" href="mailto:soporte@clinicaaurora.mx">soporte@clinicaaurora.mx</a> para recibir asistencia personalizada.</p>
        <p>• Programa una videollamada con el equipo de onboarding para capacitar a nuevos colaboradores.</p>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts"></script>
