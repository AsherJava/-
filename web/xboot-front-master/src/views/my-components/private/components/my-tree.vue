<template>
        <Tree id="myTree"  :data="data" :render="rend"></Tree>
</template>

<script>
    export default {
        name: "my-tree",
        props:{
            data:{

                type:Array,
                default:[],
            },
            rend:{
                type:Function,
                default:function () {

                }
            }
        },
            data(){
                return{

                }
            },
            methods:{

            }
    }
</script>
<style lang="less">
        #myTree{
                .ivu-tree-children{
                   li   {
                           >span{

                                   >span:first-child{
                                           cursor: pointer;
                                   }
                           }
                   }
                }
        }
</style>
<style scoped>

</style>
