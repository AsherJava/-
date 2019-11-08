<template>
    <div>
        <Upload
                :before-upload="handleUpload"
                :action="uploadFileUrl">
            <Button icon="ios-cloud-upload-outline">上传文件</Button>
        </Upload>
        <div v-if="file !== null">上传文件: {{ file.name }} <Button type="text" @click="upload" :loading="loadingStatus">{{ loadingStatus ? 'Uploading' : '' }}</Button></div>
    </div>
</template>

<script>
    import {

        //NewUpload,
        systemUpload

    } from "@/api/index";
    import axios from 'axios';
    export default {
        name: "uploadfileForlink",
        data () {
            return {
                mes:"success",
                file: null,
                loadingStatus: false,
                uploadFileUrl: systemUpload,
                editSubsystemNews: {
                    title: "",
                    url: "",
                    department: "",
                },
            }
        },
        methods: {
            info (item) {
                this.$Message.info(item);
            },
            handleUpload (file) {
                this.file = file;
                return false;
            },
            upload () {
                this.loadingStatus = true;
                this.upSubmit();
                setTimeout(() => {
                    this.file = null;
                    this.loadingStatus = false;
                    this.$Message.success('Success')
                }, 1500);
            },

            upSubmit (data) {
                if(this.file!==null){


                this.editSubsystemNews=data;

                let formData = new FormData();
                formData.append("file", this.file);
                formData.append("title",this.editSubsystemNews.title);
                formData.append("department",this.editSubsystemNews.department);
                axios.post('http://localhost:8899/xboot/downloadResources/singlefile', formData)
                    .then(response => {
                        console.log(response);
                        //alert(response.message);
                       // this.mes=response.message;
                        //alert(this.mes);
                        //this.info();
                        //window.location.reload();
                        //父组件向子组件传值控制弹出列表的消失
                        /*alert(response.message);
                        alert(111);

                        this.mes=response.message;
                        alert(this.mes);*/
                        this.info(this.mes);
                    });

                this.$emit("func",this.editSubsystemNews.title);
                this.file=null;
                }else{
                    this.info("请先上传文件");
                }
            }
        }
    }
</script>
<style scoped>

</style>
