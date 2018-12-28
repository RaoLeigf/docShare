const Koa = require('koa')
const bodyParser = require('koa-bodyparser')
const logger = require('koa-logger')
const moment = require('moment')

const router = require('./routes')
const config = require('../config')


const app = new Koa();

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
  
app.use(bodyParser({}))
console.log("http://localhost:" + config.port)
// 使用router
app.use(router.routes(),router.allowedMethods())
app.listen(config.port);