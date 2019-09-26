import { getRequest, postRequest, putRequest, deleteRequest, uploadFileRequest,getAx,postAx, poJson } from '@/libs/axios';
//用户登录判断
export const loginApp = (params) => {
    return postAx('/hnPortalApp/appLogin', params)
}
//扫描二维码，调用接口
export const scanService = (params) => {
    return   poJson('/qrcode/scanService', params)
}
//登录调用接口：
export const scanLogin = (params) => {
    return   poJson('/qrcode/scanLogin', params)
}
