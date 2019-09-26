<template>
    <div>
        <Card>
            <Layout>
                <Sider hide-trigger style="background: #fff;max-width: 205px;flex: 0 0 205px;">
                    <Menu
                            active-name="1-1"
                            theme="light"
                            width="auto"
                            :open-names="['1','2']"
                            @on-select="currName=$event"
                    >
                        <Submenu name="1">
                            <template slot="title">
                                <Icon type="md-ionic"/>前端通用组件
                            </template>
                            <MenuItem name="1-1">详细表单</MenuItem>
                            <MenuItem name="1-2">详细子表格</MenuItem>
                            <MenuItem name="1-3"> 详细选项卡表单</MenuItem>
                            <MenuItem name="1-4">树型联动组件</MenuItem>
                            <MenuItem name="1-5">内嵌表单组件</MenuItem>
                            <MenuItem name="1-6">弹出树组件</MenuItem>
                            <MenuItem name="1-7">弹出表组件</MenuItem>
                            <MenuItem name="1-8">弹出编辑组件</MenuItem>
                            <MenuItem name="1-9">弹出穿梭框组件</MenuItem>
                            <MenuItem name="1-10">轮播图组件</MenuItem>
                        </Submenu>

                    </Menu>
                </Sider>
                <Content :style="{padding: '0 24px 24px 24px', minHeight: '280px', background: '#fff'}">
                  <Alert type="warning" show-icon>说明：基于iview组件的二次封装前端通用组件, <!--可拓展性强,功能可进一步拓展，缺少可联系添加(可在现有基础上进一步拓展) 元组件props：object/array  使用函数返回--></Alert>
                    <div v-show="currName=='1-1'">
                        <Divider class="blue" orientation="left">详细表单组件</Divider>
                        <form-pages></form-pages>
                        <h3 class="article">props-详细表单</h3>
                        <Table :columns="props" :data="data6" border size="small" width="1000"></Table>
                        <h3 class="article">events-详细表单</h3>
                        <Table :columns="events" :data="data7" border size="small" width="1000"></Table>
                        <h3 class="article">motheds-表单默认选中行</h3>
                        <Table :columns="slots" :data="data8" border size="small" width="1000"></Table>
                        <h3 class="article">slot-表单插槽</h3>
                        <Table :columns="slots" :data="data5" border size="small" width="1000"></Table>
                        <h3 class="article">props-分页器</h3>
                        <Table :columns="props" :data="data1" border size="small" width="1000"></Table>
                        <h3 class="article">events-分页器</h3>
                        <Table :columns=" events" :data="data2" border size="small" width="1000"></Table>
                        <h3 class="article">styles-分页器</h3>
                        <Table :columns="styles" :data="data3" border size="small" width="1000"></Table>
                        <h3 class="article">styles-新增按钮</h3>
                        <Table :columns="styles" :data="data4" border size="small" width="1000"></Table>
                    </div>
                    <div v-show="currName=='1-2'">
                        <Divider class="blue" orientation="left">详细子表格组件</Divider>
                        <Detail-grid></Detail-grid>
                    </div>
                    <div v-show="currName=='1-3'">
                        <Divider class="blue" orientation="left">详细选项卡表单组件</Divider>
                        <detail-tabs-pages></detail-tabs-pages>
                    </div>
                    <div v-show="currName=='1-4'">
                        <Divider class="blue" orientation="left">树型联动组件</Divider>
                        <tree-link-age>

                        </tree-link-age>
                    </div>
                    <div v-show="currName=='1-5'">
                        <Divider class="blue" orientation="left">内嵌表单组件</Divider>
                        <in-cell-pages>

                        </in-cell-pages>
                    </div>
                    <div v-show="currName=='1-6'">
                        <Divider class="blue" orientation="left">弹出树组件</Divider>
                        <frame-tree-pages></frame-tree-pages>
                    </div>
                    <div v-show="currName=='1-7'">
                        <Divider class="blue" orientation="left">弹出表组件</Divider>
                        <frame-table-pages></frame-table-pages>
                    </div>
                    <div v-show="currName=='1-8'">
                        <Divider class="blue" orientation="left">弹出编辑组件</Divider>
                        <frame-edit-pages></frame-edit-pages>
                    </div>
                    <div v-show="currName=='1-9'">
                        <Divider class="blue" orientation="left">弹出编辑组件</Divider>
                        <frame-transfer-pages></frame-transfer-pages>
                    </div>
                    <h3 class="article">提示</h3>
                    部分功能可以在iview文档组件了解,并基于组件添加
                </Content>
            </Layout>
        </Card>
    </div>
</template>

