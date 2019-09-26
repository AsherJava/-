<template>
    <div id="Tabs">
        <Tabs :animated="animated" type="card">
            <div v-if="custom">
                <TabPane  v-for="(item , index) in  title" :label="item" :key="index">
                    <div :class="TabPaneContent">
                        <slot :name="'content'+index">
                        </slot>
                    </div>
                </TabPane>
            </div>
            <div v-else>
                <TabPane label="员工信息表">
                    <div :class="TabPaneContent">
                        <Form ref="formInline" :model="formInline"  label-position="left" >
                            <div :class="classStaffFlex" >
                                <div >
                                    <FormItem  label="员工账号：" :label-width="80" :class="FormItem">
                                        <Input type="text" v-model="formInline.account" placeholder="" >
                                        </Input>
                                    </FormItem>
                                    <FormItem  label="性别：" :label-width="80"     :class="FormItem">
                                        <Input type="text" v-model="formInline.sex" placeholder="">
                                        </Input>
                                    </FormItem>
                                </div>
                                <div >
                                    <FormItem  label="姓名：" :label-width="80"     :class="FormItem">
                                        <Input type="text" v-model="formInline.name" placeholder="" >
                                        </Input>
                                    </FormItem>
                                    <FormItem  label="年龄：" :label-width="80"     :class="FormItem">
                                        <Input type="text" v-model="formInline.age" placeholder="">
                                        </Input>
                                    </FormItem>
                                </div>
                                <div >
                                    <FormItem  label="薪资：" :label-width="80"      :class="FormItem">
                                        <Input type="text" v-model="formInline.salary" placeholder="" >
                                        </Input>
                                    </FormItem>
                                    <FormItem  label="出生日期：" :label-width="80"   :class="FormItem">
                                        <DatePicker type="date" v-model="formInline.birthDate" placement="bottom-start" placeholder="">
                                        </DatePicker>
                                    </FormItem>
                                </div>
                            </div>
                        </Form>
                    </div>
                </TabPane>
                <TabPane label="备注">
                    <div :class="TabPaneContent">
                        <div style="padding: 6px">
                            <Input v-model="value"  :autosize="{minRows: 4,maxRows: 6}" type="textarea" placeholder="" />
                        </div>

                    </div>
                </TabPane>
             </div>
        </Tabs>


    </div>
</template>

<script>
    export default {
        name: "detail-tabs",
        props:{
            title:{
                type: Array,
                default:function () {
                    return['员工信息表','备注']
                },
            },
            custom:{
                type:Boolean,
                default:false,
            },
            animated:{
                type:Boolean,
                default:false,
            },

            formInline:{
                type: Object,
                default:  function () {
                    return{
                        name:'',
                        sex:'',
                        age:'',
                        account:'',
                        birthDate:'',
                        salary:'',
                    }
                }
            },
            ruleInline:{
                type: Object,
                default:  function () {
                    return{
                        name:[],
                    }
                }
            },
            FormItem:{
                type: String,
                default: 'FormItem',
            },
            TabPaneContent:{
                type:String,
                default:'TabPaneContent',
            },
            classStaffFlex:{
                type: String,
                default:  "classStaffFlex"
            },
            value:{
                type:Array|Number|String,
                default:'',
            }
        }
    }
</script>

<style lang="less">
    #Tabs{
        .ivu-tabs{
            overflow: visible;
        }
        .ivu-tabs-bar{
          margin: 0;
        }
    }

    .FormItem{
        .ivu-form-item-label{
            text-align: right !important;
        }
    }
    textarea{
        resize: none;
    }
</style>
<style scoped lang="less">
    .classStaffFlex{
        display: flex;
        padding: 24px 24px 0 24px;

        >div{
            flex: 1;
        }
    }
    .TabPaneContent{
      border:1px solid #dcdee2;
        border-top: none;
    }
</style>
