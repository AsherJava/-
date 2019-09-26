<template>
    <div>
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
        <div >
            <detail-tabs :formInline="formInline">
            </detail-tabs>
        </div>
        <frame-edit :open.sync="modal" :formInline="formInline" @dataChange="editChange"></frame-edit>
    </div>
</template>

<script>
    import DetailFrom from "@/views/my-components/private/components/DetailFrom";
    import detailTabs from "@/views/my-components/private/components/detail-tabs";
    import frameEdit from "@/views/my-components/private/components/frame-edit";
    import {mockData}  from '@/libs/data';
    export default {
        name: "frame-Edit-pages",
        components:{
            DetailFrom,
            detailTabs,
            frameEdit
        },
        data(){
            return{
                pageSize:10,
                data1:[],
                modal:false,
                rowIndex:0,
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
                            },[

                                h('span',{
                                    style:{
                                        padding:'0 10px'
                                    },
                                    on:{
                                        click:() =>{
                                     this.modal=true;

                                        }
                                    }
                                }, 'Edit'),
                                h('span',{
                                style:{
                                    padding:'0 10px'
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
                            }, 'Delete'),

                            ]);
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
                this.rowIndex=data.index;
                this.formInline=data.data

            },//点击行获取数据
            editChange(data){
                      this.data1.splice(this.rowIndex,1,data)
            }
        },
        mounted() {  // html渲染后
            this.init();
            this.$refs.detailFrom.clickCurrentRow(this.rowIndex)//默认选中
        }
    }
</script>

<style scoped>

</style>


