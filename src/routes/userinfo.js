const Router = require("koa-router")
const Userinfo = require('../controller/userinfo')
const router = Router({
	prefix: "/api/userinfo"
})


//注册
router.post('/register',Userinfo.register)

//登录
router.post('/login',Userinfo.login)

//获取用户信息
router.post('/getUserInfo',Userinfo.getUserInfo)

//获取用户信息
router.post('/getUserInfoById',Userinfo.getUserInfoById)

module.exports = router