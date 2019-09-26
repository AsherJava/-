<template>
    <div :class="{commonBorder:!isClick}">
        <div :class="['common-icon-picture-'+type]" class="common-icon-picture common-icon-picture-border" @click="isShow" ></div>
    </div>
</template>

<script>
    export default {
        name: "common-icon",
        props:{
            type: String,
            isSelect:{
                type: Boolean,
                default:false,
            }
        },
        data() {
            return{
                isClick:this.isSelect,
            }
        },
        watch:{
            isSelect(val){
                this.isClick=val;
            },
            isClick(val){
               this.$emit('onChange',{type:this.type,data:val})
            }
        },
        methods:{
            isShow(){
              this.isClick=!this.isClick;
            }
        }
    }
</script>

<style scoped>
    @import "common-icon.css";
</style>
