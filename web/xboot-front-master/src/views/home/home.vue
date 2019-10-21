<style lang="less">
    @import "./home.less";
    @import "../../styles/common.less";
    .datePiker{
        width: 100%;
        background-color: white;
        border-radius:4px ;
        overflow: hidden;
    }
    #datePiker{
        width: 100%;
        >div{
            width: 100%;
            >div{
                width: 100%;
                >div{
                    width: 100%;
                    >div{
                        width: 100%;
                    }
                }
            }
        }
        .ivu-select-dropdown{
            position: static !important;
            margin: 0 !important;
        }
        .ivu-picker-panel-body{
            background-color: white;

        }
        .ivu-date-picker-header{
            border: none;
            height: 80px;
            line-height: 80px;
        }
        .ivu-picker-panel-icon-btn{
            height: 80px;
            line-height: 80px;
            margin-top: 0;
        }
        .ivu-date-picker-cells{
            margin: 0;
            padding: 10px;
            width: 100%;
            >span{
                display: inline-block;
                width: 14.28%;
                text-align: center;
            }
            .ivu-date-picker-cells-header{
                display: flex;
                >span{
                    flex: 1;
                }
            }

        }
        .ivu-date-picker-rel{
        >div{
            display: none !important;
        }
        }

    }
    .datePiker-content{
        width: 100%;
        padding: 0 20px;
        >div{
            width: 100%;
            border-top:1px solid rgba(232,236,239,1);
            min-height: 176px;
            .title-time{
                margin-top: 20px;
                margin-bottom: 2px;
                font-size:14px;
                font-family:AppleSystemUIFont;
                color:rgba(152,169,188,1);
                line-height:21px;
            }
            .title-name{
            font-size:16px;
            font-family:PingFang-SC-Heavy;
            font-weight:800;
            color:rgba(37,38,49,1);
            line-height:22px;
        }
        }
    }
</style>
<style lang="less" scoped>
.col-pad{
    padding: 0 10px;
    margin-bottom: 24px;
}
.info-pad{
    padding: 0 10px;
}
.info-title{
    width: 100%;
    height: 76px;
    display: flex;
    align-items: center;
    font-size:18px;
    font-family:PingFang-SC-Heavy;
    font-weight:800;
    color:rgba(119,140,162,1);
}
</style>
<template>
    <div>
        <div v-show="currNav=='xboot'">
            <Row >
                <Col :md="24" :lg="14" class="col-pad">
                    <Row>
                    <div class="info-title info-pad">
                        <span>
                            常用快捷功能
                        </span>
                    </div>
                    </Row>
                    <Row>
                        <Col :md="24" :lg="12" class="col-pad" v-for="(item,index) in count " :key="index">
                            <info-card id-name="user_created_count" :route="item.route" :end-val="item.createUser" :img-url="item.url" iconType="md-person-add" color="#252631" :intro-text="item.text"></info-card>
                        </Col>
                    </Row>

                </Col>
                <Col :md="24" :lg="10" class="col-pad">
                    <Row>
                        <div class="info-title">
                        <span>
                       日期
                        </span>
                        </div>
                    </Row>
                    <Row>
                        <Card :padding="0">
                            <div class="datePiker">
                                <DatePicker id="datePiker" type="date" placeholder="Select date" :open="isOpen" :editable="!isOpen"></DatePicker>
                                <div class="datePiker-content">
                                    <div>
                                        <p class="title-time">
                                            06:37PM - 09:15PM
                                        </p>
                                        <p class="title-name">通知事项:
                                            <br>各位久其同仁：<br>

                                            公司2019年度员工例行体检工作即将开始，确保顺利进行，请注意以下体检事项：

                                            本次体检需员工自行预约参检。

                                            除体检中心休息日外，员工可从规定日期中任选择前往参检。

                                            体检请在规定的时间内完成，过期将封闭体检通道。

                                            具体要求详见附件通知。
                                            </p>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </Card>

                    </Row>

                </Col>
            </Row>
        </div>
    </div>
</template>

<script>
    import infoCard from "./components/infoCard.vue";
    import {getStore} from '@/libs/storage.js'
    import {pageReturn} from '@/libs/tool'
    import Cookies from "js-cookie";
    export default {
        name: "home",
        components: {
            infoCard
        },
        beforeRouteEnter:(to,from,next)=>{//局部路守卫l

            if(pageReturn(getStore("roles"))=='home_index'){
                next()
            }else {
                next('/'+pageReturn(getStore("roles")))
            }

        },
        data() {
            return {
                count:[
                    {
                       // createUser: 17,
                        text:'用户管理',
                        url:require('../../assets/home/Cirlce.png'),
                        route:'sys/user-manage'
                    },
                    {
                       // createUser: 23,
                        text:'部门管理',
                        url:require('../../assets/home/Cirlce(1).png'),
                        route:'sys/department-manage'
                    },
                    {
                       // createUser: 200,
                        text:'新闻管理',
                        url:require('../../assets/home/Cirlce(2).png'),
                        route:'Administrivia/administriviaManage'
                    },
                    {
                        //createUser: 234,
                        text:'公告管理',
                        url:require('../../assets/home/Cirlce(3).png'),
                        route:'notice/noticeManage'
                    },
                    {
                        //createUser: 40,
                        text:'常用链接管理',
                        url:require('../../assets/home/Cirlce(4).png'),
                        route:'commonlink/common-link'
                    },
                    {
                       // createUser: 13,
                        text:'常用下载管理',
                        url:require('../../assets/home/Cirlce(5).png'),
                        route:'downloadPortal/downloadManage'
                    },
                    {
                        //createUser: 1308,
                        text:'权限管理',
                        url:require('../../assets/home/Cirlce(6).png'),
                        route:'sys/role-manage'
                    },
                    {
                        //createUser: 28,
                        text:'接口管理',
                        url:require('../../assets/home/Cirlce(7).png'),
                        route:'subsystem-interface/subsystem-interface'
                    }
                ],
                username: "",
                isOpen:true,
            };
        },
        computed: {
            currNav() {
                return this.$store.state.app.currNav;
            },
        },
        methods: {
            init() {
                let userInfo = JSON.parse(Cookies.get("userInfo"));
                this.username = userInfo.username;
            }
            ,
            dianji(){
                alert("11111");
            }
        },
        mounted() {
            this.init();

        }
    };
</script>
