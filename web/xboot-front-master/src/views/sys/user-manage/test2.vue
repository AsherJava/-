<style lang="less">
    @import "./userManage.less";
</style>
<template>
    <div class="search">
        <Row>
            <Col>
                <Card>

                    <Row class="operation">
                        <Button @click="add" type="primary" icon="md-add">添加用户</Button>
                    </Row>
                </Card>
            </Col>
        </Row>
        <Modal
                :title="modalTitle"
                v-model="userModalVisible"
                :mask-closable="false"
                :width="500"
                :styles="{top: '30px'}"
        >
            <Form ref="userForm" :model="userForm" :label-width="70" >

                <Form-item label="所属部门">
                    <department-tree-choose @on-change="handleSelectDepTree" ref="depTree"></department-tree-choose>
                </Form-item>
                <Form-item label="所属部门">
                    <department-tree-choose @on-change="handleSelectDepTree" ref="depTree"></department-tree-choose>
                </Form-item>
            </Form>
        </Modal>

    </div>
</template>

<script>
    import departmentTreeChoose from "../../my-components/xboot/department-tree-choose";
    export default {
        name: "user-manage",
        components: {
            departmentTreeChoose,
        },
        data() {
            return {
                modalTitle: "",
                userModalVisible: false,
                userForm: {
                    username: "",
                    idcard: "",//新增身份证号
                    mobile: "",
                    email: "",
                    sex: 1,
                    type: 0,
                    avatar: "",
                    roles: [],
                    departmentId: "",
                    departmentTitle: ""
                },
            };
        },
        methods: {
            init() {

            },
            handleSelectDepTree(v) {
                this.userForm.departmentId = v[0];
            },
            add() {
                this.modalType = 0;
                this.modalTitle = "添加用户";
                this.$refs.userForm.resetFields();
                this.userModalVisible = true;
            },
            edit(v) {
                this.modalType = 1;
                this.modalTitle = "编辑用户";
                this.$refs.userForm.resetFields();
                // 转换null为""
                for (let attr in v) {
                    if (v[attr] == null) {
                        v[attr] = "";
                    }
                }
                let str = JSON.stringify(v);
                let data = JSON.parse(str);
                this.userForm = data;
                this.$refs.depTree.setData([data.departmentId], data.departmentTitle);
                let selectRolesId = [];
                this.userForm.roles.forEach(function(e) {
                    selectRolesId.push(e.id);
                });
                this.userForm.roles = selectRolesId;
                this.userModalVisible = true;
            },


        },
        mounted() {
            this.init();
        }
    };
</script>
