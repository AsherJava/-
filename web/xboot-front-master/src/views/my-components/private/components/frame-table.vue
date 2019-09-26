<template>
    <frame-medal  v-model="value" :Title="Title" Width="650">
        <search-info @change="onChange"></search-info>
        <Scroll height="340" >
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
            >
                <div slot="header">
                </div>
            </detail-from>
        </Scroll>
        <div slot="footer">
            <Button type="default" @click="changeOpen(1)">取消</Button>
            <Button type="primary" @click="changeOpen(2)">确认</Button>
        </div>
    </frame-medal>
</template>

<script>
    import frameMedal  from '@/views/my-components/private/components/common/frame-medal'
    import searchInfo  from '@/views/my-components/private/components/common/search-info'
    import DetailFrom  from '@/views/my-components/private/components/DetailFrom'
    import {mockData}  from '@/libs/data';
    export default {
        name: "frame-table",
        components:{
            frameMedal,
            searchInfo,
            DetailFrom

        },
        props:{
            Title:{
                type:String|Number,
                default:'弹出表',
            },
            open:{
                type:Boolean,
                default:false,
            },
        },
        data(){
            return{
                value:false,
                search:'',
                pageSize:10,
                data1:[],
                columns1:[
                    {
                        title: '#',
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
                            }, 'Delete');
                        }
                    },
                    {
                        title: '员工账号',
                        key: 'name'
                    },
                    {
                        title: '性别',
                        key: 'sex',
                        align:'center',
                    },
                    {
                        title: '年龄',
                        key: 'age'
                    },
                    {
                        title: '出生日期',
                        key: 'birthDate'
                    },
                    {
                        title: '创建日期',
                        key: 'createDate'
                    }
                ],
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
            }
        },
        created(){
            this.detailFromInit();//刷新数据   获取假数据   html渲染前
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
            onChange(val){
                this.search=val;
            },
            changeOpen(index){
                this.value=false;
                if(index==1){
                }else if(index==2){

                }

            }
        },
        mounted() {  // html渲染后
            this.init();
            this.$refs.detailFrom.clickCurrentRow(0)//默认选中
        }




    }
</script>

<style scoped>

</style>
