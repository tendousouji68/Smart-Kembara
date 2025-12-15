<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head,Link, router } from '@inertiajs/vue3';
import { can } from '@/lib/can';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Roles',
        href: '/roles',
    },
];

defineProps({
  roles: Array // ada kat rolecontroller
});

function deleteUser (id){
    if (confirm("Are you sure you want to delete this role?")){
         router.delete(`/roles/${id}`);
    }
}

</script>

<template>
    <Head title="Roles" />

    <AppLayout :breadcrumbs="breadcrumbs">

    <div class="p-3">
        <h1 class="text-2xl font-bold mb-4">Roles</h1>
        <Link 
        v-if="can('roles.create')"
        href="/roles/create"
        class="mb-4 px-4 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
            Create
        </Link>
        <div class="overflow-x-auto mt-4">
            <table class="w-full text-sm text-left text-gray-700">
                <thead class="text-xs uppercase bg-gray-50 text-gray-700">
                <tr>
                    <th scope="col" class="px-6 py-3">ID</th>
                    <th scope="col" class="px-6 py-3">Name</th>
                    <th scope="col" class="px-6 py-3">Permissions</th>
                    <th scope="col" class="px-6 py-3 w-70">Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="role in roles" class="odd:bg-white even:bg-gray-50 border-b border-gray-200">
                    <td class="px-6 py-2 font-medium text-gray-900">{{role.id}}</td>
                    <td class="px-6 py-2 text-gray-700">{{role.name}}</td>
                    <td class="px-6 py-2 text-gray-700">
                        <span
                            v-for="permission in role.permissions"
                            key="1"
                            class="mr-1 bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded dark:bg-green-900 dark:text-green-300"
                        >
                            {{ permission.name }}
                        </span>
                    </td>
                    <td class="px-6 py-2 space-x-1">
                        <Link
                        v-if="can('roles.edit')" 
                            :href="`/roles/${role.id}/edit`"
                            class="cursor-pointer px-3 py-2 text-xs font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                            Edit
                        </Link>
                        <Link 
                        v-if="can('roles.view')"
                            :href="`/roles/${role.id}`"
                            class="cursor-pointer px-3 py-2 text-xs font-medium text-white bg-green-700 rounded-lg hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300">
                            Show
                        </Link>
                        <button 
                        v-if="can('roles.delete')"
                            @click="deleteUser(role.id)"
                            class="cursor-pointer px-3 py-2 text-xs font-medium text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300">
                            Delete
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
        
    </AppLayout>
</template>
