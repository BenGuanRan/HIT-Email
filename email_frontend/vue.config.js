const path = require("path")

function resolve(dir) {
    console.log(__dirname, dir);
    return path.join(__dirname, dir);
}

module.exports = {
    chainWebpack: config => {
        config.resolve.alias
            .set("@", resolve("src"))
            .set("assets", resolve("src/assets"))
    },
    publicPath: './',
    assetsDir: "static",  // 静态文件打包到dist/static中
    devServer: {
        open: true,
        host: 'localhost',
        port: 8081,
        https: false,
        //以上的ip和端口是我们本机的;下面为需要跨域的
        proxy: { //配置跨域
            '/api': {
                target: 'http://127.0.0.1:8000', //这里后台的地址模拟的;应该填写你们真实的后台接口
                ws: true,
                changOrigin: true, //允许跨域
                pathRewrite: {
                    '^/api': '' //请求的时候使用这个api就可以
                }
            }
        }
    }
}