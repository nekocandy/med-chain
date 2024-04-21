<script setup lang="ts">
const CARDS = [
  {
    title: 'Add Medicine',
    href: '/medicines/add',
  },
  {
    title: 'View Medicines',
    href: '/medicines',
  },
  {
    title: 'Create bills',
    href: '/bills/create',
  },
]
</script>

<template>
  <div grid grid-cols-3 gap-12>
    <HomeCard v-for="card in CARDS" :key="card.title" :title="card.title" :href="card.href" />
  </div>
</template>

<style scoped>

</style>
