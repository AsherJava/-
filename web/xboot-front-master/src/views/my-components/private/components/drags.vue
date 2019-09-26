<template>
    <div :class="treeLink" ref="treeLink">
        <div :class="treeExample" ref="treeExample" v-if="isOpen">
              <slot name="navs"></slot>
        </div>
        <div   :class="{linkMg:isOpen,linkTable:true}"  ref="linkTable">
            <div class="Position">
                <div :class="{linkDragsW:isOpen,linkDrags:true}" @mousedown="move">
                    <slot name="button">
                    </slot>
                </div>
                <div :class="TableContent" ref="TableContent">
                    <slot name="content"></slot>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
    export default {
        name: "drags",
        props:{
            isOpen:{
                type:Boolean,
                default:true,
            },
            treeLink:{
                type:String,
                default:'treeLink',
            },
            treeExample:{
                type:String,
                default:'treeExample',
            },
            linkTable:{
                type:String,
                default:'linkTable',
            },
            linkDrags:{
                type:String,
                default:'linkDrags',
            },
            TableContent:{
                type:String,
                default:'TableContent'
            }
        },
        methods:{
            move(e){
                let that= e.target;
                let disX;
                let Y;
                if(this.isOpen){
                    Y=e.target.offsetWidth
                    disX=e.clientX - this.$refs.treeExample.offsetWidth+Y;
                    document.onmousemove = (e)=>{       //鼠标按下并移动的事件
                        //用鼠标的位置减去鼠标相对元素的位置，得到元素的位置
                        let left = e.clientX - disX;
                        console.log(left)
                        //绑定元素位置到positionX和positionY上面
                        this.$refs.treeExample.style.width= left+'px';
                        this.$refs.linkTable.style.marginLeft= left+'px';
                        this.$refs.TableContent.style.width=left-Y+'px';
                        //移动当前元素
                    };
                    document.onmouseup = (e) => {
                        document.onmousemove = null;
                        document.onmouseup = null;
                    };
                }

            }
        }
    }
</script>

<style scoped>
    .Position{
        width: 100%;
        position: relative;
        height: 100%;
    }
    .treeLink{
        width: 100%;
        height: 700px;
        position: relative;
        border: 1px solid #dcdee2;
    }
    .treeExample{
        position: absolute;
        left: 0;
        top: 0;
        width: 240px;
        height: 100%;
        z-index: 2;
    }
    .linkTable{
        width: 100%;
        height: 100%;
        position: relative;
    }
    .linkMg{
       padding-left: 240px;
    }
    .linkDrags{
        width: 10px;
        height: 100%;
        border-left: 1px solid #dcdee2;
        border-right: 1px solid #dcdee2;
        position: absolute;
        left: 0;
        right: 0;
    }
    .linkDragsW{
        cursor: w-resize;
    }
    .TableContent{
       padding-left:8px;
        width: 100%;
        height: 100%;
    }
</style>

