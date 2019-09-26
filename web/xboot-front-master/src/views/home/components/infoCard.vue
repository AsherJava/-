<style lang="less">
    @import './styles/info-card.less';
</style>
<style scoped lang="less">
    .img-pic{
        display: inline-block;
        width: 60px;
        height: 60px;
    }
    .count-box{
        width: 100%;
        display: inline-block;

    }
    .count-box1{
        font-size:26px;
        font-family:PingFang-SC-Heavy;
        font-weight:800;
        color:rgba(37,38,49,1);
    }
    .count-box2{
        font-size:14px;
        font-family:PingFang-SC-Heavy;
        font-weight:800;
        color:rgba(152,169,188,1)
    }
</style>
<template>
    <Card :padding="0">
        <div class="infor-card-con">
            <Col class="infor-card-icon-con" :style="{color: 'white'}" span="8">
                <Row class="height-100" type="flex" align="middle" justify="center">

                    <!--<a href="http://www.baidu.com"><img class="img-pic" :src="imgUrl" alt=""></a>-->
                    <router-link :to='route'><img class="img-pic" :src="imgUrl" alt=""></router-link>
                </Row>
            </Col>
            <Col span="16" class="height-100">
                <Row type="flex" align="middle" justify="start" class="height-100">
                    <span>
                         <span class="count-box count-box1">
                            {{introText}}
                         </span>
                          <span class="count-box count-box2">
                             {{endVal}}
                          </span>
                    </span>

                </Row>
            </Col>
        </div>
    </Card>
</template>

<script>
    export default {
        name: 'infoCard',
        components: {

        },
        props: {
            route: String,
            idName: String,
            endVal: Number,
            color: String,
            iconType: String,
            introText: String,
            imgUrl:{
                type:String,
                default:'',
            },
            countSize: {
                type: String,
                default: '30px'
            },
            countWeight: {
                type: Number,
                default: 700
            },
            iconSize: {
                type: Number,
                default: 40
            }
        }
    };
</script>

