<template>
    <frame-medal  v-model="value" :Title="Title" Width="650" :class="{frameMedal:!isFooter}">
        <Scroll height="300" >
            <detail-from
                    ref="detailFrom"
                    :max-height="600"
                    :columns="columns1"
                    :data.sync="data1"
                    :page-size="pageSize"
                    classButton="buttonNone"
                    @change-page="changePage"
                    @size-change="sizeChange"
                    @re-flash="reFlash"
                    @row-click="rowClick"
                    :highlight-row=false
            >
                <div slot="header">
                </div>
            </detail-from>
        </Scroll>
        <div slot="footer"  v-if="isFooter">
            <Button type="default" @click="changeOpen(1)">取消</Button>
            <Button type="primary" @click="changeOpen(2)">确认</Button>
        </div>
    </frame-medal>
</template>

<script>
    import frameMedal  from '../modal/frame-medal'
    import DetailFrom  from '../form/DetailFrom'
    import {mockData}  from '@/libs/data';
    export default {
        name: "table-frame",
        components:{
            frameMedal,
            DetailFrom

        },
        props:{
            isFooter:{
                type:Boolean,
                default:false,
            },
            Title:{
                type:String|Number,
                default:'预警接收人',
            },
            open:{
                type:Boolean,
                default:false,
            },
            dataList:{
                type:Array,
                default:function () {
                    return [
                    ]
                },
            },
            columns:{
                type:Array,
                default:function () {
                    return [
                        {
                            title: '姓名',
                            key: 'name'
                        },
                        {
                            title: '手机号',
                            key: 'sex',
                            align:'center',
                        },
                        {
                            title: '操作',
                            key: 'delete',
                            align:'center',
                            render:(h,params) => {
                                const row=params.row
                                const color='#40a9ff';
                                return h('div', {
                                    props: {
                                    },
                                    style:{
                                        color:color,
                                        cursor:'pointer',
                                    },
                                    on:{
                                        click:() =>{
                                            this.$Modal.confirm({
                                                title: "确认删除",
                                                content: "您确认要删除该条数据?",
                                                onOk: () => {
                                                    this.operationLoading = true;
                                                    this.$refs.detailFrom.deleteRow(row._index)
                                                    this.$Message.success("删除成功");
                                                }
                                            });

                                        }
                                    }
                                }, '删除');
                            }
                        },
                    ]
                },
            }
        },
        data(){
            return{
                value:false,
                search:'',
                pageSize:10,
                data1:[],
                columns1:this.columns,
                formInline: {
                }
            }
        },
        watch:{
            open(val){
                this.value=this.open;
            },
            value(val){
                this.$emit('update:open',val)
            },
            columns(val){
                this.columns1=val
            },
            dataList(val){
                this.data1=val

            },
            data1(val){

            }
        },
        created(){
            //this.detailFromInit();//刷新数据   获取假数据   html渲染前
        },
        methods: {
            init(){
            },
            //1.详细表单组件
            detailFromInit() {
                this.data1=this.mockDate();
            },//数据初始化
            mockDate(){
                return mockData(this.pageSize)
            },//假数据
            changePage(){
                console.log(this.mockDate())
                this.data1=this.mockDate();
            },//改变页码
            sizeChange(index){
                this.pageSize=index;
                this. detailFromInit()//刷新数据
            },//现实条数
            reFlash(){
                this.detailFromInit()
            },////刷新数据
            rowClick(data){
                this.formInline=data.data

            },//点击行获取数据
            changeOpen(index){
                this.value=false;
                if(index==1){
                }else if(index==2){

                }

            },
            deleteClick(item){
                this.$refs.detailFrom.deleteRow(item)
            }
        },
        mounted() {  // html渲染后
            this.init();
        }




    }
</script>

<style lang="less">
    .frameMedal{
    .ivu-modal-footer{
     padding: 0 !important;
    }
    }

</style>
