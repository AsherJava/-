<template>
    <div class="Popup">
        <login-modal v-model="Popup"
                     :mask-closable="false"
                     Width="700">
            <div >
               <div class="wrap">
                   <div class="title">快速安全登录</div>
                   <div class="tips">
                       检测到您的账号已在其他站点登录，<br>
                       点击头像直接授权登录。
                    </div>
                    <div class="avatar">
                        <img  src="http://img.exrick.cn/f9c0ad63342141deb1ed1823694d233c.jpg" class="img">

                    </div>
                   <div class="nice">{{this.userInfo.username}}</div>
                   <div class="bottom">
                       <span class="link" @click="goRouter">返回上一页</span>
                   </div>
               </div>
            </div>
        </login-modal>
    </div>
</template>

<script>
    import loginModal from "../../components/login/loginModal.vue";
    import Cookies from "js-cookie";
    export default {
        name: "Popup",
       components:{
           loginModal
       },
        data(){
            return{
                Popup:false,
                userInfo:'',
            }
        },
        methods:{
            goRouter(){
                this.$router.go(-1);
            }
        },
        mounted(){
            this.Popup=true;
            if(Cookies.get('userInfo')){
                this.userInfo=JSON.parse(Cookies.get('userInfo'))
            }
        }
    }
</script>

<style scoped lang="less">
    .wrap{
        min-height: 287px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
    }
 .title{
     font-size: 20px;
     color: #333;
     margin: 16px 0;
 }
    .tips{
        color: #666;
        font-size: 16px;
        text-align: center;
        margin-bottom: 36px;
    }
    .avatar{
        position: relative;
        cursor: pointer;
        .img{
            width: 80px;
            height: 80px;
            box-shadow:black 0px 0px 5px;

            margin-bottom: 10px;
        }
    }
    .nice{
        margin-bottom: 40px;
        cursor: pointer;
    }
    .bottom{
        .link{
            color: #666;
            right: 20px;
            bottom: 13px;
            position: absolute;
            cursor: pointer;
        }
    }
</style>
