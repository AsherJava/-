<template>
    <div>
        <Cascader
                v-model="selectDep"
                :data="department"
                :load-data="loadData"
                @on-change="handleChangeDep"
                change-on-select
                filterable
                clearable
                placeholder="请选择或输入搜索部门"
        ></Cascader>
    </div>
</template>

<script>
    import { initDepartment, loadDepartment } from "@/api/index";
    export default {
        name: "queryDepartmentXL",
        props: {
            reset:{
                type: String|Number|Array,
                default:"",
            },
        },
        data() {
            return {
                selectDep: [],
                department: [],
                //返回给父组件的对象
                dataForm: {
                    id:"",
                    value:"",
                }
            };
        },
        methods: {
            initDepartmentData() {
                initDepartment().then(res => {
                    if (res.success == true) {
                        res.result.forEach(function(e) {
                            if (e.isParent) {
                                e.value = e.id;
                                e.label = e.title;
                                e.loading = false;
                                e.children = [];
                            } else {
                                e.value = e.id;
                                e.label = e.title;
                            }
                            if (e.status == -1) {
                                e.label = "[已禁用] " + e.label;
                                e.disabled = true;
                            }
                        });
                        this.department = res.result;
                    }
                });
            },
            loadData(item, callback) {

                item.loading = true;
                loadDepartment(item.value).then(res => {
                    item.loading = false;
                    if (res.success == true) {
                        res.result.forEach(function(e) {
                            if (e.isParent) {
                                e.value = e.id;
                                e.label = e.title;
                                e.loading = false;
                                e.children = [];
                            } else {
                                e.value = e.id;
                                e.label = e.title;
                            }
                            if (e.status == -1) {
                                e.label = "[已禁用] " + e.label;
                                e.disabled = true;
                            }
                        });
                        item.children = res.result;
                        callback();
                    }
                });
            },
            handleChangeDep(value, selectedData) {
                const index = value.length - 1;
                const data = selectedData[index] || false;
                let departmentId = "";
                // 获取最后一个值
                if (value && value.length > 0) {
                    departmentId = value[value.length - 1];
                }
               this.dataForm.id=departmentId;
                this.dataForm.value=data.title;
                this.$emit("on-change", this.dataForm);
                //this.$emit("func",titleData);
            },
            clearSelect() {
                this.selectDep = [];
            },
        },
        watch : {
            reset:function(newValue, oldValue) {
               this.clearSelect()
            },
        },
        created() {

            this.initDepartmentData();
        }
    };
</script>

<style lang="less">
</style>

