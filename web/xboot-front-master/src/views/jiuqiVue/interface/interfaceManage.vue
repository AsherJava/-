<template>

    <div>

        <Tabs>
            <!--<TabPane label="新闻接口" icon="md-at">
                <subsystemNews></subsystemNews>
            </TabPane>-->
            <TabPane label="公文中心" icon="md-at">
            <subsystemNotice></subsystemNotice>
        </TabPane>
            <TabPane label="消息接口" icon="md-at">
                <newInformation></newInformation>
            </TabPane>
            <TabPane label="代办/已办接口" icon="md-at">
                <backlogInterface></backlogInterface>
            </TabPane>
            <TabPane label="预警接口" icon="md-at">
                <warningManage></warningManage>
            </TabPane>
            <TabPane label="登录验证接口" icon="md-at">
                <validateUserManage></validateUserManage>
            </TabPane>
        </Tabs>
    </div>
</template>

<script>
    import test from "@/views/jiuqiVue/interface/test.vue";
    import subsystemNews from "@/views/jiuqiVue/interface/subsystemNews.vue";
    import test2 from "@/views/jiuqiVue/interface/administriviaInterface.vue";
    import subsystemNotice from "@/views/jiuqiVue/interface/subsystemNotice.vue";
    import backlogInterface from "@/views/jiuqiVue/interface/backlogInterface.vue";
    import warningManage from "@/views/jiuqiVue/interface/warningManage.vue";
    import newInformation from "@/views/jiuqiVue/interface/newInformation.vue";
    import validateUserManage from "@/views/jiuqiVue/interface/validateUserManage.vue";

    export default {
        name: "interfaceManage",
        components: {
            validateUserManage,
            newInformation,
            warningManage,
            backlogInterface,
            subsystemNotice,
            test,
            test2,
            subsystemNews
        },
    }
</script>

<style scoped>

</style>
