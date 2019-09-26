<template>
    <div>
        <Button ref="" type="primary" @click="onClick">弹框按钮</Button>
        <p>{{modal}}</p>
        <frame-transfer :open.sync="modal" :data="data1"></frame-transfer>
    </div>
</template>

<script>
    import frameTransfer from './components/frame-transfer'
    export default {
        name: "frame-transfer-pages",
        components:{
            frameTransfer
        },
        data(){
            return{
                modal:false,
                data1:''
            }
        },
        methods:{
            onClick(){
                this.modal=true;
            }
        }
    }
</script>

<style scoped>

</style>
