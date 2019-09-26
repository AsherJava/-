<template>
    <div :class="classStaffInfo">
        <Divider class="classStaffDivider" orientation="left">{{title}}</Divider>
        <div>

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

            <p v-model="formInline">{{formInline.account}}</p>
        </div>

    </div>
</template>

<script>
    export default {
        name: "staff-info",
        props:{
           title:{
                type: Number|String,
                default:'员工信息表',
            },
            classStaffInfo:{
                type: String,
                default:  "classStaffInfo"
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
        },
    }
</script>
<style lang="less">
    .FormItem{
        .ivu-form-item-label{
            text-align: right !important;
        }
    }
</style>
<style scoped lang="less">
.classStaffFlex{
    display: flex;
    padding: 0 24px;
    >div{
        flex: 1;
    }
}
.classStaffInfo{
    border: 1px solid #e8eaec;
    border-top: none;
}
    .classStaffDivider{
        margin: 0;
        margin-bottom: 10px;
        position: relative;
        top: -13px;
    }
</style>
