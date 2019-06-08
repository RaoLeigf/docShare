const Router = require("koa-router")
const History = require('../controller/history')

const router = Router({
	prefix: "/api/history"
})


//获取用户浏览历史
router.post('/getUserHistory',History.getUserHistory)
module.exports = router
