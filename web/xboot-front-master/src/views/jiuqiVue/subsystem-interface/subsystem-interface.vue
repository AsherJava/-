<style lang="less">
    // @import "./roleManage.less";
</style>
<!--这是子系统的系统管理页面-->
<template>
    <div class="search">
        <Row>
            <Col>
                <Card>

                    <Row>

                        <Form ref="subsystemNews"  :model="subsystemNews" inline :label-width="70" class="search-form">
                            <Form-item label="系统名称" prop="username">
                                <Input
                                        v-model="subsystemNews.sname"
                                        type="text"
                                        clearable
                                        placeholder="请输入..."
                                        style="width: 200px"
                                />
                            </Form-item>
                            <Form-item label="网址" prop="department">
                                <Input
                                        v-model="subsystemNews.url"
                                        type="text"
                                        clearable
                                        placeholder="请输入..."
                                        style="width: 200px"
                                />
                            </Form-item>
                            <span v-if="drop">
                <Form-item label="手机号" prop="mobile">
                  <Input
                          type="text"

                          clearable
                          placeholder="请输入手机号"
                          style="width: 200px"
                  />
                </Form-item>
              </span>
                            <Form-item style="margin-left:-35px;" class="br">
                                <Button @click="searchNews" type="primary" icon="ios-search">搜索</Button>
                                <Button @click="reset">重置</Button>
                            </Form-item>
                        </Form>
                    </Row>


                    <Row class="operation" style="padding-bottom: 15px">

                        <Button @click="addSystem" type="primary" icon="md-add">添加系统</Button>
                        <Button @click="delAll" icon="md-trash">批量删除</Button>
                        <Button @click="init" icon="md-refresh">刷新</Button>
                        <circleLoading v-if="operationLoading"/>
                    </Row>

                    <Row>
                        <Alert show-icon>
                            已选择 <span class="select-count">{{selectCount}}</span> 项
                            <a class="select-clear" @click="clearSelectAll">清空</a>
                        </Alert>
                    </Row>

                    <Row style="padding-bottom: 15px">
                        <!-- 这里是表格展示组件-->
                        <Table :loading="loading" border :columns="columns" :data="data" ref="table" sortable="custom" @on-sort-change="changeSort" @on-selection-change="changeSelect"></Table>
                    </Row>


                    <Row type="flex" justify="end" class="page">
                        <Page :current="subsystemNews.current" :total="total" :page-size="subsystemNews.size" @on-change="changePage" @on-page-size-change="changePageSize"  :page-size-opts="[10,20,50]" size="small" show-total show-elevator  show-sizer></Page>
                    </Row>
                    <Row type="flex" justify="end" class="page">
                    </Row>
                </Card>
            </Col>
        </Row>
        <!-- 添加系统 njp -->
        <Modal :title="modalTitle" v-model="roleModalVisible" :mask-closable='false' :width="500">
            <Form ref="editSubsystemNews" :model="editSubsystemNews" :label-width="80" :rules="editSubsystemNewsValidate">
                <FormItem label="系统名" prop="sysName">
                    <Input v-model="editSubsystemNews.sysName" placeholder="系统名"/>
                </FormItem>
                <FormItem label="url" prop="url">
                    <Input v-model="editSubsystemNews.url"  placeholder="url"/>
                </FormItem>
                <FormItem label="备注" prop="description">
                    <Input v-model="editSubsystemNews.description"  placeholder="请输入..."/>
                </FormItem>

                <FormItem label="数据类型" prop="infoType">
                    <Select  v-model="editSubsystemNews.infoType" placeholder="请选择" >
                        <Option   value="portal" key="portal">
                           pc端
                        </Option>
                        <Option   value="APP" key="APP">
                            APP
                        </Option>
                    </Select>
                </FormItem>

             <!--   <FormItem label="图片地址" prop="description">
                    <Input v-model="editSubsystemNews.imageUrl"  placeholder="url"/>
                </FormItem>-->


                <FormItem label="排序值" prop="sortOrder">
                    <InputNumber :max="1000" :min=0 v-model="editSubsystemNews.sortOrder"></InputNumber>
                    <span style="margin-left:5px">值越小越靠前，支持小数</span>
                </FormItem>
            </Form>
            <div slot="footer">
                <Button type="text" @click="cancelRole">取消</Button>
                <!--添加系统提交-->
                <Button type="primary" :loading="submitLoading" @click="submitNew">提交</Button>
            </div>
        </Modal>


        <!-- 菜单权限 -->
        <Modal :title="mymodalTitle" v-model="permModalVisible" :mask-closable='false' :width="500" :styles="{top: '30px'}" class="permModal">

            <Tree ref="tree" :data="permData" multiple show-checkbox :render="renderContent" :check-strictly="true"></Tree>
            <Spin size="large" v-if="treeLoading"></Spin>
            <div slot="footer">
                <Button type="text" @click="cancelPermEdit">取消</Button>
                <Button @click="selectTreeAll">全选/反选</Button>
                <Button type="primary" :loading="submitPermLoading" @click="submitPermEdit">提交</Button>
            </div>
        </Modal>

        <!-- njp 新增详情弹出表单begin-->
        <!--<Modal :title="mymodalTitle" v-model="myModalVisible" :mask-closable='false' :width="500" :styles="{top: '30px'}" class="depModal">-->
        <Modal :title="mymodalTitle" v-model="myModalVisible" :mask-closable='false' :width="500">

            <Form ref="newXQ" :model="newXQ" :label-width="80" :rules="sysFormValidate">
                <FormItem label="系统标题" prop="name">
                    <Input  v-model="newXQ.newsTitle" placeholder="标题" readonly/>
                    <p>{{newXQ.newsTitle}}</p>
                </FormItem>
                <FormItem label="系统描述" prop="description">
                    <Input v-model="newXQ.ewsDesc"  placeholder="描述" readonly/>
                    <p>{{newForm.newsDesc}}</p>
                </FormItem>
                <FormItem label="系统内容" prop="name">
                    <!--<Input v-model="sysForm.url" placeholder="内容"/>
                    <p>{{sysForm.url}}</p>-->

                    <Input @on-focus="showEditor" type="textarea" :rows="4" placeholder="Enter something..."  readonly/>

                </FormItem>

                <FormItem label="系统级别" prop="name">
                    <Input v-model="newXQ.newsRate" placeholder="级别" readonly/>
                    <p>{{newForm.newsRate}}</p>
                </FormItem>
                <FormItem label="是否置顶" prop="name">
                    <Input v-model="newXQ.newsIsTop" placeholder="" readonly/>
                </FormItem>
            </Form>
            <Alert show-icon>
                默认可查看全部数据，自定义数据范围请点击选择下方数据
            </Alert>
            <div v-if="dataType!=0" style="margin-top:15px">
                <Tree ref="depTree" :data="depData" :load-data="loadData" @on-toggle-expand="expandCheckDep" multiple style="margin-top:15px"></Tree>
                <Spin size="large" v-if="depTreeLoading"></Spin>
            </div>
            <div slot="footer">
                <Button type="text" @click="myModalVisible=false">取消</Button>

            </div>
        </Modal>

        <!-- njp 新增详情弹出表单end-->

        <!--njp 20190717新增编辑弹出窗口begin-->
        <Modal :title="BJmodalTitle" v-model="BJModalVisible" :mask-closable='false' :width="500">

            <Form ref="newXQ" :model="newXQ" :label-width="80" :rules="sysFormValidate">
                <FormItem label="系统名称" prop="name">
                    <input v-model="newXQ.imageUrl"  type="hidden" />
                    <input  v-model="newXQ.id" type="hidden" />
                    <Input  v-model="newXQ.sysName" placeholder="标题" />
                </FormItem>
                <FormItem label="系统url" prop="description">
                    <Input v-model="newXQ.url"  placeholder="描述" />
                </FormItem>
                <FormItem label="备注" prop="description">
                    <Input v-model="newXQ.description"  placeholder="描述" />
                </FormItem>
               <!-- <FormItem label="图片地址" prop="description">
                    <Input v-model="newXQ.imageUrl"  placeholder="url" />
                </FormItem>-->

             <!--   <Form-item label="新闻主图" prop="avatar">

                    <SystemUploadPicInput @func="getMsgFormSon" ></SystemUploadPicInput>

                </Form-item>-->
                <FormItem label="短信预警">
                    <i-switch size="large"  v-model="newXQ.warningStatus=='start'"@on-change="warningStatusChange">
                        <span slot="open">开启</span>
                        <span slot="close">关闭</span>
                    </i-switch>
                </FormItem>
                <FormItem label="图标上传" prop="description">
                    <systemUploadPicInput @func="getMsgFormSon"></systemUploadPicInput>
                </FormItem>

                <FormItem label="排序值" prop="sortOrder">
                    <InputNumber :max="1000" :min=0 v-model="newXQ.sortOrder"></InputNumber>
                    <span style="margin-left:5px">值越小越靠前，支持小数</span>
                </FormItem>
            </Form>
            <Alert show-icon>
                默认可查看全部数据，自定义数据范围请点击选择下方数据
            </Alert>
            <div v-if="dataType!=0" style="margin-top:15px">
                <Tree ref="depTree" :data="depData" :load-data="loadData" @on-toggle-expand="expandCheckDep" multiple style="margin-top:15px"></Tree>
                <Spin size="large" v-if="depTreeLoading"></Spin>
            </div>
            <div slot="footer">
                <Button type="text" @click="BJModalVisible=false">取消</Button>
                <Button type="primary" :loading="submitLoading" @click="submitBJ">提交</Button>

            </div>
        </Modal>
        <frame-table ref="frameTable" :data-list="tableData" :columns="tableColumns" :open.sync="frameTableModal"></frame-table>
        <!--njp 20190717新增编辑弹出窗口end-->
        <frame-edit  :open.sync="modalEdit" :formInline="formInline" @dataChange="editChange"></frame-edit>
    </div>
