<script setup lang="ts">
import { QrcodeStream } from 'vue-qrcode-reader'

const selectedDevice = ref(null)
const devices = ref([])

function onDetect() {
  // Patched via dependency, the data is sent to the server.
}

onMounted(async () => {
  // ask for camera permission.
  await navigator.mediaDevices.getUserMedia({ video: true })

  // @ts-expect-error navigator is not defined in the types.
  devices.value = (await navigator.mediaDevices.enumerateDevices()).filter(
    ({ kind }) => kind === 'videoinput',
  )

  if (devices.value.length > 0)
    selectedDevice.value = devices.value[0]
})
</script>

<template>
  <div>
    <QrcodeStream h-screen @detect="onDetect" />
  </div>
</template>

<style scoped>

</style>
