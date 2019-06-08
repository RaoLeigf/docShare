const Router = require('koa-router')
const demo = require('./demo')
const userinfo = require('./userinfo')
const doctype = require('./doctype')
const doc = require('./doc')
const history = require('./history')
const doclike = require('./doclike')
const file = require('./file')

const router = Router({})

const routes = [
    demo,
    userinfo,
    doctype,
    doc,
    history,
    doclike,
    file
]

for(route of routes){
    router.use(route.routes(), route.allowedMethods())
}


module.exports = router