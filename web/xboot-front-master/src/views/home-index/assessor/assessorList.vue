<template>
    <div class="search">
        <Row>
            <Col>
                <Card>
                    <h2 class="title">管理员审批记录 <div class="return" @click="$router.back(-1)">返回</div></h2>
                    <Row>
                        <Table
                                :loading="loading"
                                border
                                :columns="columns"
                                :data="data"
                                ref="table"
                        ></Table>
                    </Row>
                    <Row type="flex" justify="end" class="page">
                        <Page
                                :current="pageNumber"
                                :total="total"
                                :page-size="pageSize"
                                @on-change="changePage"
                                @on-page-size-change="changePageSize"
                                :page-size-opts="[10,20,50]"
                                size="small"
                                show-total
                                show-elevator
                                show-sizer
                        ></Page>
                    </Row>
                </Card>
            </Col>
        </Row>

    </div>
</template>

<script>
    import {getStore} from '@/libs/storage.js'
    import {insertSelectAll,insertOrUpdate} from '@/api/moduleIndex.js'
    export default {
        name: "assessorList",
        beforeRouteEnter:(to,from,next)=>{//局部路守卫
            if(getStore("isRole")=='assessor'){
                next()
            }else {
                next('/home-pages')
            }

        },
        data(){
            return{
                loading: true,
                data: [],
                approvalStatus:null,
                columns: [
                    {
                        title: "创建时间",
                        key: "createTime",
                        sortable: false,
                        minWidth: 200
                    },
                    {
                        title: "审批时间",
                        key: "approvalTime",
                        sortable: false,
                        minWidth: 200
                    },

                    {
                        title: "状态",
                        key: "approvalStatus",
                        align: "center",
                        minWidth: 140,
                        render: (h, params) => {
                            let re = "";
                            if (params.row.approvalStatus== 1) {
                                return h("div", [
                                    h(
                                        "Badge",
                                        {
                                            props: {
                                                status: "success",
                                                text: "已批准"
                                            }
                                        }
                                    )
                                ]);
                            } else if (params.row.approvalStatus == 2) {
                                return h("div", [
                                    h(
                                        "Badge",
                                        {
                                            props: {
                                                status: "error",
                                                text: "未批准"
                                            }
                                        }
                                    )
                                ]);
                            } else if (params.row.approvalStatus ==3) {
                                return h("div",[
                                    h(
                                        "Badge",
                                        {

                                            props: {
                                                status: "processing",
                                                text: "待审批"
                                            }
                                        },

                                    )
                                ]);
                            } else if (params.row.approvalStatus==4) {
                                return h("div", [
                                    h(
                                        "Badge",
                                        {
                                            props: {
                                                status: "warning",
                                                text: "审批超时"
                                            }
                                        }
                                    )
                                ]);
                            }
                        },
                        filters: [
                            {
                                label: "已批准",
                                value: 1,

                            },
                            {
                                label: "未批准",
                                value: 2
                            },
                            {
                                label: "待审批",
                                value: 3
                            }, {
                                label: "审批超时",
                                value: 4
                            }
                        ],
                        filterMultiple: false,
                        filterRemote: (value,row)=> {//外部过滤
                            this.approvalStatus=value[0]
                            this.getQuartzList()
                        }
                    },
                    {
                        title: "操作",
                        align: "center",
                        minWidth: 280,
                        render: (h, params) => {
                            let runOrResume = "";
                            if (params.row.approvalStatus==1) {
                                runOrResume=h('span',[]
                                );
                            } else if(params.row.approvalStatus==2){
                        runOrResume=h('span',[]
                                );
                            }else if(params.row.approvalStatus==3){

                                runOrResume=h('span',[
                                    h(
                                        "Button",
                                        {
                                            props: {
                                                type: "success",//warning
                                                size: "small",
                                            },
                                            style: {
                                                marginRight: "5px"
                                            },
                                            on: {
                                                click: () => {
                                                    this.$Modal.success({
                                                        title:'审批员审批',
                                                        content:'您确定通过审批？',
                                                        onOk:()=>{
                                                            this.insertOrUpdateOk(params.row.id,1)
                                                        }
                                                    })
                                                }
                                            }
                                        },
                                        "批准"
                                    ),
                                    h(
                                        "Button",
                                        {
                                            props: {
                                                type: "error",//warning
                                                size: "small",
                                            },
                                            style: {
                                                marginRight: "5px"
                                            },
                                            on: {
                                                click: () => {
                                                    this.$Modal.warning({
                                                        title:'审批员审批',
                                                        content:'您确定驳回审批？',
                                                        onOk: ()=>{
                                                            this.insertOrUpdateOk(params.row.id,2)
                                                        }
                                                    })
                                                }
                                            }
                                        },
                                        "驳回"
                                    )
                                    ]
                                );

                            }else if(params.row.approvalStatus ==4){
                                runOrResume=h('span',[]
                                );
                            }
                            return h("div", [
                                runOrResume
                            ]);
                        }
                    }
                ],
                pageNumber: 1,
                sortColumn:'',
                pageSize: 10,
                total: 0,
                selectList: [],
                selectCount: 0,
            }
        },
        watch:{
            approvalStatus(val){
            },
            data(val){

            }
        },
        created(){
               this.init()
        },
        methods:{
            init(){
             this.getQuartzList()
            },
            changePage(v) {
                this.pageNumber = v;
                this.getQuartzList();
                this.clearSelectAll();
            },
            changePageSize(v) {
                this.pageSize = v;
                this.getQuartzList();
            },
            clearSelectAll() {
                this.$refs.table.selectAll(false);
            },
            getQuartzList() {
                this.loading = true;
                let params = {
                    current: this.pageNumber,
                    size: this.pageSize,
                    approvalStatus:this.approvalStatus
                };
                insertSelectAll(params).then(res => {
                    this.loading = false;
                    if (res.success == true) {
                        this.data = res.result.records;
                        this.total = res.result.total;
                    }
                });
            },
            insertOrUpdateOk(id,status){
               let data= {
                   id:id,
                   approvalStatus:status,
               }
                insertOrUpdate(data).then(res=>{
                  if(res.success){
                      this.getQuartzList()
                      this.$Message.success(res.message)
                  }else {
                      this.$Message.error(res.message)
                  }
                })
            }
        }
    }
</script>

<style lang="less">
    @import "./assessor.less";
</style>
