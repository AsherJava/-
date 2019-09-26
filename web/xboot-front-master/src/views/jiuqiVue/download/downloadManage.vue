<style lang="less">
    // @import "./roleManage.less";
</style>
<!--这是子系统的链接管理页面-->
<template>
    <div class="search">
        <Row>
            <Col>
                <Card>

                    <Row>

                        <Form ref="queryForm"  :model="queryForm" inline :label-width="70" class="search-form">
                            <Form-item label="标题" prop="username">
                                <Input
                                        v-model="queryForm.title"
                                        type="text"
                                        clearable
                                        placeholder="请输入标题"
                                        style="width: 200px"
                                />
                            </Form-item>
                            <Form-item label="部门" prop="department">
                               <!-- <Select v-model="queryForm.department"  placeholder="请选择">
                                    <Option v-for="type in types"  :value="type.id" :key="type.id">
                                        {{type.name}}
                                    </Option>
                                </Select>-->

                                <queryDepartmentXL :reset="chongzhi"  @on-change="querySelectDepTree"  ref="depTree"></queryDepartmentXL>
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


                    <Row class="operation">

                        <Button @click="addSystem" type="primary" icon="md-add">添加链接</Button>
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

                    <Row>
                        <!-- 这里是表格展示组件-->
                        <Table :loading="loading" border :columns="columns" :data="data" ref="table" sortable="custom" @on-sort-change="changeSort" @on-selection-change="changeSelect"></Table>
                    </Row>


                    <Row type="flex" justify="end" class="page">
                        <Page :current="queryForm.current" :total="total" :page-size="queryForm.size" @on-change="changePage" @on-page-size-change="changePageSize"  :page-size-opts="[10,20,50]" size="small" show-total show-elevator ></Page>

                    </Row>
                        <Row type="flex" justify="end" class="page">
                    </Row>
                </Card>
            </Col>
        </Row>
        <!-- 添加链接 njp -->
        <Modal :title="modalTitle" v-model="roleModalVisible" :mask-closable='false' :width="500">
            <Form ref="editSubsystemNews" :model="editSubsystemNews" :label-width="80" :rules="editSubsystemNewsValidate">
                <FormItem label="链接标题" prop="title">
                    <Input v-model="editSubsystemNews.title" placeholder="标题"/>
                </FormItem>
                <FormItem label="url" prop="url">
                    <Input v-model="editSubsystemNews.url"  placeholder="url"/>
                </FormItem>
                <FormItem label="部门" prop="department">
                  <!--  <Select v-model="editSubsystemNews.department"  placeholder="请选择">
                        <Option v-for="type in types"  :value="type.id" :key="type.id">
                            {{type.name}}
                        </Option>
                    </Select>-->
                    <queryDepartmentXL   @on-change="AddquerySelectDepTree"  ref="depTree"></queryDepartmentXL>
                </FormItem>
            </Form>
            <div slot="footer">
                <Button type="text" @click="cancelRole">取消</Button>
                <!--添加链接提交-->
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
        <!-- 数据权限 -->
        <Modal :title="modalTitle" v-model="depModalVisible" :mask-closable='false' :width="500" :styles="{top: '30px'}" class="depModal">
            <Form :label-width="65" >
                <FormItem label="数据范围">
                    <Select v-model="dataType">
                        <Option :value="0">全部数据权限</Option>
                        <Option :value="1">自定义数据权限</Option>
                    </Select>
                </FormItem>
            </Form>
            <Alert show-icon>
                交水建portal
            </Alert>
            <div v-if="dataType!=0" style="margin-top:15px">
                <Tree ref="depTree" :data="depData" :load-data="loadData" @on-toggle-expand="expandCheckDep" multiple style="margin-top:15px"></Tree>
                <Spin size="large" v-if="depTreeLoading"></Spin>
            </div>
            <div slot="footer">
                <Button type="text" @click="depModalVisible=false">取消</Button>
                <Button type="primary" :loading="submitDepLoading" @click="submitDepEdit">提交</Button>
            </div>
        </Modal>

        <!--njp 20190717新增编辑弹出窗口begin-->
        <Modal :title="BJmodalTitle" v-model="BJModalVisible" :mask-closable='false' :width="500">

            <Form ref="newXQ" :model="newXQ" :label-width="80" :rules="sysFormValidate">
                <FormItem label="链接标题" prop="name">
                    <input  v-model="newXQ.id" type="hidden" />
                    <Input  v-model="newXQ.title" placeholder="标题" />
                </FormItem>
                <FormItem label="链接url" prop="description">
                    <Input v-model="newXQ.url"  placeholder="描述" />
                </FormItem>

                <FormItem  label="部门" prop="name">
                  <!--  <Select v-model="newXQ.department"  placeholder="请选择">
                        <Option v-for="type in types"  :value="type.id" :key="type.id">
                            {{type.name}}
                        </Option>
                    </Select>-->
                    <JQdepartmenttree :depName="newXQ.department"  @on-change="handleSelectDepTree" @func="editDepTitle" ref="depTree"></JQdepartmenttree>
                </FormItem>
            </Form>
            <Alert show-icon>
                交水建portal管理
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
        <!--njp 20190717新增编辑弹出窗口end-->
    </div>
