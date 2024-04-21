<script setup lang="ts">
import * as fcl from '@onflow/fcl'
import GET_BILLS from '~/cadence/scripts/bills/getBills.cdc?raw'
import { getCurrentUser } from '~/utils/flow'

const route = useRoute()
const billId = route.params.id as string

const isLoading = ref(true)
const billData = ref<BillData | null>(null)

async function getBills() {
  isLoading.value = true
  const data = await fcl.query({
    cadence: GET_BILLS,
  })

  if (data[billId])
    billData.value = data[billId]

  isLoading.value = false
}

onMounted(async () => {
  getCurrentUser()

  getBills()
})
</script>

<template>
  <div fc gap-6>
    <Heading title="Bill Details" />
    <span bg-yellow-900 w-fit px-4 py-2 text-white rounded-md text-lg>Data fetched from FLOW Blockchain!</span>

    <div v-if="isLoading">
      Loading...
    </div>
    <div v-else>
      <div v-if="billData" flex flex-col gap-4 text-2xl font-mono>
        <div flex items-center>
          <span font-bold>Bill ID: </span>
          <span>{{ billData.bill_id }}</span>
        </div>

        <div flex items-center>
          <span font-bold>Patient Name: </span>
          <span>{{ billData.bill_name }}</span>
        </div>

        <div flex items-center>
          <span font-bold>Amount: </span>
          <span>{{ billData.amount }}</span>
        </div>

        <div flex items-center>
          <span font-bold>Expense: </span>
          <span>{{ billData.expense }}</span>
        </div>

        <div flex items-center>
          <span font-bold>Status: </span>
          <span> {{ billData.paid ? "Paid" : "Unpaid" }} </span>
        </div>

        <div v-if="!billData.paid">
          <button bg-teal-600 px-4 py-2 rounded-md text-white>
            Pay Bill with FLOW Tokens
          </button>
        </div>
      </div>

      <div v-else>
        No bill found
      </div>
    </div>
  </div>
</template>

<style scoped>

</style>
