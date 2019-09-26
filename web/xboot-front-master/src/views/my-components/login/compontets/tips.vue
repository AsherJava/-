<template>
    <div >
        <span  class="tips-word" :class="{tipsW:isOpen,tipsH:isTip}" v-model=" tips">{{tips}}</span>
    </div>
</template>

<script>
    export default {
        name: "tips",
        props:{
            isShow:{
                type:Boolean,
                default:false,
            },
            tips:{
                type:String,
                default:'',
            },
            isTip:{
                type:Boolean,
                default:false,
            }
        },
        data(){
            return{
                isOpen:this.isShow
            }
        },
        watch:{
            isShow(val){
                this.isOpen=val;
            }
        },
        methods:{

        }
    }
</script>

<style scoped lang="less">
    .tips-word{
        color: #ed4014;
        padding: 6px 0 ;
        font-size: 14px;
        font-weight: normal;
        transition: 3s;
        display:inline-block;
        opacity: 0;
        filter:Alpha(opacity=0)
    }
    .tipsW{
        opacity: 1;
        filter:Alpha(opacity=100);
        transition: opacity 0.1s;
    }
    .tipsH{
        opacity: 1;
    }
</style>
