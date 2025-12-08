<script setup>
import {reactive, ref, onMounted, inject} from 'vue';
import { Head, Link, router, useForm, usePage } from '@inertiajs/vue3';
// import AppLayout from '@/Layouts/AppLayout.vue';
import Layout from '@/Layouts/AuthenticatedLayout.vue';
import SubHeader from '@/Layouts/SubHeader.vue';
import Datatable from '@/Components/Datatable.vue';
import moment from 'moment';
import Modal from '@/Components/Modal.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import Button from '@/Components/Button.vue';
import Input from '@/Components/Input.vue';
import SectionTitle from '@/Components/SectionTitle.vue';

const role = reactive(usePage().props.role);
const permissions = reactive(usePage().props.permission);
let checkedNames = reactive(usePage().props.checked);

const form = useForm({
    role_id: role.id,
    permission_id: null,
})

const updatePermission = (id) => {
    form.permission_id = id;
    form.post(route('role.update'));
};
</script>

<template>
    <Head title="Role Edit" />

    <Layout title="Role Edit">
        <SubHeader menu="Role" sub-menu="Role Edit" href-menu="role">
            <template #header>
                <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                    Role Edit : {{ role.description }}
                </h2>
            </template>
    
            <div class="pt-4 pb-12">
                <div class="max-w-8xl mx-auto sm:px-6 lg:px-8">
                    <div class="bg-white p-6 dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-xl">
                        <div class="flex flex-row p-4">
                            <div class="w-1/2">
                                <SectionTitle>
                                    <template #title>
                                        Role Information
                                    </template>
                                    <template #description>
                                        View and manage permission for specific roles
                                    </template>
                                </SectionTitle>
                            </div>
                            <div class="w-1/2">
                                <InputLabel for="name" value="Name"/>
                                <Input id="name" v-model="role.description" type="text" class="mt-1 block w-full" disabled/>
                            </div>
                        </div>
                        
                        <div v-for="(permission, key) in permissions" class="w-full">
                            <div class="w-full dark:text-gray-300 px-4 py-3 text-lg font-semibold">
                                {{ key }}
                                <hr class="h-px my-4 bg-gray-200 border-0 dark:bg-gray-700">
                            </div>
                            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 py-3">
                                <div v-for="(value, key) in permission" class="flex flex-row px-4 gap-x-3">
                                    <label class="relative inline-flex items-center cursor-pointer">
                                        <input type="checkbox" :value="value.id" @change="updatePermission(value.id)" v-model="checkedNames" :disabled="form.processing" class="sr-only peer">
                                        <div class="peer ring-0 bg-red-500 rounded-full outline-none duration-300 after:duration-500 w-8 h-8  shadow-md peer-checked:bg-emerald-600  peer-focus:outline-none  after:content-['N'] after:rounded-full after:absolute after:outline-none after:h-5 after:w-5 after:bg-gray-50 after:top-3 after:left-1.5 after:flex after:justify-center after:items-center peer-checked:after:content-['Y'] after:-rotate-180 peer-checked:after:rotate-0"></div>
                                    </label>
                                    <div class="flex flex-col">
                                        <p class="font-semibold dark:text-gray-300">{{ value.description }}</p>
                                        <p class="text-gray-600 italic text-sm">{{ value.name }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </SubHeader>
    </Layout>
</template>
