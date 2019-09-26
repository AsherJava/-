<template>
    <div>
        <frame-medal  v-model="value" :Title="Title" Width="348">

            <search-info @change="onChange"></search-info>
                <Scroll height="200" >
                    <div class="scrollTree">
                        <Tree :data="data1"></Tree>
                    </div>
                </Scroll>
            <div slot="footer">
                <Button type="default" @click="changeOpen(1)">取消</Button>
                <Button type="primary" @click="changeOpen(2)">确认</Button>
            </div>
        </frame-medal>
    </div>
</template>

<script>
    import frameMedal  from '@/views/my-components/private/components/common/frame-medal'
    import searchInfo  from '@/views/my-components/private/components/common/search-info'
    export default {
        name: "frame-tree",
        components:{
            frameMedal,
            searchInfo
        },
        props:{
            data:{
                type:String|Number|Array,
                default:[],
            },
            open:{
                type:Boolean,
                default:false,
            },
            Title:{
                type:String|Number,
                default:'选择树',
            },
        },
        data(){
            return{
                value:false,
                search:'',
                data1: [
                    {
                        title: '久其金建',
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
        watch:{
            open(val){
                this.value=this.open;
            },
            value(val){
                this.$emit('update:open',val)
            }
        },
        methods:{
            onChange(val){
                this.search=val;
            },
            changeOpen(index){
                this.value=false;
                if(index==1){
                }else if(index==2){

                }

            }
        }

    }
</script>

<style scoped>
.scrollTree{
    padding-left: 16px;
}
</style>
