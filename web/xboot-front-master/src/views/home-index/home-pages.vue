<style scoped lang="less">
    @import "../main.less";
    .mainHeader{
        padding-left: 0 !important;
        height:95px;

    }
    .mainSingle{
        left: 0 !important;
    }
    .main .mainSingle{
        top: 95px!important;
    }
    .main-header-pic{
        height: 100%;
        display: inline-block;
        img{
            height: 100%;
            width: auto;
        }
    }
   #isScroll::-webkit-scrollbar{

            width: 0 !important;


    }
    #isScroll::-webkit-scrollbar {
        width: 0 !important;height: 0;
    }
    .main {

        &-header{
            background: rgba(51, 157, 255, 1);
        }
    }
    .main-header .header-avator-con .user-dropdown-menu-con .main-user-name{
        color: #515a6e !important;
    }
    .main .single-page-con .single-page{
        margin: 0px ;
    }
    .assessContent{
        font-size: 20px;
        .assessContent-title{
            text-align: center;
            line-height: 30px;
            padding: 40px 0 30px 0;
            .content{
                display: inline-block;
                line-height: 30px;
            }
        }
        .assessFooter{
            padding-bottom: 10px;
            .assessBut{
                width: 100%;
                display: flex;
                .bord{
                    border-left:1px solid rgba(220,222,227,1);
                    border-right:1px solid rgba(220,222,227,1);
                }
                .assessChild{

                    cursor: pointer;
                    flex: 1;
                    text-align: center;
                    span{
                        display: inline-block;
                    }
                }
            }
        }
    }
</style>
<template>
    <div class="main" :class="{'main-hide-text': shrink}">
        <div class="main-header-con" :style="{paddingLeft: shrink?'60px':'220px'}" :class="{mainHeader:!isIf}">
            <div class="main-header" :style="{boxShadow:'none'}">
                <div class="main-header-pic">
                    <img src="../../assets/home-pages/home-logo3.png" alt="">
                </div>
                <div :class="{'header-avator-con':navType!=4, 'header-avator-con nav4':navType==4}">
                    <Dropdown @on-click="selectNav" class="options" v-if="navType==4">
                        <Icon type="ios-apps" :size="24" class="language"></Icon>
                        <DropdownMenu slot="list">
                            <DropdownItem
                                    v-for="(item, i) in navList"
                                    :key="i"
                                    :name="item.name"
                                    :selected="currNav==item.name"
                            >
                                <div>
                                    <Icon :type="item.icon" :size="14" style="margin: 0 10px 2px 0"></Icon>
                                    {{item.title}}
                                </div>
                            </DropdownItem>
                        </DropdownMenu>
                    </Dropdown>
                    <full-screen v-model="isFullScreen" @on-change="fullscreenChange"></full-screen>
                    <lock-screen></lock-screen>
                    <!--<message-tip v-model="mesCount"></message-tip>-->
                    <div class="user-dropdown-menu-con">
                        <Row type="flex" justify="end" align="middle" class="user-dropdown-innercon">
                            <Dropdown transfer trigger="hover" @on-click="handleClickUserDropdown">
                                <a href="javascript:void(0)">
                                    <span class="main-user-name">{{ username }}</span>
                                    <Icon type="md-arrow-dropdown"/>
                                    <Avatar :src="avatarPath" style="background: #619fe7;margin-left: 10px;"></Avatar>
                                </a>
                                <DropdownMenu slot="list">
                                    <!--<DropdownItem name="ownSpace">{{ $t('userCenter') }}</DropdownItem>-->
                                    <!--<DropdownItem name="ownSpaceOld">{{ $t('userCenterOld') }}</DropdownItem>-->
                                    <!--<DropdownItem name="changePass">{{ $t('changePass') }}</DropdownItem>-->
                                    <DropdownItem name="assessorList" v-if="isRole=='assessor'">{{isRoleList}}</DropdownItem>
                                    <DropdownItem name="loginout" >{{ $t('logout') }}</DropdownItem>
                                </DropdownMenu>
                            </Dropdown>
                        </Row>
                    </div>
                </div>
            </div>
        </div>
        <div id="isScroll" class="single-page-con " :style="{left: shrink?'60px':'220px'}"  :class="{mainSingle:!isIf}">
            <div class="single-page">
                <keep-alive :include="cachePage">
                    <router-view></router-view>
                </keep-alive>
            </div>
        </div>
        <loginModal  v-model="assessModal"
                     :mask-closable="false"
                     Width="650"
        >
         <div class="assessContent">
             <div class="assessContent-title">
                 <Icon type="ios-alert" size="30" color="#ed4014"/>
                 <span class="content">管理员正在登录后台管理，是否批准？</span>
             </div>
             <div class="assessFooter">
                 <div class="assessBut">
                     <div class="assessChild">
                         <span style="color:#1DAD5E" @click="assess(1)">通过</span>
                     </div>
                     <div class="assessChild bord">
                         <span style="color:#7B7B7B" @click="assess(0)">暂不处理</span>
                     </div>
                     <div class="assessChild">
                         <span style="color:#ed4014" @click="assess(2)">驳回</span>
                     </div>
                 </div>
             </div>
         </div>
        </loginModal>
        <web-socket ref="websocket" @change="socketChange" v-show="false"></web-socket>
    </div>
