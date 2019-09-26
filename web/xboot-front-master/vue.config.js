const CompressionPlugin = require('compression-webpack-plugin');
const webpack = require('webpack')

const URL_BASE= process.env.NODE_ENV === 'production'
    ?'http://10.1.13.28:8899'
    :'http://10.1.13.28:8899'//'http://10.1.13.14:8899'http://10.1.13.28:8899/app
const URL_ONE='http://10.39.5.48:9797'
module.exports = {

    devServer: {
        host: '10.1.13.6',
        // //host: 'localhost',//     --host 10.1.13.6
        port: 8088,
        proxy: {
            '/xboot': {
        //  target:'http://127.0.0.1:8888',
            target: URL_BASE,  // 请求本地 需要xboot后台项目
                ws: true
            },
            '/foo': {
                target: '<other_url>'
            },
            '/loginTest':{
                target: URL_BASE,
                ws: true,
                pathRewrite: {
                    '^/loginTest': '/loginTest'
                },
            },
            '/portal':{
                target: URL_ONE,
                ws: true,
                pathRewrite: {
                    '^/portal': '/portal'
                },
            },
            '/ssoLogin':{
                target: URL_BASE,
                ws: true,
                pathRewrite: {
                    '^/ssoLogin': '/ssoLogin'
                },
            },
            '/hnPortalApp':{
                target: URL_BASE,
                ws: true,
                pathRewrite: {
                    '^/hnPortalApp': '/hnPortalApp'
                },
            },
            '/qrcode':{
                target: URL_BASE,
                ws: true,
                pathRewrite: {
                    '^/qrcode': '/qrcode'
                },
            },
        }
    },
    // 打包时不生成.map文件 避免看到源码
    productionSourceMap: false,
    // 部署优化
    configureWebpack: {
        // 使用CDN
        // externals: {
        //     vue: 'Vue',
        //     axios: 'axios',
        //     'vue-router': 'VueRouter',
        //     vuex: 'Vuex',
        //     iview: 'iview',
        //     echarts: 'echarts',
        //     apexcharts: 'ApexCharts',
        //     'vue-apexcharts': 'VueApexCharts',
        //     xlsx: 'XLSX',
        //     dplayer: 'DPlayer',
        //     gitalk: 'Gitalk'
        // },
        // GZIP压缩
        plugins: [
            new CompressionPlugin({
                test: /\.js$|\.html$|\.css/, // 匹配文件
                threshold: 10240 // 对超过10k文件压缩
            }),
            new webpack.ProvidePlugin({
                $:"jquery",

                jQuery:"jquery",
                "windows.jQuery":"jquery"
            })
        ]
    }
}
