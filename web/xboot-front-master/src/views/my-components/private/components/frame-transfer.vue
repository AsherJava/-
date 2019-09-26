<template>
    <div>
        <frame-medal  v-model="value" :Title="Title" Width="460">

            <search-info @change="onChange"></search-info>
                    <div class="transfer">
                        <transfer-common :data="data1" :targetKey="targetKeys1" @onChange="handleChange"></transfer-common>
                    </div>
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
    import transferCommon from '@/views/my-components/private/components/common/transfer-common'
    import {MockData,targetKeys} from '@/libs/data'
    export default {
        name: "frame-transfer",
        components:{
            frameMedal,
            searchInfo,
            transferCommon
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
                default:'穿梭框',
            },
        },
        data(){
            return{
                value:false,
                search:'',
                data1:MockData(),
                targetKeys1:targetKeys(MockData())
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

            },
            handleChange(data,key){
                console.log(data)
                console.log(key)
                this.targetKeys1=key
            }
        }

    }
</script>

<style scoped>

    .transfer{
       margin-left: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 16px 0;
    }
</style>
