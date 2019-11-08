<template>
    <div class="pages">
        <Button @click="back" class="buttonReturn">返回</Button>
        <div  class="pages_news_detail" v-html="content">

        </div>
    </div>
</template>

<script>
    import {subsystemNews} from '@/api/moduleIndex.js'
    export default {
        name: "subsystem-detail",
        data(){
            return{
                content:'',
            }
        },
        created(){
            let ID=this.getStore('pagesSubsystemNewsDetail');
            this.getNew(ID)
        },
        mounted() {

        },
        methods:{
            back(){
                this.$router.go(-1);//返回上一层
            },
            getNew(ID){
                subsystemNews({id:ID}).then(res=>{
                    if(res.success){
                        this.content=res.result.newsConten
                    }

                })
            }
        }
    }
</script>

<style scoped>
    .pages{
        width: 100%;
        height: 100%;
        position: relative;
    }
    .buttonReturn{
        position: absolute;
        right: 30px;
        top: 30px;
    }
    .pages_news_detail{
        width: 100%;
        height: 100%;
        text-align: center;
        background-color: white;
    }
</style>
