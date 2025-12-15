<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head, useForm } from '@inertiajs/vue3';

const props = defineProps({
  package: Object,
});

// Initialize the form with the package data
const form = useForm({
  id: props.package.id,
  nama: props.package.nama,
  PackageCode: props.package.PackageCode,
  PackageStatus: props.package.PackageStatus,
  subpackages: props.package.subpackages.map((subpackage: any) => ({
    id: subpackage.id,
    name: subpackage.name,
    deleted: false,
  })),
});

// Add a new subpackage field
const addSubpackage = () => {
  form.subpackages.push({ name: '', deleted: false });
};

// Mark a subpackage as deleted
const removeSubpackage = (index: number) => {
  form.subpackages[index].deleted = true;
};

// Handle form submission
const submit = () => {
  // Filter out deleted subpackages before submitting
  const subpackagesToSubmit = form.subpackages.filter(subpackage => !subpackage.deleted);
  form.subpackages = subpackagesToSubmit;

  // Submit the form to update the package and subpackages
  form.put(`/packages/${form.id}`, {
    onFinish: () => {
      form.reset();
    },
  });
};
</script>

<template>
  <Head title="Edit Package" />

  <AppLayout>
    <div class="p-6">
      <h1 class="text-2xl font-bold mb-4">Edit Package</h1>

      <form @submit.prevent="submit" class="space-y-4">
        <!-- Package Name -->
        <div>
          <label for="nama" class="block text-sm font-medium text-gray-700">Package Name</label>
          <input
            type="text"
            id="nama"
            v-model="form.nama"
            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            :class="{'border-red-500': form.errors.nama}"
          />
          <span v-if="form.errors.nama" class="text-sm text-red-500">{{ form.errors.nama }}</span>
        </div>

        <!-- Package Code -->
        <div>
          <label for="PackageCode" class="block text-sm font-medium text-gray-700">Package Code</label>
          <input
            type="text"
            id="PackageCode"
            v-model="form.PackageCode"
            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        <!-- Package Status -->
        <div>
          <label for="PackageStatus" class="block text-sm font-medium text-gray-700">Package Status</label>
          <select
            id="PackageStatus"
            v-model="form.PackageStatus"
            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option :value="true">Active</option>
            <option :value="false">Inactive</option>
          </select>
        </div>

        <!-- Subpackages -->
        <div>
          <label class="block text-sm font-medium text-gray-700">Subpackages</label>
          <div v-for="(subpackage, index) in form.subpackages" :key="index" class="space-y-2">
            <div class="flex space-x-2">
              <input
                type="text"
                v-model="subpackage.name"
                class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                placeholder="Subpackage Name"
              />
              <button
                type="button"
                @click="removeSubpackage(index)"
                class="bg-red-600 text-white rounded px-4 py-2 text-xs"
              >
                Remove
              </button>
            </div>
            <span v-if="form.errors.subpackages && form.errors.subpackages[index]?.name" class="text-sm text-red-500">{{ form.errors.subpackages[index]?.name }}</span>
          </div>
          <button
            type="button"
            @click="addSubpackage"
            class="mt-2 px-4 py-2 text-xs font-medium text-white bg-blue-700 rounded-md hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300"
          >
            Add Subpackage
          </button>
        </div>

        <!-- Submit Button -->
        <div>
          <button
            type="submit"
            class="px-6 py-2 text-white bg-blue-700 rounded-md hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300"
          >
            Update Package
          </button>
        </div>
      </form>
    </div>
  </AppLayout>
</template>