<script>
    import formPages  from '@/views/my-components/private/form-pages'
    import DetailGrid from '@/views/my-components/private/DetailGrid'
    import detailTabsPages from '@/views/my-components/private/detail-tabs-pages'
    import treeLinkAge from '@/views/my-components/private/tree-link-age'
    import inCellPages from '@/views/my-components/private/in-cell-pages'
    import frameTreePages from '@/views/my-components/private/frame-tree-pages'
    import frameTablePages from '@/views/my-components/private/frame-table-pages'
    import frameEditPages from '@/views/my-components/private/frame-Edit-pages'
    import frameTransferPages from '@/views/my-components/private/frame-transfer-pages'
    export default {
        name: "private-componetents",
        components: {
            formPages,
            DetailGrid,
            detailTabsPages,
            treeLinkAge,
            inCellPages,
            frameTreePages,
            frameTablePages,
            frameEditPages,
            frameTransferPages
        },
        data() {
            return {
                currName: "1-1",
                processModalVisible: false,
                icon: "",
                selectDeps: [],
                selectUsers: [],
                picUrl: "",
                processLoading: false,
                styles:[
                    {
                        title: "class",
                        key: "name",
                        width: 150
                    },
                    {
                        title: "描述",
                        key: "desc",
                        width: 300
                    },
                    {
                        title: "默认值",
                        key: "value"
                    }
                ],
                events: [
                    {
                        title: "事件名",
                        key: "name",
                        width: 150
                    },
                    {
                        title: "说明",
                        key: "desc",
                        width: 300
                    },
                    {
                        title: "返回值",
                        key: "value"
                    }
                ],
                props: [
                    {
                        title: "属性",
                        key: "name",
                        width: 130
                    },
                    {
                        title: "说明",
                        key: "desc"
                    },
                    {
                        title: "类型",
                        key: "type",
                        width: 130
                    },
                    {
                        title: "默认值",
                        key: "value"
                    }
                ],
                slots:[
                {
                    title: "名称",
                    key: "name",
                    width: 130
                },
                {
                    title: "说明",
                    key: "desc"
                },
                {
                    title: "用法",
                    key: "value",
                    width: 130
                },
            ],
                methods: [
                    {
                        title: "方法名",
                        key: "name",
                        width: 150
                    },
                    {
                        title: "说明",
                        key: "type",
                        width: 300
                    },
                    {
                        title: "参数",
                        key: "value"
                    }
                ],
                data1: [
                    {
                        name: "total",
                        desc: "数据总数",
                        type: " Number",
                        value: "100"
                    },
                    {
                        name: "current",
                        desc: "当前页码，支持 .sync 修饰符",
                        type: "Number",
                        value: "1"
                    },
                    {
                        name: "page-size",
                        desc: "每页条数",
                        type: "Number",
                        value: "10"
                    },
                    {
                        name: "show-sizer",
                        desc: "显示分页，用来改变page-size",
                        type: "Boolean",
                        value: "false"
                    },
                    {
                        name: "page-size-opts",
                        desc:
                            "每页条数切换的配置",
                        type: "Array",
                        value: "[10, 20, 30, 40]"
                    },
                    {
                        name: "show-total",
                        desc: "显示总页数",
                        type: "Boolean",
                        value: "true"
                    },
                    {
                        name: "show-elevator",
                        desc: "显示电梯，可以快速切换到某一页",
                        type: "Boolean",
                        value: "true"
                    }
                ],
                data2:[
                    {
                        name: "@on-change",
                        desc: "页码改变的回调，返回改变后的页码",
                        value: "页码"
                    },
                    {
                        name: "@on-page-size-change",
                        desc: "切换每页条数时的回调，返回切换后的每页条数",
                        value: "page-size"
                    },
                ],
                data3:[
                    {
                        name: "classPages",
                        desc: "分页器容器属性调整高度分页器是否居中等自行设置",
                        value: "flex 垂直居中 高度70px  text-align: right;(分页器居右) "
                    },
                    {
                        name: "classPagesPotion",
                        desc: " 与classPages一起使用 也可以通过他调整分页器位置  ",
                        value:  "width: 100%;" + " float: right;" + " position: relative;"
                    },
                    {
                        name: "classPage",
                        desc: "为刷新按钮预留位置",
                        value: "padding-right: 50px;"
                    },       {
                        name: "classReFlash",
                        desc: "刷新按钮样式",
                        value: "padding-right: 50px;"
                    }
                ],
                data4:[
                    {
                        name: "classButton",
                        desc: "按钮盒子样式可自行设置样式控制显示",
                        value: "   height: 70px;" +
                            "    display:flex;" +
                            "    align-items:center;"
                    }
                ],
                data5:[
                    {
                        name: "header",
                        desc: "给表单上面添加额外内容",
                        value: "<标签 slot='header'><\/标签>  "
                    }
                ],
                data6: [
                    {
                        name: "height",
                        desc: "表单高度",
                        type: " String|Number",
                        value: "--"
                    },
                    {
                        name: "columns",
                        desc: "表格列的配置",
                        type: "Array",
                        value:'[]',
                    },
                    {
                        name: "data",
                        desc: "表格行的配置",
                        type: "Array",
                        value:'[]',
                    },       {
                        name: "maxHeight",
                        desc: "表单最大高度",
                        type: "Number | String",
                        value:'--',
                    },       {
                        name: "border",
                        desc: "表单表格边框",
                        type: "Boolean",
                        value:'true',
                    },       {
                        name: "highlight-row",
                        desc: "选中行高亮",
                        type: "Boolean",
                        value:'true',
                    }

                ],
                data7:[

                    {
                        name: "@on-row-click",
                        desc: "表单行点击事件:单击某一行时触发",
                        value: "返回\n" +
                            "》当前行的数据\n" +
                            "》index"
                    },
                ],
                data8:[
                    {
                        name: "clickCurrentRow",
                        desc: "默认选中行",
                        value: "this.$refs.'ref名称'.clickCurrentRow(index)"
                    },

                ],
                data21: [
                    {
                        name: "columns",
                        desc: "表格列的配置",
                        type: "Array",
                        value:'[]',
                    }
                ]
            };
        },
        created(){
        },
        methods: {
            init() {
            },
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
