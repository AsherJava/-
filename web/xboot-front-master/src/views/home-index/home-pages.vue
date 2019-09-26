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
                                    <DropdownItem name="ownSpace">{{ $t('userCenter') }}</DropdownItem>
                                    <DropdownItem name="ownSpaceOld">{{ $t('userCenterOld') }}</DropdownItem>
                                    <DropdownItem name="changePass">{{ $t('changePass') }}</DropdownItem>
                                    <DropdownItem name="loginout" divided>{{ $t('logout') }}</DropdownItem>
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
    </div>
</template>
<script>
    import breadcrumbNav from "./../main-components/breadcrumb-nav.vue";
    import fullScreen from "./../main-components/fullscreen.vue";
    import lockScreen from "./../main-components/lockscreen/lockscreen.vue";
    import messageTip from "./../main-components/message-tip.vue";
    import Cookies from "js-cookie";
    import util from "@/libs/util.js";

    export default {
        name:'home-pages',
        components: {
            breadcrumbNav,
            fullScreen,
            lockScreen,
            messageTip,
        },
        data() {
            return {
                isIf:false,
                shrink: false,
                username: "",
                userId: "",
                isFullScreen: false,
                firstThreeNav: [],
                lastNav: [],
                navType: 1,
                mesCount:0,
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
                } else if (name == "loginout") {
                    // 退出登录
                    this.$store.commit("logout", this);
                    this.$store.commit("clearOpenedSubmenu");
                    // 强制刷新页面 重新加载router
                    location.reload();
                }
            },
            fullscreenChange(isFullScreen) {
                // console.log(isFullScreen);
            }
        },
        watch: {
            $route(to) {

            },
        },
        mounted() {
            this.init();
        }
    };
</script>
