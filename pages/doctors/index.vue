<script setup lang="ts">
import * as fcl from '@onflow/fcl'
import GET_DOCTORS from '~/cadence/scripts/doctors/getDoctors.cdc?raw'
import { getCurrentUser } from '~/utils/flow'
import type { IDoctor } from '~/utils/types'

const isLoading = ref(true)
const doctors = ref<IDoctor[]>()

async function getDoctors() {
  isLoading.value = true
  const data = await fcl.query({
    cadence: GET_DOCTORS,
  })

  if (data.length)
    doctors.value = data

  consola.info('requests', doctors.value)
  isLoading.value = false
}

onMounted(async () => {
  getCurrentUser()

  getDoctors()
})
</script>

<template>
  <div fc gap-8>
    <Heading title="Doctors" />

    <div flex items-center>
      <NuxtLink href="/doctors/register" class="px-4 py-2 border-2 bg-teal-600 text-white rounded-md">
        Register Doctor
      </NuxtLink>
    </div>

    <div grid grid-cols-3 gap-4>
      <DoctorCard v-for="doctor in doctors" :key="doctor.doctor_id" :doctor="doctor" />
    </div>
  </div>
</template>

<style scoped>

</style>
