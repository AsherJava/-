import Vue from 'vue'
import { setStore, getStore, removeStore } from '@/libs/storage'
import { getRoleCode } from "@/api/index";
import { getAllRoleList} from '@/api/index.js';
export function search (data, argumentObj) {//模糊搜索
    let res = data;
    let dataClone = data;
    for (let argu in argumentObj) {
        if (argumentObj[argu].length > 0) {
            res = dataClone.filter(d => {
                return d[argu].indexOf(argumentObj[argu]) > -1;
            });
            dataClone = res;
        }
    }
    return res;
}
export    function screenW() {//屏幕宽
         return  document.body.clientWidth;
     }
export function  onSize(e,item){//监听屏幕尺寸
        const that = e;
        const screenWidth=item;
        let timer=false;
        window.onresize = () => {
            return (() => {
                window.screenWidth = document.body.clientWidth
                if (!timer) {//延时函数
                   timer = true
                    setTimeout(function () {
                        that[screenWidth] = window.screenWidth
                        timer = false
                    }, 400)
                }

            })()}
    }
export function pageReturn(roles){//页面类型返回  返回路由name
    let [code]=JSON.parse(roles)
    let roleCode=JSON.parse(getStore('roleCodeList'));
    let data;
    roleCode.forEach(function (item) {
        if(code==item.name){//添加字段后修改
            data=item.route
        }
    })
      return data
}
export function pageRouter(roles){//页面类型返回  返回路由name
    if(roles){
        let [code]=JSON.parse(roles)
        if(code=='ROLE_ADMIN'){
            return 0
        }else if(code=='ROLE_USER'|code=='ROLE_USER'|'ROLE_TEST') {
            return 1
        }else {
            return 2
        }
        }else {
            return 999
        }

}
export function runPriminse(item){//异步
    var p = new Promise(function(resolve, reject){
        //做一些异步操作
        setTimeout(function(){
            console.log('执行完成');
            resolve(item);
        }, 500);
    });
    return p;
}



export function  fromPost(url,data) {  // to:提交动作（action）,p:参数
    let myForm = document.createElement("form");
    let data1=data;
    myForm.target = "_blank";
    myForm.method = "post";
    myForm.action = url;
    for (var i in data1) {
        let myInputUserCode = document.createElement("input");
        myInputUserCode.setAttribute("name", i);  // 为input对象设置name
        myInputUserCode.setAttribute("value", data1[i]);  // 为input对象设置value
        myForm.appendChild(myInputUserCode);
    }
    document.body.appendChild(myForm);
    myForm.submit();
    document.body.removeChild(myForm);  // 提交后移除创建的form
}
// export function qrCode() {//二维码
//     let that = this;
//     let qrcode = new QRCode('qrcode', {
//         width: 124,
//         height: 124,        // 高度
//         text:  this.link,   // 二维码内容
//         // render: 'canvas' ,   // 设置渲染方式（有两种方式 table和canvas，默认是canvas）
//         // background: '#f0f',   // 背景色
//         // foreground: '#ff0'    // 前景色
//     })
// }
export function  clearBlean(item,value){//修改属性值
    this[item]=value;

}
export function  clearValue(item,value){//修改值
    item=value;

}
export function  downCount(timer,value,_this){//时间值
    let that=_this;
    return function  countDown() {
        if (timer == 0) {
            return that[value]=false;
        } else {
           timer--;
        }
        setTimeout(function() {
            countDown();
        }, 1000);
    }()
}
export  function openHref(url,type) {
    window.open(url,type)
}
export function setTimer(value,time){//定时器
     let timer=setInterval(function () {
        value
     },time)
}

