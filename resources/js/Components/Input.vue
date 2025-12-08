<script setup>
import { onMounted, ref } from 'vue';

const props = defineProps({
    modelValue: {
        type: String,
        default: '',
    },
    showOnly: {
        type: Boolean,
        default: false,
    },
    color: {
        type: String,
        default: null,
    }
});

const emit = defineEmits(['update:modelValue']);

const input = ref(null);

onMounted(() => {
    if (input.value.hasAttribute('autofocus')) {
        input.value.focus();
    }
});

// Common base classes for all inputs
const baseClasses = 'bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full p-2.5 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 disabled:cursor-not-allowed';

// Color-specific classes
const colorClasses = {
    success: 'bg-green-50 border-green-500 text-green-900 dark:text-green-400 placeholder-green-700 dark:placeholder-green-500 focus:ring-green-500 focus:border-green-500',
    info: 'bg-blue-50 border-blue-500 text-blue-900 placeholder-blue-700 focus:ring-blue-500 dark:bg-gray-700 focus:border-blue-500 dark:text-blue-500 dark:placeholder-blue-500 dark:border-blue-500',
    warning: 'bg-yellow-50 border-yellow-500 text-yellow-900 placeholder-yellow-700 focus:ring-yellow-500 dark:bg-gray-700 focus:border-yellow-500 dark:text-yellow-500 dark:placeholder-yellow-500 dark:border-yellow-500',
    danger: 'bg-red-50 border-red-500 text-red-900 placeholder-red-700 focus:ring-red-500 dark:bg-gray-700 focus:border-red-500 dark:text-red-500 dark:placeholder-red-500 dark:border-red-500',
};
</script>

<template>
    <input
        :class="[baseClasses, colorClasses[color] || '']"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        ref="input"
    />
</template>
