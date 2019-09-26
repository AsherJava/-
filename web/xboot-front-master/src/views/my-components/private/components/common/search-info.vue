<template>
    <div class="search">
        <span class="nameTitle">名称：</span>
        <Input v-model="searchInfo" search placeholder="请输入搜索内容...." @on-change="handleSearch1"  style="width: 186px"/>
        <Button type="text">查询</Button>
    </div>
</template>

<script>
    export default {
        name: "search-info",
        data(){
        return{
            searchInfo:'',
        }
        },
        methods:{
            handleSearch1(){
            this.$emit('change',this.searchInfo)
            }
        }
    }
</script>

<style scoped lang="less">
    .nameTitle{
        padding-right: 8px;
    }
    .search{
        width: 100%;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-bottom: 1px solid  #dcdee2
    }
</style>
