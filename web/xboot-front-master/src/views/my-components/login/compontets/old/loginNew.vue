<template>
    <div>


    <!--<template>-->
        <!--<div id="pages-login">-->
            <!--<div class="main">-->
                <!--<div class="pic ">-->
                    <!--<div class="wh flex">-->
                  <!--<span class="span-img">-->
                       <!--<img src="./../assets/pages-login/jiaozhi.png" alt="">-->
                  <!--</span>-->

                    <!--</div>-->
                <!--</div>-->
                <!--<div class="login">-->
                    <!--<div class="login-flex-hc">-->
                        <!--<div class="login-flex-child" v-show="loginDownLoad">-->
                            <!--<div class="title">-->
                                <!--<div class="shaoWord"  v-show="loginShow"><span class="icon-dun"></span><span class="span" >扫描登录更安全</span></div>-->
                                <!--<div class="shao" v-show="loginShow" @click="erClick"></div>-->
                                <!--<div class="shao shao1" v-show="!loginShow" @click="erClick"></div>-->
                                <!--<span>-->
                <!--欢迎登录-->
            <!--</span>-->
                            <!--</div>-->
                            <!--<p class="line-p">-->
                                <!--<span class="line"></span>-->
                            <!--</p>-->
                            <!--<div class="switch"  v-show="loginShow">-->
                   <!--<span class="switch-span">-->
                       <!--<span v-for="(item ,index) in singleSelect" :key="index" class="election">-->
                           <!--<span :class="{switchButton:openIndex==index?isShow[1]:isShow[0],switchButtonSelect:openIndex==index?isShow[0]:isShow[1]}"  @click="electionClick(index)"></span>-->
                           <!--<span>{{item}}</span>-->
                       <!--</span>-->
                   <!--</span>-->
                            <!--</div>-->
                            <!--<div class="login-content" v-show="loginShow" >-->
                                <!--<div v-show="openIndex==0" v-model="form">-->
                                    <!--<input-use ref="input1" v-model="form.username" :data.sync=" form.username"   :tips="tips.username.tips[0]"   :placeholder="tips.username.tips[1]"></input-use>-->
                                    <!--<input-use ref="input2" is-icon="lock" v-model="form.password" :data.sync="form.password" :tips="tips.password.tips[0]"  :placeholder="tips.password.tips[1]"></input-use>-->
                                <!--</div>-->
                                <!--&lt;!&ndash;<div  v-show="openIndex==1"  v-model="form1">&ndash;&gt;-->
                                <!--&lt;!&ndash;<input-use  ref="input3" v-model="form1.code" :data.sync="form1.code" :tips="tips.codeAPP.tips[0]" is-icon="code"  :placeholder="tips.codeAPP.tips[1]" @countPlus="countChange"></input-use>&ndash;&gt;-->
                                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                                <!--<div  v-show="openIndex==1"  v-model="form2">-->
                                    <!--<input-use ref="input4" v-model="form2.username" :data.sync="form2.username"  :tips="tips.usernameBusiness.tips[0]" :placeholder="tips.usernameBusiness.tips[1]"></input-use>-->
                                    <!--<input-use ref="input5" is-icon="code" v-model="form2.code" :data.sync="form2.code"  :tips="tips.codeAPP.tips[0]" :placeholder="tips.codeBusiness.tips[1]" @changeCode="sendCode"   @countPlus="countChange1"></input-use>-->
                                <!--</div>-->
                                <!--<div>-->
                                    <!--<button class="deng" @click="buttonClick">登 录</button>-->
                                <!--</div>-->
                            <!--</div>-->
                            <!--<div  v-show="!loginShow">-->
                                <!--<div  v-show="loginSuccess">-->
                                    <!--<p class="shao-p">扫描登录更安全</p>-->
                                    <!--<div class="erPic">-->
                                        <!--<div class="erWei">-->
                                            <!--<div id="qrcode" ref="qrcode" class="qrcode " >-->
                                                <!--<div class="mark" v-show="qrMark"></div>-->
                                                <!--<div class="markContent" v-show="qrMark">-->
                                                    <!--<div>-->
                                                        <!--<span>二维码已失效</span>-->
                                                        <!--<span class="shuaB">-->
                                          <!--<div class="shuaButton" @click="downCount(5,'qrMark')">请点击刷新</div>-->
                                        <!--</span>-->
                                                    <!--</div>-->
                                                <!--</div>-->
                                            <!--</div>-->
                                        <!--</div>-->
                                    <!--</div>-->
                                    <!--<p class="shao-p">-->
                     <!--<span>-->
                          <!--<span class="icon-shao"></span>-->
                      <!--打开-->
                        <!--<span style="color:#1890FF;cursor: pointer"  @click="valueChange('loginDownLoad',false)">-->
                           <!--PORTAL APP-->
                        <!--</span>，扫一扫登录-->
                     <!--</span>-->
                                    <!--</p>-->
                                <!--</div>-->
                                <!--<div v-show="!loginSuccess">-->
                                    <!--<p class="shao-p"><img src="../assets/home-pages/icon-phone-success.png" alt=""></p>-->
                                    <!--<p class="shao-p shao-p1">扫描成功！</p>-->
                                    <!--<p class="shao-p shao-p1">请在手机上确认登录</p>-->
                                    <!--<p class="shao-p shao-p2" @click="valueChange('loginSuccess',true)">返回二维码登录</p>-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</div>-->
                        <!--<div class="login-flex-child1" v-show="!loginDownLoad">-->
                            <!--<div class="title1">-->
                    <!--<span>-->
                  <!--手机扫描，即可下载-->
                    <!--</span>-->
                            <!--</div>-->
                            <!--<div  v-show="loginSuccess">-->
                                <!--<p class="shao-p">iPhone下载</p>-->
                                <!--<div class="erPic">-->
                                    <!--<div class="erWei">-->
                                        <!--<div id="qrIos" ref="qrIos" class="qrcode" ></div>-->
                                    <!--</div>-->
                                <!--</div>-->
                                <!--<p class="shao-p">Android下载</p>-->
                                <!--<div class="erPic">-->
                                    <!--<div class="erWei">-->
                                        <!--<div id="qrAndroid" ref="qrAndroid" class="qrcode" ></div>-->
                                    <!--</div>-->
                                <!--</div>-->
                                <!--<p class="shao-p shao-p2" @click="valueChange('loginDownLoad',true)">返回二维码登录</p>-->
                            <!--</div>-->
                        <!--</div>-->
                    <!--</div>-->
                <!--</div>-->
                <!--<login-modal  v-model="loginModal" Width="650">-->
                    <!--<div class="modalContent">-->
                        <!--<p>短信认证</p>-->
                        <!--<p>-->
                    <!--<span>-->
                    <!--验证码已发送到您的手机，请查收！-->
                <!--</span>-->
                        <!--</p>-->
                        <!--<div class="login-content login-content-modal">-->
                            <!--<div v-show="openIndex==0" v-model="form">-->
                                <!--<input-use ref="input7" is-icon="clock" v-model="form.code" :data.sync="form.code" :tips="clockCode"  :placeholder="tips.password.tips[1]" :tip-show='true'   @countPlus="clockCount"></input-use>-->
                            <!--</div>-->
                            <!--<div>-->
                                <!--<button class="deng" @click="buttonClick">登 录</button>-->
                            <!--</div>-->
                        <!--</div>-->
                    <!--</div>-->
                <!--</login-modal>-->
                <!--<login-modal  v-model="loginModal1" Width="650">-->
                    <!--<div class="modalContent">-->
                        <!--<p>APP动态码认证</p>-->
                        <!--<p>-->
                 <!--<span>-->
                <!--请打开手机APP动态码页面，进行查看！-->
                <!--</span>-->
                        <!--</p>-->
                        <!--<div class="login-content login-content-modal">-->
                            <!--<div v-show="openIndex==0" v-model="form">-->
                                <!--<input-use ref="input7" is-icon="dynamic" v-model="form.password" :data.sync="form.password" :tips="clockCode"  :placeholder="tips.password.tips[1]" :tip-show='true'   @countPlus="clockCount"></input-use>-->
                            <!--</div>-->
                            <!--<div>-->
                                <!--<button class="deng" @click="buttonClick">登 录</button>-->
                            <!--</div>-->
                        <!--</div>-->
                    <!--</div>-->
                <!--</login-modal>-->
            <!--</div>-->

        <!--</div>-->
    <!--</template>-->
    <!--<script>-->

        <!--import Cookies from "js-cookie";-->
        <!--import {-->
            <!--login,-->
            <!--userInfo,-->
            <!--githubLogin,-->
            <!--qqLogin,-->
            <!--weiboLogin,-->
            <!--getJWT,-->
            <!--sendSms,-->
            <!--smsLogin,-->
            <!--sendCode,-->
            <!--receiveCode,-->
            <!--getRoleCode-->
        <!--} from "@/api/index";-->
        <!--import  { ssoLogin } from  "@/api/moduleIndex";-->
        <!--import util from "@/libs/util.js";-->
        <!--import loginModal from "../components/login/loginModal.vue";-->
        <!--import {isMobile,validatenull} from "@/libs/validate.js";-->
        <!--import {pageReturn,runIndex} from '@/libs/tool'-->
        <!--import  inputUse from '../views/my-components/login/compontets/input-use'-->
        <!--import QRCode  from "qrcodejs2"-->
        <!--export default {-->
            <!--name: "login",-->
            <!--components:{-->
                <!--inputUse,-->
                <!--loginModal-->
            <!--},-->
            <!--data() {-->
                <!--const validateMobile = (rule, value, callback) => {-->
                    <!--var reg = /^[1][3,4,5,7,8][0-9]{9}$/;-->
                    <!--if (!reg.test(value)) {-->
                        <!--callback(new Error("手机号格式错误"));-->
                    <!--} else {-->
                        <!--callback();-->
                    <!--}-->
                <!--};-->
                <!--return {-->
                    <!--linkQrCode:'https://baidu.com',-->
                    <!--error: false,-->
                    <!--errorMsg: "",-->
                    <!--loginModal:false,-->
                    <!--loginModal1:false,-->
                    <!--loginSuccess:true,-->
                    <!--loginDownLoad:true,-->
                    <!--qrMark:false,-->
                    <!--flag:true,-->
                    <!--loginShow:true,-->
                    <!--tabName: "username",-->
                    <!--saveLogin: true,-->
                    <!--loading: false,-->
                    <!--maxLength: 6,-->
                    <!--errorCode: "",-->
                    <!--form: {-->
                        <!--username: "admin或test或test2 ",-->
                        <!--password: "123456",-->
                        <!--mobile: "",-->
                        <!--code: ""-->
                    <!--},-->
                    <!--form1: {-->
                        <!--username: "",-->
                        <!--password: "",-->
                        <!--mobile: "",-->
                        <!--code: ""-->
                    <!--},-->
                    <!--form2: {-->
                        <!--username: "",-->
                        <!--password: "",-->
                        <!--mobile: "",-->
                        <!--code: ""-->
                    <!--},-->
                    <!--tips:{-->
                        <!--username:{tips:['请正确输入用登录账号!','请输入用登录账号']},-->
                        <!--password:{tips:['请正确输入登录密码!','请输入登录密码']},-->
                        <!--usernameAPP:[],-->
                        <!--passwordApp:[],-->
                        <!--codeAPP:{tips:['请正确输入APP动态码!','请输入APP动态码']},-->
                        <!--usernameBusiness:{tips:['请正确输入登录账号或手机号!','请输入登录账号或手机号']},-->
                        <!--passwordBusiness:{tips:['请正确输入APP动态码!','APP动态码']},-->
                        <!--codeBusiness:{tips:['请正确输入APP动态码!','APP动态码']},-->
                        <!--clockCode:['您的验证码仍在有效期内','您的验证码已失效']-->
                    <!--},-->
                    <!--clockCode:'',-->
                    <!--rules: {-->
                        <!--username: [-->
                            <!--{-->
                                <!--required: true,-->
                                <!--message: "账号不能为空",-->
                                <!--trigger: "blur"-->
                            <!--}-->
                        <!--],-->
                        <!--password: [-->
                            <!--{-->
                                <!--required: true,-->
                                <!--message: "密码不能为空",-->
                                <!--trigger: "blur"-->
                            <!--}-->
                        <!--],-->
                        <!--mobile: [-->
                            <!--{-->
                                <!--required: true,-->
                                <!--message: "手机号不能为空",-->
                                <!--trigger: "blur"-->
                            <!--},-->
                            <!--{-->
                                <!--validator: validateMobile,-->
                                <!--trigger: "blur"-->
                            <!--}-->
                        <!--]-->
                    <!--},-->
                    <!--data1:'',-->
                    <!--count:true,-->
                    <!--count1:true,-->
                    <!--isShow:[true,false],-->
                    <!--openIndex:0,-->
                    <!--singleSelect:[-->
                        <!--'用户名登录',-->
                        <!--'APP动态码',-->
                    <!--],-->
                    <!--isFocus:false,-->

                <!--}-->
            <!--},-->
            <!--created(){-->
            <!--},-->
            <!--watch:{-->
                <!--loginModal(val){-->
                    <!--if(!val){-->
                        <!--this.clearValue(this.from.code,'')-->
                    <!--}-->

                <!--},-->
                <!--loginModal1(val){-->

                <!--},-->
                <!--shuaShow(val){-->
                    <!--console.log(val)-->
                <!--}-->
            <!--},-->
            <!--methods:{-->
                <!--qrCode(item,url,width,height) {//二维码-->
                    <!--let that = this;-->
                    <!--let qrcode = new QRCode(item, {-->
                        <!--width: width,-->
                        <!--height: height,        // 高度-->
                        <!--text: url,   // 二维码内容-->
                        <!--// render: 'canvas' ,   // 设置渲染方式（有两种方式 table和canvas，默认是canvas）-->
                        <!--// background: '#f0f',   // 背景色-->
                        <!--// foreground: '#ff0'    // 前景色-->
                    <!--})-->
                <!--},-->
                <!--clearBox(val){-->
                    <!--document.getElementById(val).innerHTML='';-->
                <!--},-->
                <!--modalClick(item){-->
                    <!--this[item]=true;-->

                <!--},-->
                <!--valueChange(item,value){//清空修改值-->
                    <!--console.log(item)-->
                    <!--this[item]=value;-->

                <!--},-->
                <!--clearValue(item,value){//清空修改值-->

                    <!--item=value;-->

                <!--},-->
                <!--downCount(timer,value){//时间、、定时器··刷新二维码-->
                    <!--let that=this;-->
                    <!--return function  countDown() {-->
                        <!--if (timer == 0) {-->
                            <!--return  that[value]=ture;-->
                        <!--} else {-->
                            <!--timer&#45;&#45;;-->
                        <!--}-->
                        <!--setTimeout(function() {-->
                            <!--countDown();-->
                        <!--}, 1000);-->
                    <!--}()-->
                <!--},-->
                <!--erClick(){-->
                    <!--if(this.loginShow){-->
                        <!--this.qrCode('qrcode',this.linkQrCode,132,132)-->
                    <!--}else {-->
                        <!--this.clearBox('qrcode');-->
                    <!--}-->
                    <!--this.loginShow=!this.loginShow;-->
                <!--},-->
                <!--getRole(){-->
                    <!--getRoleCode().then(res=>{-->
                        <!--if (res.code == 200) {-->
                            <!--this.setStore("roleCodeList", res.result);-->
                        <!--}else {-->
                            <!--if(this.flag){-->
                                <!--this.getRole()-->
                            <!--}else {-->
                                <!--this.$Message.error(res.message)-->
                            <!--}-->
                        <!--}-->
                    <!--})-->
                <!--},-->
                <!--focusInput(){-->
                <!--},-->
                <!--electionClick(index){-->
                    <!--this.openIndex=index;-->
                <!--},-->
                <!--countChange(item){//发送验证码60秒结束  sended 改变-->
                    <!--this.count=item;-->

                <!--},-->
                <!--countChange1(item){//发送验证码60秒结束 sended 改变-->
                    <!--this.count1=item;-->

                <!--},-->
                <!--clockCount(item){-->
                    <!--console.log(item)-->
                    <!--if(item){-->
                        <!--this.clockCode=this.tips.clockCode[1]-->
                    <!--}else {-->
                        <!--this.clockCode=this.tips.clockCode[0]-->
                    <!--}-->
                <!--},-->
                <!--buttonClick(){-->
                    <!--if(this.openIndex==0){//登录校验-->
                        <!--if(validatenull(this.form.username)){-->
                            <!--this.$refs.input1.isShow=true-->
                        <!--}-->
                        <!--if(validatenull(this.form.password)){-->
                            <!--this.$refs.input2.isShow=true-->
                        <!--}-->
                        <!--if(this.$refs.input1.isShow|this.$refs.input2.isShow){-->
                        <!--}else {-->
                            <!--ssoLogin(this.form).then(res=>{-->
                                <!--if(res.code==200){-->
                                    <!--if(res.success){-->
                                        <!--this.modalClick('loginModal');-->
                                    <!--}-->
                                <!--}-->

                            <!--})-->
                            <!--// this.validateInput('form')-->
                        <!--}-->
                    <!--}else if(this.openIndex==1){-->
                        <!--if(validatenull(this.form1.code)){-->
                            <!--this.$refs.input3.isShow=true-->
                        <!--}-->
                        <!--if(this.$refs.input3.isShow){-->
                        <!--}else {-->
                            <!--//  this.sendCode('form1')-->
                        <!--}-->
                    <!--}else if(this.openIndex==2){-->
                        <!--if(validatenull(this.form2.username)){-->
                            <!--this.$refs.input4.isShow=true-->
                        <!--}-->
                        <!--if(validatenull(this.form2.code)){-->
                            <!--this.$refs.input5.isShow=true-->
                        <!--}-->
                        <!--if(this.$refs.input4.isShow|this.$refs.input5.isShow){-->
                        <!--}else {-->
                            <!--this.receiveCode('form2')-->
                        <!--}-->
                    <!--}-->
                <!--},-->
                <!--receiveCode(item){-->
                    <!--receiveCode({-->
                        <!--username:this[item].username,-->
                        <!--rewxcode:this[item].code,-->

                    <!--}).then(res => {-->
                        <!--if (res.success == true) {-->
                            <!--this.setStore("accessToken", res.result);-->
                            <!--// 获取用户信息-->
                            <!--userInfo().then(res => {-->
                                <!--if (res.success == true) {-->
                                    <!--// 避免超过大小限制-->
                                    <!--delete res.result.permissions;-->
                                    <!--let roles = [];-->
                                    <!--res.result.roles.forEach(e => {-->
                                        <!--roles.push(e.name);-->
                                    <!--});-->
                                    <!--this.setStore("roles", roles);-->
                                    <!--if (this.saveLogin) {-->
                                        <!--// 保存7天-->
                                        <!--Cookies.set("userInfo", JSON.stringify(res.result), {-->
                                            <!--expires: 7-->
                                        <!--});-->
                                    <!--} else {-->
                                        <!--Cookies.set("userInfo", JSON.stringify(res.result));-->
                                    <!--}-->
                                    <!--this.setStore("userInfo", res.result);-->
                                    <!--this.$store.commit("setAvatarPath", res.result.avatar);-->
                                    <!--// 加载菜单-->

                                    <!--util.initRouter(this);-->

                                    <!--this.$router.push({-->
                                        <!--name:pageReturn(this.getStore("roles"))-->
                                    <!--});-->
                                <!--} else {-->
                                    <!--this.loading = false;-->
                                <!--}-->
                            <!--});-->
                        <!--} else {-->
                            <!--// this.loading = false;-->
                            <!--this.$Message.error(res.message)-->
                        <!--}-->
                    <!--});-->
                <!--},-->
                <!--sendCode(){-->
                    <!--if(this.form2.username){-->
                        <!--sendCode({-->
                            <!--username:this.form2.username,-->
                        <!--}).then(res => {-->
                            <!---->
                        <!--});-->
                    <!--}else {-->
                        <!--this.$Message.success(this.tips.usernameBusiness.tips[0]);-->
                    <!--}-->

                <!--},-->
                <!--validateInput(item){-->
                    <!--this.loading = true;-->
                    <!--login({-->
                        <!--username: this[item].username,-->
                        <!--password: this[item].password,-->
                        <!--saveLogin: this[item].saveLogin-->
                    <!--}).then(res => {-->
                        <!--if (res.success == true) {-->
                            <!--this.setStore("accessToken", res.result);-->
                            <!--// 获取用户信息-->
                            <!--userInfo().then(res => {-->
                                <!--if (res.success == true) {-->
                                    <!--// 避免超过大小限制-->
                                    <!--delete res.result.permissions;-->
                                    <!--let roles = [];-->
                                    <!--res.result.roles.forEach(e => {-->
                                        <!--roles.push(e.name);-->
                                    <!--});-->
                                    <!--this.setStore("roles", roles);-->
                                    <!--if (this.saveLogin) {-->
                                        <!--// 保存7天-->
                                        <!--Cookies.set("userInfo", JSON.stringify(res.result), {-->
                                            <!--expires: 7-->
                                        <!--});-->
                                    <!--} else {-->
                                        <!--Cookies.set("userInfo", JSON.stringify(res.result));-->
                                    <!--}-->
                                    <!--this.setStore("userInfo", res.result);-->
                                    <!--this.$store.commit("setAvatarPath", res.result.avatar);-->
                                    <!--// 加载菜单-->

                                    <!--util.initRouter(this);-->
                                    <!--this.$router.push({-->
                                        <!--name:pageReturn(this.getStore("roles"))-->
                                    <!--});-->
                                <!--} else {-->
                                    <!--this.loading = false;-->
                                <!--}-->
                            <!--});-->
                        <!--} else {-->
                            <!--this.loading = false;-->
                        <!--}-->
                    <!--});-->
                <!--},-->
                <!--submitLogin(){-->
                    <!--if (this.tabName == "username") {-->
                        <!--this.$refs.usernameLoginForm.validate(valid => {-->
                            <!--if (valid) {-->
                                <!--this.loading = true;-->
                                <!--login({-->
                                    <!--username: this.form.username,-->
                                    <!--password: this.form.password,-->
                                    <!--saveLogin: this.saveLogin-->
                                <!--}).then(res => {-->
                                    <!--if (res.success == true) {-->
                                        <!--this.setStore("accessToken", res.result);-->
                                        <!--// 获取用户信息-->
                                        <!--userInfo().then(res => {-->
                                            <!--if (res.success == true) {-->
                                                <!--// 避免超过大小限制-->
                                                <!--delete res.result.permissions;-->
                                                <!--let roles = [];-->
                                                <!--res.result.roles.forEach(e => {-->
                                                    <!--roles.push(e.name);-->
                                                <!--});-->
                                                <!--this.setStore("roles", roles);-->
                                                <!--if (this.saveLogin) {-->
                                                    <!--// 保存7天-->
                                                    <!--Cookies.set("userInfo", JSON.stringify(res.result), {-->
                                                        <!--expires: 7-->
                                                    <!--});-->
                                                <!--} else {-->
                                                    <!--Cookies.set("userInfo", JSON.stringify(res.result));-->
                                                <!--}-->
                                                <!--this.setStore("userInfo", res.result);-->
                                                <!--this.$store.commit("setAvatarPath", res.result.avatar);-->
                                                <!--// 加载菜单-->

                                                <!--util.initRouter(this);-->

                                                <!--this.$router.push({-->
                                                    <!--name:pageReturn(this.getStore("roles"))-->
                                                <!--});-->
                                            <!--} else {-->
                                                <!--this.loading = false;-->
                                            <!--}-->
                                        <!--});-->
                                    <!--} else {-->
                                        <!--this.loading = false;-->
                                    <!--}-->
                                <!--});-->
                            <!--}-->
                        <!--});-->
                    <!--} else if (this.tabName == "mobile") {-->
                        <!--this.$refs.mobileLoginForm.validate(valid => {-->
                            <!--if (valid) {-->
                                <!--if (this.form.code == "") {-->
                                    <!--this.errorCode = "验证码不能为空";-->
                                    <!--return;-->
                                <!--} else {-->
                                    <!--this.errorCode = "";-->
                                <!--}-->
                            <!--}-->
                        <!--});-->
                    <!--}-->
                <!--},-->
                <!--showAccount() {-->
                    <!--this.$Notice.info({-->
                        <!--title: "体验账号密码",-->
                        <!--desc:-->
                            <!--"账号1：test 密码：123456 <br>账号2：test2 密码：123456 ！",-->
                        <!--duration: 10-->
                    <!--});-->
                <!--},-->

            <!--},-->
            <!--mounted() {-->
                <!--this.getRole();-->
                <!--this.qrCode('qrIos',this.linkQrCode,132,132)-->
                <!--this.qrCode('qrAndroid',this.linkQrCode,132,132)-->
            <!--}-->
        <!--}-->
    <!--</script>-->

    <!--<style scoped lang="less">-->
        <!--@import "./login";-->
    <!--</style>-->
    </div>
</template>

<script>
    export default {
        name: "loginNew"
    }
</script>

<style scoped>

</style>
