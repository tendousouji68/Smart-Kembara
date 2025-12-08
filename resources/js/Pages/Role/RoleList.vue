<script setup>
import { reactive, ref, onMounted, inject } from 'vue';
import { Head, Link, router, useForm, usePage } from '@inertiajs/vue3';
// import AppLayout from '@/Layouts/AppLayout.vue';
import Layout from '@/Layouts/AuthenticatedLayout.vue';
import SubHeader from '@/Layouts/SubHeader.vue';
import Datatable from '@/Components/Datatable.vue';
import moment from 'moment';
import Swal from 'sweetalert2';
import Modal from '@/Components/Modal.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import Button from '@/Components/Button.vue';
import Input from '@/Components/Input.vue';

const columns = ref([
    { name: "Name", sort: "description" },
    { name: "Slug", sort: "name" },
    { name: "No Of User", sort: "" },
    { name: "" },
]);

const datatable = ref(null);
const permission = reactive(usePage().props.can);

const form = useForm({
    show: false,
    name: null,
})

const openModal = () => {
    form.show = true;
};

const closeModal = () => {
    form.reset();
};

const addRole = () => {
    form.post(route('role.create'), {
        onSuccess: () => {
            form.reset();
            datatable.value.reloadDataListing();
        },
    });
};

const removeRole = (id) => {
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            form.delete(route('role.destroy', id), {
                onSuccess: (page) => {
                    form.reset();
                    datatable.value.reloadDataListing();
                },
            });
        }
    });
};
</script>

<template>

    <Head title="Role" />

    <Layout title="Role">
        <SubHeader menu="Role">
            
            <div class="pt-4 pb-12">
                <div class="max-w-8xl mx-auto sm:px-6 lg:px-8">
                    <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg">
                        <Datatable ref="datatable" api-url="role.filter" :columns="columns"
                            :enable-create="permission['create.role']" @on-create="openModal" sort-by="created_at">
                            <template #data="role">
                                <td scope="row" class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white">
                                    {{ role.description }}
                                </td>
                                <td scope="row" class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white">
                                    {{ role.name }}
                                </td>
                                <td scope="row" class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white">
                                    {{ '-' }}
                                </td>
                                <td scope="row"
                                    class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white w-0">
                                    <!-- <Link :href="route('role.edit',role.id)">
                                        <button type="button" class="text-white bg-gradient-to-r from-blue-500 via-blue-600 to-blue-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-sm px-4 py-2 text-center me-2">
                                            View
                                        </button>
                                    </Link> -->
                                    <Link v-if="permission['edit.role']" :href="route('role.edit', role.id)">
                                    <button type="button" class="cursor-pointer transition-all bg-blue-500 text-white text-sm px-6 py-2 rounded-lg
                                    border-blue-600 border-b-[4px] hover:brightness-110 hover:-translate-y-[1px] 
                                    active:border-b-[2px] active:brightness-90 active:translate-y-[2px] me-2">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>
                                    </Link>
                                    <button v-if="permission['delete.role']" type="button" @click="removeRole(role.id)"
                                        :disabled="form.processing" class="cursor-pointer transition-all bg-red-500 text-white text-sm px-6 py-2 rounded-lg
                                    border-red-600 border-b-[4px] hover:brightness-110 hover:-translate-y-[1px] 
                                    active:border-b-[2px] active:brightness-90 active:translate-y-[2px]">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </td>
                            </template>
                        </Datatable>
                    </div>
                </div>
            </div>
        </SubHeader>

        <Modal :show="form.show" @close="closeModal">
            <template #title>
                Add New Role
            </template>

            <template #content>
                <form @submit.prevent="addRole">
                    <InputLabel for="name" value="Name" />
                    <Input id="name" v-model="form.name" type="text" class="mt-1 block w-full" required />
                    <InputError :message="form.errors.name" class="mt-2" />

                    <div class="flex flex-row items-center justify-end gap-x-2 mt-4">
                        <Button :color="'secondary'" @click="closeModal">
                            Cancel
                        </Button>
                        <Button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                            Submit
                        </Button>
                    </div>
                </form>
            </template>
        </Modal>
    </Layout>
</template>
