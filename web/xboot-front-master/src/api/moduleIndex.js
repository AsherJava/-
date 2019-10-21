import { getRequest, postRequest, putRequest, deleteRequest, uploadFileRequest,getAx,postAx, poJson } from '@/libs/axios';
//

// 新闻通知
export const selectInformation = (params) => {
    return getRequest('/portalController/selectInformationPortal', params)
}
//公告

export const selectNotice = (params) => {
    return getRequest('/portalController/selectNoticePortal', params)
}
//获取下载
export const downloadResources = (params) => {
    return getRequest('/portalController/selectDownloadResourcesByNumAndDep', params)
}
//获取预警取数的子系统地址
export const getWarning = ( params) => {
    return getRequest('/warning/getAll', params)
}
//获取新闻（result：子系统新闻，subjoin：本地新闻，imgUrl：本地新闻图片地址）
export const selectNewsPortal = (params) => {
    return getRequest('/portalController/selectNewsPortal', params)
}
//通过id获取新闻详情（字段newsConten：新闻内容）
export const getNewDetail = (params) => {
    return getRequest('/news/getNewsById', params)
}
//登录验证码获取
export const ssoLoginSend= (params) => {
    return postAx('/ssoLogin/sendCode', params)
}
//用户登录判断
export const loginWho = (params) => {
    return postAx('/ssoLogin', params)
}
//二维码uid
export const generateQRCode = (params)=>{
    return getAx('/qrcode/generateQRCode', params)
}
//轮询
export const CheckLogin = (params)=>{
    return   poJson('/qrcode/qrcodeCheckLogin', params)
}
export const registAssessor = (params)=>{//注册审批员
    return  postRequest('/role/registAssessor', params)
}
export const  insertOrUpdate=(params)=>{//审批员审批接口
    return postRequest('/approvalInfo/insertOrUpdate',params)
}
export const  insertSelectAll=(params)=>{//获取审批数据列表按时间倒序排列
    return getRequest('/approvalInfo/selectAll',params)
}
export const  submitApprovalInfo=(params)=>{//提交审批接口(adminCode: admin +唯一标识)eg:admin+UUID
    return postRequest('/approvalInfo/submitApprovalInfo',params)
}

