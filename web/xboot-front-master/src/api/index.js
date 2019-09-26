// 统一请求路径前缀在libs/axios.js中修改
import { getRequest, postRequest, putRequest, deleteRequest, uploadFileRequest,getAx,postAx ,postJsonRequest} from '@/libs/axios';



// 文件上传接口
export const uploadFile = "/xboot/upload/file"
// 验证码渲染图片接口
export const drawCodeImage = "/xboot/common/captcha/draw/"
// 获取菜单
export const getMenuList = "/xboot/permission/getMenuList"
// 获取数据字典
export const getDictData = "/xboot/dictData/getByType/"
// 图片上传接口
export const NewUpload = "/xboot/news/newUpload"
// 登陆
export const login = (params) => {
    return postRequest('/login', params)
}
export const sendCode = (params) => {
    return postRequest('/user/sendcode', params)

}//1   用户登录
export const receiveCode = (params) => {
    return postRequest('/login/code', params)
}//企业微信登录验证

// 获取用户登录信息
export const userInfo = (params) => {
    return getRequest('/user/info', params)
}
// 注册
export const regist = (params) => {
    return postRequest('/user/regist', params)
}
// 初始化验证码
export const initCaptcha = (params) => {
    return getRequest('/common/captcha/init', params)
}
// 发送短信验证码
export const sendSms = (mobile, params) => {
    return getRequest(`/common/captcha/sendSms/${mobile}`, params)
}
// 短信验证码登录
export const smsLogin = (params) => {
    return postRequest('/user/smsLogin', params)
}
// IP天气信息
export const ipInfo = (params) => {
    return getRequest('/common/ip/info', params)
}
// 个人中心编辑
export const userInfoEdit = (params) => {
    return postRequest('/user/edit', params)
}
// 个人中心修改密码
export const changePass = (params) => {
    return postRequest('/user/modifyPass', params)
}
// 解锁
export const unlock = (params) => {
    return postRequest('/user/unlock', params)
}


// github登录
export const githubLogin = (params) => {
    return getRequest('/social/github/login', params)
}
// qq登录
export const qqLogin = (params) => {
    return getRequest('/social/qq/login', params)
}
// 微博登录
export const weiboLogin = (params) => {
    return getRequest('/social/weibo/login', params)
}
// 绑定账号
export const relate = (params) => {
    return postRequest('/social/relate', params)
}
// 获取JWT
export const getJWT = (params) => {
    return getRequest('/social/getJWT', params)
}

// 获取绑定账号信息
export const relatedInfo = (username, params) => {
    return getRequest(`/relate/getRelatedInfo/${username}`, params)
}
// 解绑账号
export const unRelate = (params) => {
    return postRequest('/relate/delByIds', params)
}
// 分页获取绑定账号信息
export const getRelatedListData = (params) => {
    return getRequest('/relate/findByCondition', params)
}

// 获取用户数据 多条件
export const getUserListData = (params) => {
    return getRequest('/user/getByCondition', params)
}
// 获取全部用户数据
export const getAllUserData = (params) => {
    return getRequest('/user/getAll', params)
}
// 添加用户
export const addUser = (params) => {
    return postRequest('/user/admin/add', params)
}
// 编辑用户
export const editUser = (params) => {
    return postRequest('/user/admin/edit', params)
}
// 启用用户
export const enableUser = (id, params) => {
    return postRequest(`/user/admin/enable/${id}`, params)
}
// 禁用用户
export const disableUser = (id, params) => {
    return postRequest(`/user/admin/disable/${id}`, params)
}
// 启用用户微信
export const enableUserWX = (id, params) => {
    return postRequest(`/user/admin/enableWX/${id}`, params)
}

// 禁用用户微信
export const disableUserWX = (id, params) => {
    return postRequest(`/user/admin/disableWX/${id}`, params)
}
// 删除用户
export const deleteUser = (ids, params) => {
    return deleteRequest(`/user/delByIds/${ids}`, params)
}



// 获取一级部门
export const initDepartment = (params) => {
    return getRequest('/department/getByParentId/0', params)
}
// 加载部门子级数据
export const loadDepartment = (id, params) => {
    return getRequest(`/department/getByParentId/${id}`, params)
}
// 通过部门获取全部用户数据
export const getUserByDepartmentId = (id, params) => {
    return getRequest(`/user/getByDepartmentId/${id}`, params)
}
// 添加部门
export const addDepartment = (params) => {
    return postRequest('/department/add', params)
}
// 编辑部门
export const editDepartment = (params) => {
    return postRequest('/department/edit', params)
}
// 删除部门
export const deleteDepartment = (ids, params) => {
    return deleteRequest(`/department/delByIds/${ids}`, params)
}
// 搜索部门
export const searchDepartment = (params) => {
    return getRequest('/department/search', params)
}



