<template>
    <div>
        <detail-from
                ref="detailFrom"
                :max-height="2000"
                :columns="columns1"
                :data.sync="data1"
                :page-size="pageSize"
                @change-page="changePage"
                @size-change="sizeChange"
                @re-flash="reFlash"
                @row-click="rowClick"
        >
            <div slot="header">
            </div>
        </detail-from>
        <div>
            <staff-info title="员工信息表X" :formInline="formInline"></staff-info>
            <p v-model="formInline">{{formInline}}</p>
        </div>
    </div>
</template>

<script>
    import DetailFrom from "@/views/my-components/private/components/DetailFrom";
    import staffInfo  from '@/views/my-components/private/components/staff-info'
    import {mockData}  from '@/libs/data';
    export default {
        name: "form-pages",
        components:{
            staffInfo,
            DetailFrom
        },
        data(){
            return{
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
                               on :{
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

            }//点击行获取数据
        },
        mounted() {  // html渲染后
            this.init();
            this.$refs.detailFrom.clickCurrentRow(0)//默认选中
        }
    }
</script>
