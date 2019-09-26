<template>
    <div class="app-main app-content">
        <img @click="openErSc" :src="require('../../../../assets/app/img/home/home.png')" alt="">
    </div>
</template>

<script>
    import {
        scanService,
        scanLogin
    } from "@/api/app";
    export default {
        name: "appHome",
        data(){
            return{
                info:'',
            }
        },
        created(){
            window.ErCodeScan = this.ErCodeScan;
            if(JSON.parse(this.getStore('appUsersInfo'))){
                this.info=JSON.parse(this.getStore('appUsersInfo'))
            }
        },
        methods:{
            openErSc(){
                let u = navigator.userAgent; // 判断ios andrid和是否网页
                if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
                    if(u.indexOf('Android') > -1 || u.indexOf('Linux') > -1){
                        window.android.openErScan();
                    }
                    if(!!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)){
                    }
                }
            },
            ErCodeScan(val){
                let value={
                    uuid:JSON.parse(val).uuid,
                    token:this.info.token
                };
                scanService(value).then(res=>{
                      if(res.code==200){
                          scanLogin({
                              username:this.info.username,
                              token:this.info.token
                          }).then(res=>{
                            if(res.code==200){
                                this.$Message.success(res.msg);
                            }else {
                                alert(res.msg)
                                this.$Message.error(res.msg);
                            }
                          })
                      }else {
                          alert(2)
                          this.$Message.error(res.msg);

                      }
                })
            }
        }
    }
</script>

<style scoped lang="less">
    @import "../../common/common.less";
    img{
        width: 100%;
        height: 100%;
    }
</style>