// 获取全部角色数据
export const getAllRoleList = (params) => {
    return getRequest('/role/getAllList', params)
}
// 分页获取角色数据
export const getRoleList = (params) => {
    return getRequest('/role/getAllByPage', params)
}
// 添加角色
export const addRole = (params) => {
    return postRequest('/role/save', params)
}
// 编辑角色
export const editRole = (params) => {
    return postRequest('/role/edit', params)
}
// 设为或取消注册角色
export const setDefaultRole = (params) => {
    return postRequest('/role/setDefault', params)
}
// 分配角色权限
export const editRolePerm = (params) => {
    return postRequest('/role/editRolePerm', params)
}
// 分配角色数据权限
export const editRoleDep = (params) => {
    return postRequest('/role/editRoleDep', params)
}
// 删除角色
export const deleteRole = (ids, params) => {
    return deleteRequest(`/role/delAllByIds/${ids}`, params)
}



// 获取全部字典
export const getAllDictList = (params) => {
    return getRequest('/dict/getAll', params)
}
// 添加字典
export const addDict = (params) => {
    return postRequest('/dict/add', params)
}
// 编辑字典
export const editDict = (params) => {
    return postRequest('/dict/edit', params)
}
// 删除字典
export const deleteDict = (ids, params) => {
    return deleteRequest(`/dict/delByIds/${ids}`, params)
}
// 搜索字典
export const searchDict = (params) => {
    return getRequest('/dict/search', params)
}
// 获取全部字典数据
export const getAllDictDataList = (params) => {
    return getRequest('/dictData/getByCondition', params)
}
// 添加字典数据
export const addDictData = (params) => {
    return postRequest('/dictData/add', params)
}
// 编辑字典数据
export const editDictData = (params) => {
    return postRequest('/dictData/edit', params)
}
// 删除字典数据
export const deleteData = (ids, params) => {
    return deleteRequest(`/dictData/delByIds/${ids}`, params)
}
// 通过类型获取字典数据
export const getDictDataByType = (type, params) => {
    return getRequest(`/dictData/getByType/${type}`, params)
}



// 获取全部权限数据
export const getAllPermissionList = (params) => {
    return getRequest('/permission/getAllList', params)
}
// 添加权限
export const addPermission = (params) => {
    return postRequest('/permission/add', params)
}
// 编辑权限
export const editPermission = (params) => {
    return postRequest('/permission/edit', params)
}
// 删除权限
export const deletePermission = (ids, params) => {
    return deleteRequest(`/permission/delByIds/${ids}`, params)
}
// 搜索权限
export const searchPermission = (params) => {
    return getRequest('/permission/search', params)
}


// 分页获取日志数据
export const getLogListData = (params) => {
    return getRequest('/log/getAllByPage', params)
}
// 删除日志
export const deleteLog = (ids, params) => {
    return deleteRequest(`/log/delByIds/${ids}`, params)
}
// 清空日志
export const deleteAllLog = (params) => {
    return deleteRequest('/log/delAll', params)
}



// 分页获取Redis数据
export const getRedisData = (params) => {
    return getRequest('/redis/getAllByPage', params)
}
// 通过key获取Redis信息
export const getRedisByKey = (key, params) => {
    return getRequest(`/redis/getByKey/${key}`, params)
}
// 获取Redis键值数量
export const getRedisKeySize = (params) => {
    return getRequest('/redis/getKeySize', params)
}
// 获取Redis内存
export const getRedisMemory = (params) => {
    return getRequest('/redis/getMemory', params)
}
// 获取Redis信息
export const getRedisInfo = (params) => {
    return getRequest('/redis/info', params)
}
// 添加编辑Redis
export const saveRedis = (params) => {
    return postRequest('/redis/save', params)
}
// 删除Redis
export const deleteRedis = (params) => {
    return deleteRequest('/redis/delByKeys', params)
}
// 清空Redis
export const deleteAllRedis = (params) => {
    return deleteRequest('/redis/delAll', params)
}



// 分页获取定时任务数据
export const getQuartzListData = (params) => {
    return getRequest('/quartzJob/getAllByPage', params)
}
// 添加定时任务
export const addQuartz = (params) => {
    return postRequest('/quartzJob/add', params)
}
// 编辑定时任务
export const editQuartz = (params) => {
    return postRequest('/quartzJob/edit', params)
}
// 暂停定时任务
export const pauseQuartz = (params) => {
    return postRequest('/quartzJob/pause', params)
}
// 恢复定时任务
export const resumeQuartz = (params) => {
    return postRequest('/quartzJob/resume', params)
}
// 删除定时任务
export const deleteQuartz = (ids, params) => {
    return deleteRequest(`/quartzJob/delByIds/${ids}`, params)
}