</template>

<script>
    import {
        editSystem,
        getSystemById,
        addSubsystemNews,
        delSsystem,
        getSystemPageVoMap,//条件查询系统
        getNewById,//根据id查询系统
        deleteNew,//删除系统
        addNews,
        addSystem,
        getNews,
        getRoleList,
        getAllPermissionList,
        addRole,
        editRole,
        deleteRole,
        setDefaultRole,
        editRolePerm,
        initDepartment,
        loadDepartment,
        editRoleDep,
        editNews,
    } from "@/api/index";
    import {
        getSMSBySys,
        delById,
        insertOrUpdate
    } from "@/api/receiveSMS";
    import {
        disableSubsystemUrl,
        enableSubsystemUrl
    }from "@/api/manage";
    import util from "@/libs/util.js";
    import circleLoading from "@/views/my-components/circle-loading.vue";
    import textarea from "@/views/jiuqiVue/myTemplate/textarea.vue";
    import systemUploadPicInput from "@/views/jiuqiVue/myTemplate/systemUploadPicInput.vue";
    import frameTable  from '@/components/common/table/frame-table'
    import frameEdit  from './common/frame-edit'
    //import MyUploadPicInput from "@/views/my-components/xboot/MyUploadPicInput";
    // import  uploadPicInput from "";
    export default {
        name: "subsystem-interface",
        components: {
            circleLoading,
            textarea,
            systemUploadPicInput,
            frameTable,
            frameEdit
           // MyUploadPicInput
        },
        data() {
            return {
                frameTableModal:false,
                tableData:[],
                tableColumns: [
                    {
                        title: '姓名',
                        key: 'name'
                    },
                    {
                        title: '手机号',
                        key: 'telephone',
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
                                                this.$refs.frameTable.deleteClick(row._index)
                                                delById({id:row.id}).then(res=>{
                                                    if(res.success){
                                                        this.$Message.success("删除成功");
                                                    }
                                                })

                                            }
                                        });

                                    }
                                }
                            }, '删除');
                        }
                    },
                ],//
                modalEdit:false,
                formInline:{
                    name:'',
                    telephone:'',
                    sysId:''
                },
                dropDownContent: "展开",
                drop:false,
                loading: true,
                treeLoading: true,
                depTreeLoading: true,
                operationLoading: false,
                submitPermLoading: false,
                submitDepLoading: false,
                searchKey: "",
                //modefy nijianping for jiuqi-portal-系统 20190715 begin
                //在使用mybatis-plus是按照时间排序需要传这个字段
                sortColumn: "create_time",
                //modefy nijianping for jiuqi-portal-系统 20190715 end

                //njp详情表单 begin
                mymodalType: 0,
                mymodalTitle: "",
                // njp 详情显示 20190715 begin
                myModalVisible:false,
                // njp 详情显示 20190715 end
                //njp详情表单 end
                //njp 20190717 系统编辑表单显示字段 begin
                BJmodalType: 0,
                BJmodalTitle: "",
                BJModalVisible:false,
                //njp 20190717 系统编辑表单显示字段 end

                sortType: "desc",
                modalType: 0,
                roleModalVisible: false,
                permModalVisible: false,
                depModalVisible: false,

                modalTitle: "",
                //子系统类型对象数组
                types: [{id:"OA",name:"OA"},{id:"CW",name:"财务"},{id:"",name:"其他"}],
                roleForm: {
                    name: "",
                    description: ""
                },

                //20190722 njp子系统系统对象
                editSubsystemNews: {
                    imageUrl:"",
                    sysName: "",
                    url: "",
                    description: "",
                    sortOrder: 0,
                    infoType: "",
                },

                editSubsystemNewsValidate: {
                    sysName: [
                        { required: true, message: "名称不能为空", trigger: "blur" }
                    ],
                    url: [
                        { required: true, message: "url不能为空", trigger: "blur" }
                    ],
                    description: [
                        { required: true, message: "备注不能为空", trigger: "blur" }
                    ],

                },

                //编辑系统提交数据的中间对象 njp20190722
                BJSubsystemNews:{
                    imageUrl: "",
                    id: "",
                    sysName: "",
                    url: "",
                    description: "",
                    sortOrder: "",
                },
                //添加系统表的对象
                newForm: {
                    newsTitle: "",//标题
                    newsConten: "",//内容
                    newsDesc: "",//描述
                    newsImagePath: "",//图片路径
                    newsRate: "0",//系统等级上
                    newsIsTop: "1",//是否置顶
                    imageId: "",//图片表id
                },
                newFormValidate: {
                    newsTitle: [
                        { required: true, message: "标题不能为空", trigger: "blur" }
                    ],
                    newsRate: [
                        { required: true, message: "系统等级不能为空", trigger: "blur" }
                    ],
                    newsIsTop: [
                        { required: true, message: "不能为空", trigger: "blur" }
                    ],
                },
                //系统编辑存储提交数据的对象 20190717 begin
                newBJForm: {
                    id: "",
                    newsTitle: "",//标题
                    newsConten: "",//内容
                    newsDesc: "",//描述
                    newsImagePath: "",//图片路径
                    newsRate: "0",//系统等级上
                    newsIsTop: "1",//是否置顶
                },
                //系统编辑存储提交数据的对象 20190717 end
                //add nijianping for jiuqi-系统 20190715 begin 
                //系统对象
                newXQ: {}
                /* newsTitle: "",//标题
                 newsConten: "",//内容
                 newsDesc: "",//描述
                 newsImagePath: "",//图片路径
                 newsRate: "",//系统等级上
                 newsIsTop: "",//是否置顶
                    warningStatus :是否预警
                 */


                ,
                //add nijianping for jiuqi-系统 20190715 end 
                roleFormValidate: {
                    name: [{ required: true, message: "角色名称不能为空", trigger: "blur" }]
                },
                sysFormValidate: {
                    sname: [{ required: true, message: "系统不能为空", trigger: "blur" }]
                },
                submitLoading: false,
                selectList: [],
                selectCount: 0,
                columns: [
                    {
                        type: "selection",
                        width: 60,
                        align: "center"
                    },
                    {
                        type: "index",
                        width: 60,
                        align: "center"
                    },

                    {
                        title: "系统名称",
                        key: "sysName",
                        minWidth: 120,

                    },
                    {
                        title: "url",
                        key: "url",
                        width: 150,

                    },

                    {
                        title: "图片地址",
                        key: "imageUrl",
                        width: 150,

                    },
                    {
                        title: "备注",
                        key: "description",
                        minWidth: 190,

                    },
                    {
                        title: "排序",
                        key: "sortOrder",
                        align:'center',
                        minWidth: 80,

                    },
                    {
                        title: "创建时间",
                        key: "createTime",
                        width: 160,


                    },
                    {
                        title: "更新时间",
                        key: "updateTime",
                        width: 160,

                    },
                    {
                        title: "数据类型",
                        key: "infoType",
                        minWidth: 80,

                    },
                    {
                        title: "连接状态",
                        key: "connStatus",
                        align:'center',
                        minWidth: 80,
                        render: (h, params) => {
                            let status=params.row.connStatus
                            let content=status==1?'正常':status==2?'异常':''
                            let color=status==1?'#1DAD5E':status==2?'red':''
                            return h('div', [
                                h('span', {
                                    style:{
                                        color:color
                                    }
                                },content)
                            ]);
                        }

                    },
                    {
                        title: "短信预警",
                        key: "warningStatus",
                        minWidth:180,
                        render: (h, params) => {
                            let status=params.row.warningStatus;
                            let content=status=='start'?'已开启':status=='stop'?'关闭':''
                            return h('div', [
                                h('span', {
                                    style:{
                                    marginRight:'5px',
                                        display:'inline-block',
                                        width:'40px',
                                    }
                                },content),
                                h('span', {
                                    style:{
                                        marginRight:'5px',
                                        color:'#1890FF',
                                        cursor:'pointer',
                                    },
                                    on: {
                                        click: () => {
                                            this. frameTableModal=true;
                                            this.getSMSBy(params.row.id,'tableData')

                                        }
                                    }
                                },'接收人'),
                                h('span', {
                                    style:{
                                        marginRight:'5px',
                                        color:'#1890FF',
                                        cursor:'pointer',//
                                    },
                                    on: {
                                        click: () => {
                                            if(params.row.id){
                                                this. modalEdit=true;
                                                this.formInline.sysId=params.row.id;
                                            }else {
                                                this.$Message.error('ID不存在!')
                                            }

                                        }
                                    }
                                },'添加')
                            ]);
                        }
                    },

                    {
                        title: "操作",
                        key: "action",
                        align: "center",
                        fixed: "right",
                        minWidth: 220,
                        render: (h, params) => {
                            /*njp add 20190729 启用/禁用begin*/
                            let WXenableOrDisable = "";
                            if (params.row.status == 0) {
                                WXenableOrDisable = h(
                                    "Button",
                                    {
                                        props: {
                                            size: "small"
                                        },
                                        style: {
                                            marginRight: "5px"
                                        },
                                        on: {
                                            click: () => {
                                                this.disable(params.row);
                                            }
                                        }
                                    },
                                    "禁用"
                                );
                            } else {
                                WXenableOrDisable = h(
                                    "Button",
                                    {
                                        props: {
                                            type: "success",
                                            size: "small"
                                        },
                                        style: {
                                            marginRight: "5px"
                                        },
                                        on: {
                                            click: () => {
                                                this.enable(params.row);
                                            }
                                        }
                                    },
                                    "启用"
                                );
                            }
                            /*njp add 20190729 启用/禁用end*/
                            return h("div", [

                                h(
                                    "Button",
                                    {
                                        props: {
                                            type: "primary",
                                            size: "small"
                                        },
                                        style: {
                                            marginRight: "5px"
                                        },
                                        on: {
                                            click: () => {
                                                this.editDep(params.row);
                                            }
                                        }
                                    },
                                    "编辑系统"
                                ),
                                WXenableOrDisable,
                                h(
                                    "Button",
                                    {
                                        props: {
                                            type: "error",
                                            size: "small"
                                        },
                                        on: {
                                            click: () => {
                                                this.remove(params.row);
                                            }
                                        }
                                    },
                                    "删除"
                                )
                            ]);
                        }
                    }
                ],
                data: [],
                pageNumber: 1,
                pageSize: 10,
                total: 0,
                permData: [],
                editRolePermId: "",
                selectAllFlag: false,
                depData: [],
                dataType: 0,
                editDepartments: [],
                //njp 20190716 控制文本编辑器显示的字段 begin
                editorModalTitle: "",
                editorModalVisible: false,
                //njp 20190716 控制文本编辑器显示的字段 end
                newImage:"",
                //条件查询的对象
                subsystemNews: {
                    sname: "",//系统标题
                    url: "",//部门
                    current: 1,
                    size: 10,
                    //sort: "create_time",
                    order: "desc",
                },
                types: [{id:"OA",name:"OA"},{id:"CW",name:"财务"},{id:"qt",name:"其他"}],
            };
        },
        watch:{
            frameTableModal(val){
                if(!val){

                }
            },
            tableData(val){
            }
        },
        methods: {
            editChange(item){
                insertOrUpdate(item).then(res=>{
                    if(res.success){
                        this.$Message.success('添加成功!');
                        this.formInline.name='';
                        this.formInline.telephone='';
                        this.formInline.sysId=''
                        this.modalEdit=false;
                    }else {
                        this.$Message.error('添加失败!');
                    }

                })
            },
            getSMSBy(id,key){
                getSMSBySys({sysId:id}).then(res=>{
                    if(res.success){
                        if(res.result ){
                            this[key]=res.result
                        }else {
                            this[key]=[]
                        }
                    }
                })
            },
            init() {
                this.getRoleList();
                // 获取所有菜单权限树
            },
            //禁用
            disable(v){
                this.$Modal.confirm({
                    title: "确认禁用",
                    content: "您确认要禁用用户 " + v.username + "的微信登录方式 ?",
                    onOk: () => {
                        this.operationLoading = true;
                        disableSubsystemUrl(v.id).then(res => {
                            this.operationLoading = false;
                            if (res.success == true) {
                                this.$Message.success("操作成功");
                                this.getRoleList();
                            }
                        });
                    }
                });
            },
            //启用
            enable(v){
                this.$Modal.confirm({
                    title: "确认启用",
                    content: "您确认要启用用户 " + v.username + "的微信登录方式 ?",
                    onOk: () => {
                        this.operationLoading = true;
                        enableSubsystemUrl(v.id).then(res => {
                            this.operationLoading = false;
                            if (res.success == true) {
                                this.$Message.success("操作成功");
                                this.getRoleList();
                            }
                        });
                    }
                });

            },
            //njp add 20190717 父组件接收子组件信息的方法 begin
            getMsgFormSon(data){
                this.newXQ.imageUrl=data.imageUrl;
                //njp 将回传的图片id赋值，并在提交后台
                //this.newForm.imageId=this.newImage.id;
               /* alert(this.newXQ.imageUrl);*/
            },
            //njp 20190717 父组件接收子组件信息的方法 end
            showEditor() {

                this.editorModalTitle="文本编辑器",
                    this.editorModalVisible= true

            },
            renderContent(h, { root, node, data }) {
                let icon = "";
                if (data.level == 0) {
                    icon = "ios-navigate";
                } else if (data.level == 1) {
                    icon = "md-list-box";
                } else if (data.level == 2) {
                    icon = "md-list";
                } else if (data.level == 3) {
                    icon = "md-radio-button-on";
                } else {
                    icon = "md-radio-button-off";
                }
                return h(
                    "span",
                    {
                        style: {
                            display: "inline-block",
                            cursor: "pointer"
                        },
                        on: {
                            click: () => {
                                data.checked = !data.checked
                            }
                        }
                    },
                    [
                        h("span", [
                            h("Icon", {
                                props: {
                                    type: icon,
                                    size: "16"
                                },
                                style: {
                                    "margin-right": "8px",
                                    "margin-bottom": "3px"
                                }
                            }),
                            h("span", { class: "ivu-tree-title" }, data.title)
                        ])
                    ]
                );
            },
            changePage(v) {
                this.subsystemNews.current = v;
                this.getRoleList();
                this.clearSelectAll();
            },
            changePageSize(v) {
                this.subsystemNews.size = v;
                this.getRoleList();
            },
            changeSort(e) {
                this.sortColumn = e.key;
                this.sortType = e.order;
                if (e.order == "normal") {
                    this.sortType = "";
                }
                this.getRoleList();
            },
            getRoleList() {
                this.loading = true;
                let params = {
                    pageNumber: this.pageNumber,
                    pageSize: this.pageSize,
                    sort: this.sortColumn,
                    order: this.sort
                };
                //njp测试
                /*  this.subsystemNews.title="test";
                  this.subsystemNews.department="OA";*/
                getSystemPageVoMap(this.subsystemNews).then(res => {
                    this.loading = false;
                    if (res.success == true) {
                        //因为mybatis-plus与jpa的返回格式不一样所以这里稍加改动
                        //this.data = res.result.content;
                        this.data = res.result.records;
                        this.total = res.result.total;
                    }
                });
            },

            // 递归标记禁用节点
            deleteDisableNode(permData) {
                let that = this;
                permData.forEach(function(e) {
                    if (e.status == -1) {
                        e.title = "[已禁用] " + e.title;
                        e.disabled = true;
                    }
                    if (e.children && e.children.length > 0) {
                        that.deleteDisableNode(e.children);
                    }
                });
            },
            cancelRole() {
                this.roleModalVisible = false;
            },
            submitNew() {
                this.$refs.editSubsystemNews.validate(valid => {
                    if (valid) {
                        if (this.modalType == 0) {
                            // 添加
                            this.submitLoading = true;
                            addSystem(this.editSubsystemNews).then(res => {
                                this.submitLoading = false;
                                if (res.success == true) {
                                    this.$Message.success("操作成功");
                                    this.getRoleList();
                                    this.roleModalVisible = false;
                                    this.newImage="";
                                }
                            });
                        }
                    }
                });
            },
            /*
                    newsIsTop: "",//是否置顶*/
            //系统编辑的提交
            submitBJ() {

                this.submitLoading = true;
                this.BJSubsystemNews.id=this.newXQ.id;
                this.BJSubsystemNews.sysName=this.newXQ.sysName;
                this.BJSubsystemNews.url=this.newXQ.url;
                this.BJSubsystemNews.description=this.newXQ.description;
                this.BJSubsystemNews.imageUrl=this.newXQ.imageUrl;
                this.BJSubsystemNews.sortOrder=this.newXQ.sortOrder;
                this.BJSubsystemNews.warningStatus=this.newXQ.warningStatus;
                editSystem(this.BJSubsystemNews).then(res => {
                    this.submitLoading = false;
                    if (res.success == true) {
                        this.$Message.success("操作成功");
                        this.getRoleList();
                        this.BJModalVisible = false;
                    }
                });


            },
            addRole() {
                this.modalType = 0;
                this.modalTitle = "添加系统";
                this.$refs.roleForm.resetFields();
                delete this.roleForm.id;
                this.roleModalVisible = true;
            },
            addSystem() {
                this.modalType = 0;
                this.modalTitle = "添加系统";

                this.$refs['editSubsystemNews'].resetFields(),
                    //清空表begin
                    /*  this.newForm.newsTitle="";
                      this.newForm.newsConten="";
                      this.newForm.newsDesc="";
                      this.newForm.newsImagePath="";
                      this.newForm.newsRate="";
                      this.newForm.newsIsTop="";
                      this.newForm.imageId="";*/
                    //清空表end


                    delete this.editSubsystemNews.id;
                this.roleModalVisible = true;
            },
            edit(v) {
                this.modalType = 1;
                this.modalTitle = "编辑角色";
                this.$refs.roleForm.resetFields();
                // 转换null为""
                for (let attr in v) {
                    if (v[attr] == null) {
                        v[attr] = "";
                    }
                }
                let str = JSON.stringify(v);
                let roleInfo = JSON.parse(str);
                this.roleForm = roleInfo;
                this.roleModalVisible = true;
            },
            remove(v) {
                this.$Modal.confirm({
                    title: "确认删除",
                    content: "您确认要删除 " + v.sysName + " ?",
                    onOk: () => {

                        this.operationLoading = true;

                        delSsystem(v.id).then(res => {
                            this.operationLoading = false;
                            if (res.success == true) {
                                this.$Message.success("删除成功");
                                this.getRoleList();
                            }
                        });
                    }
                });
            },
            setDefault(v) {
                this.$Modal.confirm({
                    title: "确认设置",
                    content: "您确认要设置所选的 " + v.name + " 为注册用户默认角色?",
                    onOk: () => {
                        let params = {
                            id: v.id,
                            isDefault: true
                        };
                        this.operationLoading = true;
                        setDefaultRole(params).then(res => {
                            this.operationLoading = false;
                            if (res.success == true) {
                                this.$Message.success("操作成功");
                                this.getRoleList();
                            }
                        });
                    }
                });
            },
            clearSelectAll() {
                this.$refs.table.selectAll(false);
            },
            changeSelect(e) {
                this.selectList = e;
                this.selectCount = e.length;
            },
            delAll() {
                if (this.selectCount <= 0) {
                    this.$Message.warning("您还未选择要删除的数据");
                    return;
                }
                this.$Modal.confirm({
                    title: "确认删除",
                    content: "您确认要删除所选的 " + this.selectCount + " 条数据?",
                    onOk: () => {
                        let ids = "";
                        this.selectList.forEach(function(e) {
                            ids += e.id + ",";
                        });
                        ids = ids.substring(0, ids.length - 1);
                        this.operationLoading = true;
                        delSsystem(ids).then(res => {
                            this.operationLoading = false;
                            if (res.success == true) {
                                this.$Message.success("删除成功");
                                this.clearSelectAll();
                                this.getRoleList();
                            }
                        });
                    }
                });
            },
            //njp 控制详情页 begin
            editPerm(v) {

                this.mymodalType = 0;
                this.mymodalTitle = "系统详情";
                this.myModalVisible = true;
                //njp 20190715 通过id查询系统详情 begin
                getNewById(v.id).then(res => {


                    this.operationLoading = false;
                    if (res.success == true) {
                        this.newXQ = res.result;
                        this.newForm.newsConten= this.newXQ.newsConten;
                        //this.$Message.success("删除成功");
                        //this.getRoleList();
                    }
                });

            },
            //njp 控制详情页 end
            // 递归判断子节点
            checkPermTree(permData, rolePerms) {
                let that = this;
                permData.forEach(function(p) {
                    if (that.hasPerm(p, rolePerms)&&p.status!=-1) {
                        p.checked = true;
                    } else {
                        p.checked = false;
                    }
                    if (p.children && p.children.length > 0) {
                        that.checkPermTree(p.children, rolePerms);
                    }
                });
            },
            // 判断角色拥有的权限节点勾选
            hasPerm(p, rolePerms) {
                let flag = false;
                for (let i = 0; i < rolePerms.length; i++) {
                    if (p.id == rolePerms[i].permissionId) {
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    return true;
                }
                return false;
            },
            // 全选反选
            selectTreeAll() {
                this.selectAllFlag = !this.selectAllFlag;
                let select = this.selectAllFlag;
                this.selectedTreeAll(this.permData, select);
            },
            // 递归全选节点
            selectedTreeAll(permData, select) {
                let that = this;
                permData.forEach(function(e) {
                    e.checked = select;
                    if (e.children && e.children.length > 0) {
                        that.selectedTreeAll(e.children, select);
                    }
                });
            },
            submitPermEdit() {
                this.submitPermLoading = true;
                let permIds = "";
                let selectedNodes = this.$refs.tree.getCheckedNodes();
                selectedNodes.forEach(function(e) {
                    permIds += e.id + ",";
                });
                permIds = permIds.substring(0, permIds.length - 1);
                editRolePerm({
                    roleId: this.editRolePermId,
                    permIds: permIds
                }).then(res => {
                    this.submitPermLoading = false;
                    if (res.success == true) {
                        this.$Message.success("操作成功");
                        util.initRouter(this);
                        this.getRoleList();
                        this.permModalVisible = false;
                    }
                });
            },
            cancelPermEdit() {
                this.permModalVisible = false;
            },
            loadData(item, callback) {
                loadDepartment(item.id, { openDataFilter: false }).then(res => {
                    if (res.success == true) {
                        res.result.forEach(function(e) {
                            e.selected = false;
                            if (e.isParent) {
                                e.loading = false;
                                e.children = [];
                            }
                            if (e.status == -1) {
                                e.title = "[已禁用] " + e.title;
                                e.disabled = true;
                            }
                        });
                        callback(res.result);
                    }
                });
            },
            //系统编辑
            editDep(v) {
                this.BJmodalType = 0;
                this.BJmodalTitle = "编辑";
                this.BJModalVisible = true;

                //njp 20190715 通过id查询系统详情 begin
                getSystemById(v.id).then(res => {

                    this.operationLoading = false;
                    if (res.success == true) {
                        this.newXQ = res.result;
                        this.newForm.newsConten= this.newXQ.newsConten;
                        //this.$Message.success("删除成功");
                        //this.getRoleList();
                    }
                });
            },
            expandCheckDep(v) {
                // 判断展开子节点
                this.checkDepTree(v.children, this.editDepartments);
            },
            // 判断子节点
            checkDepTree(depData, roleDepIds) {
                let that = this;
                depData.forEach(function(p) {
                    if (that.hasDepPerm(p, roleDepIds)) {
                        p.selected = true;
                    } else {
                        p.selected = false;
                    }
                });
            },
            // 判断角色拥有的权限节点勾选
            hasDepPerm(p, roleDepIds) {
                let flag = false;
                for (let i = 0; i < roleDepIds.length; i++) {
                    if (p.id == roleDepIds[i].departmentId) {
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    return true;
                }
                return false;
            },
            submitDepEdit() {
                let depIds = "";
                if (this.dataType != 0) {
                    let selectedNodes = this.$refs.depTree.getSelectedNodes();
                    if (selectedNodes.length < 1) {
                        this.$Message.error("请至少选择一条数据");
                        return;
                    }
                    selectedNodes.forEach(function(e) {
                        depIds += e.id + ",";
                    });
                    depIds = depIds.substring(0, depIds.length - 1);
                }
                this.submitDepLoading = true;
                editRoleDep({
                    roleId: this.editRolePermId,
                    dataType: this.dataType,
                    depIds: depIds
                }).then(res => {
                    this.submitDepLoading = false;
                    if (res.success == true) {
                        this.$Message.success("操作成功");
                        this.getRoleList();
                        this.depModalVisible = false;
                    }
                });
            },
            //检索
            searchNews() {
                this.getRoleList();
            },
            //重置
            reset(){
                this.subsystemNews.sname="";
                this.subsystemNews.url="";
                this.getRoleList();
            },
            warningStatusChange(item){    //d短信预警开关变换
                if(item){
                    this.newXQ.warningStatus='start'
                }else {
                    this.newXQ.warningStatus='stop'
                }
            }
        },
        mounted() {
            this.init();
        }
    };
</script>
