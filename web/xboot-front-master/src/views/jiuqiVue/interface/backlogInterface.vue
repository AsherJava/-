<template>
    <div>
        <!--<button @click="setUp">接口设置</button>-->
        <Button type="primary" shape="circle"  @click="setUp">{{buttonTitle}}</Button>

         <span v-if=drop>
             <div><Card>
           <!-- <Button type="primary" icon="md-add">添加子节点</Button>-->
                 <!--  <br><br>-->
            <br>
            <Layout>
                <Sider hide-trigger style="background: #fff;max-width: 205px;flex: 0 0 205px;">
                    <Menu
                            theme="light"
                            width="auto"
                            :open-names="['1']"
                            @on-select="currName=$event"
                    >
                        <Submenu name="1">
                            <template slot="title">
                                <Icon type="md-ionic"/>系统部门
                            </template>
                            <!--循环显示-->
                            <span
                                    v-for="site in backlogOrFullData"
                            >
                            <MenuItem :name="site.id" >{{site.department}}请求路径设置</MenuItem>
                                <!--  <MenuItem name="1-2">OA报表请求路径设置</MenuItem>-->
                            </span>
                        </Submenu>


                    </Menu>
                </Sider>
                <Content :style="{padding: '0 24px 24px 24px', minHeight: '280px', background: '#fff'}">
                    <Alert type="warning" show-icon>说明：设置待办已办的取数的url, </Alert>
                    <!--OA待办-->
                    <!-- <div v-show="currName=='1-1'">-->
                    <div>
                        <br>
                        <Col span="9" style="margin-left:10px">

                            <Form ref="menuForm"  :label-width="100" >

                                <FormItem label="业务" prop="type">
                                    <Icon type="ios-list-box-outline" size="16" style="margin:0 5px 3px 0;"></Icon>
                                    <span>设置连接</span>
                                </FormItem>

                                <FormItem label="部门" prop="title" >
                                    <JQdepartmenttree :depName="formInfo.department" @on-change="handleSelectDepTree" @func="getDepTitle" ref="depTree"></JQdepartmenttree>
                                </FormItem>

                                <FormItem label="待办取数接口" prop="path" >
                                    <Input v-model="formInfo.backlogUrl"/>
                                </FormItem>
                                <FormItem label="已办取数接口" prop="path" >
                                    <Input v-model="formInfo.fullUrl"/>
                                </FormItem>
                                <FormItem label="单点访问链接" prop="path" >
                                    <Input v-model="formInfo.url"/>
                                </FormItem>
                                <FormItem label="排序值" prop="sortOrder">
                                    <InputNumber :max="1000" :min=1 v-model="formInfo.sortOrder"></InputNumber>
                                    <span style="margin-left:5px">值越小越靠前，支持小数,此数据排序对应首页顺序</span>
                                </FormItem>

                                <Form-item>
                                    <Button
                                            style="margin-right:5px"
                                            :loading="submitLoading"
                                            type="primary"
                                            icon="ios-create-outline"
                                            @click="saveOAInfo()"
                                    >修改并保存</Button>
                                    <Button @click="handleReset">重置</Button>
                                </Form-item>
                            </Form>
                        </Col>
                        <br> <br> <br> <br><br> <br> <br> <br><br> <br> <br> <br><br> <br> <br> <br><br> <br> <br> <br>

                    </div>


                </Content>
            </Layout>
        </Card></div>

         </span>
        <span v-if=infoTree>
        <div> <Row>

                    <!--待办已办列表-->
                    <backlogOrFull></backlogOrFull>

    <!-- 这里是表格展示组件-->
            </Row></div>

         </span>

    </div>
</template>

