<script setup lang="ts">
defineProps<{
  doctor: IDoctor
}>()
</script>

<template>
  <div fc gap-4 p-4 border-2 rounded-md border-zinc-900>
    <div flex items-center justify-between>
      <div flex items-center gap-1>
        <span font-bold>Name:</span>
        <span>{{ doctor.name }}</span>
      </div>

      <span>{{ doctor.doctor_id }}</span>
    </div>

    <div flex gap-2 items-center>
      <span font-bold>Specialization:</span>
      <span>{{ doctor.specialty }}</span>
    </div>

    <NuxtLink :href="`/doctors/review/${doctor.doctor_id}`" self-end py-2 px-8 bg-teal-500 rounded-md text-white>
      Reviews
    </NuxtLink>
  </div>
</template>

<style scoped>

</style>
