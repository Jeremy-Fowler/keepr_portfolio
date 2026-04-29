<script setup lang="ts">
import { computed, useTemplateRef } from 'vue';

const { size } = defineProps({
  icon: { type: String, required: true },
  spin: { type: Boolean, default: false },
  stroke: { type: String },
  // TODO maybe compute this to find text size of ancestor?
  size: { type: [String, Number], default: 24 }
})

const svg = useTemplateRef('svg')

const fontColor = computed(() => {
  if (!svg.value) return ''
  const styles = window.getComputedStyle(svg.value)
  return styles.color
})

</script>


<template>
  <svg :class="{ spin }" ref="svg" :height="size" :width="size" viewBox="0 0 24 24">
    <path :d="icon" :stroke="stroke ? `var(--bs-${stroke})` : ''" />
  </svg>
</template>


<style scoped lang="scss">
svg {
  height: 100%
}

path {
  fill: v-bind('fontColor');
}

.spin {
  animation: spin 1s linear infinite;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }

  to {
    transform: rotate(360deg);
  }
}
</style>