<script>
    import {
        getBacklogOrFullById,
        updateBacklogOrFullAll,
        getBacklogOrFullAll
    } from "@/api/index";
    import DetailGrid from '@/views/my-components/private/DetailGrid'
    import dbForm from "@/views/jiuqiVue/interface/dbForm.vue";
    import JQdepartmenttree from "@/views/jiuqiVue/myTemplate/JQdepartment-tree.vue";
    import backlogOrFull from "@/views/jiuqiVue/interface/backlogOrFull.vue";
    export default {
        name: "private-componetents",
        components: {
    JQdepartmenttree,
            dbForm,
            DetailGrid,
            backlogOrFull
        },
        data() {
            return {
                buttonTitle:"设置",
                currName: "",
                submitLoading: false,
                //接受数据的对象
                backlogOrFullData: [],
                drop:false,
                infoTree:true,
                formInfo: {
                    id: "",
                    department: "",//部门
                    fullUrl: "",//已办
                    backlogUrl: "",//待办
                    url: "",//通过这个地址访问子系统的页面
                    sortOrder:1 ,
                },


            };
        },
        created(){
        },
        methods: {
            init() {
            this.getBacklogOrFull();
            },
            //重置方法
            handleReset(){
                if(this.formInfo.id!=="") {
                    getBacklogOrFullById(this.currName).then(res => {
                        if (res.success == true) {
                            //因为mybatis-plus与jpa的返回格式不一样所以这里稍加改动
                            //this.data = res.result.content;
                            this.formInfo.id = res.result.id;
                            this.formInfo.department = res.result.department;
                            this.formInfo.backlogUrl = res.result.backlogUrl;
                            this.formInfo.fullUrl = res.result.fullUrl;
                            this.formInfo.url = res.result.url;
                            this.formInfo.sortOrder= res.result.sortOrder;
                        }
                    });
                }
             },

           getBacklogOrFull(){
                let that=this;
                //调用查询待办已办信息的方法
               getBacklogOrFullAll().then(res => {

                   if (res.success == true) {
                       //因为mybatis-plus与jpa的返回格式不一样所以这里稍加改动
                       //this.data = res.result.content;
                       this.backlogOrFullData = res.result;
                   }
               });
           },
            //修改并保存按钮
            saveOAInfo(v){
                if(this.formInfo.id!==""){
                    updateBacklogOrFullAll(this.formInfo).then(res => {
                        if (res.success == true) {
                            this.$Message.success("操作成功");
                            this.getBacklogOrFull();
                        }
                    });
                }else{
                    this.$Message.info('请选择要操作的数据');
                }

            },
            //接受部门id(目前没有用到id保留以后会用到)
            handleSelectDepTree(v) {
                let Id = v[0];
            },
            //接受部门的名字
            getDepTitle(data){
                this.formInfo.department=data;
                //alert(this.department.departmentTitle);
            },
            setUp(){
                if(this.drop){
                    this.buttonTitle="设置";
                    this.drop=false;
                }else{
                    this.drop=true;
                }

                if(this.infoTree){
                    this.buttonTitle="列表";
                    this.infoTree=false;
                }else{
                    this.infoTree=true;
                }
            }
        },
        watch : {
            currName:function(val) {

                getBacklogOrFullById(this.currName).then(res => {
                    if (res.success == true) {
                        //因为mybatis-plus与jpa的返回格式不一样所以这里稍加改动
                        //this.data = res.result.content;
                        this.formInfo.id=res.result.id;
                        this.formInfo.department=res.result.department;
                        this.formInfo.backlogUrl=res.result.backlogUrl;
                        this.formInfo.fullUrl=res.result.fullUrl;
                        this.formInfo.url=res.result.url;
                        this.formInfo.sortOrder= res.result.sortOrder;
                    }
                });
            }
        },
        mounted() {  // html渲染后
            this.init();
        }
    };
</script>

<style lang="less">
    .article {
        font-size: 16px;
        font-weight: 400;
        margin: 12px 0;
    }
    .blue {
        color: #40a9ff !important;
    }
    code {
        display: inline-block;
        background: #f7f7f7;
        font-family: Consolas, Monaco, Andale Mono, Ubuntu Mono, monospace;
        margin: 0 3px;
        padding: 1px 5px;
        border-radius: 3px;
        color: #666;
        border: 1px solid #eee;
    }
    .sorry {
        height: 500px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        .text {
            font-size: 20px;
            margin: 20px 0;
        }
    }
</style>
