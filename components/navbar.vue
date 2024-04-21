<script setup lang="ts">
const LINKS = [
  {
    title: 'Home',
    href: '/home',
  },
  {
    title: 'Doctors',
    href: '/doctors',
  },
  {
    title: 'Donate',
    href: '/donate',
  },
]
</script>

<template>
  <div flex flex-col items-center justify-between bg-teal-500 h-full px-8 py-6 rounded-md>
    <NuxtLink href="/">
      <h1 text-2xl font-bold text-white>
        <div i-healthicons-agriculture text-6xl />
      </h1>
    </NuxtLink>

    <div fc items-center gap-4>
      <NuxtLink v-for="link in LINKS" :key="link.title" :href="link.href" text-white font-bold text-lg class="hover:underline">
        {{ link.title }}
      </NuxtLink>
    </div>

    <div />
  </div>
</template>

<style scoped>

</style>
