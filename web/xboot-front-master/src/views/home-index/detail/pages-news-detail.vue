<template>
    <div  class="pages_news_detail" v-html="content">

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
            getNewDetail({id:ID}).then(res=>{
                if(res.success){
                   this.content=res.result.newsConten
                }

            })
        },
        mounted() {

        },
        methods:{
        }
    }
</script>

<style scoped>
.pages_news_detail{
    width: 100%;
    height: 100%;
    text-align: center;
}
</style>
