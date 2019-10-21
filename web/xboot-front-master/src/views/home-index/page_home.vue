<style lang="less">
    @import "../home/home.less";
    @import "../../styles/common.less";
    .my-card{
        .ivu-card-body{
            padding: 10px 12px;
        }
    }
    .my-card1{
        .ivu-card-body{
            padding: 0;
        }
    }
</style>
<style scoped lang="less">
    @import "./page_home.less";
    .demo-carousel{
        width: 100%;
        height: 100%;
    }
</style>
<template>
    <div>
        <div class="paValue">
            <Col :md="24" :lg="24" class="posiFix">
                <Row >
                    <div class="pl12 pp12 pr12" >
                        <Card  class="Position">
                            <div class="Entrance flex">
                                <span class="entranceSpan" :class="{spanTips1:index==0}"  v-for="(item ,index) in entrance" :key="index">
                                    <div style="position: relative">
                                         <Badge dot style="position: absolute;z-index: 10;right: 0" v-if="item.code=='todo'">
                                          </Badge>
                                   <img style="width: 60px;height: 60px" @click="entranceClick(item.url)" :class="{img1:index==0}" :src="imgFormat(item.imageUrl)" alt="">
                                    <div class="span-tips" >
                                        {{item.sysName}}
                                    </div>
                                    </div>
                                </span>
                            </div>
                        </Card>
                    </div>
                </Row>
            </Col>
            <Col :md="24" :lg="24">
                <Row >
                    <div class="pl12 pb12 pr12">
                        <Card  class="Position">
                            <p class=" maC span-message1 spanPo" style="zIndex: 1">
                                <span>新闻中心</span>
                            </p>
                            <div class="News Position">
                                <span class="gen" style="float: right">更多</span>
                                <div class="new-child wh1 hg">
                                    <div class="pic-img">
                                        <div  class="new-child-img">
                                            <horse-light @onChange="carouselChange" ref="carouse"></horse-light>
                                        </div>
                                        <!--<img class="new-child-img" :src="isTipNews(tipsNews.imgUrl)" alt="">-->
                                        <div class="new-content new-content1">
                                            <div @mouseover="$refs.carouse.moveClear()" @mouseleave="$refs.carouse.move()">
                                                <p class="flex maC wh1 " :ref="'p'+index" v-for="(item ,index) in News" :key="index" v-if="index<8">
                                                    <a class="flex-a " href="javascript:void(0);" :class="{lightNews:carouselValue==index}"  @mouseover="$refs.carouse.Index=index"   @click="localClick(item.infoCode=='1',item.url,item.id,item.newsId)">
                                                         <span class="new-icon new-icon-span">
                                                             <span class="word">
                                                              {{index+1}}
                                                             </span>
                                                         </span>
                                                        <span class="size4 pl12 span-Eli  Ellipsis" v-model="Width" :style="{width:Width+'px'}">{{item.newsTitle}}</span>
                                                        <span class="NewsTime NewsTime1">{{item.createTime}}</span>
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </Card>
                    </div>
                </Row>
            </Col>
            <Col :md="24" :lg="24" >
                <Row>
                    <Col :md="24" :lg="8" >
                        <div class="pl12 pr12 pb12">
                            <Card  class="Position">
                                <div class="messageCom message300" ref="list0">
                                    <p class="wh1 Position maC span-message1">
                                        <span class="lineTitle"></span>
                                        <span class="size5 lineTitlePa"><span>通知公告</span></span>
                                        <span class="gen2">
                                               <span>更多</span>
                                        </span>
                                    </p>
                                    <p class="wh1 flex maC Position span-message" :id="`list${index}`" v-for="(item,index) in notice.result" :key="index">
                                        <a target="_blank" :href="item.url">
                                            <span class="dian"></span>
                                            <span class=" span-Eli  Ellipsis" v-model="WidthMes" :style="{width:WidthMes+'px'}">
                                            {{item.title}}
                                            </span>
                                            <span class="message-timer">{{ dateFormat(item.updateTime)}}</span>
                                        </a>
                                    </p>
                                </div>
                            </Card>
                        </div>
                    </Col>
                    <Col :md="24" :lg="8" >
                        <div class="pr12 pb12">
                            <Card  class="Position">
                                <div class="messageCom message300" ref="list0">
                                    <p class="wh1 Position maC span-message1">
                                        <span class="lineTitle"></span>
                                        <span class="size5 lineTitlePa" >公文中心</span>
                                        <span class="gen2">
                                            <span>更多</span>
                                        </span>
                                    </p>
                                    <p class="wh1 flex maC Position span-message" :id="`li${index}`" v-for="(item,index) in selectNotice.result" :key="index" >
                                        <a target="_blank" :href="item.url">
                                            <span class="dian"></span>
                                            <span class=" span-Eli  Ellipsis" v-model="WidthMes" :style="{width:WidthMes+'px'}">
                                            {{item.title}}
                                            </span>
                                            <span class="message-timer">{{ dateFormat(item.updateTime)}}</span>
                                        </a>
                                    </p>
                                </div>
                            </Card>
                        </div>
                    </Col>
                    <Col :md="24" :lg="8" >
                        <div class=" pb12 pr12">
                            <Card  class="Position">
                                <div class="messageCom message300" ref="list0">
                                    <p class="wh1 Position maC span-message1">
                                        <span class="lineTitle"></span>
                                        <span class="size5 lineTitlePa">预警信息</span>
                                      <span class="size6 ">{{WarningNews.length}}</span>

                                        <span class="size5">类</span>
                                        <span class="gen2">
                                            <span>更多</span>
                                        </span>
                                    </p>
                                    <p class="wh1 flex maC Position span-message" :id="`lis${index}`" v-for="(item,index) in WarningNews" :key="index" >
                                        <a href="javascript:void(0);" target="_blank" @click="warningNewsClick(item.functionName)" >
                                            <span class="dian"></span>
                                            <span class=" span-Eli  Ellipsis" v-model="WidthMes" :style="{width:WidthMes+'px'}">
                                               {{item.warningName}}
                                            </span>
                                            <span class="message-timer">{{item.count}}条</span>
                                        </a>
                                    </p>
                                </div>
                            </Card>
                        </div>
                    </Col>
                </Row>
                <Row>
                    <Col :md="24" :lg="8" >
                        <Row>
                            <div class=" pl12 pr12 pb12">
                                <Card class="Position paC my-card1">
                                    <tab-card Title="OA平台"  Height="305"  @open="">
                                        <div slot="content1"  ref="list1">
                                            <div class="message-content flex-a"
                                                 v-for="(item,index) in cardOa"
                                                 :key="index" v-if="index<5"
                                                 @click=" fromSummit(item.value,{
                                                 userCode:userInfo.idcardEncryption.toString(),
                                                 changingtype:item.code,
                                                 params:item.url })"
                                            >
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                    <span class="message-name">{{item.name}}</span>
                                                    <span class="message-timer">{{ dateFormat(item.createTime)}}</span>
                                                </p>
                                            </div>
                                        </div>
                                        <div slot="content0">
                                            <div class="message-content flex-a"
                                                 v-for="(item,index) in cardOa"
                                                 :key="index"
                                                 v-if="index<5"
                                                 @click=" fromSummit(item.value,{
                                                 userCode:userInfo.idcardEncryption.toString(),
                                                 changingtype:item.code,
                                                 params:item.url })">
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >

                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                    <span class="message-name">{{item.name}}</span>
                                                    <span class="message-timer">{{ dateFormat(item.createTime)}}</span>

                                                </p>
                                            </div>
                                        </div>
                                    </tab-card>
                                </Card>
                            </div>
                        </Row>
                    </Col>
                    <Col :md="24" :lg="8" >
                        <Row>
                            <div class="pr12 pb12">
                                <Card class="Position paC my-card1">
                                    <tab-card Title="HR平台"  Height="305"  @open="">
                                        <div slot="content1"  ref="list1">
                                            <div class="message-content flex-a" v-for="(item,index) in cardHr" :key="index" v-if="index<5"
                                                 @click="fromSummit(item.value,{
                                                 userCode:userInfo.idcardEncryption.toString(),
                                                 changingtype:item.code,
                                                 params:item.url })">
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                    <!--<span class="message-name">{{item.name}}</span>-->
                                                    <span class="message-timer">{{ dateFormat(item.createTime)}}</span>

                                                </p>
                                            </div>
                                        </div>
                                        <div slot="content0">
                                            <div class="message-content flex-a" v-for="(item,index) in cardHr1" :key="index" v-if="index<5"
                                                 @click=" fromSummit(item.value,{
                                                 userCode:userInfo.idcardEncryption.toString(),
                                                 changingtype:item.code,
                                                 params:item.url })"
                                            >
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                    <!--<span class="message-name">{{item.name}}</span>-->
                                                    <span class="message-timer">{{ dateFormat(item.createTime)}}</span>

                                                </p>
                                            </div>
                                        </div>
                                    </tab-card>
                                </Card>
                            </div>
                        </Row>
                    </Col>

                    <Col :md="24" :lg="8" >
                        <Row>
                            <div class="pr12 pb12">
                                <Card class="Position paC my-card1">
                                    <tab-card Title="常用链接"  :card-title-list='cardTitleList1' :content-index=1 Height="305"  @open="">
                                        <div>
                                            <div class="message-content flex-a"  v-for="(item ,index) in  linkUrl" :key="index" @click="openHref(item.url,'_blank')">
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                </p>
                                            </div>
                                        </div>
                                    </tab-card>
                                </Card>
                            </div>
                        </Row>
                    </Col>
                </Row>
                <Row>
                    <Col :md="24" :lg="8" >
                        <Row>
                            <div class="pl12 pr12 pb12">
                                <Card class="Position paC my-card1">
                                    <tab-card Title="财务管理平台"  Height="305"  @open="">
                                        <div slot="content1"  ref="list1">
                                            <div class="message-content flex-a" v-for="(item,index) in cardCai" :key="index"
                                                 @click=" fromSummit(item.value,{
                                                 userCode:userInfo.idcardEncryption.toString(),
                                                 changingtype:item.code,
                                                 params:item.url })">
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                    <span class="message-name">{{item.name}}</span>
                                                    <span class="message-timer">{{ dateFormat(item.createTime)}}</span>
                                                </p>
                                            </div>
                                        </div>
                                        <div slot="content0">
                                            <div class="message-content flex-a" v-for="(item,index) in  cardCai1" :key="index"
                                                 @click=" fromSummit(item.value,{
                                                 userCode:userInfo.idcardEncryption.toString(),
                                                 changingtype:item.code,
                                                 params:item.url })"
                                            >
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                    <span class="message-name">{{item.name}}</span>
                                                    <span class="message-timer">{{ dateFormat(item.createTime)}}</span>
                                                </p>
                                            </div>
                                        </div>
                                    </tab-card>
                                </Card>
                            </div>
                        </Row>
                    </Col>
                    <Col :md="24" :lg="8" >
                        <Row>
                            <div class="pr12 pb12">
                                <Card class="Position paC my-card1">
                                    <tab-card Title="项目管理平台"  Height="305"  @open="">
                                        <div slot="content1"  ref="list1">
                                            <div class="message-content flex-a" v-for="(item,index) in cardMd" :key="index"
                                                 @click=" fromSummit(item.value,{
                                                 userCode:userInfo.idcardEncryption.toString(),
                                                 changingtype:item.code,
                                                 params:item.url })"
                                            >
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                    <span class="message-name">{{item.name}}</span>
                                                    <span class="message-timer">{{ dateFormat(item.createTime)}}</span>
                                                </p>
                                            </div>
                                        </div>
                                        <div slot="content0">
                                            <div class="message-content flex-a" v-for="(item,index) in cardMd1" :key="index"
                                                 v-if="index<4"
                                                 @click=" fromSummit(item.value,{
                                                 userCode:userInfo.idcardEncryption.toString(),
                                                 changingtype:item.code,
                                                 params:item.url })"
                                            >
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class="dian dian-black"></span>
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}
                                                    </span>
                                                    <span class="message-name">{{item.name}}</span>
                                                    <span class="message-timer">{{ dateFormat(item.createTime)}}</span>
                                                </p>
                                            </div>
                                        </div>
                                    </tab-card>
                                </Card>
                            </div>
                        </Row>
                    </Col>
                    <Col :md="24" :lg="8" >
                        <Row>
                            <div class="pr12 pb12">
                                <Card class="Position paC my-card1">
                                    <tab-card Title="常用下载"  :card-title-list='cardTitleList1' :content-index=1 Height="305"  @open="">
                                        <div>
                                            <div class="message-content flex-a"  v-for="(item,index) in download" :key="index" @click="openHref(item.url,'_blank')">
                                                <p class="wh1 flex Position span-message" :id="`list${index}`" >
                                                    <span class=" span-Eli  Ellipsis" v-model="cardWidth" :style="{width:cardWidth+'px'}">
                                                    {{item.title}}({{ dateTime(item.updateTime).y}}-{{ dateTime(item.updateTime).M}}-{{ dateTime(item.updateTime).d}})
                                                    </span>
                                                </p>
                                            </div>
                                        </div>
                                    </tab-card>
                                </Card>
                            </div>
                        </Row>
                    </Col>
                </Row>
            </Col>
            <!--<Col :md="24" :lg="5">-->
                <!--<Row>-->
                    <!--<div class="pb12">-->
                        <!--<Card  class="Position paC my-card ">-->
                            <!--<div class="message">-->
                              <!--<p class="wh1 Position maC span-message1">-->
                                  <!--<span class="size5">预警信息</span>-->
                                  <!--<span class="size6">{{WarningNews.length}}</span>-->
                                  <!--<span class="size5">类</span>-->
                                  <!--<span class="gen">更多</span>-->
                              <!--</p>-->
                                <!--<p @click="warningNewsClick(item.functionName)" class="wh1 flex maC Position span-message" v-for="(item,index) in WarningNews" :key="index" v-if="index<3">-->
                                    <!--<a href="javascript:void(0);">-->
                                    <!--<span class="dian"></span>-->
                                    <!--<span class="">-->
                                          <!--{{item.warningName}}-->
                                    <!--</span>-->
                                      <!--<span class="message-timer">{{item.count}}条</span>-->
                                    <!--</a>-->
                                <!--</p>-->

                            <!--</div>-->
                        <!--</Card>-->
                    <!--</div>-->
                <!--</Row>-->
                <!--<Row>-->
                    <!--<div class="pb12">-->
                        <!--<Card  class="Position paC my-card ">-->
                            <!--<div class="message message2">-->
                                <!--<p class="wh1 Position maC span-message1">-->
                                    <!--<span class="size5">常用链接</span>-->
                                <!--</p>-->
                                <!--<p class="wh1 flex maC Position span-message span-message2"  v-for="(item ,index) in  linkUrl" :key="index" >-->
                                     <!--<span class="">-->
                                     <!--<a :href="item.url" target="_blank">{{item.title}}</a>-->
                                    <!--</span>-->
                                <!--</p>-->
                            <!--</div>-->
                        <!--</Card>-->
                    <!--</div>-->
                <!--</Row>-->
                <!--<Row>-->
                    <!--<div class="pb12">-->
                        <!--<Card  class="Position paC my-card ">-->
                            <!--<div class=" message message3">-->
                                <!--<p class="wh1 Position maC span-message1">-->
                                    <!--<span class="size5">常用下载</span>-->
                                <!--</p>-->
                                <!--<a :href="item.url" target="_blank" v-for="(item,index) in download" :key="index" style="width: 100%;">-->
                                    <!--<p class="wh1 Position maC span-message1" >-->
                                <!--<span class="often-use">-->
                                  <!--<span class="pl12 flex">-->
                                      <!--<span>{{item.title}}</span>(<span>{{ dateFormat(item.updateTime)}}</span>）-->
                                  <!--</span>-->
                                <!--</span>-->
                                    <!--</p>-->
                                <!--</a>-->
                            <!--</div>-->
                        <!--</Card>-->
                    <!--</div>-->
                <!--</Row>-->
              <!--<Row>-->
              <!--</Row>-->
            <!--</Col>-->
        </div>

    </div>
</template>

<script>
    import Cookies from "js-cookie";
    import {pageHome} from "@/libs/data";
    import { screenW,onSize,fromPost,downCount,openHref} from "@/libs/tool";
    import { dateFormat,dateTime } from "@/libs/date";
    import {
        systemGet ,
        loginTest,
        GetWarning,
        GetWorkAll,
        GetDoneAll,
        noticeAll,
        commonLink,
        selectPage,
        NoticePage,
        apiTest,
        callForm,
        fullList
    } from '@/api/index.js';
    import {selectInformation ,
            selectNotice,
            downloadResources,
            getWarning,
            selectNewsPortal
        } from '@/api/moduleIndex.js'
    import {postHttp ,postTo} from '@/libs/axios';
    import $ from 'jquery'
    import tabCard from '@/components/card/tabCard.vue'
    import horseLight from '@/components/common/horseLight.vue'
    export default {
        name: "page_home",
        components: {
            tabCard,
            horseLight
        },
        data() {
            return {
                username:'',//用户名
                userInfo:'',//用户信息
                tips:{},
                News:[],//新闻
                Width:0,//新闻宽度超出显示省略号
                WidthMes:0,///公告
                cardWidth:0,//选项片
                screenWidth:screenW(),//屏幕宽度
                cardTitleList1:[],
                cardTitleList:[//选项卡头
                    '办结事项',
                    '已办信息',
                    '待办信息',
                ],
                carouselValue:0,
                cardLine:0,//卡片头部蓝线
                cardOa:'',//卡片头部蓝线
                //已办代办信息
                cardHr:'',
                cardCai:'',
                cardOa1:'',
                cardHr1:'',
                cardCai1:'',
                cardMd:'',
                cardMd1:'',
                entrance:[],
                linkUrl:[],
                download:[],
                tipsNews:'',
                backlogUrl:[],
                fullUrl:[],
                linkInfoUrl:[],
                titleMessage:[
                    'OA',
                    'HR',
                    '财务管理',
                    '项目管理'
                ],
                numMessage:[
                    '费控待办',
                    '费控已办'
                ],
                notice:'',
                Warning:'',
                WarningNews:[],
                selectNotice:'',
                imgIcon:[
                    require('../../assets/home-pages/Rectangle-path@2x.png'),
                    require('../../assets/home-pages/Rectangle-path@2x(1).png'),
                    require('../../assets/home-pages/Rectangle-path@2x(2).png'),
                    require('../../assets/home-pages/Rectangle-path@2x(3).png'),
                    require('../../assets/home-pages/Rectangle-path@2x(4).png'),
                ],
                Height:'208px',
                data:'100%',

            };
        },
        created(){
            downCount(323,'cardTitleList',this)
            this.pageData();
            this.cardLine=this.cardTitleList.length-1;
            this.init();

        },
        computed: {

        },
        watch: {
            screenWidth (val) {
                this.screenWidth = val
                this.onWidth()
            }
        },

        methods: {
            dateTime: dateTime,
            timerTool:function (time) {//轮询时间
                let that=this
                setInterval(function () {
                    that.fullAdd({
                        num:6,
                        moduleName:'OA',
                        code:'todo',
                        userCode:that.userInfo.idcard
                    },'cardOa');
                    that.fullAdd({
                        num:6,
                        moduleName:'OA',
                        code:'done',
                        userCode:that.userInfo.idcard
                    },'cardOa');
                    that.fullAdd({
                        num:6,
                        moduleName:'HR',
                        code:'todo',
                        userCode:that.userInfo.idcard
                    },'cardHr');
                    that.fullAdd({
                        num:6,
                        moduleName:'HR',
                        code:'done',
                        userCode:that.userInfo.idcard
                    },'cardHr1');

                    that.fullAdd({
                        num:6,
                        moduleName:'FD',
                        code:'todo',
                        userCode:that.userInfo.idcard
                    },'cardCai');
                    that.fullAdd({
                        num:6,
                        moduleName:'FD',
                        code:'done',
                        userCode:that.userInfo.idcard
                    },'cardCai1');

                    that.fullAdd({
                        num:6,
                        moduleName:'PM',
                        code:'todo',
                        userCode:that.userInfo.idcard
                    },'cardMd');
                    that.fullAdd({
                        num:6,
                        moduleName:'PM',
                        code:'done',
                        userCode:that.userInfo.idcard
                    },'cardMd1');
                },time)
            },
            cardTitleClick(item){
                this.cardLine=item;
            },
            carouselChange(val){
                this.carouselValue=val;
            },
            fromSummit:fromPost,
            warningNewsClick(item){
                let url;
                if(item){
                    let data={
                        userCode:this.userInfo.idcardEncryption.toString(),
                        templateName:item
                    }
                    fromPost(this.Warning,data)
                   // url=this.Warning+'&userCode='+this.userInfo.idcardEncryption.toString()+'&templateName='+item;
                }
             //   window.open(url,"_blank");
            },
            socketChange(item){
                if(item.success){
                    this.init();
                }
            },
            localClick(item,url,id,newID){
                if(item){
                        this.setStore('pagesNewsDetail',id)
                        this.$router.push({
                            name: "pages_news_detail"
                        });
                }else {
                 this.fromSummit(url,
                     {
                         userCode:this.userInfo.idcardEncryption.toString(),
                         newsId:newID.toString()
                     })
                }
            },
            dateFormat: dateFormat,
            isTipNews(item){
                if(item){
                    return item
                }else {
                    return require('../../assets/home-pages/heiheihei.png')
                }
            },
            getHttp(url,id){
               this.$http.get(url,{params:{idcardEncryption:id}},{}).then(response => {

                }, response => {
                    // error callback
                });
            },
            imgFormat(item){
                return require('../../assets/home-pages/'+item);
            },
            init() {
                let userInfo = JSON.parse(Cookies.get("userInfo"));
                this. userInfo=userInfo;
                this.username = userInfo.username;
                this.systemALL();
            },
            pageData(){
                let data;
                [data]=pageHome()
                this.News=data.News;
              ///  this.cardOa=data.result
            },
            onWidth(){
                this.Width=this.$refs.p0[0].clientWidth-160;
                this.WidthMes=this.$refs.list0.clientWidth-160;
                this.cardWidth=this.$refs.list1.clientWidth-310;
            },
            hrefUrl(item,code){
                let url;
                if(code==0){
                    url=item+'&userCode='+this.userInfo.idcardEncryption.toString();
                    return  url
                }else {
                    url='javascript:void(0);';
                    return  url
                }
            },
            systemALL(){
                this.getWarning();
                this.selectNewsPortal();
                this.fullAdd({
                    num:6,
                    moduleName:'OA',
                    code:'todo',
                    userCode:this.userInfo.idcard
                },'cardOa');
                this.fullAdd({
                    num:6,
                    moduleName:'OA',
                    code:'done',
                    userCode:this.userInfo.idcard
                },'cardOa');
                this.fullAdd({
                   num:6,
                   moduleName:'HR',
                   code:'todo',
                   userCode:this.userInfo.idcard
               },'cardHr');
                this.fullAdd({
                    num:6,
                    moduleName:'HR',
                    code:'done',
                    userCode:this.userInfo.idcard
                },'cardHr1');
                this.fullAdd({
                    num:6,
                    moduleName:'FD',
                    code:'todo',
                    userCode:this.userInfo.idcard
                },'cardCai');
                this.fullAdd({
                    num:6,
                    moduleName:'FD',
                    code:'done',
                    userCode:this.userInfo.idcard
                },'cardCai1');
                this.fullAdd({
                    num:6,
                    moduleName:'PM',
                    code:'todo',
                    userCode:this.userInfo.idcard
                },'cardMd');
                this.fullAdd({
                    num:6,
                    moduleName:'PM',
                    code:'done',
                    userCode:this.userInfo.idcard
                },'cardMd1');
                this.downloadResources();
                this.selectInformation();
                this.selectNoti();
                this.commonLink();
                this.systemGet();

            },
            getWarning(){//预警
                getWarning().then(res=>{
                    if(res.code==200){
                        let data=res.result;
                        let that=this;
                        let ID=this.userInfo.idcardEncryption;
                        data.forEach(function (item) {
                            that.Warning=item.subUrl;
                            apiTest({
                                "message": {
                                    "method": "getWarningCountByUserCode",
                                    "data": {
                                        "receiver": "JQFO",
                                        "sender": "PORTAL",
                                        "userCode":that.userInfo.idcard,//that.userInfo.idcard
                                    }
                                },
                                "url":item.url
                            }).then(response => {
                                let data=response.data
                      if(data){

                          that.WarningNews=data.items;
                      }
                            });
                        })

                    }else {
                        this.$Message.error(res.message);
                    }
                })
            },
            selectNewsPortal(){//新闻
                selectNewsPortal({departmentId:this.userInfo.departmentId,num:7}).then(res=>{
                    if(res.code==200){
                        let data=res;
                        this.tipsNews=data
                        this.News=data.result;
                    }
                })
            },
            fullAdd(data,key){//已办，代办
                fullList(data).then(res=>{
                    if(res.success){

                        this[key]=res.result
                        // fromPost({
                        //     userCode:this.userInfo.idcardEncryption.toString(),
                        //     changingtype:'todo',
                        //     params:res.result[0].url
                        // })
                    }

                })
            },
            downloadResources(){//常用下载
                downloadResources({departmentId:this.userInfo.departmentId,num:6}).then(res=>{
                    if(res.code==200){
                        this.download=res.result
                    }else {
                        this.$Message.error(res.message);
                    }
                })
            },
            selectInformation(){//通知公告
                selectInformation({departmentId:this.userInfo.departmentId,num:8}).then(res=>{
                    if(res.code==200){
                        this.notice=res
                    }else {
                        this.$Message.error(res.message);
                    }
                })
            },
            selectNoti(){//公文中心
                selectNotice({departmentId:this.userInfo.departmentId,num:8}).then(res=>{
                    if(res.code==200){
                        this.selectNotice=res
                    }else {
                        this.$Message.error(res.message);
                    }
                })
            },
            commonLink(){//常用链接
                commonLink({num:6}).then(res=>{
                    if(res.code==200){
                        this.linkUrl=res.result
                    }else {
                        this.$Message.error(res.message);
                    }
                })
            },
            systemGet(){//快捷入口
                systemGet().then(res=>{
                    if(res.code==200){
                        this.entrance=res.result
                    }else {
                        this.$Message.error(res.message);
                    }
                })
            },
            entranceClick(item){
               // let url;
               // if(item){
               //     url=item+'?userCode='+this.userInfo.idcardEncryption.toString();
               // }else {
               //     url=''
               // }
               // window.open(url,"_blank");
                if(item){
                    this.fromSummit(item,{userCode:this.userInfo.idcardEncryption.toString()})
                }
            },
            openHref:openHref,


        },
        mounted() {
            this.onWidth()//动态的添加宽度为了本页面的省略号才搞的
            onSize(this,'screenWidth')//监听赋值
            this.timerTool(10000)
        }
    };
</script>