</template>

<script>
    import {
        getDownloadResourcesById,
        editDownloadResources,
        getDownloadResources,
        addDownloadResources,
        deldownloadResources,
        getSubsystemNews,//条件查询链接
        getNewById,//根据id查询链接
        deleteNew,//删除链接
        setDefaultRole,
        editRolePerm,
        loadDepartment,
        editRoleDep,
    } from "@/api/index";
    import util from "@/libs/util.js";
    import circleLoading from "@/views/my-components/circle-loading.vue";
    import textarea from "@/views/jiuqiVue/myTemplate/textarea.vue";
    import queryDepartmentXL from "@/views/jiuqiVue/myTemplate/queryDepartmentXL.vue";
    import MyUploadPicInput from "@/views/my-components/xboot/MyUploadPicInput";
    import JQdepartmenttree from "@/views/jiuqiVue/myTemplate/JQdepartment-tree.vue";
    // import  uploadPicInput from "";
    export default {
        name: "downloadManage",
        components: {
            JQdepartmenttree,
            queryDepartmentXL,
            circleLoading,
            textarea,

            MyUploadPicInput
        },
        data() {
            return {
                dropDownContent: "展开",
                drop:false,
                loading: true,
                treeLoading: true,
                depTreeLoading: true,
                operationLoading: false,
                submitPermLoading: false,
                submitDepLoading: false,
                searchKey: "",
                chongzhi:"",
                //modefy nijianping for jiuqi-portal-链接 20190715 begin
                //在使用mybatis-plus是按照时间排序需要传这个字段
                sortColumn: "create_time",
                //modefy nijianping for jiuqi-portal-链接 20190715 end

                //njp详情表单 begin
                mymodalType: 0,
                mymodalTitle: "",
                // njp 详情显示 20190715 begin
                myModalVisible:false,
                // njp 详情显示 20190715 end
                //njp详情表单 end
                //njp 20190717 链接编辑表单显示字段 begin
                BJmodalType: 0,
                BJmodalTitle: "",
                BJModalVisible:false,
                //njp 20190717 链接编辑表单显示字段 end

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

                //20190722 njp子系统链接对象
                editSubsystemNews: {
                    title: "",
                    url: "",
                    department: "",
                },

                editSubsystemNewsValidate: {
                    title: [
                        { required: true, message: "标题不能为空", trigger: "blur" }
                    ],
                    url: [
                        { required: true, message: "url不能为空", trigger: "blur" }
                    ],
                    department: [
                        { required: true, message: "不能为空", trigger: "blur" }
                    ],

                },

                //编辑链接提交数据的中间对象 njp20190724
                BJInfo:{
                        id: "",
                        title: "",
                        url: "",
                        department: "",
                },
                //添加链接表的对象
                newForm: {
                    newsTitle: "",//标题
                    newsConten: "",//内容
                    newsDesc: "",//描述
                    newsImagePath: "",//图片路径
                    newsRate: "0",//链接等级上
                    newsIsTop: "1",//是否置顶
                    imageId: "",//图片表id
                },
                newFormValidate: {
                    newsTitle: [
                        { required: true, message: "标题不能为空", trigger: "blur" }
                    ],
                    newsRate: [
                        { required: true, message: "链接等级不能为空", trigger: "blur" }
                    ],
                    newsIsTop: [
                        { required: true, message: "不能为空", trigger: "blur" }
                    ],
                },
                //链接编辑存储提交数据的对象 20190717 begin
                newBJForm: {
                    id: "",
                    newsTitle: "",//标题
                    newsConten: "",//内容
                    newsDesc: "",//描述
                    newsImagePath: "",//图片路径
                    newsRate: "0",//链接等级上
                    newsIsTop: "1",//是否置顶
                },
                //链接编辑存储提交数据的对象 20190717 end
                //add nijianping for jiuqi-链接 20190715 begin 
                //链接对象
                newXQ: {}
                /* newsTitle: "",//标题
                 newsConten: "",//内容
                 newsDesc: "",//描述
                 newsImagePath: "",//图片路径
                 newsRate: "",//链接等级上
                 newsIsTop: "",//是否置顶*/

                ,
                //add nijianping for jiuqi-链接 20190715 end 
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
                        title: "链接标题",
                        key: "title",
                        width: 150,

                    },
                    {
                        title: "url",
                        key: "url",
                        //width: 150,
                        minWidth: 190,
                    },
                    {
                        title: "部门",
                        key: "department",
                        width: 150,
                    },

                    {
                        title: "创建时间",
                        key: "createTime",
                        width: 160,
                        sortType: "desc"
                    },
                    {
                        title: "更新时间",
                        key: "updateTime",
                        width: 160,

                    },

                    {
                        title: "操作",
                        key: "action",
                        align: "center",
                        fixed: "right",
                        width: 300,
                        render: (h, params) => {
                            return h("div", [
                              /*  h(
                                    "Button",
                                    {
                                        props: {
                                            type: "warning",
                                            size: "small"
                                        },
                                        style: {
                                            marginRight: "5px"
                                        },
                                        on: {
                                            click: () => {
                                                this.editPerm(params.row);
                                            }
                                        }
                                    },
                                    "查看详情"
                                ),*/
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
                                    "编辑链接"
                                ),

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
                queryForm: {
                    title: "",//链接标题
                    department: "",//部门
                    current: 1,
                    size: 10,
                    //sort: "create_time",
                    order: "desc",
                },
                types: [{id:"OA",name:"OA"},{id:"CW",name:"财务"},{id:"qt",name:"其他"}],
            };
        },
        methods: {
            init() {
                this.getRoleList();
                // 获取所有菜单权限树
            },
            //njp add 20190717 父组件接收子组件信息的方法 begin
            getMsgFormSon(data){

                this.newImage=data;
                //njp 将回传的图片id赋值，并在提交后台
                this.newForm.imageId=this.newImage.id;

            },
            //njp 20190717 父组件接收子组件信息的方法 end
            showEditor() {

                this.editorModalTitle="文本编辑器",
                    this.editorModalVisible= true

            },

            options() {
                var array= [
                    { text: 'One', value: 'A' },
                    { text: 'Two', value: 'B' },
                    { text: 'Three', value: 'C' }
                ];
                return array;

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
                this.queryForm.current = v;
                this.getRoleList();
                this.clearSelectAll();
            },
            changePageSize(v) {
                this.queryForm.size = v;
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
                getDownloadResources(this.queryForm).then(res => {
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
                            addDownloadResources(this.editSubsystemNews).then(res => {

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
            //链接编辑的提交
            submitBJ() {
                        this.submitLoading = true;
                        this.BJInfo.id=this.newXQ.id;
                        this.BJInfo.title=this.newXQ.title;
                        //this.BJInfo.department=this.newXQ.department;
                        this.BJInfo.url=this.newXQ.url;
                editDownloadResources(this.BJInfo).then(res => {
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
                this.modalTitle = "添加链接";
                this.$refs.roleForm.resetFields();
                delete this.roleForm.id;
                this.roleModalVisible = true;
            },
            addSystem() {

                this.modalType = 0;
                this.modalTitle = "添加链接";

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
                    content: "您确认要删除 " + v.title + " ?",
                    onOk: () => {

                        this.operationLoading = true;

                        deldownloadResources(v.id).then(res => {
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
            cancelDefault(v) {
                this.$Modal.confirm({
                    title: "确认取消",
                    content: "您确认要取消所选的 " + v.name + " 角色为默认?",
                    onOk: () => {
                        let params = {
                            id: v.id,
                            isDefault: false
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
                        deldownloadResources(ids).then(res => {
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
                this.mymodalTitle = "链接详情";
                this.myModalVisible = true;
                //njp 20190715 通过id查询链接详情 begin
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
            //链接编辑
            editDep(v) {
                this.BJmodalType = 0;
                this.BJmodalTitle = "编辑";
                this.BJModalVisible = true;

                //njp 20190715 通过id查询链接详情 begin
                getDownloadResourcesById(v.id).then(res => {

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
                this.queryForm.title="";
                this.queryForm.department="";
                this.chongzhi=Math.random()+ new Date().toLocaleString();
                this.getRoleList();
            },
            querySelectDepTree(v){
                //部门id
                v.id;
                //部门名字
                this.queryForm.department=v.value;
            },
            AddquerySelectDepTree(v){
                this.editSubsystemNews.department=v.value;
            },
            //部门id暂时不用
            handleSelectDepTree(v) {
                let id = v[0];
            },
            //接受部门的名字
            editDepTitle(data){
                this.BJInfo.department=data;
            },
        },
        mounted() {
            this.init();
        }
    };
</script>
