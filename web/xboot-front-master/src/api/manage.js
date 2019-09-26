// 统一请求路径前缀在libs/axios.js中修改
import { getRequest, postRequest, putRequest, deleteRequest, uploadFileRequest,getAx,postAx } from '@/libs/axios';


// 修改图片上传接口
export const editUpload = "/xboot/news/editUpload"

// 子系统快捷入口(链接)的禁用
export const disableSubsystemUrl = (id, params) => {
    return postRequest(`/system/disable/${id}`, params)
}
//子系统快捷入口(链接)的启用
export const enableSubsystemUrl = (id, params) => {
    return postRequest(`/system/enable/${id}`, params)
}

// 通过新闻id获取图片信息
export const getImgsByNewsIds = (id, params) => {
    return getRequest(`/newsImages/getImgsByNewsIds/${id}`, params)
}

// 待办已办列表的条件查询
export const selectBacklogOrFullListPageVoMap = (params) => {
    return getRequest(`/backlogOrFullList/selectBacklogOrFullListPageVoMap`, params)
}
// 添加待办已办列表
export const addBacklogOrFullList = (params) => {
    return postRequest(`/backlogOrFullList/addBacklogOrFullList`, params)
}

//通过id获取子系统待办已办列表
export const getBacklogOrFullListById = (id, params) => {
    return getRequest(`/backlogOrFullList/get/${id}`, params)
}


//编辑待办已办列表
export const editBacklogOrFullList = (params) => {
    return postRequest(`/backlogOrFullList/insertOrUpdate`,params)
}

//删除子系统新闻
export const delBacklogOrFullList = (ids,params) => {
    return deleteRequest(`/backlogOrFullList/delByIds/${ids}`, params)
}


// 添加待办已办列表
export const getConfigByKey = (params) => {
    return getRequest(`/portalConfig/getByKey`,params)
}

//修改配置
export const updateConfig = (params) => {
    return postRequest('/portalConfig/insertOrUpdate',params)
}



