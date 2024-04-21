<script setup lang="ts">
defineProps<{
  title: string
}>()
</script>

<template>
  <div>
    <h1 class="text-2xl font-bold">
      {{ $props.title }}
    </h1>
  </div>
</template>

<style scoped>

</style>
