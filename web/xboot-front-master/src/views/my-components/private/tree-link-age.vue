<template>
    <Drags :is-open="isOpen">
        <div slot="navs"  class="navs">
            <div style="border-bottom: 1px solid  #dcdee2">
                <div class="navs-header">
                    <div style="padding-left: 6px">
                        <span>名称：</span>
                        <Input v-model="searchInfo" search placeholder="请输入姓名搜索...." @on-change="handleSearch1"  style="width: 186px"/>
                    </div>
                </div>
                <!--<div class="navs-header">-->
                <!--<div style="padding: 6px">-->
                <!--<Input search enter-button placeholder="" style="width: 226px"/>-->
                <!--</div>-->
                <!--</div>-->
                <!--<div class="navs-header">-->
                <!--<div style="padding: 6px">-->
                <!--<Input search enter-button="查找" placeholder="" style="width: 226px"/>-->
                <!--</div>-->
                <!--</div>-->


            </div>
            <my-tree :data="data5" :rend="renderContent"></my-tree>

        </div>
        <div slot="button" class="flex">
            <div class="flex-child">
                <div class="left-l"  @click="isShow(false)">
                </div>
                <div class="right-r" @click="isShow(true)">
                </div>
         </div>
        </div>
        <div slot="content" class="content">
            <div class="navs-header">
                <div style="margin-left: 6px">
                    <Button type="primary" icon="md-add" @click="$refs.detailFrom.addRow()">添加</Button>
                    <Button  icon="md-trash" @click="del()">删除</Button>
                    <Button  icon="ios-filing" @click="save()">保存</Button>
                </div>

            </div>
              <div class="detailBox">
                  <detail-from
                          ref="detailFrom"
                          classButton="buttonNone"
                          :max-height="600"
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
              </div>


        </div>
    </Drags>
</template>

