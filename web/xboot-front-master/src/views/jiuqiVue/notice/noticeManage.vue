<style lang="less">
    // @import "./roleManage.less";
</style>
<template>
    <div class="search">
        <br><br>
        <Row>
            <Col>
                <Card>
                    <Row class="operation">

                        <Button @click="addNotice" type="primary" icon="md-add">添加公告</Button>
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
                        <Page :current="pageNumber" :total="total" :page-size="pageSize" @on-change="changePage" @on-page-size-change="changePageSize" :page-size-opts="[10,20,50]" size="small" show-total show-elevator show-sizer></Page>
                    </Row>
                </Card>
            </Col>
        </Row>
        <!-- 新增公告 begin -->
        <Modal :title="modalTitle" v-model="NoticeModalVisible" :mask-closable='false' :width="500">
            <Form ref="noticeForm" :model="noticeForm" :label-width="80" :rules="noticeFormValidate">
                <FormItem label="公告标题" prop="noticeTitle">
                    <Input v-model="noticeForm.noticeTitle" placeholder="标题" autocomplete="off"/>
                    <p>{{newForm.newsTitle}}</p>
                </FormItem>

                <FormItem label="公告描述" prop="description">
                    <Input v-model="noticeForm.noticeDesc"  placeholder="描述"/>
                    <p>{{newForm.newsDesc}}</p>
                </FormItem>
                <FormItem label="公告内容" prop="name"  >
                    <Input  @on-focus="showEditor" type="textarea" :rows="4" placeholder="Enter something..." />
                </FormItem>
               <!-- <Form-item label="公告" prop="avatar">
                    <MyUploadPicInput @func="getMsgFormSon" ></MyUploadPicInput>
                    <p>{{newImage}}</p>
                </Form-item>-->

                <FormItem label="公告级别" prop="">
                    <!-- <Input v-model="newForm.newsRate" placeholder="级别"/>-->
                    <InputNumber :max="1000" :min=1 v-model="noticeForm.noticeRate"></InputNumber>
                    <span style="margin-left:5px">值越小越靠前，支持小数</span>
                </FormItem>
                <FormItem label="是否置顶" prop="noticeIsTop">
                    <Select v-model="noticeForm.noticeIsTop"  placeholder="请选择" autocomplete="off">
                        <Option   value="0" key="0">
                            是
                        </Option>
                        <Option   value="1" key="1">
                            否
                        </Option>
                    </Select>
                </FormItem>

            </Form>
            <div slot="footer">
                <Button type="text" @click="cancelNotice">取消</Button>
                <!--添加新公告闻提交-->
                <Button type="primary" :loading="submitLoading" @click="submitNotice">提交</Button>
            </div>
        </Modal>
        <!-- 新增公告 end -->
        <!--njp add 20190716 将富文本编辑器以按钮点击弹出编辑窗口  begin-->
<!--
        <Modal :title="editorModalTitle" v-model="editorModalVisible" :mask-closable='false'  :width="1000" :styles="{top: '60px'}" class="permModal">
