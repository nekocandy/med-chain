<script setup lang="ts">
defineProps<{
  review: DoctorReviewData
}>()
</script>

<template>
  <div fc border-2 border-black rounded-md py-4 px-6 gap-6>
    <div>
      {{ review.doctor }}
    </div>

    <div>
      {{ review.review }}
    </div>

    <div flex items-center justify-between>
      <span>{{ review.reviewer }}</span>

      {{ dayjs.unix(parseInt(review.time)).format('YYYY-MM-DD HH:mm:ss') }}
    </div>
  </div>
</template>

<style scoped>

</style>
