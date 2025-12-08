<script setup>
const props = defineProps({
    color: {
        type: String,
        default: 'primary',
    }
});

const baseClasses = 'inline-flex items-center px-4 py-2 font-semibold text-xs uppercase tracking-widest rounded-md transition ease-in-out duration-150 focus:outline-none focus:ring-2 focus:ring-offset-2';

const colorClasses = {
    primary: 'bg-gray-800 dark:bg-gray-200 text-white dark:text-gray-800 hover:bg-gray-700 dark:hover:bg-white focus:bg-gray-700 dark:focus:bg-white active:bg-gray-900 dark:active:bg-gray-300 border border-transparent focus:ring-indigo-500 dark:focus:ring-offset-gray-800',
    secondary: 'bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 border border-gray-300 dark:border-gray-500 shadow-sm hover:bg-gray-50 dark:hover:bg-gray-700 focus:ring-indigo-500 dark:focus:ring-offset-gray-800',
    info: 'bg-blue-600 text-white hover:bg-blue-500 active:bg-blue-700 border border-transparent focus:ring-blue-500 dark:focus:ring-offset-gray-800',
    success: 'bg-green-600 text-white hover:bg-green-500 active:bg-green-700 border border-transparent focus:ring-green-500 dark:focus:ring-offset-gray-800',
    warning: 'bg-yellow-500 text-white hover:bg-yellow-400 active:bg-yellow-600 border border-transparent focus:ring-yellow-500 dark:focus:ring-offset-gray-800',
    danger: 'bg-red-600 text-white hover:bg-red-500 active:bg-red-700 border border-transparent focus:ring-red-500 dark:focus:ring-offset-gray-800',
};
</script>

<template>
    <button :class="[baseClasses, colorClasses[color] || colorClasses.primary]">
        <slot />
    </button>
</template>
