<script setup>
import InputLabel from '@/Components/InputLabel.vue';

const props = defineProps({
    label: {
        type: String,
        default: null,
    },
    forLabel : {
        type: String,
        default: '',
    },
    classes : {
        type: String,
        default: '',
    },
    useLabel : {
        type: Boolean,
        default: true,
    },
    color: {
        type: String,
    }
});

</script>
<template>
    <div class="w-full items-center">
        <div v-if="label">
            <InputLabel :for="forLabel" :color="color">
                <span v-if="label">{{ label }}</span>
                <span v-else>
                    <slot name="label"/>
                </span>
            </InputLabel>
        </div>
        <div class="w-full">
            <slot/>
        </div>
    </div>
</template>

<script>
export default {
    name: "InputRow"
}
</script>

<style scoped>

</style>
