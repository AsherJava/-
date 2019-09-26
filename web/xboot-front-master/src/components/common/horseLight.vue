<template>
    <div  ref="horseLight" class="horseLight">
     <ul   ref="horseUl" :style="{left:Left+'px'}" @mouseover="moveClear" @mouseleave="move">
        <li :style="{height:Height,width:Width}" v-for="(item,index) in dataList" :class="{leave:!(index==Index),enter:index==Index}">
            <img :src="item" alt="">
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
                        'https://i1.fuimg.com/693259/32fe2a1e11a35de4.png',
                        'https://i1.fuimg.com/693259/f3d7514217caa8b4.png',
                        'http://i1.fuimg.com/693259/c54743d9260a8f81.png',
                        'https://i1.fuimg.com/693259/3c99e08a4e4eabc6.png',
                        'https://i1.fuimg.com/693259/c8a8767217be9bef.png',
                        'https://i1.fuimg.com/693259/1a942aaf11693a29.png',
                        'https://i1.fuimg.com/693259/e7bb49ee72cdd275.png',
                        // 'https://i1.fuimg.com/693259/5fee12b44a5d06ac.png'
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
                timer:null,
            }
        },
        watch:{
            Index(val){
                this.$emit('onChange',val);
            }
        },
        created(){

        },
        mounted(){
            this.move()
        },
        methods:{
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
