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
    title: 'Mobile Scan Medicines QR Code',
    href: '/medicines/scan',
  },
  {
    title: 'Medicine Realtime Scan Monitor',
    href: '/medicines/scan-monitor',
  },
  {
    title: 'Create bills',
    href: '/bills/create',
  },
  {
    title: 'Register Doctor',
    href: '/doctors/register',
  },
  {
    title: 'View Doctors',
    href: '/doctors',
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
