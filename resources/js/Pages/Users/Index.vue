<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head, Link, router } from '@inertiajs/vue3';
import { can } from '@/lib/can';

const breadcrumbs: BreadcrumbItem[] = [
  {
    title: 'Users',
    href: '/users',
  },
];

defineProps({
  users: Array,
});

function deleteUser(id: number) {
  if (confirm('Are you sure you want to delete this user?')) {
    router.delete(`/users/${id}`);
  }
}

// Helper function to display roles nicely (show first 2, then +X more)
function formatRoles(roles: any[]) {
  if (!roles || roles.length === 0) return { display: [], tooltip: '' };
  const maxDisplay = 2;
  const display = roles.slice(0, maxDisplay);
  const remaining = roles.length - maxDisplay;
  const tooltip = remaining > 0 ? roles.map(r => r.name).join(', ') : '';
  return { display, remaining, tooltip };
}
</script>

<template>
  <Head title="Users" />

  <AppLayout :breadcrumbs="breadcrumbs">
    <div class="p-3">
      <h1 class="text-2xl font-bold mb-4">Users</h1>
      <Link
        v-if="can('users.create')"
        href="/users/create"
        class="mb-4 inline-block px-4 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300"
      >
        Create
      </Link>

      <!-- Responsive Table Container -->
      <div class="overflow-x-auto mt-4">
        <table class="w-full text-sm text-left text-gray-700 min-w-[600px]">
          <thead class="text-xs uppercase bg-gray-50 text-gray-700">
            <tr>
              <th scope="col" class="px-6 py-3 min-w-[50px]">ID</th>
              <th scope="col" class="px-6 py-3 min-w-[150px]">Name</th>
              <th scope="col" class="px-6 py-3 min-w-[200px]">Email</th>
              <th scope="col" class="px-6 py-3 min-w-[200px]">Roles</th>
              <th scope="col" class="px-6 py-3 min-w-[200px]">Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in users" :key="user.id" class="odd:bg-white even:bg-gray-50 border-b border-gray-200">
              <td class="px-6 py-2 font-medium text-gray-900">{{ user.id }}</td>
              <td class="px-6 py-2 text-gray-700">{{ user.name }}</td>
              <td class="px-6 py-2 text-gray-700">{{ user.email }}</td>
              <td class="px-6 py-2 text-gray-700">
                <div class="flex flex-wrap gap-1 items-center">
                  <span
                    v-for="role in formatRoles(user.roles).display"
                    :key="role.id"
                    class="bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded dark:bg-green-900 dark:text-green-300"
                  >
                    {{ role.name }}
                  </span>
                  <span
                    v-if="formatRoles(user.roles).remaining > 0"
                    class="text-xs text-gray-500 cursor-pointer"
                    :title="formatRoles(user.roles).tooltip"
                  >
                    +{{ formatRoles(user.roles).remaining }} more
                  </span>
                </div>
                <div v-if="!user.roles || user.roles.length === 0" class="text-gray-500 text-xs">No roles</div>
              </td>
              <td class="px-6 py-2 space-x-1">
                <Link
                  v-if="can('users.edit')"
                  :href="`/users/${user.id}/edit`"
                  class="inline-block px-3 py-2 text-xs font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300"
                >
                  Edit
                </Link>
                <Link
                  v-if="can('users.view')"
                  :href="`/users/${user.id}`"
                  class="inline-block px-3 py-2 text-xs font-medium text-white bg-green-700 rounded-lg hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300"
                >
                  Show
                </Link>
                <button
                  v-if="can('users.delete')"
                  @click="deleteUser(user.id)"
                  class="inline-block px-3 py-2 text-xs font-medium text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300"
                >
                  Delete
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- No Users Message -->
      <div v-if="!users || users.length === 0" class="mt-4 text-center text-gray-500">
        No users found.
      </div>
    </div>
  </AppLayout>
</template>