// 分页获取消息数据
export const getMessageData = (params) => {
    return getRequest('/message/getByCondition', params)
}
// 添加消息
export const addMessage = (params) => {
    return postRequest('/message/add', params)
}
// 编辑消息
export const editMessage = (params) => {
    return postRequest('/message/edit', params)
}
// 删除消息
export const deleteMessage = (ids, params) => {
    return deleteRequest(`/message/delByIds/${ids}`, params)
}
// 分页获取消息推送数据
export const getMessageSendData = (params) => {
    return getRequest('/messageSend/getByCondition', params)
}
// 编辑发送消息
export const editMessageSend = (params) => {
    return putRequest('/messageSend/update', params)
}
// 删除发送消息
export const deleteMessageSend = (ids, params) => {
    return deleteRequest(`/messageSend/delByIds/${ids}`, params)
}



// base64上传
export const base64Upload = (params) => {
    return postRequest('/upload/file', params)
}



/**
 *name:nijianping
 * time :20190711
 * content:因开发交水建portal新增路由
 * begin
 */

//条件获取快捷入口信息
export const getSystemPageVoMap = (params) => {
    return getRequest('/system/selectSystemPageVoMap', params)
}

// 删除快捷入口
export const delSsystem = (ids,params) => {
    return deleteRequest(`/system/delByIds/${ids}`, params)
}
//通过id获取快捷入口
export const getSystemById = (id, params) => {
    return getRequest(`/system/get/${id}`, params)
}
// 新增快捷入口
export const addSystem = (params) => {
    return postRequest('/system/addSystem', params)
}

//编辑快捷入口信息
export const editSystem = (params) => {
    return postRequest('/system/insertOrUpdate', params)
}
//分页获取新闻信息
export const getNews = (params) => {
    return getRequest('/news/getByPage', params)
}
//添加新闻
export const addNews = (params) => {
    return postRequest('/news/addNews', params)
}

// njp 删除新闻  20190715 begin
export const deleteNew = (ids, params) => {
    return deleteRequest(`/news/delByIds/${ids}`, params)
}
// njp 删除新闻  20190715 end

//njp 根据id查询新闻 begin
export const getNewById = (id, params) => {
    return getRequest(`/news/get/${id}`, params)
}
//njp 根据id查询新闻 end

//njp 20190717 新闻编辑 begin
export const editNews = (params) => {
    return postRequest('/news/insertOrUpdate', params)
}
//njp 20190717 新闻编辑 end

//njp 20190718 分页获取公告信息 begin
//分页获取新闻信息
export const getNotice = (params) => {
    return getRequest('/notice/getByPage', params)
}
//njp 20190718 分页获取公告信息 end
//添加公告 begin
export const addNotice = (params) => {
    return postRequest('/notice/addNotice', params)
}
//njp 添加公告 end
//njp 20190718 删除公告 begin
export const deleteNotice = (ids, params) => {
    return deleteRequest(`/notice/delByIds/${ids}`, params)
}
//njp 20190718 删除公告 begin

//njp 20190718 通过id获取公告 begin
export const getNoticeById = (id, params) => {
    return getRequest(`/notice/get/${id}`, params)
}
//njp 20190718 通过id获取公告 end

//公告编辑
export const editNotice = (params) => {
    return postRequest('/notice/insertOrUpdate', params)
}


//条件获取子系统新闻
export const getSubsystemNews = (params) => {
    return getRequest('/subsystemNews/selectPageVoMap', params)
}
//删除子系统新闻
export const delSubsystemNews = (ids,params) => {
    return deleteRequest(`/subsystemNews/delByIds/${ids}`, params)
}

//新增子系统新闻 njp 20190722
export const addSubsystemNews = (params) => {
    return postRequest('/subsystemNews/addSubsystemNews', params)
}
//通过id获取子系统新闻或公告
export const getSubsystemNewsById = (id, params) => {
    return getRequest(`/subsystemNews/get/${id}`, params)
}


//编辑子系统的新闻或者公告
export const editSubsystemNews = (params) => {
    return postRequest('/subsystemNews/insertOrUpdate', params)
}

//条件获取子系统公告
export const getSubsystemNotice = (params) => {
    return getRequest('/subsystemNews/selectNoticePageVoMap', params)
}
addSubsystemNotice
//新增子系统公告 njp 20190722
export const addSubsystemNotice = (params) => {
    return postRequest('/subsystemNews/addSubsystemNotice', params)
}
//获取待办已办的信息
export const getBacklogOrFullAll = () => {
    return getRequest('/backlogOrFull/getAll')
}
//修改待办已办的接口
export const updateBacklogOrFullAll = (params) => {
    return postRequest('/backlogOrFull/insertOrUpdate',params)
}
//通过id获取子系统新闻或公告
export const getBacklogOrFullById = (id, params) => {
    return getRequest(`/backlogOrFull/get/${id}`, params)
}

