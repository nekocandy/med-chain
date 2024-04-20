<script setup lang="ts">

</script>

<template>
  <div flex gap-4 h-screen py-8 px-8 bg-stone-200 text-stone-900 font-sans>
    <main flex-1 px-4 overflow-y-auto>
      <slot />
    </main>

    <nav>
      <Navbar />
    </nav>
  </div>
</template>

<style scoped>

</style>
