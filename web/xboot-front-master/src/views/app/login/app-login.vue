<template>
    <div id="app-content" class="app-content app-content-pa">
        <div class="app-login-child">
            <div class="app-login-children">
                <img class="app-logo-image" :src="require('../../../assets/app/img/login/login.png')">
            </div>
        </div>
        <div class="app-login-child">
            <div class="input-group">
                <div class="input-row border login-input-row" :class="{inputRowHover:inputHover}">
                    <login-input type="text" displayable focus v-model="username" :value="username" placeholder="请输入账号" @onFocus="focusGet" @onBlur="blurGet"></login-input>
                </div>
                <div   class="input-row border login-input-row" :class="{inputRowHover:inputHover1}">
                    <login-input type="password" icon-type="lock" displayable focus v-model="password" :value="password" placeholder="请输入密码" @onFocus="focusGet1" @onBlur="blurGet1"></login-input>
                </div>
                <div class="input-row border login-input-row" :class="{inputRowHover:inputHover2}">
                    <login-input type="text" icon-type="code" displayable focus v-model="code"  placeholder="请输入短信验证码"  @onFocus="focusGet2" @onBlur="blurGet2"></login-input>
                </div>
            </div>
            <div class="group-button group-padding">
                <div class="group-button-child">
                    <div  class="group-button">
                        <common-icon type="check"  @onChange="changeUser" :is-select='accountSelect'></common-icon><div class="button-text">记住用户</div>
                    </div>
                </div>
                <div class="group-button-child">
                    <div  class="group-button">
                        <common-icon type="check" @onChange="changePass" :is-select='passwordSelect'></common-icon><div class="button-text">记住密码</div>
                    </div>
                </div>
            </div>
            <div class="btn-row">
                <button type="primary" class="primary" @click="bindLogin">登 录</button>
            </div>
        </div>
    </div>
</template>

<script>
    import {setRem } from  '../tools/rem'
    import loginInput from '../../../components/app/login-input/login-input.vue'
    import commonIcon from '../../../components/app/common-icon/common-icon.vue';
    import {
        loginApp
    } from "@/api/app";
    export default {
        name: "app-login",
        components:{
            loginInput,
            commonIcon
        },
        data(){
            return{
                providerList: [],
                hasProvider: false,
                username: '',
                password: '',
                code:'',
                accountSelect:false,
                passwordSelect:false,
                positionTop: 0,
                inputHover:false,
                inputHover1:false,
                inputHover2:false,
                test:1243,
            }
        },
        created(){
            this.init()
        },
        methods:{
            bindLogin() {
                let data={
                    username:this.username,
                    password:this.password,
                    code:this.code,
                }
                loginApp(data).then(res=>{
                    this.test=res. message
                    if(res.success){
                        this.setStore("appInfo",{username:this.username});
                        this.setStore("appUsersInfo",res.result);
                        // 判断ios andrid和是否网页
                        let u = navigator.userAgent;
                        if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
                            if(u.indexOf('Android') > -1 || u.indexOf('Linux') > -1){
                                window.android.setAlias(this.username)
                            }
                            if(!!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)){
                            }
                        }
                        this.$router.push({
                            name: "app-home",
                            path:"/app-home",
                        });
                    }
                })

            },
            init(){
                if(this.getStore("appInfo")){
                    this.username=JSON.parse(this.getStore("appInfo")).username
                }
            },
            focusGet(value){
                this.inputHover=value
            },
            blurGet(value){
                this.inputHover=value
            },
            focusGet1(value){
                this.inputHover1=value
            },
            blurGet1(value){
                this.inputHover1=value
            },
            focusGet2(value){
                this.inputHover2=value
            },
            blurGet2(value){
                this.inputHover2=value
            },
            changeUser(val){
            },
            changePass(val){
            },
        },
        mounted(){
            setRem()
            window.onresize = function () {
                setRem()
            }

        }
    }

</script>

<style scoped lang="less">
    @import "../common/common.less";
    @import "login.less";
</style>
