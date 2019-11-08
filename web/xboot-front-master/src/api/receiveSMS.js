import { getRequest, postRequest, putRequest, deleteRequest, uploadFileRequest,getAx,postAx, poJson } from '@/libs/axios';

export const getSMSBySys= (params) => {//通过应用查询短信名单接口
    return getRequest('/receiveSMS/getSMSBySys', params)
}
export const delById= (params) => {//删除短信人员
    return deleteRequest('/receiveSMS/delById', params)
}
export const insertOrUpdate= (params) => {//添加短信预警名单名单
    return postRequest('/receiveSMS/insertOrUpdate', params)
}
//
export const smsSendCode= (params) => {//web端获取短信接口
    return postRequest('/smsLogin/sendCode', params)
}
export const smsVerifyLogin= (params) => {//短信登陆
    return postRequest('/smsLogin/verifyLogin', params)
}
//
