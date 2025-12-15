<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head,Link, useForm } from '@inertiajs/vue3';
// import { route } from 'ziggy-js';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Roles Detail',
        href: '/roles',
    },
];

const props =  defineProps({
    "role": Object,
    "rolePermissions": Array,
})

</script>

<template>
    <Head title="Roles Detail" />

    <AppLayout :breadcrumbs="breadcrumbs">

     <div class="overflow-x-auto p-3">
        <h1 class="text-2xl font-bold mb-4">Edit Role</h1>
        <Link 
        href="/roles"
        class="mb-4 px-4 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
            Back
        </Link>
       
            <div>
                <p><strong>Name:</strong>{{ role.name }}</p>
                <p><strong>Permissions:</strong>
                <span
                    v-for="permission in rolePermissions"
                    key="1"
                    class="mr-1 bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded dark:bg-green-900 dark:text-green-300"
                >
                    {{ permission }}
                </span>
                </p>
            </div>
        
    </div>
        
    </AppLayout>
</template>
