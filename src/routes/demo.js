const Router = require("koa-router")
const Demo = require('../controller/demo')

const router = Router({
	prefix: "/api/demo"
})


//测试用路由
router.post('/hello',Demo.controllerDemo)


module.exports = router