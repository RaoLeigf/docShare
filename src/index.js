const Koa = require('koa')
const bodyParser = require('koa-bodyparser')
const logger = require('koa-logger')
const moment = require('moment')
const session = require('koa-session')
const static = require('koa-static')
const path = require('path')
const koaBody = require('koa-body');

const {
    sessionConfig
} = require('../config')

const router = require('./routes')
const config = require('../config')



const app = new Koa();

app.use(koaBody({
    multipart: true,
    formidable: {
        maxFileSize: 200*1024*1024    // 设置上传文件大小最大限制，默认2M
    }
}));
//服务器log
app.use(logger({
    transporter: async(str, args) => {
        const time = args[4]
        if(time){//return
            console.log(moment().format('MM-DD HH:mm:ss'),'<--',args[1],args[2],args[3],time,args[5])
        }else{
            console.log(moment().format('MM-DD HH:mm:ss'),'-->',args[1],args[2])
        }
    }
  }))
app.keys = ['koa:sess']
app.use(session(sessionConfig, app))

app.use(static(path.join(__dirname, './img')))

app.use(bodyParser({}))
console.log("http://localhost:" + config.port)
//使用router
app.use(router.routes(),router.allowedMethods())
app.listen(config.port);