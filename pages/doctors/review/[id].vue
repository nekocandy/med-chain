<script setup lang="ts">
import * as fcl from '@onflow/fcl'
import GET_REVIEWS from '~/cadence/scripts/doctors/getReviews.cdc?raw'
import ADD_REVIEW from '~/cadence/transactions/doctors/addReview.cdc?raw'
import { getCurrentUser } from '~/utils/flow'

const route = useRoute()
const doctorId = route.params.id

const isSavingOnChain = ref(false)
const isLoading = ref(true)
const reviews = ref([])
const inputReview = ref('')

async function getReviews() {
  isLoading.value = true
  const data = await fcl.query({
    cadence: GET_REVIEWS,
  })

  reviews.value = data
  consola.info('requests', reviews.value)
  isLoading.value = false
}

async function onSubmit() {
  if (!inputReview.value) {
    push.error('Please enter a review')
    return
  }

  const requestPromise = push.promise('Storing doctor review on the FLOW chain database')
  isSavingOnChain.value = true

  consola.info({
    inputReview: inputReview.value,
    doctorId,
    userData: userData.value?.addr,
    ADD_REVIEW,
  })

  const txnId = await fcl.mutate({
    cadence: ADD_REVIEW,
    // @ts-expect-error no typings
    args: (arg, t) => [
      arg(doctorId, t.String),
      arg(inputReview.value, t.String),
      arg(userData.value?.addr, t.Address),
    ],
  })

  consola.info('txnId', txnId)

  TransactionModals.value.push({
    title: 'Storing doctor review to FLOW Chain',
    transactionId: txnId,
  })

  await fcl.tx(txnId).onceSealed()
  requestPromise.resolve('Review has been saved on FLOW Blockchain successfully')

  inputReview.value = ''
  isSavingOnChain.value = false
}

onMounted(() => {
  getCurrentUser()

  getReviews()
})
</script>

<template>
  <div>
    <Heading title="Review" />

    <div v-if="isLoading">
      Loading <div loading />
    </div>

    <div v-else>
      <!-- add a form for taking input for the review, style using tailwind -->
      <form class="w-full mx-auto mt-10" @submit.prevent="onSubmit">
        <div class="mb-4">
          <label for="doctorId" class="block text-sm font-medium text-gray-700">Doctor ID</label>
          <input id="doctorId" v-model="doctorId" disabled type="text" name="doctorId" class="mt-1 p-2 block w-full border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
        </div>

        <div class="mb-4">
          <label for="inputReview" class="block text-sm font-medium text-gray-700">Review</label>
          <textarea id="inputReview" v-model="inputReview" type="text" name="inputReview" class="mt-1 p-2 block w-full border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" />
        </div>

        <button type="submit" class="w-full bg-teal-500 hover:bg-teal-700 text-white font-bold py-2 px-4 rounded" fjic w-full>
          <div v-if="!isSavingOnChain">
            Save review to FLOW CHain
          </div>
          <div v-else>
            <div loading w-6 h-6 />
          </div>
        </button>

        <span class="inline-block pt-2 text-lg">(This shall add the data to FLOW Blockchain, which means it can't be manipulated)</span>
      </form>
    </div>
  </div>
</template>

<style scoped>

</style>