//条件获取常用链接
export const getCommonLink = (params) => {
    return getRequest('/commonLink/selectCommonLinkPageVoMap', params)
}

//删除常用链接
export const delCommonLink = (ids,params) => {
    return deleteRequest(`/commonLink/delByIds/${ids}`, params)

}
//通过id获取常用链接
export const getCommonLinkById = (id, params) => {
    return getRequest(`/commonLink/get/${id}`, params)
}

//新增常用链接
export const addCommonLink = (params) => {
    return postRequest('/commonLink/addCommonLink', params)
}
//编辑常用链接
export const editCommonLink = (params) => {
    return postRequest('/commonLink/insertOrUpdate', params)
}

//条件获取常用下载链接资源
export const getDownloadResources = (params) => {
    return getRequest('/downloadResources/selectDownloadResourcesPageVoMap', params)
}

//删除常用下载资源链接
export const deldownloadResources = (ids,params) => {
    return deleteRequest(`/downloadResources/delByIds/${ids}`, params)
}
//通过id获取常用下载资源链接
export const getDownloadResourcesById = (id, params) => {
    return getRequest(`/downloadResources/get/${id}`, params)
}

//编辑常用下载资源信息
export const editDownloadResources = (params) => {
    return postRequest('/downloadResources/insertOrUpdate', params)
}

//新增常用下载 njp 20190724
export const addDownloadResources = (params) => {
    return postRequest('/downloadResources/addDownloadResources', params)
}

//获取数据分析的all信息
export const getDataAnalysisAll = () => {
    return getRequest('/dataAnalysis/getAll')
}

//通过id获取子获取数据分析
export const getDataAnalysisById = (id, params) => {
    return getRequest(`/dataAnalysis/get/${id}`, params)
}

//修改数据分析
export const updateDataAnalysis = (params) => {
    return postRequest('/dataAnalysis/insertOrUpdate',params)
}


//获取预警接口的all信息
export const getWarningAll = () => {
    return getRequest('/warning/getAll')
}

//通过id获取预警信息
export const getWarningById = (id, params) => {
    return getRequest(`/warning/get/${id}`, params)
}
//修改预警信息
export const updateWarning = (params) => {
    return postRequest('/warning/insertOrUpdate',params)
}
///page_home 子系统跳转
export const systemGet = (params) => {
    return getRequest('/system/getAll',params)
}
///点击子系统进入的测试接口
export const loginTest = (params) => {
    return postAx('/loginTest/receiveData',params)
}
///查询预警信息:
export const GetWarning = (params) => {
    return postAx('/portal/GetWarningCountServlet',params)
}
//根据用户名查询待办总数
export const GetWorkAll= (params) => {
    return postAx('/portal/GetWorkFlowServlet',params)
}
//根据用户名查询已办总数:
export const GetDoneAll= (params) => {
    return postAx('/portal/GetDoneCountServlet',params)
}
//新闻接口：公告接口
export const noticeAll= (params) => {
    return getRequest('/notice/getAll',params)
}
//常用链接：
export const commonLink= (params) => {
    return getRequest('/portalController/selectCommonLinkByNum',params)
}
//（子）新闻接口：
export const selectPage= (params) => {
    return getRequest('/subsystemNews/selectPageVoMap',params)
}
//（子）公告接口：
export const NoticePage= (params) => {
    return getRequest('/subsystemNews/selectNoticePageVoMap',params)
}
//条件获取新消息通知
export const getInformationPageVoMap = (params) => {
    return getRequest('/information/selectInformationPageVoMap', params)
}
//删除新消息通知
export const delInformation = (ids,params) => {
    return deleteRequest(`/information/delByIds/${ids}`, params)
}
//新增新消息通知
export const addInformation = (params) => {
    return postRequest('/information/addInformation', params)
}

//通过id获取新消息通知
export const getInformationById = (id, params) => {
    return getRequest(`/information/get/${id}`, params)
}

//编辑子系统的新闻或者公告
export const editInformation = (params) => {
    return postRequest('/information/insertOrUpdate', params)
}
//获取权限列表
export const getRoleCode = (params) => {
    return getRequest('/role/getAllList', params)
}
export const apiTest = (params) => {
    return postJsonRequest('/api/callApi',params)
}
export const callApiFrom= (params) => {
    return postJsonRequest('/api/callApiForm',params)
}
export const callForm = (params) => {
    return getRequest('/api/alipayforward', params)
}
export const fullList = (params) => {
    return getRequest('/portalController/selectBacklogOrFullListByMap', params)
}
/**
 *name:nijianping/
 * time :20190711
 * content:因开发交水建portal新增
 * end
 */
