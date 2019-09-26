<template>
    <div>
        <Button  type="primary" @click="onClick">弹框按钮</Button>
        <p>{{modal}}</p>
        <frame-table  :open.sync="modal">   </frame-table>
    </div>

</template>

<script>
    import frameTable  from '@/views/my-components/private/components/frame-table'

    export default {
        name: "frame-table-pages",
        components:{
            frameTable
        },
        data(){
            return{
                modal:false,
            }
        },methods:{
            onClick(){
                this.modal=true;
            }
        }
    }
</script>

<style scoped>

</style>
