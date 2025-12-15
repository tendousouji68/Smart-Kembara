<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';  // Make sure Package type is defined
import { Head, Link, router } from '@inertiajs/vue3';
import { can } from '@/lib/can'; // Assuming you have a permissions system

const breadcrumbs: BreadcrumbItem[] = [
  {
    title: 'Packages',
    href: '/packages',
  },
];

// Define props for the component
defineProps({
  packages: Array as PropType<Package[]>,  // Package data passed from the controller
});

// Function to handle deleting a package
function deletePackage(id: number) {
  if (confirm('Are you sure you want to delete this package?')) {
    // Send delete request to the server
    router.delete(`/packages/${id}`, {
      onFinish: () => {
        // Optional: Trigger actions on successful deletion (e.g., reload the page or redirect)
        alert('Package deleted successfully');
      },
      onError: (error) => {
        // Handle error if delete fails
        alert('Error deleting package');
      }
    });
  }
}
</script>

<template>
  <Head title="Packages" />

  <AppLayout :breadcrumbs="breadcrumbs">

    <div class="p-3">
      <h1 class="text-2xl font-bold mb-4">Packages</h1>

      <Link 
        v-if="can('packages.create')"
        href="/packages/create"
        class="mb-4 px-4 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
        Create
      </Link>

      <div class="overflow-x-auto mt-4">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th scope="col" class="px-6 py-3">ID</th>
              <th scope="col" class="px-6 py-3">Name</th>
              <th scope="col" class="px-6 py-3">Package Code</th>
              <th scope="col" class="px-6 py-3">Package Status</th>
              <th scope="col" class="px-6 py-3">Subpackages</th>
              <th scope="col" class="px-6 py-3 w-70">Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="packageItem in packages" :key="packageItem.id" class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700 border-gray-200">
              <td class="px-6 py-2 font-medium text-gray-900 dark:text-white">{{ packageItem.id }}</td>
              <td class="px-6 py-2 text-gray-600 dark:text-gray-300">{{ packageItem.nama }}</td>
              <td class="px-6 py-2 text-gray-600 dark:text-gray-300">{{ packageItem.PackageCode }}</td>
              <td class="px-6 py-2 text-gray-600 dark:text-gray-300">
                <span v-if="packageItem.PackageStatus === 1" class="bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded">Active</span>
                <span v-else class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded">Inactive</span>
              </td>
              <!-- Display subpackages -->
              <td class="px-6 py-2 text-gray-600 dark:text-gray-300">
                <div v-if="packageItem.subpackages.length > 0">
                  <ul class="list-none ">
                    <li v-for="subpackage in packageItem.subpackages" :key="subpackage.id" class="text-xs text-gray-600 dark:text-gray-300">
                      {{ subpackage.name }} <!-- Assuming 'name' is a property of Subpackage -->
                    </li>
                  </ul>
                </div>
                <div v-else class="text-gray-500 text-xs">No subpackages</div>
              </td>
              <td class="px-6 py-2 space-x-1">
                <Link
                  v-if="can('packages.edit')" 
                  :href="`/packages/${packageItem.id}/edit`"
                  class="cursor-pointer px-3 py-2 text-xs font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                  Edit
                </Link>
                <Link 
                  v-if="can('packages.view')"
                  :href="`/packages/${packageItem.id}`"
                  class="cursor-pointer px-3 py-2 text-xs font-medium text-white bg-green-700 rounded-lg hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300">
                  Show
                </Link>
                <button 
                  v-if="can('packages.delete')"
                  @click="deletePackage(packageItem.id)"
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
