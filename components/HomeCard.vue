<script setup lang="ts">
defineProps<{
  title: string
  href: string
}>()
</script>

<template>
  <NuxtLink :href="href" px-8 py-12 bg-teal-400 fjic rounded-lg hover:bg-opacity-70>
    {{ title }}
  </NuxtLink>
</template>

<style scoped>

</style>