</template>
<script>
    import breadcrumbNav from "./../main-components/breadcrumb-nav.vue";
    import fullScreen from "./../main-components/fullscreen.vue";
    import lockScreen from "./../main-components/lockscreen/lockscreen.vue";
    import messageTip from "./../main-components/message-tip.vue";
    import loginModal from "@/components/login/loginModal.vue";
    import Cookies from "js-cookie";
    import util from "@/libs/util.js";
    import {insertOrUpdate} from  "@/api/moduleIndex.js";
    import webSocket from '../home-index/webSocket.vue'
    export default {
        name:'home-pages',
        components: {
            breadcrumbNav,
            fullScreen,
            lockScreen,
            messageTip,
            loginModal,
            webSocket
        },
        data() {
            return {
                isIf:false,
                shrink: false,
                assessModal:false,
                approvalId:'',
                username: "",
                userId: "",
                isFullScreen: false,
                firstThreeNav: [],
                lastNav: [],
                navType: 1,
                mesCount:0,
                isRole:'',
                isRoleList:'审批列表'
            };
        },
        computed: {
            avatarPath() {
                return localStorage.avatorImgPath;
            },
            cachePage() {
                return this.$store.state.app.cachePage;
            },
            lang() {
                return this.$store.state.app.lang;
            },
        },
        created(){
           this.isRole=this.getStore("isRole")
        },
        stompClient: {
            monitorIntervalTime: 100,
            stompReconnect: true,
            timeout(orgCmd) {}
        },
        methods: {
            socketChange(item){
            },
            init() {
                let userInfo = JSON.parse(Cookies.get("userInfo"));
                this.username = userInfo.username;
                this.userId = userInfo.id;
            },
            selectNav(name) {
                this.$store.commit("setCurrNav", name);
                this.setStore("currNav", name);
                // 清空所有已打开标签
                // this.$store.commit("clearAllTags");
                this.$router.push({
                    name: "home_index"
                });
                util.initRouter(this);
            },
            toggleClick() {
                this.shrink = !this.shrink;
            },
            handleLanDropdown(name) {
                localStorage.lang = name;
                this.$store.commit("switchLang", name);
            },
            handleClickUserDropdown(name) {
                if (name == "ownSpace") {
                    util.openNewPage(this, "ownspace_index");
                    this.$router.push({
                        name: "ownspace_index"
                    });
                } else if (name == "ownSpaceOld") {
                    util.openNewPage(this, "ownspace_old");
                    this.$router.push({
                        name: "ownspace_old"
                    });
                } else if (name == "changePass") {
                    util.openNewPage(this, "change_pass");
                    this.$router.push({
                        name: "change_pass"
                    });
                }else if(name=="assessorList"){
                    console.log(name)
                    this.$router.push({
                        path: '/assessorList',
                    });
                }else if (name == "loginout") {
                    // 退出登录
                    this.$store.commit("logout", this);
                    this.$store.commit("clearOpenedSubmenu");
                    // 强制刷新页面 重新加载router
                    location.reload();
                }
            },
            fullscreenChange(isFullScreen) {
                // console.log(isFullScreen);
            },
            assess(Status){
                let data= {
                    id:this.approvalId,
                    approvalStatus:Status,
                }
                this.assessModal=false;
                if(Status==0){
                    return
                }
                insertOrUpdate(data).then(res=>{
                    if(res.success){
                        this.$Message.success(res.message)
                    }else {
                        this.$Message.error(res.message)
                    }
                })
            },
            socketChange(item){
                let data=item;
                if(data.ApprovalUpdate){
                    this.assessModal=true;
                    this.approvalId=data.ApprovalInfo.id
                }else {
                    this.assessModal=false;
                }

            }//websocket 变化
        },
        watch: {
            $route(to) {

            },
        },
        mounted() {
            this.init();
            if(this.isRole=='assessor'){
                if(Cookies.get("userInfo")){
                    this.$refs.websocket.websocketInit(JSON.parse(Cookies.get("userInfo")).username)
                }

            }
        }
    };
</script>
