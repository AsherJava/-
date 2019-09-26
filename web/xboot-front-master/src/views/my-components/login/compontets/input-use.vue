<template>
    <div class="input-div">
        <div v-if="isIcon=='people'">
            <input class="login-input login-input1" type="text" @focus="focusInput()"   @blur="blurInput()" @mouseover="mouseOver"
                   @mouseleave="mouseLeave" v-model="value" :placeholder="placeholder">
            <span :class="{loginInputPic:!open,loginInputPic1:open,loginInputPic11:open1}" ></span>
            <div class="input-tips" v-if="verification">
                <tips-use :tips="tip" v-model="isShow" :is-show="isShow"></tips-use>
            </div>
        </div>
        <div v-if="isIcon=='lock'">
            <input class="login-input login-input1" type="text" @focus="focusInput()"   @blur="blurInput()" @mouseover="mouseOver"
                   @mouseleave="mouseLeave" v-model="value" :placeholder="placeholder">
            <span :class="{loginInputPic2:!open,loginInputPic3:open,loginInputPic33:open1}" ></span>
            <div class="input-tips" v-if="verification">
                <tips-use :tips="tip"  v-model="isShow" :is-show="isShow"></tips-use>
            </div>
        </div>
        <div v-if="isIcon=='code'">
            <div class="code-box">
                <input class="login-input login-input2" type="text" @focus="focusInput()"   @blur="blurInput()" v-model="value" :placeholder="placeholder">
                <span class="code" @click="sendCode">
                    <span>
                          <span v-if="!sending">获取验证码</span>
                                 <span v-else v-model="countButton">{{countButton}}</span>
                    </span>
                </span>
                <div class="input-tips" v-if="verification">
                    <tips-use ref="tips" :tips="tip" v-model="isShow" :is-show="isShow"></tips-use>

                </div>
            </div>
        </div>
        <div v-if="isIcon=='clock'" class="clock-box">
            <input class="login-input login-input1 login-input-clock"  type="text" @focus="focusInput()"   @blur="blurInput()" @mouseover="mouseOver"
                   @mouseleave="mouseLeave" v-model="value" :placeholder="placeholder"  >
            <span :class="{loginInputPic4:!open,loginInputPic44:open,loginInputPic444:open1}" ></span>
            <span class="sendInput" :class="{sendInput1:open}" @click="sendCode">
                 <span v-if="!sending">{{tipsMessage}}</span>
                 <span v-else v-model="countButton">{{countButton}}</span>
                  </span>
            <div class="input-tips" v-if="verification">
                <tips-use :tips="tip" v-model="isShow" :is-tip="tipShow"  ></tips-use>
            </div>

        </div>
        <div v-if="isIcon=='dynamic'" class="clock-box">
            <input class="login-input login-input1"  type="text" @focus="focusInput()"   @blur="blurInput()" @mouseover="mouseOver"
                   @mouseleave="mouseLeave" v-model="value" :placeholder="placeholder"  >
            <span :class="{loginInputPic5:!open,loginInputPic55:open,loginInputPic555:open1}" ></span>
        </div>
    </div>
</template>

<script>
    import  tipsUse from './tips'
    export default {
        name: "input-use",
        components:{
            tipsUse
        },
        props:{
            data:{
                type:String,
                default:'',
            },
            verification:{
                type:Boolean,
                default:true,
            },
            tipShow:{
                type:Boolean,
                default:false,
            },
             tipsMessage:{
                type:String,
                default:'获取验证码',
            },
            isOpen:{
                type:Boolean,
                default:false,
            },
            isIcon:{
                type:String,
                default:'people',
            },
            placeholder:{
                type:String,
                default:'people',
            },
            tips:{
                type:String,
                default:'',
            }
        },
        data(){
            return{
                tip:this.tips,
                open:this.isOpen,
                isShow:false,
                value:this.data,
                open1:false,
                countButton:'60s',
                sending: false,
                sended: true,
                count: 60,
            }
        },
        watch:{
            tips(val){
                this.tip=val;
            },
            value(val){
                this.$emit('update:data',val)
            },
            isShow(val){
                if(val){
                    this.timeOut()
                }
            }
        },
        methods:{
            timeOut(){
                let  that=this
                setTimeout(function() {
                    that.isShow=false;
                },2000);
            },
            sendCode(){
                this.sending=true;
                this.countDown()
                this.$emit('changeCode',true)
            },
            countDown() {
                let that = this;
                if (this.count == 0) {
                    if(!this.sended){
                        this.sended=true;
                        this.$emit('countPlus',this.sended);
                    }
                    this.sending = false;
                    this.count = 60;
                    this.countButton=60+'s';
                    return;
                } else {
                    if(this.sended){
                        this.sended=false;
                        this.$emit('countPlus',this.sended);
                    }
                    this.countButton = this.count + " s";
                    this.count--;
                }
                setTimeout(function() {
                    that.countDown();
                }, 1000);
            },
            focusInput(){
                this.open=true;
            },
            blurInput(){
                this.open=false;
            },
            mouseLeave(){
                this.open1=false;
            },
            mouseOver(){
                this.open1=true;
            }
        }
    }
