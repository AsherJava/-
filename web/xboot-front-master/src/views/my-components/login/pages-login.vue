<template>
    <div id="pages-login">
        <div class="main">
            <div class="pic ">
              <div class="wh flex">
                  <span class="span-img">
                       <img src="../../../assets/pages-login/jiaozhi.png" alt="">
                  </span>

              </div>
            </div>
            <div class="login">
                <div class="login-flex-hc">
                    <div class="login-flex-child">
                        <div class="title">
            <span>
                欢迎登录
            </span>
                        </div>
                        <p class="line-p">
                            <span class="line"></span>
                        </p>
                        <div class="switch">
                   <span class="switch-span">
                       <span v-for="(item ,index) in singleSelect" :key="index" class="election">
                           <span :class="{switchButton:openIndex==index?isShow[1]:isShow[0],switchButtonSelect:openIndex==index?isShow[0]:isShow[1]}"  @click="electionClick(index)"></span>
                           <span>{{item}}</span>
                       </span>
                   </span>
                        </div>
                        <div class="login-content">
                    <div v-if="openIndex==0">
                        <input-use :data.sync="data1" placeholder="请输入用登录账号"></input-use>

                        <input-use is-icon="lock"  placeholder="请输入登录密码"></input-use>
                    </div>
                            <div v-if="openIndex==1">
                                <input-use is-icon="code" :data.sync="data1" placeholder="请输入APP动态码"></input-use>

                            </div>
                            <div v-if="openIndex==2">
                                <input-use :data.sync="data1" placeholder="请输入企业微信或手机号"></input-use>
                                <input-use is-icon="code" :data.sync="data1" placeholder="企业微信动态码"></input-use>

                            </div>
                            <div>
                                <button class="deng">登 录</button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>



        </div>

    </div>
</template>
<script>
    import  inputUse from './compontets/input-use'
    export default {
        name: "pages-login",
        components:{
            inputUse
        },
        data() {
            return {
                data1:'',
                isShow:[true,false],
                openIndex:0,
                singleSelect:[
                    '用户名登录',
                    'APP动态码',
                    '企业微信动态码'
                ],
                isFocus:false,
            }
        },
        methods:{
            focusInput(){
            },
            electionClick(index){
             this.openIndex=index;
            }
        }
    }
</script>

<style scoped lang="less">
 @import "./login";
</style>
