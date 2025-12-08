<script setup>
import { reactive, ref, onMounted, inject } from 'vue';
import { Head, Link, router, useForm, usePage } from '@inertiajs/vue3';
// import AppLayout from '@/Layouts/AppLayout.vue';
import Layout from '@/Layouts/AuthenticatedLayout.vue';
import SubHeader from '@/Layouts/SubHeader.vue';
import Datatable from '@/Components/Datatable.vue';
import Select from '@/Components/Select.vue';
import moment from 'moment';
import Modal from '@/Components/Modal.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import Button from '@/Components/Button.vue';
import Input from '@/Components/Input.vue';
import Swal from 'sweetalert2';

const columns = ref([
    { name: "Name", sort: "name" },
    { name: "Email", sort: "email" },
    { name: "Role", sort: "role" },
    { name: "Member Since", sort: "created_at" },
    { name: "" }
]);

const roles = ref(usePage().props.roles);
const permission = reactive(usePage().props.can);
const datatable = ref(null);

const form = useForm({
    show: false,
    name: null,
    email: null,
    role: null,
})

const openModal = () => {
    form.show = true;
};

const closeModal = () => {
    form.reset();
};

const addUser = () => {
    form.post(route('user.create'), {
        onSuccess: (page) => {
            form.reset();
            datatable.value.reloadDataListing();
        },
    });
};

const removeUser = (id) => {
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
            form.delete(route('user.destroy', id), {
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
    <Head title="User" />

    <Layout title="User">
        <SubHeader menu="User">
            
            <div class="pt-4 pb-12">
                <div class="max-w-8xl mx-auto sm:px-6 lg:px-8">
                    <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg">
                        <Datatable ref="datatable" api-url="user.filter" :columns="columns"
                            :enable-create="permission['create.user']" @on-create="openModal" sort-by="created_at">
                            <template #data="user">
                                <td scope="row" class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white">
                                    {{ user.name }}
                                </td>
                                <td scope="row" class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white">
                                    {{ user.email }}
                                </td>
                                <td scope="row" class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white">
                                    {{ user.roles.map(x => x.description).join(", ") }}
                                </td>
                                <td scope="row" class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white">
                                    {{ moment(user.created_at).format('Do MMMM YYYY') }}
                                </td>
                                <td scope="row" class="p-2 font-normal text-gray-900 whitespace-nowrap dark:text-white w-0">
                                    <Link :href="route('profile.edit', user.id)" class="cursor-pointer transition-all bg-blue-500 text-white text-sm px-5 py-2 rounded-lg
                                        border-blue-600 border-b-[4px] hover:brightness-110 hover:-translate-y-[1px] 
                                        active:border-b-[2px] active:brightness-90 active:translate-y-[2px] me-2">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </Link>
                                    <button v-if="permission['delete.user']" type="button" @click="removeUser(user.id)"
                                        :disabled="form.processing" class="cursor-pointer transition-all bg-red-500 text-white text-sm px-5 py-2 rounded-lg
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
    </Layout>

    <Modal :show="form.show" @close="closeModal">
        <template #title>
            Add New User
        </template>

        <template #content>
            <InputLabel for="name" value="Name" />
            <Input id="name" v-model="form.name" type="text" class="mt-1 block w-full" required />
            <InputError :message="form.errors.name" class="mt-2" />

            <InputLabel for="email" value="Email" class="mt-2" />
            <Input id="email" v-model="form.email" type="email" class="mt-1 block w-full" required />
            <InputError :message="form.errors.email" class="mt-2" />

            <InputLabel for="role" value="Role" class="mt-2" />
            <Select class="mt-1" :options="roles" v-model="form.role"
                :get-option-label="option => option.description" :reduce="option => option.id">
                <template #search="{ attributes, events }">
                    <input class="vs__search" :required="!form.role" v-bind="attributes" v-on="events" />
                </template>
            </Select>
            <InputError :message="form.errors.role" class="mt-2" />

            <div class="flex flex-row items-center justify-end gap-x-2 mt-4">
            </div>
        </template>
        <template #footer>
            <Button :color="'secondary'" @click="closeModal">
                Cancel
            </Button>
            <Button :class="{ 'opacity-25': form.processing }" :disabled="form.processing" @click="addUser">
                Submit
            </Button>
        </template>
    </Modal>
</template>
