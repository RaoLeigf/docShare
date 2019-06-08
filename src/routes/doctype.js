const Router = require("koa-router")
const DocType = require('../controller/doctype')

const router = Router({
	prefix: "/api/doctype"
})


//获取系统自带类型
router.post('/getAllSystemtype',DocType.getAllSystemtype)

//用户选择类型
router.post('/userLikeType',DocType.userLikeType)

//获取所有类型
router.post('/getAlltype',DocType.getAlltype)

module.exports = router