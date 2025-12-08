<script setup>
import InputLabel from '@/Components/InputLabel.vue';
import { onMounted } from 'vue';
import 'flowbite';
import { initAccordions, initTooltips } from 'flowbite';

defineProps({
    label: {
        type: String,
        default: '',
    },
    forLabel : {
        type: String,
        default: 'for_label',
    },
    classes : {
        type: String,
        default: 'for_label',
    },
    fullRow : {
        type: Boolean,
        default: false,
    },
    alert : {
        type: Boolean,
        default: false,
    },
    message : {
        type: String,
        default: null,
    },
});

onMounted(async() => {
    initAccordions();
    initTooltips();
})

</script>
<template>
    <InputLabel :for="forLabel" class="font-bold text-gray-900 dark:text-gray-300 mb-1">
        <span class="font-bold text-gray-900 dark:text-gray-300" v-if="label">{{ label }} 
            <button type="button" :data-tooltip-target="message" data-tooltip-placement="bottom" v-show="alert">
                <i class="fa-solid fa-triangle-exclamation text-red-600"></i>
                <div :id="message" role="tooltip" class="absolute z-10 invisible inline-block px-3 py-2 text-sm font-medium text-white transition-opacity duration-300 bg-gray-900 rounded-lg shadow-sm opacity-0 tooltip dark:bg-gray-700">
                    {{ message }}
                    <div class="tooltip-arrow" data-popper-arrow></div>
                </div>
            </button>
        </span>
        <span v-else>
            <slot name="label"/>
        </span>
    </InputLabel>
    
    <div v-if="fullRow" class="w-full grid grid-cols-1 gap-x-6 gap-y-4 mb-4">
        <slot />
    </div>

    <div v-else class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-4 mb-4">
        <slot />
    </div>
</template>

<script>
export default {
    name: "FormRow"
}
</script>

<style scoped>

</style>
