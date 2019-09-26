<template>
    <div>
        <Card>
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
                            <MenuItem :name="site.id" ><span>{{site.department}}</span>请求路径设置</MenuItem>
                                <!--  <MenuItem name="1-2">OA报表请求路径设置</MenuItem>-->
                            </span>
                        </Submenu>


                    </Menu>
                </Sider>
                <Content :style="{padding: '0 24px 24px 24px', minHeight: '280px', background: '#fff'}">
                    <Alert type="warning" show-icon>说明：数据分析的取数接口, </Alert>
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

                                <FormItem label="路径" prop="path" >
                                    <Input v-model="formInfo.url"/>
                                </FormItem>
                                <FormItem label="备注" prop="path" >
                                    <Input v-model="formInfo.description"/>
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
        </Card>
    </div>
</template>

<script>
    import {
        getDataAnalysisById,
        updateDataAnalysis,
        getDataAnalysisAll
    } from "@/api/index";
    import DetailGrid from '@/views/my-components/private/DetailGrid'
    import dbForm from "@/views/jiuqiVue/interface/dbForm.vue";
    import JQdepartmenttree from "@/views/jiuqiVue/myTemplate/JQdepartment-tree.vue";

    export default {
        name: "data-analysis",
        components: {
            JQdepartmenttree,
            dbForm,
            DetailGrid,
        },
        data() {
            return {
                currName: "",
                submitLoading: false,
                //接受数据的对象
                backlogOrFullData: [],

                formInfo: {
                    id: "",
                    department: "",//部门
                    url: "",
                    description: "",
                },


            };
        },
        created(){
        },
        methods: {
            init() {
                this.getAllList();
            },
            //重置方法
            handleReset(){
                getDataAnalysisById(this.currName).then(res => {
                    if (res.success == true) {
                        //因为mybatis-plus与jpa的返回格式不一样所以这里稍加改动
                        //this.data = res.result.content;
                        this.formInfo.id=res.result.id;
                        this.formInfo.department=res.result.department;
                        this.formInfo.url=res.result.url;
                        this.formInfo.description=res.result.description;
                    }
                });
            },
            getAllList(){
                let that=this;
                //调用查询待办已办信息的方法
                getDataAnalysisAll().then(res => {

                    if (res.success == true) {
                        //因为mybatis-plus与jpa的返回格式不一样所以这里稍加改动
                        //this.data = res.result.content;
                        this.backlogOrFullData = res.result;
                    }
                });
            },
            //修改并保存按钮
            saveOAInfo(v){
                updateDataAnalysis(this.formInfo).then(res => {
                    if (res.success == true) {
                        this.$Message.success("操作成功");
                        this.getAllList();
                    }
                });
            },
            //接受部门id(目前没有用到id保留以后会用到)
            handleSelectDepTree(v) {
                let Id = v[0];
            },
            //接受部门的名字
            getDepTitle(data){
                this.formInfo.department=data;
                //alert(this.department.departmentTitle);
            }
        },
        watch : {
            currName:function(val) {

                getDataAnalysisById(this.currName).then(res => {
                    if (res.success == true) {
                        //因为mybatis-plus与jpa的返回格式不一样所以这里稍加改动
                        //this.data = res.result.content;
                        this.formInfo.id=res.result.id;
                        this.formInfo.department=res.result.department;
                        this.formInfo.url=res.result.url;
                        this.formInfo.description=res.result.description;
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
