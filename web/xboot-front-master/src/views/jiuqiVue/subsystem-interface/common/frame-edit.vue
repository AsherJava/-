

<template>
    <div>
        <frame-medal id="frameMal"  v-model="value" :Title="Title" Width="400">
                <div class="scrollTree">
                    <div :class="TabPaneContent">
                        <Form ref="formIn" :model="formInline" :rules="ruleValidate"  label-position="left" >
                            <div :class="classStaffFlex" >
                                <div >
                                    <FormItem  label="姓名：" :label-width="90" :class="FormItem" prop="name">
                                        <Input type="text" v-model="formInline.name" placeholder="" >
                                        </Input>
                                    </FormItem>
                                    <FormItem  label="电话号码：" :label-width="90"     :class="FormItem"  prop="telephone">
                                        <Input type="text" v-model="formInline.telephone" placeholder="">
                                        </Input>
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
    import frameMedal  from '@/components/common/modal/frame-medal'
    export default {
        name: "from-frame-edit",
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
                        telephone: '',
                        sysId:''
                    }
                }
            },
            open:{
                type:Boolean,
                default:false,
            },
            Title:{
                type:String|Number,
                default:'添加预警接收人',
            },
        },
        data(){
            const validatePhone = (rule, value, callback) => {
                let reg =  /^1[0-9]{10}$/;
               if(!reg.test(value)){
                    callback(new Error('电话号码输入不正确!'));
                }else {
                   callback()
               }
            };
            return{
                value:false,
                ruleValidate:{
                    name: [
                        { required: true, message: "姓名不能为空!", trigger: "blur" },
                    ],
                    telephone: [
                        { required: true, message: "电话号码不能为空!", trigger: "blur" },
                        {validator: validatePhone, trigger: 'blur' }
                    ],
                }
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
                    this.value=false;
                }else if(index==2){
                    this.$refs.formIn.validate((valid) => {
                        if (valid) {
                            this.$emit('dataChange',this.formInline);
                        } else {
                            this.$Message.error('失败!');
                        }
                    })
                }

            },

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
<style lang="less">
   #frameMal{
        .ivu-input-icon-validate{
            display: none !important;
        }
    }
</style>
