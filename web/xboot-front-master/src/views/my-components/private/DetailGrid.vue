<template>
    <div >
        <h3 class="article">提示： 表单功能设置可以在详细表单组件中查阅</h3>

          <div style="width: 800px">
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
          <div>
                <detail-from
                        ref="detailFrom1"
                        :max-height="800"
                        :columns="columns2"
                        :data.sync="data2"
                        :page-size="pageSize2"
                        classButton="buttonNone"
                        @change-page="changePage2"
                        @size-change="sizeChange2"
                        @re-flash="FromInit()"
                >
                    <div slot="header">
                    </div>
                </detail-from>
          </div>

    </div>
</template>

<script>
    import DetailFrom from "@/views/my-components/private/components/DetailFrom";
    export default {
        name: "DetailGrid",
        components:{
          DetailFrom,
        },
        data(){
            return{
                pageSize:10,
                pageSize2:10,
                data1:[],
                columns1:[
                    {
                        title: 'ID',
                        key: 'id',
                    },
                    {
                        title: '部门名称',
                        key: 'department'
                    },

                ],
                formInline:{},
                data2:[],
                columns2:[
                    {
                        title: '员工账号',
                        key: 'account',
                        align:'center',
                        render:(h,params) => {
                            const row=params.row.account
                            return h('div', {
                                props: {
                                },
                                style:{
                                   textAlign:'left',
                                },
                                on:{
                                    click:() =>{
                                    }
                                }
                            },row);
                        }
                    },
                    {
                        title: '性别',
                        align:'center',
                        key: 'sex'
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
                        key: 'createDate',
                        align:'center',
                        render:(h,params) => {
                            const row=params.row.createDate
                            return h('div', {
                                props: {
                                },
                                style:{
                                    textAlign:'left',
                                },
                                on:{
                                    click:() =>{
                                    }
                                }
                            },row);
                        }
                    },


                ],

            }
        },
        created(){
            this.detailFromInit();//刷新数据   获取假数据   html渲染前
            this.FromInit()
        },
        mounted(){
            this.$refs.detailFrom.clickCurrentRow(0)
        },
        methods:{
            //1.详细表单组件
            detailFromInit() {
                this.data1=this.mockDate();
            },//数据初始化
          FromInit() {
                this.data2=this.mockDate2();
            },//数据初始化1
            mockDate(){
                let data = [];
                for (let i = 0; i < this.pageSize; i++) {
                    data.push({
                        delete:'delete',
                        name: 'John Brown'+Math.ceil(Math.random ()*10+1),
                        age: Math.ceil(Math.random ()*10+1),
                        sex: '男',
                        birthDate: '2016-10-03',
                        createDate: '2016-10-03',
                        id:'src'+Math.ceil(Math.random ()*10+1),
                        department:'天上人间'+Math.ceil(Math.random ()*10+1)+'部',
                        account:Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+'@'+'.com.cn'
                    })
                }
                return data
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
                this.data2=this.mockDate2();

            },//点击行获取数据
        /*表2*/
            mockDate2(){
                let data = [];
                for (let i = 0; i < this.pageSize2; i++) {
                    data.push({
                        delete:'delete',
                        name: 'John Brown'+Math.ceil(Math.random ()*10+1),
                        age: Math.ceil(Math.random ()*10+1),
                        sex: '男',
                        birthDate: '2016-10-03',
                        createDate: '2016-10-03',
                        id:'src'+Math.ceil(Math.random ()*10+1),
                        department:'天上人间'+Math.ceil(Math.random ()*10+1)+'部',
                        account:Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+'@'+'.com.cn'
                    })
                }
                return data
            },//假数据
            changePage2(){
                this.data2=this.mockDate2();
            },//改变页码
            sizeChange2(index){
                this.pageSize2=index;
                this.FromInit()//刷新数据
            },//现实条数
        }
    }
</script>

<style >

    .buttonNone{
        display: none;
    }
</style>
