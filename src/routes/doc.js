const Router = require("koa-router")
const Doc = require('../controller/doc')

const router = Router({
	prefix: "/api/doc"
})


//创建文档
router.post('/createDoc',Doc.createDoc)

//获取文档详情
router.post('/getDocDetailById',Doc.getDocDetailById)

//根据时间倒叙查看列表
router.post('/getDocListByCreateTime',Doc.getDocListByCreateTime)

//根据类型查看列表
router.post('/getDocListByType',Doc.getDocListByType)

//根据用户喜好推荐列表
router.post('/getDocListByLike',Doc.getDocListByLike)

//查看我的文档
router.post('/getMyDocs',Doc.getMyDocs)

//删除文档
router.post('/deleteDoc',Doc.deleteDoc)

//我的文档总数
router.post('/sumMyDocs',Doc.sumMyDocs)

//推荐数量
router.post('/commond',Doc.commond)

module.exports = router