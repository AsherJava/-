
<template>
    <div>
         <input type="text" v-model="data">
         <button @click="send()">发送消息</button>
         <br>
         <button @click="closeWebSocket()">关闭websocket连接</button>
        <button @click="websocketInit('test')">点击链接test</button>
    </div>
</template>
<script>
    import Cookies from "js-cookie";

    export default {
        name: "WebSocket",
        props:{
            isWebSocket:{
                type: Boolean,
                default:false,
            }
        },
        components: {

        },
        data() {
            return {
                text: '',
                data: '',
                websocket: null,
               open:this.isWebSocket
            }
        },
      watch:{
            data(val){
            }
      },
        mounted() {
            let userInfo =Cookies.get("userInfo");
            if(this.open){
                if(userInfo){
                    this.websocketInit(JSON.parse(userInfo).username)
                }
            }



        },
        beforeDestroy() {
            this.onbeforeunload()
        },
        methods: {
            init(){

            },
            websocketInit(username){
                if(username){
                    if ('WebSocket' in window) {
                        this.websocket = new WebSocket('ws://10.1.13.14:8899/websocket/'+ username)
                        //this.websocket = new WebSocket('ws://10.1.13.14:8080/portalManage/websocket/'+ username)
                        this.initWebSocket()
                    } else {
                        alert('当前浏览器不支持websocket,请升级浏览器')
                    }
                }

            },
            isData(data){
                let item=JSON.parse(data);
                if((typeof item)=="object"){
                    this.$emit('change',item)
                }
            },
            initWebSocket() {
                //连接错误
                this.websocket.onerror = this.setErrorMessage

                // //连接成功
                this.websocket.onopen = this.setOnopenMessage

                //收到消息的回调
                this.websocket.onmessage = this.setOnmessageMessage

                //连接关闭的回调
                this.websocket.onclose = this.setOncloseMessage

                //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
                window.onbeforeunload = this.onbeforeunload
            },
            setErrorMessage() {
              //  this.data = "WebSocket连接发生错误" + '   状态码：' + this.websocket.readyState;
            },
            setOnopenMessage() {
                //this.data = "WebSocket连接成功" + '   状态码：' + this.websocket.readyState;
            },
            setOnmessageMessage(event) {
                this.data =event.data;
                this.isData(event.data)
            },
            setOncloseMessage() {
                //this.data = "WebSocket连接关闭" + '   状态码：' + this.websocket.readyState;
            },
            onbeforeunload() {
                this.closeWebSocket();
            },
            //websocket发送消息
            send() {
                this.websocket.send(this.text)
                this.text = ''
            },
            closeWebSocket() {
                if(this.websocket){
                    this.websocket.close()
                }

            }
        }
    }
</script>

<style scoped>

</style>
