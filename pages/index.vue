<script setup lang="ts">
import FlowLogo from '~/assets/flow.svg'
import { logIn, unauthenticate } from '~/utils/flow/authentication'
</script>

<template>
  <div h-full flex="~ col" items-center justify-center gap-12>
    <div v-if="isUserLoggedIn" flex="~ col" items-center justify-center gap-6>
      <h1 text-5xl>
        Welcome back, {{ userData?.addr }}!
      </h1>

      <div flex items-center justify-center gap-6>
        <button text-xl px-12 py-4 bg-red-500 rounded-md text-white @click="unauthenticate">
          Logout
        </button>

        <NuxtLink href="/home" text-xl px-12 py-4 bg-teal-500 rounded-md text-white flex items-center gap-2>
          <div i-healthicons-agriculture />
          <span>Continue to App</span>
          <div i-material-symbols-arrow-forward-rounded />
        </NuxtLink>
      </div>
    </div>

    <div v-else flex="~ col" items-center justify-center gap-6>
      <h1 text-5xl flex items-center gap-4>
        Welcome to the app!
        <div i-healthicons-agriculture text-teal-500 />
      </h1>
      <button text-2xl px-12 py-4 bg-teal-500 rounded-md text-white @click="logIn">
        Login with <span font-bold>FLOW</span>
      </button>
    </div>

    <div bg-stone-900 bg-opacity-70 text-green rounded-md px-12 py-2 flex items-center gap-4>
      <span text-2xl font-bold>Auth & Built with</span>
      <img h-8 :src="FlowLogo" alt="Flow Logo">
    </div>
  </div>
</template>

<style scoped>

</style>
