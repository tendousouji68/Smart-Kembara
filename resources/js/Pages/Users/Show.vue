<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head,Link, useForm } from '@inertiajs/vue3';
// import { route } from 'ziggy-js';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Users Show',
        href: '/users',
    },
];

const props = defineProps({
    user: Object
});

</script>

<template>
    <Head title="Users Show" />

    <AppLayout :breadcrumbs="breadcrumbs">

     <div class="overflow-x-auto p-3">
        <h1 class="text-2xl font-bold mb-4">User Detail</h1>
        <Link 
        href="/users"
        class="mb-4 px-4 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
            Back
        </Link>

        <div>
            <p><strong>Name:</strong>{{ user.name }}</p>
            <p><strong>Email:</strong>{{ user.email }}</p>
        </div>
        
    </div>
        
    </AppLayout>
</template>