</script>

<style scoped lang="less">
    .code-box{
        position: relative;
        width: 100%;
        padding-right:110px;
    }

    .code{
        height: 50px;
        width: 100px;
        position: absolute;
        display: inline-block;
        right: 0;
        top: 0;
        border:1px solid rgba(224, 224, 224, 1);
        border-radius: 8px;
        cursor: pointer;

        >span{
            display: flex;
            width: 100%;
            height: 100%;
            align-items: center;
            justify-items: center;
            font-size: 16px;
            >span{
                position: relative;
                top: 2px;
                display: inline-block;
                text-align: center;
                width: 100%;
            }

        }
    }
    .code:hover{
        color: #2b85e4;
    }
    .login-input{
        color:rgba(153,153,153,1);
        width: 100%;
        height: 50px;
        border-radius: 8px;
        border:1px solid rgba(224, 224, 224, 1);
        outline: none;
        font-size:21px;

    }
    .login-input1{
        min-width: 210px;
        padding-left: 64px;

    }
    .login-input-clock{
        padding-right: 76px;
    }
    .sendInput{
        display: inline-block;
        position: absolute;
        font-size:16px;
        font-family:PingFang SC;
        font-weight:500;
        color:rgba(24,144,255,1);
        right: 0;
        top: 0;
        width: 120px;
        height: 50px;
        border-left:1px solid rgba(224, 224, 224, 1);
        cursor: pointer;
        span{
            display:block;
            margin: 0 auto;
            text-align: center;
            line-height: 50px;
        }
    }
    .sendInput1{
        border-left:1px solid rgba(24, 144, 255, 1);
    }
    .login-input2{
        text-align: center;
    }
    .login-input:focus{
        border:1px solid rgba(24, 144, 255, 1);
    }
    .login-input::-webkit-input-placeholder { /* WebKit browsers */
        color:rgba(153,153,153,1);
        font-size:21px;
    }
    .login-input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        color:rgba(153,153,153,1);
        font-size:21px;
    }
    .login-input::-moz-placeholder { /* Mozilla Firefox 19+ */
        color:rgba(153,153,153,1);

        font-size:21px;
    }
    .login-input:-ms-input-placeholder { /* Internet Explorer 10+ */
        color:rgba(153,153,153,1);
        font-size:21px;
    }
    .login-input:hover{
        border-radius: 8px;
        border:1px solid rgba(24, 144, 255, 1);
    }
    .login-input:hover ~ .sendInput{
        border-left:1px solid rgba(24, 144, 255, 1);
    }
    .input-div{
        position: relative;
        padding-bottom: 46px;
    }
    .loginInputPic{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/people.png");
    }
    .loginInputPic1{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/people1.png");
    }
    .loginInputPic11{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/people1.png");
    }
    .loginInputPic2{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/mi.png");
    }
    .loginInputPic3{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/mi1.png");
    }
    .loginInputPic33{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/mi1.png");
    }
    .loginInputPic4{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/icon-dun1.png");
    }
    .loginInputPic44{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/icon-dun.png");
    }
    .loginInputPic444{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/icon-dun.png");
    }
    .loginInputPic5{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/icon-duntai1.png");
    }
    .loginInputPic55{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/icon-duntai.png");
    }
    .loginInputPic555{
        display: inline-block;
        position: absolute;
        top: 13px;
        left: 20px;
        width: 24px;
        height: 24px;
        background: url("../../../../assets/pages-login/icon-duntai.png");
    }
    .input-tips{
        position: absolute;
        width: 100%;
        top: 50px;
        left: 0;
    }

</style>
