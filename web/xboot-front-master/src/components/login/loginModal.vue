<template>
    <Modal
            :class="modalId"
             v-model="modal"
            :footer-hide="!showFooter"
            :mask-closable="maskClosable"
            :closable="Closable"
            :width="Width"

    >
        <div slot="header" v-if="showHeader">
            <slot name="header">
            </slot>
        </div>
        <div>
            <slot>

            </slot>
        </div>
        <div slot="footer" v-if="showFooter">
            <slot name="footer">
            </slot>
        </div>

    </Modal>
</template>

<script>
    export default {
        name: "loginModal",
        props:{
            modalId:{
                type: String|Number,
                default:'loginNodal',
            },
            value:{
                type: Boolean,
                default:false,
            },
            showHeader:{
                type: Boolean,
                default:false,
            },
            showFooter:{
                type: Boolean,
                default:false,
            },
            Width:{
                type: String|Number,
                default:'',
            },
            maskClosable:{
                type: Boolean,
                default:true,
            },
            Closable:{
                type: Boolean,
                default:true,
            },
            Title:{
                type: String|Number,
                default:'弹窗',
            },
        },
        data(){
            return{
                modal:this.value,
            }
        },
        watch:{
            value(val){
                this.modal=val
            } ,
            modal(val){
                this.$emit("input",val);
            }
        }
    }
</script>

<style lang="less">
    .loginNodal{
    .ivu-modal-wrap{
        display: flex;
        align-items: center;
        justify-content: center;
    }
        .ivu-modal{
            position: static;

        }
    }

</style>
