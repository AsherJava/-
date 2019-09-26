<template>
<div>
    <detail-tabs :formInline="data"></detail-tabs>
</div>
</template>
<script>
    import detailTabs from "@/views/my-components/private/components/detail-tabs";
    export default {
        name:'table-expand',
        props: {
            row: Object
        },
        components:{
            detailTabs
        },
        data(){
            return{
                data:this.row
            }
        }
    };
</script>
<style  lang="less">
    #Tabs{
    .TabPaneContent{
        background-color: white;
    }
    }
</style>
