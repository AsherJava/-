<template>
    <Modal  :id="modalId"
            v-model="modal"
            title="Title"
            :loading="loading"
            :footer-hide="!showFooter"
            :title="Title"
            :width="Width"
            @on-ok="asyncOK">
        <div slot="header" v-if="showHeader">
          <slot name="header"></slot>
        </div>
        <div>
            <slot>

            </slot>
        </div>
        <div slot="footer" v-if="showFooter">
            <slot name="footer"></slot>
        </div>
    </Modal>
</template>

<script>
    export default {
        name: "medal-frame",
        props:{
            modalId:{
                type: String|Number,
                default:'modalBox',
            },
            Width:{
                type: String|Number,
                default:'',
            },
            Title:{
                type: String|Number,
                default:'弹窗',
            },
            showHeader:{
                type: Boolean,
                default:false,
            },
            showFooter:{
                type: Boolean,
                default:true,
            },
            value: {
                type: Boolean,
                default:true,
            }
        },
        data () {
            return {
                modal:false,
                loading: true
            }
        },
        watch:{
            value(val) {
                this.modal = val;
            },
            modal(val){
                this.$emit("input",val);
            }
        },

        methods: {
            asyncOK () {
                setTimeout(() => {
                this.modal=false;
                }, 2000);
            }
        }
    }
</script>

<style lang="less">
    #modalBox{
       .ivu-modal-body{
        padding: 0 0;
    }
    }

</style>
