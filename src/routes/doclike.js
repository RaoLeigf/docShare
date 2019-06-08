const Router = require("koa-router")
const DocLike = require('../controller/doclike')

const router = Router({
	prefix: "/api/doclike"
})

//点赞或点踩
router.post('/likedDoc',DocLike.likedDoc)

//获取用户喜欢总数
router.post('/sumLiked',DocLike.sumLiked)

module.exports = router
