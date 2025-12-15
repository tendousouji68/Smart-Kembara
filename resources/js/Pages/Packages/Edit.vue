<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head, useForm } from '@inertiajs/vue3';
import { can } from '@/lib/can';
import { ref } from 'vue';

// Define interfaces for type safety
interface Subpackage {
  id?: number; // Optional for new subpackages
  name: string;
  deleted?: boolean; // Flag for marking deletion
}

interface Package {
  id: number;
  nama: string;
  PackageCode: string | null;
  PackageStatus: boolean;
  subpackages: Subpackage[];
}

// Props (keep as 'package' to match Inertia data key, then destructure to 'pkg')
const props = defineProps<{
  package: Package;
}>();

// Destructure to rename 'package' to 'pkg' (avoids reserved word issues)
const { package: pkg } = props;

// Breadcrumbs
const breadcrumbs: BreadcrumbItem[] = [
  {
    title: 'Packages',
    href: '/packages',
  },
  {
    title: 'Edit Package',
    href: `/packages/${pkg.id}/edit`,
  },
];

// Form setup using Inertia's useForm
const form = useForm({
  nama: pkg.nama,
  PackageCode: pkg.PackageCode || '',
  PackageStatus: pkg.PackageStatus,
  subpackages: pkg.subpackages.map(sub => ({ ...sub, deleted: false })), // Clone and add deleted flag
});

// Methods for managing subpackages
const addSubpackage = () => {
  form.subpackages.push({ name: '', deleted: false });
};

const removeSubpackage = (index: number) => {
  const subpackage = form.subpackages[index];
  if (subpackage.id) {
    // Mark existing subpackage for deletion
    subpackage.deleted = true;
  } else {
    // Remove new subpackage entirely
    form.subpackages.splice(index, 1);
  }
};

// Submit handler
const submit = () => {
  form.put(`/packages/${pkg.id}`, {
    onSuccess: () => {
      // Optional: Handle success (e.g., redirect or show message)
    },
    onError: () => {
      // Errors are handled automatically by Inertia
    },
  });
};
</script>

<template>
  <Head title="Edit Package" />

  <AppLayout :breadcrumbs="breadcrumbs">
    <div class="p-3 max-w-4xl mx-auto">
      <h1 class="text-2xl font-bold mb-4">Edit Package</h1>

      <!-- Form -->
      <form @submit.prevent="submit" class="space-y-6">
        <!-- Package Name -->
        <div>
          <label for="nama" class="block text-sm font-medium text-gray-700">Package Name</label>
          <input
            id="nama"
            v-model="form.nama"
            type="text"
            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
            required
          />
          <div v-if="form.errors.nama" class="mt-1 text-sm text-red-600">{{ form.errors.nama }}</div>
        </div>

        <!-- Package Code -->
        <div>
          <label for="PackageCode" class="block text-sm font-medium text-gray-700">Package Code</label>
          <input
            id="PackageCode"
            v-model="form.PackageCode"
            type="text"
            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
          />
          <div v-if="form.errors.PackageCode" class="mt-1 text-sm text-red-600">{{ form.errors.PackageCode }}</div>
        </div>

        <!-- Package Status -->
        <div>
          <label class="block text-sm font-medium text-gray-700">Package Status</label>
          <div class="mt-1 flex items-center space-x-4">
            <label class="flex items-center">
              <input
                v-model="form.PackageStatus"
                type="radio"
                :value="true"
                class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300"
              />
              <span class="ml-2 text-sm text-gray-700">Active</span>
            </label>
            <label class="flex items-center">
              <input
                v-model="form.PackageStatus"
                type="radio"
                :value="false"
                class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300"
              />
              <span class="ml-2 text-sm text-gray-700">Inactive</span>
            </label>
          </div>
          <div v-if="form.errors.PackageStatus" class="mt-1 text-sm text-red-600">{{ form.errors.PackageStatus }}</div>
        </div>

        <!-- Subpackages Section -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">Subpackages</label>
          <div v-for="(subpackage, index) in form.subpackages" :key="index" class="mb-4 p-4 border border-gray-200 rounded-md">
            <div v-if="!subpackage.deleted" class="flex items-center space-x-4">
              <input
                v-model="subpackage.name"
                type="text"
                placeholder="Subpackage Name"
                class="flex-1 px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                required
              />
              <button
                type="button"
                @click="removeSubpackage(index)"
                class="px-3 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
              >
                Remove
              </button>
            </div>
            <div v-else class="text-sm text-gray-500 italic">
              This subpackage will be deleted upon save.
            </div>
          </div>
          <button
            type="button"
            @click="addSubpackage"
            class="px-4 py-2 text-sm font-medium text-white bg-green-600 rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500"
          >
            Add Subpackage
          </button>
          <div v-if="form.errors['subpackages']" class="mt-1 text-sm text-red-600">{{ form.errors['subpackages'] }}</div>
        </div>

        <!-- Submit Button -->
        <div class="flex justify-end space-x-4">
          <Link
            href="/packages"
            class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-200 rounded-md hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500"
          >
            Cancel
          </Link>
          <button
            type="submit"
            :disabled="form.processing"
            class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 disabled:opacity-50"
          >
            {{ form.processing ? 'Updating...' : 'Update Package' }}
          </button>
        </div>
      </form>
    </div>
  </AppLayout>
</template>