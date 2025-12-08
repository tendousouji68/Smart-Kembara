<script setup>
import { reactive, ref, inject, watch, onMounted, computed } from 'vue';
import axios from 'axios';

const props = defineProps({
    apiUrl: {
        type: [String],
        default: null,
    },
    apiId: {
        type: [String, Number],
        default: null,
    },
    perPage: {
        type: [String, Number],
        default: 10,
    },
    columns: {
        type: [Array, Object],
        default: [],
    },
    enableCreate: {
        type: Boolean,
        default: false,
    },
    enableSearch: {
        type: Boolean,
        default: true,
    },
    sortBy: {
        type: String,
        default: 'created_at',
    },
})

let list = reactive({
    items: [],
    currentPage: 1,
    lastPage: 1,
    perPage: props.perPage,
    totalRecord: 0,
    from: 0,
    to: 0,
});

let query = reactive({
    id: props.apiId,
    paginate: props.perPage,
    page: 1,
    search: null,
    sort_direction: 'desc',
    sort_field: props.sortBy,
});

const PreviousPage = async () => {
    query.page--;
    reloadDataListing();
};

const NextPage = async () => {
    query.page++;
    reloadDataListing();
};

const searchRecord = (e) => {
    query.page = 1;
    reloadDataListing();
}

const sortColumn = (field) => {
    if (field) {
        if (query.sort_field == field) {
            query.sort_direction = query.sort_direction == 'asc' ? 'desc' : 'asc';
        } else {
            query.sort_field = field;
        }
        reloadDataListing();
    }
}

let mapPaginateData = (respond) => {
    list.items = respond.data.data
    list.currentPage = respond.data.current_page
    list.lastPage = respond.data.last_page
    list.perPage = respond.data.per_page
    list.totalRecord = respond.data.total
    list.from = respond.data.from ?? 0
    list.to = respond.data.to ?? 0

    query.paginate = respond.data.per_page
    query.page = respond.data.current_page
}

const reloadDataListing = async () => {
    await axios.post(route(props.apiUrl), query).then(response => {
        mapPaginateData(response);
    });
}

const emit = defineEmits(['onCreate'])

onMounted(async () => {
    reloadDataListing();
});

defineExpose({ reloadDataListing, mapPaginateData })

</script>
<template>
    <section>
        <div class="relative overflow-hidden bg-white shadow border dark:border-gray-700 dark:bg-gray-800 rounded-lg px-0">
            <div class="flex flex-col px-4 py-3 space-y-3 sm:flex-row sm:items-center sm:justify-between sm:space-y-0 sm:space-x-4">
                <div v-if="enableSearch" class="flex items-center flex-1 space-x-4">
                    <div class="relative w-full">
                        <div class="absolute inset-y-0 start-0 flex items-center ps-3.5 pointer-events-none">
                            <i class="fas fa-search dark:text-gray-300"></i>
                        </div>
                        <input type="text" v-model="query.search" @keyup="searchRecord"
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full sm:w-80 ps-10 px-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-gray-300 dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="Search here...">
                    </div>
                </div>
                <div v-if="enableCreate"
                    class="flex flex-col flex-shrink-0 space-y-3 md:flex-row md:items-center lg:justify-end md:space-y-0 md:space-x-3">
                    <button @click="emit('onCreate')" type="button"
                        class="flex items-center justify-center flex-shrink-0 px-3 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
                        <i class="fas fa-plus mr-2"></i>
                        New
                    </button>
                </div>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="p-4 text-center">
                                No.
                            </th>
                            <th v-for="column in columns" scope="col" class="px-4 py-3 text-nowrap">
                                <a class="mr-1" href="#" @click.prevent="sortColumn(column.sort)">{{ column.name
                                    }}</a>
                                <i v-if="query.sort_field == column.sort && query.sort_direction == 'desc'"
                                    class="fas fa-sort-up"></i>
                                <i v-if="query.sort_field == column.sort && query.sort_direction == 'asc'"
                                    class="fas fa-sort-down"></i>
                                <!-- <i v-if="column.sort" class="fa-solid fa-sort"></i> -->
                            </th>
                        </tr>
                    </thead>
                    <tbody v-if="list.items.length > 0">
                        <tr v-for="(item, index) in list.items" :key="item.id"
                            class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                            <td scope="row"
                                class="px-4 py-4 font-normal text-gray-900 whitespace-nowrap dark:text-gray-300 text-center">
                                {{ index + (query.paginate * (list.currentPage - 1)) + 1 }}
                            </td>
                            <slot name="data" v-bind="item"></slot>
                        </tr>
                    </tbody>
                    <tbody v-else>
                        <tr
                            class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                            <td :colspan="99" class="h-12 text-center">
                                <div class="w-full p-4 flex flex-col gap-4 items-center">
                                    <div class="w-full p-4 text-sm text-gray-800 rounded-xl bg-gray-100 dark:bg-gray-700 dark:text-gray-300"
                                        role="alert">
                                        <span class="font-medium">No record found</span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="flex flex-col justify-between p-4 space-y-3 sm:flex-row sm:items-center sm:space-y-0">
                <div
                    class="flex flex-row items-center justify-center gap-x-2 text-sm font-normal text-gray-500 dark:text-gray-400">
                    <span class="font-semibold text-black dark:text-gray-300">Row per page</span>
                    <select @change.prevent="searchRecord" v-model="query.paginate"
                        class="h-9 text-sm text-gray-500 bg-gray-50 border rounded-lg border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-700 dark:border-gray-500 dark:text-gray-300 dark:hover:bg-gray-700 dark:hover:text-gray-400">
                        <option v-for="val in [5, 10, 25, 50, 100]" :value="val" :key="val">{{ val }}</option>
                    </select>
                    <div>
                        <span class="font-semibold text-gray-900 dark:text-gray-300">{{ list.from }} - {{ list.to
                            }}</span>
                        <span> of </span>
                        <span class="font-semibold text-gray-900 dark:text-gray-300">{{ list.totalRecord }}</span>
                    </div>
                </div>
                <div class="flex flex-row items-center justify-center">
                    <div>
                        <button @click="PreviousPage" :disabled="list.currentPage == 1"
                            class="flex items-center justify-center h-full py-2 px-3 ml-0 text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                            <i class="fas fa-chevron-left"></i>
                        </button>
                    </div>
                    <div
                        class="flex flex-row items-center px-4 py-1.5 border border-gray-300 dark:border-gray-700 text-sm font-semibold dark:text-gray-400">
                        {{ list.currentPage }} / {{ list.lastPage }}
                    </div>
                    <div>
                        <button @click="NextPage" :disabled="list.currentPage >= list.lastPage"
                            class="flex items-center justify-center h-full py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                            <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </section>
</template>
