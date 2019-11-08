<template>
    <div class="pages">
        <Button @click="back" class="buttonReturn">返回</Button>
        <div  class="pages_news_detail" v-html="content">

        </div>
    </div>

</template>

<script>
    import {getNewDetail} from '@/api/moduleIndex.js'
    export default {
        name: "pages_news_detail",
        data(){
            return{
                 content:'',
            }
        },
        created(){
            let ID=this.getStore('pagesNewsDetail');
           this.getNew(ID)
        },
        mounted() {

        },
        methods:{
            getNew(ID){
                getNewDetail({id:ID}).then(res=>{
                    if(res.success){
                        this.content=res.result.newsConten
                    }

                })
            },
            back(){
                this.$router.go(-1);//返回上一层
            },
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
