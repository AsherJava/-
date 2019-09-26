<template>
    <div class="login-input-div">
        <div class="input-icon">
            <input-icon :type="iconType"></input-icon>
        </div>
        <input  :type="inputType" :value="value" @input="onInput" class="login-input" :placeholder="placeholder"
                :password="type==='password'&&!showPassword"  @focus="onFocus" @blur="onBlur"/>
        <div v-if="iconType=='code'" class="input-text">
          <div v-if="!sending" @click="sendCode">获取验证码</div>
            <div v-else v-model="countButton">{{countButton}}</div>
        </div>

    </div>
</template>

<script>
    import inputIcon from '../input-icon/input-icon.vue'
    export default {
        name: "login-input",
        props: {
            /**
             * 图标类型
             */
            iconType: {
                type: String,
                default:"people"
            },
            /**
             * 输入类型
             */
            type: String,
            /**
             * 值
             */
            value: String,
            /**
             * 占位符
             */
            placeholder: String,
            /**
             * 是否显示清除按钮
             */
            clearable: {
                type: [Boolean, String],
                default: false
            },
            /**
             * 是否显示密码可见按钮
             */
            displayable: {
                type: [Boolean, String],
                default: false
            },
            /**
             * 自动获取焦点
             */
            focus: {
                type: [Boolean, String],
                default: false
            }
        },
        components: {
             inputIcon
        },
        data() {
            return {
                /**
                 * 显示密码明文
                 */
                showPassword: false,
                /**
                 * 是否获取焦点
                 */
                isFocus: false,
                /**
                 * 倒计时
                 */
                countButton:'60s',
                /**
                 * 倒计时文字显示
                 */
                sending: false,
                sended: true,
                count: 60,
            }
        },
        computed: {
            inputType() {
                const type = this.type
                return type === 'password' ? 'text' : type
            },
            clearable_() {
                return String(this.clearable) !== 'false'
            },
            displayable_() {
                return String(this.displayable) !== 'false'
            },
            focus_() {
                return String(this.focus) !== 'false'
            }
        },
        methods: {
            clear() {
                this.$emit('input', '')
            },
            display() {
                this.showPassword = !this.showPassword
            },
            onFocus() {
                this.isFocus = true
                this.$emit('onFocus', true)
            },
            onBlur() {
                this.$nextTick(() => {
                    this.isFocus = false
                })
                this.$emit('onBlur', false)
            },
            onInput(e) {
                this.$emit('input', e.target.value)
            },
            sendCode(){
                this.sending=true;
                this.countDown()
                this.$emit('changeCode',true)
            },
            countDown() {
                let that = this;
                if (this.count == 0) {
                    if(!this.sended){
                        this.sended=true;
                        this.$emit('countPlus',this.sended);
                    }
                    this.sending = false;
                    this.count = 60;
                    this.countButton=60+'s';
                    return;
                } else {
                    if(this.sended){
                        this.sended=false;
                        this.$emit('countPlus',this.sended);
                    }
                    this.countButton = this.count + " s";
                    this.count--;
                }
                setTimeout(function() {
                    that.countDown();
                }, 1000);
            },
        }
    }
</script>

<style scoped lang="less">
   .login-input-div{
       display: flex;
       flex-direction: row;
       align-items: center;
       width: 100%;
       flex: 1;
   }
   .login-input{
       display: flex;
       flex-direction: row;
       align-items: center;
       width: 100%;
       flex: 1;
       padding: 0 1rem;
       font-size:1rem;
       font-family:PingFangSC;
       font-weight:400;
       line-height:1.6rem;
   }
    .input-icon{
        padding: 0.725rem;
        display: flex;
        align-items: center;
    }
    .input-text{
        width:5rem;
        text-align: center;
        font-size:1em;
        font-family:PingFangSC;
        font-weight:400;
        color:rgba(12,166,240,1);
        margin-right:0;
    }
    input{
        border: 0px;
        outline: none;

    }
</style>
