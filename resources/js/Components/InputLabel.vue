<script setup>
defineProps({
    value: {
        type: String,
    },
    color: {
        type: String,
    }
});
</script>

<template>
    <label :class="['block mb-2 text-sm font-medium text-gray-600 dark:text-gray-300',
        {
            'text-green-600 dark:text-green-500': color === 'success',
            'text-blue-600 dark:text-blue-500': color === 'info',
            'text-yellow-600 dark:text-yellow-500': color === 'warning',
            'text-red-600 dark:text-red-500': color === 'danger',
        }
    ]">
        <span v-if="value">{{ value }}</span>
        <span v-else><slot /></span>
    </label>
</template>