<script>
    import Drags from  "@/views/my-components/private/components/drags";
    import DetailFrom from  "@/views/my-components/private/components/DetailFrom";
    import myTree from  "@/views/my-components/private/components/my-tree";
    import {mockData}  from '@/libs/data';
    import {search}  from '@/libs/data';
    import $ from 'jquery'
    export default {
        name: "tree-link-age",
        components:{
            Drags,
            DetailFrom,
            myTree
        },
        props:{
        },
        filters: {
            capitalize: function (value) {
                if (!value) return ''
                value = value.toString()
                return value.charAt(0).toUpperCase() + value.slice(1)
            }
        },
        data(){
            return{
                TableData:'',
                searchInfo:'',
                isOpen:true,
                pageSize:10,
                data1:[],
                columns1:[
                    {
                        title: '员工账号',
                        key: 'name'
                    },
                    {
                        title: '姓名',
                        key: 'name',
                        render:(h,params)=>{
                            const row=params.row

                            return h('Input', {
                                props: {
                                    type:'text',
                                    value:  this.data1[params.index].name,
                                },
                                on: {
                                    'on-blur': (event) => {
                                        this.data1[params.index].name = event.target.value;

                                    },
                                }
                            });
                        }

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
                },//右表
                data5: [
                    {
                        title: '行政部门',
                        expand: true,
                        render: (h, { root, node, data }) => {
                            return h('span', {
                                style: {
                                    display: 'inline-block',
                                    width: '100%'
                                }
                            }, [
                                h('span', [
                                    h('Icon', {
                                        props: {
                                            type: 'ios-folder-outline'
                                        },
                                        style: {
                                            marginRight: '8px'
                                        }
                                    }),
                                    h('span', data.title)
                                ]),
                                h('span', {
                                    style: {
                                        display: 'inline-block',
                                        float: 'right',
                                        marginRight: '32px'
                                    }
                                }, [
                                    h('Button', {
                                        props: Object.assign({}, this.buttonProps, {
                                            icon: 'ios-add',
                                            type: 'primary'
                                        }),
                                        style: {
                                            width: '64px'
                                        },
                                        on: {
                                            click: () => { this.append(data) }
                                        }
                                    })
                                ])
                            ]);
                        },
                        children: [
                            {
                                title: '人事部',
                                expand: true,
                                children: [
                                    {
                                        title: '人事-1部',
                                        expand: true
                                    },
                                    {
                                        title: '人事-2部',
                                        expand: true
                                    }
                                ]
                            },
                            {
                                title: '财务部',
                                expand: true,
                                children: [
                                    {
                                        title: '财务-1部',
                                        expand: true
                                    },
                                    {
                                        title: '财务2部',
                                        expand: true
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        title: '业务部门',
                        expand: true,
                        render: (h, { root, node, data }) => {
                            return h('span', {
                                style: {
                                    display: 'inline-block',
                                    width: '100%'
                                }
                            }, [
                                h('span', [
                                    h('Icon', {
                                        props: {
                                            type: 'ios-folder-outline'
                                        },
                                        style: {
                                            marginRight: '8px'
                                        }
                                    }),
                                    h('span', data.title)
                                ]),
                                h('span', {
                                    style: {
                                        display: 'inline-block',
                                        float: 'right',
                                        marginRight: '32px'
                                    }
                                }, [
                                    h('Button', {
                                        props: Object.assign({}, this.buttonProps, {
                                            icon: 'ios-add',
                                            type: 'primary'
                                        }),
                                        style: {
                                            width: '64px'
                                        },
                                        on: {
                                            click: () => { this.append(data) }
                                        }
                                    })
                                ])
                            ]);
                        },
                        children: [
                            {
                                title: '技术部',
                                expand: true,
                                children: [
                                    {
                                        title: '久其金建-1部',
                                        expand: true
                                    },
                                    {
                                        title: '久其金建-2部',
                                        expand: true
                                    }
                                ]
                            },
                            {
                                title: '市场销售部',
                                expand: true,
                                children: [
                                    {
                                        title: '市场销售-1部',
                                        expand: true
                                    },
                                    {
                                        title: '市场销售-2部',
                                        expand: true
                                    }
                                ]
                            }
                        ]
                    }
                ],
                buttonProps: {
                    type: 'default',
                    size: 'small',
                }//左树

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
                this.TableData=mockData(this.pageSize)
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
                this.formInline=data.index;

            },//点击行获取数据
            isShow(item){
                this.isOpen=item
            },//拖拽开关和树显示开关,
            del(){
                this.$refs.detailFrom.delTip(this.formInline)
                this.formInline='none';
            },//删除加提示
            save(){
                this.$Message.success("保存成功");
            },//保存功能
            search (data, argumentObj) {
                let res = data;
                let dataClone = data;
                for (let argu in argumentObj) {
                    if (argumentObj[argu].length > 0) {
                        res = dataClone.filter(d => {
                            return d[argu].indexOf(argumentObj[argu]) > -1;
                        });
                        dataClone = res;
                    }
                }
                return res;
            },
            handleSearch1 (e) {
                if (e.target.value === '') {
                  return  this.data1 = this.TableData;
                }
                this.data1 = this.search(this.data1,{name: this.searchInfo});
            },
            renderContent (h, { root, node, data }) {
                return h('span', {
                    style: {
                        display: 'inline-block',
                        width: '100%'
                    }
                }, [
                    h('span', [
                        h('Icon', {
                            props: {
                                type: 'ios-paper-outline'
                            },
                            style: {
                                marginRight: '8px'
                            }
                        }),
                        h('span', {
                            style:{

                            },
                            on:{
                                click:()=>{
                           this.detailFromInit()
                                }
                            }
                        },data.title)
                    ]),
                    h('span', {
                        style: {
                            display: 'inline-block',
                            float: 'right',
                            marginRight: '32px'
                        },

                    }, [
                        h('Button', {
                            props: Object.assign({}, this.buttonProps, {
                                icon: 'ios-add'
                            }),
                            style: {
                                marginRight: '8px'
                            },
                            on: {
                                click: () => { this.append(data) }
                            }
                        }),
                        h('Button', {
                            props: Object.assign({}, this.buttonProps, {
                                icon: 'ios-remove'
                            }),
                            on: {
                                click: () => { this.remove(root, node, data) }
                            }
                        })
                    ])
                ]);
            },
            append (data) {
                const children = data.children || [];
                children.push({
                    title: 'appended node',
                    expand: true
                });
                this.$set(data, 'children', children);
            },
            remove (root, node, data) {
                const parentKey = root.find(el => el === node).parent;
                const parent = root.find(el => el.nodeKey === parentKey).node;
                const index = parent.children.indexOf(data);
                parent.children.splice(index, 1);
            }
        },
        watch:{
        },
        mounted() {  // html渲染后
            this.init();
            this.$refs.detailFrom.clickCurrentRow(0)//默认选中


        }

    }
</script>

<style scoped lang="less">
    .navs{
        overflow: hidden;
    }
    .content{
        width: 100%;
        >div{
            width: 100%;
        }
    }
    .detailBox{
        padding: 0 16px;
    }
.flex{
    display: flex;
    align-items: center;
    width: 100%;
    height: 100%;
    .flex-child{
        display: inline-block;
        width: 100%;
        height: auto;
        cursor: pointer;
    }
}
.left-l{
    width: 100%;
    height: 12px;
    background:url("../../../assets/left-l.png") no-repeat;
    background-size: 100% 100%;
    margin-bottom: 10px;
}
.right-r{
    width: 100%;
    background:url("../../../assets/right-r.png") no-repeat;
    background-size: 100% 100%;
    height: 12px;
}
.buttonNone{
    display: none;
}
.navs-header{
    display: flex;
    align-items: center;
    height:40px;
    width: 100%;
    button{
        margin-left: 10px;
    }
}
</style>
