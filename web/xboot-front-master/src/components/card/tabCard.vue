<template>
    <div class=" messageCom message300  Position" :style="{height:Height+'px'}">
        <div class="nav-card">
            <div class="title">
                <span class="lineTitle"></span> <span class="lineTitlePa">{{Title}}</span>
            </div>
            <ul>
                <li v-for="(item,index) in cardTitleList" :key="index" @click="cardTitleClick(index)">
                    <span :class="{spanColor:cardLine==index}">{{item}}</span>
                    <span class="lineColor1" :class="{lineColor:cardLine==index}"></span>
                </li>
            </ul>
        </div>
          <div v-if="contentIndex==0" class="nav-card-content"  v-for="(item,index) in cardTitleList"  :key="index"  :class="{isNone:cardLine==index}">
                    <slot :name="card+index" ></slot>
          </div>
          <div v-if="contentIndex==1" class="nav-card-content isNone">
                <slot></slot>
          </div>
        <div class="nav-card-footer flex-a" :class="{navCardFooter:!footerBorder}">
            <p class="wh1 Position messageAll">
                                                <span class="gen2">
                                                <span class="span-1" v-if="isShow" @click="buttonRefresh">{{footerOne}}</span>
                                                <span  @click="buttonOpen">{{footerTwo}}</span>
                                        </span>
            </p>
        </div>
    </div>
</template>

<script>
    export default {
        name: "tabCard",
        props:{
           Title:{
               type:String,
               default:'XXXX平台'
           },
            Height:{
                type:String|Number,
                default:'300'
            },
            cardTitleList:{
               type: Array,
                default:()=>{
                    return  [//选项卡头
                        '已办信息',
                        '待办信息',
                    ]
                }
            },
            cardIndex:{//头部默认选中
               type:Number,
                default:0,
            },
            footerOne:{
                type: String,
                default:'刷新'
            },
            footerTwo:{
                type: String,
                default:'更多'
            },
            footerBorder:{
               type:Boolean ,
                default:false,
            },
            contentIndex:{
               type:String|Number,
                default:0,
            },
                card:{
                    type: String,
                    default:'content'
            },
           isShow:{
                type: Boolean,
                default:false,
            }
        },
        data(){
            return{
                cardLine:0 ,
            }
        },
        created(){
            this.cardLine=this.cardTitleList.length-1;
        },
        watch:{
            cardTitleList(val){
                this.cardLine=val.length-1;
            }
        },
        methods:{
            cardTitleClick(item){
                this.cardLine=item;
            },
            buttonRefresh(){//刷新按钮
                this.$emit('refresh',true)
            },
            buttonOpen(){//触发事件 默认更多
                this.$emit('Open',true)
            },
        }
    }
</script>

<style scoped lang="less">
   @import "less/tab";
    .isNone{
        display: inline-block !important;
    }
</style>
