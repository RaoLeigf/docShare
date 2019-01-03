const Router = require('koa-router')
const demo = require('./demo')

const router = Router({})

const routes = [
    demo
]

for(route of routes){
    router.use(route.routes(), route.allowedMethods())
}


module.exports = router