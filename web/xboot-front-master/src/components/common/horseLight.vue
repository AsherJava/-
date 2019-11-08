<template>
    <div  ref="horseLight" class="horseLight">
     <ul   ref="horseUl" :style="{left:Left+'px'}" @mouseover="moveClear" @mouseleave="move">
        <li :style="{height:Height,width:Width}" v-for="(item,index) in dataImg" :class="{leave:!(index==Index),enter:index==Index}">
            <img :src="item" alt="" onerror="this.src='http://10.2.24.14:8899/portalImage/default.jpg'">
        </li>
    </ul>
    </div>
</template>

<script>
    export default {
        name: "horseLight",
        props:{
            dataList:{
                type:Array,
                default:()=>{
                    return[
                    ]
                }
            },
            Height:{
                type: String,
                default:'100%'
            }
        },
        data() {
            return {
                Width:'100%',
                Left:0,
                Index:0,
                dataImg:[],
                timer:null,
            }
        },
        watch:{
            Index(val){
                this.$emit('onChange',val);
            },
            dataList(val){
                this.dataFor(val)
            }

        },
        created(){

        },
        mounted(){
            this.dataFor(this.dataList)
            this.move()
        },
        methods:{
            dataFor(val){
                var  data=[];

                if(val){
                    val.forEach(res=>{
                        data.push(res.imageUrl)
                    })
                    this.dataImg=data
                }else{
                    this.dataImg=[ 'http://10.2.24.14:8899/portalImage/default.jpg',]
                }
            },
         move(){
             let that=this;
             this.timer=setInterval(function () {
                 if(that.Index>=that.dataList.length-1){
                     that.Index=0;
                 }else {
                     that.Index=that.Index+1;
                 }
             },3000)
         },
            moveClear() {
                clearInterval(this.timer);
                this.timer = null;
            }

        }
    }
</script>

<style scoped lang="less">
  .horseLight{
      width: 100%;
      height: 100%;
      overflow: hidden;
      ul{
          height: 100%;
          width: 100%;

          position: relative;
          li{
              list-style: none;
                position: absolute;
                  left: 0;
                  top: 0;
                  opacity: 1;
                  transition: all 1s;
                img{
                    width: 100%;
                    height: 100%;
                    cursor: pointer;
                }
          }
      }
      .leave{
          opacity: 0;
      }
      .enter{
          z-index: 1;
      }
  }
</style>
