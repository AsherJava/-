
<template>
    <div>
         <input type="text" v-model="data">
         <button @click="send()">发送消息</button>
         <br>
         <button @click="closeWebSocket()">关闭websocket连接</button>
        <div id="qrcode" ></div>
    </div>
</template>
<script>
    import Cookies from "js-cookie";
    import QRCode  from "qrcodejs2"
    export default {
        name: "WebSocket",
        components: {

        },
        data() {
            return {
                text: '',
                data: '',
                websocket: null,
                link: 'https://baidu.com'
            }
        },
      watch:{
            data(val){
         // if(val==200){
         // } else if(val){
         //  let data=val
         //  this.$emit('change',data)
         //        }
            }
      },
        mounted() {
   //          let userInfo = JSON.parse(Cookies.get("userInfo"));
   //          let username = userInfo.username;
   //          if ('WebSocket' in window) {
   //              this.websocket = new WebSocket('ws://10.1.13.14:8899/websocket/'+ username)
   //              //this.websocket = new WebSocket('ws://10.1.13.14:8080/portalManage/websocket/'+ username)
   //              this.initWebSocket()
   //          } else {
   //              alert('当前浏览器不支持websocket,请升级浏览器')
   //          }
   // this.qrCode()
        },
        beforeDestroy() {
            this.onbeforeunload()
        },
        methods: {
            init(){//

            },
            qrCode() {
                let that = this;
                let qrcode = new QRCode('qrcode', {
                    width: 124,
                    height: 124,        // 高度
                    text:  this.link,   // 二维码内容
                    // render: 'canvas' ,   // 设置渲染方式（有两种方式 table和canvas，默认是canvas）
                    // background: '#f0f',   // 背景色
                    // foreground: '#ff0'    // 前景色
                })
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
                this.websocket.close()
            }
        }
    }
</script>

<style scoped>

</style>
