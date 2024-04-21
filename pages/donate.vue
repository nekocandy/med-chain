<script setup lang="ts">
import * as fcl from '@onflow/fcl'
import { sendFlow } from '~/utils/flow/utils'

async function donate() {
  // eslint-disable-next-line no-alert
  const tokens = prompt('How many tokens would you like to donate?')

  if (!tokens) {
    push.error('Please enter a valid amount.')
    return
  }

  const sendingAmountPromise = push.promise('Sending FLOW Tokens...')
  const sendTransactionId = await sendFlow(
    '0x3f5080e114fa96d9',
    tokens,
  )

  TransactionModals.value.push({
    title: `Transaction for Donation`,
    transactionId: sendTransactionId,
  })

  await fcl.tx(sendTransactionId).onceSealed()
  sendingAmountPromise.resolve('Sent FLOW! Thank you for your donation')
}
</script>

<template>
  <div fc gap-6>
    <Heading title="Donate" />

    <span class="text-xl">Your donation would help someone in need.</span>

    <button bg-teal-600 text-white rounded-md w-fit px-6 py-2 font-bold text-lg @click="donate">
      Donate
    </button>
  </div>
</template>

<style scoped>

</style>
