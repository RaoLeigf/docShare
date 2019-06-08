const Router = require("koa-router")
const File = require('../controller/file')

const router = Router({
	prefix: "/api/file"
})


//测试用路由
router.post('/uploadImg',File.uploadImg)


module.exports = router