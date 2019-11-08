<template>
 <div>
<div :class="classButton">
    <Button type="primary" @click="addRow" v-if="isButton">新增</Button>
</div>
    <slot name="header">
    </slot>
     <Table
             ref="tableForm"
             :height="height"
             :max-height="maxHeight"
             :border="border"
             :columns="columns"
             :data="data"
             @on-row-click="onRowClick"
             :highlight-row="highlightRow"
     >
     </Table>
     <div :class="classPages" v-if="isPage">
               <div :class="classPagesPotion">
                   <Page   :class="classPage"
                           :total="total"
                           :current="current"
                           :page-size="pageSize"
                           :show-sizer="showSizer"
                           :page-size-opts="pageSizeOpts"
                           :show-total="showTotal"
                           :show-elevator="showElevator"
                           @on-change="changePage"
                           @on-page-size-change="sizeChange"
                   ></Page>
                <div class="classReFlash">
                    <Icon type="md-refresh" size="26" @click="reFlash"/>
                </div>
               </div>
     </div>

 </div>

</template>

<script>
    export default {
        name: "from-detail",
        components:{
        },
        props: {
            isButton:{
                type: Boolean,
                default:false,
            },
            //分页
            total:{
                type: Number,
                default:100,
            },
            current:{
                type: Number,
                default:1,
            },
            showTotal:{
                type: Boolean,
                default: true,
            },
            showElevator:{
                type: Boolean,
                default: true,
            },
            border: {
                type: Boolean,
                default: true,
            },
            showSizer:{
                type: Boolean,
                default: true,
            },
            pageSizeOpts:{
                type: Array,
                default:function () {
                    return [10, 20, 30, 40]
                },
            },
            pageSize:{
                type: Number,
                default:10,
            },
            //table
            highlightRow:{
                type: Boolean,
                default: true,
            },
            height: {
                type: String|Number,
                default: '',
            },
            columns: {
                type: Array,
                default:[],
            },
            data: {
                type: Array,
                default: [],
            },
            maxHeight :{
                type: String|Number,
                default: '',
            },
            //样式
            classButton:{
                type: String,
                default: 'defaultButton',
            },
            classPages:{
                type: String,
                default: 'classPages',
            },
            classPagesPotion:{
                type: String,
                default: 'classPagesPotion',
            },
            classPage:{
                type: String,
                default: 'classPage',
            }
            ,
            classReFlash:{
                type: String,
                default: 'classReFlash',
            },
            isPage:{
                type: Boolean,
                default: false,
            }

        },
        methods:{
            onRowClick(data,index){
               let json={
                   data:data,
                   index:index
               }
                this.$emit('row-click',json)//刷新元数据
            },
            reFlash(){
                this.$emit('re-flash',true)//刷新元数据
            },
            delTip(index){
                if(index=='none'){
                    this.deleteRow(index)
                }else {
                    this.$Modal.confirm({
                        title: "确认删除",
                        content: "您确认要删除该条数据?",
                        onOk: () => {
                            this.operationLoading = true;
                            this.deleteRow(index)
                            this.$Message.success("删除成功");
                        }
                    });
                }

            },
            deleteRow(index){
                if(index!='none'){
                    this.data.splice(index,1)//删除
                    this.$emit('update:data',this.data)//刷新父组件数据
                }else{
                    this.$Modal.confirm({
                        title: "提示",
                        content: "请选中删除项！",
                        onOk: () => {
                            this.operationLoading = true;
                            this.$refs.detailFrom.deleteRow(row._index)
                            this.$Message.success("删除成功");
                        }
                    });
                }

            },
            addRow(){
                this.data.unshift({})
                this.$emit('update:data',this.data)
            },
            changePage () {
                this.$emit('change-page',true)
            },
            sizeChange(index){
                this.$emit('size-change',index)
            },
            clickCurrentRow(index){
                this.$refs.tableForm.$refs.tbody.clickCurrentRow(index)
            },

        },
        mounted() {

        }
    }
</script>

<style scoped lang="less">
.defaultButton{
    height: 70px;
    display:flex;
    align-items:center;
}
    .classPages{
        height: 70px;
        display:flex;
        text-align: right;
        align-items:center;
    }
    .classPagesPotion{
        width: 100%;
        float: right;
        position: relative;
    }
    .classPage{
        padding-right: 50px;
    }
    .classReFlash{
        position: absolute;
        right: 0;
        top: 5px;
        padding-right: 10px;
        cursor: pointer;
    }
</style>
