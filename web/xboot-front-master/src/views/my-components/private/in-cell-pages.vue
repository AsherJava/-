<template>
<div>
    <h3 class="article">提示： 表单功能设置可以在详细表单组件中查阅</h3>

    <div style="">
        <detail-from
                ref="detailFrom"
                :max-height="300"
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
    </div>
</div>
</template>

<script>
    import DetailFrom from "@/views/my-components/private/components/DetailFrom";
    import expandRow from "@/views/my-components/private/components/in-cell-table/table-expand";
    import {dateTime} from '@/libs/date'
    import {mockData}  from '@/libs/data';
    export default {
        name: "in-cell-pages",
        components:{
            DetailFrom,

        },
        data(){
            return{
                pageSize:10,
                pageSize2:10,
                data1:[],
                columns1: [
                    {
                        type: 'expand',
                        width: 50,
                        render: (h, params) => {
                            return h(expandRow, {
                                props: {
                                    row: params.row
                                }
                            })
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
                        key: 'birthDate',
                        render: (h, params) => {
                            let birth=params.row.birthDate;
                           let  date=dateTime(birth).y+'-'+dateTime(birth).M+'-'+dateTime(birth).d
                            return h('span', {
                            }, date)
                        }
                    },
                    {
                        title: '创建日期',
                        key: 'createDate'
                    }
                ],
                formInline:{},
            }
        },
        created(){
            this.detailFromInit();//刷新数据   获取假数据   html渲染前
        },
        mounted(){
            this.$refs.detailFrom.clickCurrentRow(0)
        },
        methods:{
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
                //  this.formInline=data.data


            },//点击行获取数据
        }
    }
</script>

<style scoped>

</style>
