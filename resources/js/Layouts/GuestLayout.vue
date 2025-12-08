<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <div class="min-h-screen flex flex-col justify-center items-center pt-6 bg-gray-100 dark:bg-gray-900">
        <div class="sm:w-full max-w-md mx-10 sm:mx-auto">
            <Link href="/">
                <ApplicationLogo class="fill-current text-gray-500" />
            </Link>

            <div class="mt-6 px-6 py-4 bg-white dark:bg-gray-800 shadow-md overflow-hidden rounded-lg">
                <slot />
            </div>
        </div>
    </div>
</template>
