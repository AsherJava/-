<template>
<div>
    <Button ref="" type="primary" @click="onClick">弹框按钮</Button>
    <p>{{modal}}</p>
    <frame-tree :open.sync="modal" :data="data1"></frame-tree>
</div>
</template>

<script>
    import frameTree  from '@/views/my-components/private/components/frame-tree'
    export default {
        name: "frame-tree-pages",
        components:{
            frameTree
        },
        data(){
            return{
                modal:false,
                data1: [
                    {
                        title: 'parent 1',
                        expand: true,
                        children: [
                            {
                                title: '人事部',
                                expand: true,
                                children: [
                                    {
                                        title: '人事-1部',
                                        expand: true
                                    },
                                    {
                                        title: '人事-2部',
                                        expand: true
                                    }
                                ]
                            },
                            {
                                title: '财务部',
                                expand: true,
                                children: [
                                    {
                                        title: '财务-1部',
                                        expand: true
                                    },
                                    {
                                        title: '财务2部',
                                        expand: true
                                    }
                                ]
                            }
                        ]
                    }
                ]
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
