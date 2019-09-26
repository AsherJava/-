<template>
    <Transfer
            :data="data1"
            :target-keys="targetKeys1"
            :render-format="render1"
            @on-change="handleChange1">
    </Transfer>
</template>
<script>
    import {MockData,targetKeys} from '@/libs/data'

    export default {
        name: "transfer-common",
        props:{
            data:{
                type:Object|Array,
                default:function () {
                    return MockData()
                }
            },
            targetKey:{
                type:Object|Array,
                default:function () {
                    return targetKeys(MockData())
                }
            }
        },
        data () {
            return {
             data1:this.data,
             targetKeys1:this.targetKey
            }
        },
        watch:{
            data(val) {
                console.log(val)
            },
            targetKey(val) {
                this.targetKeys1 = val;
            },
        },
        methods: {
            getMockData () {
                return MockData();
            },
            getTargetKeys () {
                return targetKeys(this.getMockData())
            },
            render1 (item) {
                return item.label;
            },
            handleChange1 (newTargetKeys, direction, moveKeys) {
                this.$emit('onChange',this.data1,newTargetKeys, direction, moveKeys)
            }
        }
    }
</script>

<style scoped>

</style>