-->
            <Modal v-model="editorModalVisible" fullscreen title="editorModalTitle Modal">
            <div >
                <quill-editor  v-model="noticeForm.noticeConten" ></quill-editor>
            </div>
        </Modal>
        <!--njp add 20190716 将富文本编辑器以按钮点击弹出编辑窗口  end-->







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
                <FormItem label="公告标题" prop="name">
                    <Input  v-model="noticeXQ.noticeTitle" placeholder="标题" readonly/>

                </FormItem>
                <FormItem label="公告描述" prop="description">
                    <Input v-model="noticeXQ.noticeDesc"  placeholder="描述" readonly/>

                </FormItem>
                <FormItem label="公告内容" prop="name">
                    <!--<Input v-model="sysForm.url" placeholder="内容"/>
                    <p>{{sysForm.url}}</p>-->

                    <Input @on-focus="showEditor" type="textarea" :rows="4" placeholder="Enter something..."  readonly/>

                </FormItem>
               <!-- <FormItem label="公告主图" prop="name">
                    <Input v-model="newXQ.newsImagePath" placeholder="url" readonly/>
                    <p>{{newForm.newsImagePath}}</p>
                </FormItem>-->
                <FormItem label="公告级别" prop="name">
                    <Input v-model="noticeXQ.noticeRate" placeholder="级别" readonly/>

                </FormItem>
                    <FormItem label="是否置顶" prop="noticeIsTop">
                        <Select v-model="istop.InfoIsTop"  placeholder="请选择" autocomplete="off">
                            <Option   value="0" key="0">
                                是
                            </Option>
                            <Option   value="1" key="1">
                                否
                            </Option>
                        </Select>
                    </FormItem>
            </Form>
            <Alert show-icon>
                poatal管理
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

            <Form ref="noticeBJForm" :model="noticeBJForm" :label-width="80" :rules="noticeFormValidate">
                <FormItem label="公告标题" prop="name">
                    <input  v-model="noticeXQ.id" type="hidden" />
                    <Input  v-model="noticeXQ.noticeTitle" placeholder="标题" />

                </FormItem>
                <FormItem label="公告描述" prop="description">
                    <Input v-model="noticeXQ.noticeDesc"  placeholder="描述" />

                </FormItem>
                <FormItem label="公告内容" prop="name">
                    <!--<Input v-model="sysForm.url" placeholder="内容"/>
                    <p>{{sysForm.url}}</p>-->

                    <Input @on-focus="showEditor" type="textarea" :rows="4" placeholder="Enter something..."  />

                </FormItem>
             <!--   <FormItem label="公告主图" prop="name">
                    <Input v-model="newXQ.newsImagePath" placeholder="url" />

                </FormItem>-->
                <FormItem label="公告级别" prop="">
                    <!-- <Input v-model="newForm.newsRate" placeholder="级别"/>-->
                    <InputNumber :max="1000" :min=1 v-model="noticeXQ.noticeRate"></InputNumber>
                    <span style="margin-left:5px">值越小越靠前，支持小数</span>
                </FormItem>
               <!-- <FormItem label="是否置顶" prop="name">
                    <Input v-model="noticeXQ.noticeIsTop" placeholder="" />
                </FormItem>-->
                <FormItem label="是否置顶" prop="name">
                    <!-- <Input v-model="newXQ.newsIsTop" placeholder="" readonly/>-->
                    <Select  v-model="istop.InfoIsTop"  placeholder="请选择">
                        <Option   value="0"  >
                            是
                        </Option>
                        <Option   value="1" >
                            否
                        </Option>
                    </Select>
                </FormItem>
            </Form>
            <Alert show-icon>
                poatal管理
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
        editNotice,//编辑方法
        getNoticeById,
        deleteNotice,//删除公告
        addNotice,//新增公告
        getNotice,
        getNewById,//根据id查询公告
        deleteNew,//删除公告
        addNews,
        addSystem,

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
    import util from "@/libs/util.js";
    import circleLoading from "@/views/my-components/circle-loading.vue";
    import textarea from "@/views/jiuqiVue/myTemplate/textarea.vue";

    import MyUploadPicInput from "@/views/my-components/xboot/MyUploadPicInput";
   // import  uploadPicInput from "";
    export default {
        name: "noticeManage",
        components: {
            circleLoading,
            textarea,

            MyUploadPicInput
        },
        data() {
            return {


                loading: true,
                treeLoading: true,
                depTreeLoading: true,
                operationLoading: false,
                submitPermLoading: false,
                submitDepLoading: false,
                searchKey: "",
                //modefy nijianping for jiuqi-portal-公告 20190715 begin
                //在使用mybatis-plus是按照时间排序需要传这个字段
                sortColumn: "create_time",
                //modefy nijianping for jiuqi-portal-公告 20190715 end

                //njp详情表单 begin
                mymodalType: 0,
                mymodalTitle: "",
                // njp 详情显示 20190715 begin
                myModalVisible:false,
                // njp 详情显示 20190715 end
                //njp详情表单 end
                //njp 20190717 公告编辑表单显示字段 begin
                BJmodalType: 0,
                BJmodalTitle: "",
                BJModalVisible:false,
                //njp 20190717 公告编辑表单显示字段 end

                sortType: "desc",
                modalType: 0,
                NoticeModalVisible: false,
                permModalVisible: false,
                depModalVisible: false,

                modalTitle: "",
                //子系统类型对象数组
                types: [{id:"OA",name:"OA"},{id:"CW",name:"财务"},{id:"qt",name:"其他"}],
                roleForm: {
                    name: "",
                    description: ""
                },
                //添加公告表对象 begin
                noticeForm: {
                    noticeTitle: "",//标题
                    noticeConten: "",//内容
                    noticeDesc: "",//描述

                    noticeRate: 1,//公告等级上
                    noticeIsTop: "1",//是否置顶
                },
                noticeFormValidate: {
                    noticeTitle: [
                        { required: true, message: "标题不能为空", trigger: "blur" }
                    ],
                    noticeRate: [
                        { required: true, message: "等级不能为空", trigger: "blur" }
                    ],
                    noticeIsTop: [
                       { required: true, message: "不能为空", trigger: "blur" }
                   ],

                },

                //公告编辑对象
                noticeBJForm: {
                    noticeTitle: "",//标题
                    noticeConten: "",//内容
                    noticeDesc: "",//描述

                    noticeRate: "",//公告等级上
                    noticeIsTop: "1",//是否置顶


                },
                //添加公告表对象 end
                //添加公告表的对象
                newForm: {
                    newsTitle: "",//标题
                    newsConten: "",//内容
                    newsDesc: "",//描述
                    newsImagePath: "",//图片路径
                    newsRate: 1,//公告等级上
                    newsIsTop: "",//是否置顶
                    imageId: "",//图片表id
                },
                //公告编辑存储提交数据的对象 20190717 begin
                newBJForm: {
                    id: "",
                    newsTitle: "",//标题
                    newsConten: "",//内容
                    newsDesc: "",//描述
                    newsImagePath: "",//图片路径
                    newsRate: "",//公告等级上
                    newsIsTop: "",//是否置顶
                },
                //公告编辑存储提交数据的对象 20190717 end
                //add nijianping for jiuqi-公告 20190715 begin 
                //20190718编辑公告对象
                noticeXQ: {},//补充字段
                istop: {
                    InfoIsTop: "1",
                },

                newXQ: {},
                //add nijianping for jiuqi-公告 20190715 end 
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
                        title: "公告标题",
                        key: "noticeTitle",
                        width: 150,

                    },
                    {
                        title: "公告描述",
                        key: "noticeDesc",
                        width: 150,

                    },
                    {
                        title: "公告级别",
                        key: "noticeRate",
                        minWidth: 190,

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
                                h(
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
                                ),
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
                                                this.editNotice(params.row);
                                            }
                                        }
                                    },
                                    "编辑"
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
            };
        },
        methods: {
            init() {
                this.getNoticeList();
                // 获取所有菜单权限树
            },
            //njp add 20190717 父组件接收子组件信息的方法 begin
            getMsgFormSon(data){

                this.newImage=data;
                //njp 将回传的图片id赋值，并在提交时传入后台
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
                this.pageNumber = v;
                this.getNoticeList();
                this.clearSelectAll();
            },
            changePageSize(v) {
                this.pageSize = v;
                this.getNoticeList();
            },
            changeSort(e) {
                this.sortColumn = e.key;
                this.sortType = e.order;
                if (e.order == "normal") {
                    this.sortType = "";
                }
                this.getNoticeList();
            },
            getNoticeList() {
                this.loading = true;
                let params = {
                    pageNumber: this.pageNumber,
                    pageSize: this.pageSize,
                    sort: this.sortColumn,
                    order: this.sort
                };
                getNotice(params).then(res => {

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
            cancelNotice() {
                this.NoticeModalVisible = false;
            },
            submitNotice() {
                this.$refs.noticeForm.validate(valid => {

                    if (valid) {
                            // 添加
                            this.submitLoading = true;
                        addNotice(this.noticeForm).then(res => {

                                this.submitLoading = false;
                                if (res.success == true) {

                                    this.$Message.success("操作成功");
                                    this.getNoticeList();
                                    this.NoticeModalVisible = false;
                                }
                            });
                        }
                });
            },

            //公告编辑的提交
            submitBJ() {

                this.$refs.noticeBJForm.validate(valid => {

                    if (valid) {
                        this.submitLoading = true;
                        //将编辑表的值赋值给要传给后台的对象

                        this.noticeBJForm.id=this.noticeXQ.id;
                        this.noticeBJForm.noticeConten=this.noticeForm.noticeConten;
                        this.noticeBJForm.noticeDesc=this.noticeXQ.noticeDesc;
                        this.noticeBJForm.noticeTitle=this.noticeXQ.noticeTitle;
                        this.noticeBJForm.noticeRate=this.noticeXQ.noticeRate;
                        //this.noticeBJForm.noticeIsTop=this.noticeXQ.noticeIsTop;
                        this.noticeBJForm.noticeIsTop=this.istop.InfoIsTop;
                        editNotice(this.noticeBJForm).then(res => {
                                this.submitLoading = false;
                                if (res.success == true) {
                                    this.$Message.success("操作成功");
                                    this.getNoticeList();
                                    this.BJModalVisible = false;
                                }
                            });
                        }
                });
            },
            addRole() {
                this.modalType = 0;
                this.modalTitle = "添加公告";
                this.$refs.roleForm.resetFields();
                delete this.roleForm.id;
                this.roleModalVisible = true;
            },
            addNotice() {

                this.modalType = 0;
                this.modalTitle = "新增公告";
                this.noticeForm.noticeConten="";
                this.$refs['noticeForm'].resetFields(),

                delete this.noticeForm.id;
                this.NoticeModalVisible = true;
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
                    content: "您确认要删除 " + v.noticeTitle + " ?",
                    onOk: () => {

                        this.operationLoading = true;

                        deleteNotice(v.id).then(res => {

                            this.operationLoading = false;
                            if (res.success == true) {
                                this.$Message.success("删除成功");
                                this.getNoticeList();
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
                                this.getNoticeList();
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
                                this.getNoticeList();
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
                        deleteNotice(ids).then(res => {
                            this.operationLoading = false;
                            if (res.success == true) {
                                this.$Message.success("删除成功");
                                this.clearSelectAll();
                                this.getNoticeList();
                            }
                        });
                    }
                });
            },
            //njp 控制详情页 begin
            editPerm(v) {

                this.mymodalType = 0;
                this.mymodalTitle = "公告详情";
                this.myModalVisible = true;
                //njp 20190715 通过id查询公告详情 begin
                getNoticeById(v.id).then(res => {
                    this.operationLoading = false;
                    if (res.success == true) {
                        this.noticeXQ = res.result;
                        this.noticeBJForm.noticeConten= this.noticeXQ.noticeConten;
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
                        this.getNoticeList();
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
            //公告编辑
            editNotice(v) {
                this.BJmodalType = 0;
                this.BJmodalTitle = "编辑";
                this.BJModalVisible = true;

                //njp 20190715 通过id查询公告详情 begin
                getNoticeById(v.id).then(res => {

                    this.operationLoading = false;
                    if (res.success == true) {
                        this.noticeXQ = res.result;

                        this.istop.InfoIsTop=this.noticeXQ.noticeIsTop+"";
                        this.noticeForm.noticeConten= this.noticeXQ.noticeConten;
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
                        this.getNoticeList();
                        this.depModalVisible = false;
                    }
                });
            }
        },
        mounted() {
            this.init();
        }
    };
</script>
<style lang="less">


    //文本编辑器
    .edit_container {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
        margin-top: 60px;
    }
    .ql-editor{
        height:1000px;
    }
</style>
