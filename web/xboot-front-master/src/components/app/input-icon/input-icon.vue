<template>
    <div class="input-icon-picture" :class="['input-icon-picture-'+type]"></div>
</template>

<script>
    export default {
        name: "input-icon",
        props:{
            type: String,
        }
    }
</script>

<style scoped>
@import "input-icon.css";
</style>
