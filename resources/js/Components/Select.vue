<script setup>
import {ref} from "vue";

defineProps({
    'options': {
        type: Array,
        default: []
    },

    'isRequired': {
        type: Boolean,
        default: true
    },
});

const select2 = ref(null);
</script>

<template>
    <v-select ref="select2" :options="options" :class="'style-chooser'" placeholder="Select an option">
        <template #search="{attributes, events}">
            <input
                class="vs__search "
                :required="!isRequired"
                v-bind="attributes"
                v-on="events"
            />
        </template>
    </v-select>
</template>

<script>
export default {
    name: "Select2",
    inheritAttrs: true,
}
</script>

<style>
.style-chooser .vs__selected-options {
    color: #6b7280; /* gray-500 for light mode */
}

.dark .style-chooser .vs__selected-options {
    color: #9ca3af; /* gray-400 for dark mode */
}

.style-chooser .vs__dropdown-toggle {
    background-color: #F9FAFB; /* bg-gray-50 */
    border: 1px solid #D1D5DB; /* border border-gray-300 */
    color: #111827; /* text-gray-900 */
    font-size: 0.875rem; /* text-sm */
    border-radius: 0.5rem; /* rounded-lg */
    outline: none; /* removes default outline */
    box-shadow: 0 0 0 0 transparent; /* for focus effect */
    width: 100%; /* block w-full */
    padding: 0.4rem; /* p-2.5 */
}

.style-chooser .vs__dropdown-toggle:focus {
    border: 1px solid #3B82F6; /* border border-gray-300 */
    box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.5); /* create a focus ring effect */
}

.dark .style-chooser .vs__dropdown-toggle {
    background-color: #374151; /* dark:bg-gray-700 */
    border-color: #4B5563; /* dark:border-gray-600 */
    color: #FFFFFF; /* dark:text-white */
}

.dark .style-chooser .vs__dropdown-toggle::placeholder {
    color: #9CA3AF; /* dark:placeholder-gray-400 */
}

.dark .style-chooser .vs__dropdown-toggle:focus {
    border: 1px solid #3B82F6; /* border border-gray-300 */
    box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.5); /* create a focus ring effect */
}

.dark .style-chooser .vs__dropdown-menu {
  background: #374151; /* dark:bg-gray-700 equivalent */
  border: none;
  color: white;
}
.dark .style-chooser .vs__dropdown-toggle {
    background: #374151;
    fill: #374151;
}

.dark {
    --vs-state-disabled-bg: #374151;
} 
.dark .style-chooser .vs__selected {
    border: none;
    color: white;
    font-size: 0.9rem;
}
.style-chooser .vs__selected {
    border: none;
    color: black;
    font-size: 0.9rem;
}
.dark .style-chooser .vs__open-indicator {
  fill: white;
  overflow: auto;
}
.dark .style-chooser .vs__clear {
    fill: white;
    overflow: auto;
}
</style>
