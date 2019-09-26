

<template>
    <div>
        <frame-medal  v-model="value" :Title="Title" Width="650">
                <div class="scrollTree">
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
                </div>

            <div slot="footer">
                <Button type="default" @click="changeOpen(1)">取消</Button>
                <Button type="primary" @click="changeOpen(2)">确认</Button>
            </div>
        </frame-medal>
    </div>
</template>

<script>
    import frameMedal  from '@/views/my-components/private/components/common/frame-medal'
    export default {
        name: "frame-edit",
        components:{
            frameMedal,
        },
        props:{
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
            open:{
                type:Boolean,
                default:false,
            },
            Title:{
                type:String|Number,
                default:'编辑页',
            },
        },
        data(){
            return{
                value:false,
            }

        },
        watch:{
            open(val){
                this.value=this.open;
            },
            value(val){
                this.$emit('update:open',val)
            }
        },
        methods:{
            changeOpen(index){
                if(index==1){
                }else if(index==2){

                    this.$emit('dataChange',this.formInline)
                }
                this.value=false;
            }
        }

    }
</script>

<style scoped lang="less">
    .scrollTree{
        padding-left: 16px;
    }
    .classStaffFlex{
        display: flex;
        padding: 24px 24px 0 24px;

    >div{
        flex: 1;
    }
    }
    .TabPaneContent{

    }
</style>
