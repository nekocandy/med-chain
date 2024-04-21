<script setup lang="ts">
import Pusher from 'pusher-js'

const pusherConfig = useRuntimeConfig().public.pusherConfig

const pusherChannel = new Pusher(pusherConfig.appId, {
  cluster: pusherConfig.cluster,
})

onMounted(() => {
  const channel = pusherChannel.subscribe('medicines')
  channel.bind('scan', (data: any) => {
    consola.info('Scanned', data)
  })
})
</script>

<template>
  <div />
</template>

<style scoped>

</style>
