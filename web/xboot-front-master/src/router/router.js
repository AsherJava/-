import Main from '@/views/Main.vue';
export const homeRouter={
    path: '/home-pages',
    name: 'home-pages',
    redirect: '/page_home',
    children: [
        { path: '/page_home', title: { i18n: 'page_home' }, name: 'page_home', component: () => import('@/views/home-index/page_home.vue') },
        { path: '/pages-news-detail', title: { i18n: 'pages-news-detail' }, name: 'pages_news_detail', component: () => import('@/views/home-index/detail/pages-news-detail.vue') },
        { path: '/webSocket', title: { i18n: 'webSocket' }, name: 'WebSocket', component: () => import('@/views/home-index/webSocket.vue') },
    ],
    component: () => import('@/views/home-index/home-pages.vue')
};
export const loginPagesRouter={
    path: '/pages-login',
    name: 'pages-login',
    meta: {
        title: '登录 - 湖南交建 '
    },
    component: () => import('@/views/my-components/login/pages-login.vue')
};
export const otherRouter ={
    path: '/',
    name: 'otherRouter',
    redirect: '/home',
    component: Main,
    children: [
        { path: 'home', title: { i18n: 'home' }, name: 'home_index', component: () => import('@/views/home/home.vue') },
        { path: 'ownspace', title: '个人中心', name: 'ownspace_index', component: () => import('@/views/own-space/own-space.vue') },
        { path: 'ownspace-old', title: '个人中心', name: 'ownspace_old', component: () => import('@/views/own-space/own-space-old.vue') },
        { path: 'change-pass', title: '修改密码', name: 'change_pass', component: () => import('@/views/change-pass/change-pass.vue') },
        { path: 'message', title: '消息中心', name: 'message_index', component: () => import('@/views/message/message.vue') },
        { path: 'add', title: '添加', name: 'add', component: () => import('@/views/xboot-vue-template/new-window/add.vue') },
        { path: 'edit', title: '编辑', name: 'edit', component: () => import('@/views/xboot-vue-template/new-window/edit.vue') },
        { path: 'message-send-detail', title: '消息发送详情', name: 'message_send_detail', component: () => import('@/views/sys/message-manage/messageSendDetail.vue') }
    ]
};
export const loginRouter = {
    path: '/login',
    name: 'login',
    meta: {
        title: '登录 - 湖南交建 '
    },
    component: () => import('@/views/login.vue')
};
export const registRouter = {
    path: '/regist',
    name: 'regist',
    meta: {
        title: '注册 - 湖南交建'
    },
    component: () => import('@/views/regist.vue')
};
export const registResult = {
    path: '/regist-result',
    name: 'regist-result',
    meta: {
        title: '注册结果 - 湖南交建'
    },
    component: () => import('@/views/regist-result.vue')
};
// export const page404 = {pages-login
//     path: '/*',
//     name: 'error-404',
//     meta: {
//         title: '404-页面不存在'
//     },
//     component: () => import('@/views/error-page/404.vue')
// };

export const page403 = {
    path: '/403',
    meta: {
        title: '403-权限不足'
    },
    name: 'error-403',
    component: () => import('@/views/error-page/403.vue')
};
export const page500 = {
    path: '/500',
    meta: {
        title: '500-服务端错误'
    },
    name: 'error-500',
    component: () => import('@/views/error-page/500.vue')
};
export const locking = {
    path: '/locking',
    name: 'locking',
    component: () => import('@/views/main-components/lockscreen/components/locking-page.vue')
};
//app路由
export const appLoginResult = {
    path: '/app-login',
    name: 'app-login',
    meta: {
        title: 'app登录'
    },
    component: () => import('@/views/app/login/app-login.vue')
};
export const appHomeRouter = {
    path: '/app-home',
    name: 'app-home',
    meta: {
        title: 'app主页'
    },
    component: () => import('@/views/app/pages/home/appHome.vue')
};
export const  PopupRouter={
    path: '/Popup',
    name: ' Popup',
    meta: {
        title: 'Popup页'
    },
    component: () => import('@/views/otherPages/Popup.vue')
}

// 作为Main组件的子页面展示并且在左侧菜单显示的路由写在appRouter里
// export const appRouter = [
//     {
//         path: '/form',
//         icon: 'ios-gear',
//         name: 'sys',
//         title: '系统管理',
//         component: Main,
//         children: [
//             { path: 'user-manage', title: '用户管理', name: 'user-manage', icon: 'android-person', component: () => import('@/views/sys/user-manage/userManage') },
//             { path: 'role-manage', title: '角色管理', name: 'role-manage', icon: 'android-contacts', component: () => import('@/views/sys/role-manage/roleManage.vue') },
//             { path: 'menu-manage', title: '菜单管理', name: 'menu-manage', icon: 'navicon-round', component: () => import('@/views/sys/menu-manage/menuManage.vue') },
//             { path: 'log-manage', title: '日志管理', name: 'log-manage', icon: 'android-list', component: () => import('@/views/sys/log-manage/logManage.vue') }
//         ]
//     }
// ];

export const appRouter = [];

// 所有上面定义的路由都要写在下面的routers里
export const routers = [
    loginRouter,
    loginPagesRouter,
    registRouter,
    registResult,
    otherRouter,
    homeRouter,
    locking,
    ...appRouter,
    page500,
    page403,
    appLoginResult,
    appHomeRouter,
    PopupRouter
];
