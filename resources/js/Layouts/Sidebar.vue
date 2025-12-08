<script setup>
import { reactive, watchEffect } from 'vue';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import { Link, usePage } from '@inertiajs/vue3';

const dropdown = reactive({
    admin: false,
    menu: false
})

watchEffect(() => {
    if (route().current('user') || route().current('role')) {
        dropdown.admin = true
    }
})

const permission = reactive(usePage().props.can);
</script>
<template>
    <aside id="sidebar-multi-level-sidebar"
    class="fixed top-0 left-0 z-40 w-64 shadow-md h-screen transition-transform sm:translate-x-0"
    :class="{ '-translate-x-full': !dropdown.menu }">
        <div class="h-full mt-16 px-3 py-4 overflow-y-auto bg-white dark:bg-gray-800">
            <div class="flex mb-5 sm:hidden">
                <!-- Logo -->
                <div class="shrink-0 flex items-center">
                    <Link :href="route('dashboard')">
                    <ApplicationLogo class="block h-9 w-auto fill-current text-gray-800 dark:text-gray-200" />
                    </Link>
                </div>
            </div>
            <ul class="space-y-2 font-medium">
                <li>
                    <Link :href="route('dashboard')"
                        class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group"
                        :class="{ 'bg-gray-200 dark:bg-gray-600': route().current('dashboard') }">
                        <i class="fa-solid fa-chart-line"></i>
                    <span class="ms-3">Dashboard</span>
                    </Link>
                </li>
                <li>
                    <Link :href="route('component')"
                        class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group"
                        :class="{ 'bg-gray-200 dark:bg-gray-600': route().current('component') }">
                        <i class="fa-solid fa-screwdriver-wrench"></i>
                    <span class="ms-3">Component</span>
                    </Link>
                </li>
                <li v-if="permission['view.admin']">
                    <button type="button" @click="dropdown.admin = !dropdown.admin"
                        class="flex items-center w-full p-2 text-base text-gray-900 transition duration-75 rounded-lg group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
                        <i class="fa-solid fa-user-tie"></i>
                        <span
                            class="flex-1 ms-3 text-left rtl:text-right whitespace-nowrap">Administration</span>
                        <i v-if="dropdown.admin" class="fa-solid fa-angle-up"></i>
                        <i v-else class="fa-solid fa-angle-down"></i>
                    </button>
                    <ul v-if="dropdown.admin" class="py-2 space-y-2">
                        <li v-if="permission['view.user']">
                            <Link :href="route('user')"
                                class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"
                                :class="{ 'bg-gray-200 dark:bg-gray-600': route().current('user') }">
                            User
                            </Link>
                        </li>
                        <li v-if="permission['view.role']">
                            <Link :href="route('role')"
                                class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"
                                :class="{ 'bg-gray-200 dark:bg-gray-600': route().current('role') }">
                            Role
                            </Link>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </aside>
</template>