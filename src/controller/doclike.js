const {
    getResponse,
    dbQuery
} = require('../helpers')

var sd = require('silly-datetime')

//点赞或点踩
const likedDoc = async(ctx) =>{
    let {
        DocId,
        IsLiked
    } = ctx.request.body
    
    let UserId = ctx.session.userInfo.Id
    let insertSql = `insert into docLike(UserId,DocId,IsLiked) values('${UserId}','${DocId}','${IsLiked}')`
    await dbQuery( insertSql )
    
    var docSql = `select * from doc where Id = '${DocId}'`
    var doc = await dbQuery(docSql)
    
    //将点赞的类型标记为喜欢
    if(IsLiked == 1 && doc.length > 0){

        let likedSql = `select * from userlikedtype where userId = '${UserId}' and docTypeId = '${doc[0].TypeId}'`
        let likedInfo = await dbQuery( likedSql )

        if(likedInfo.length > 0){
            let updateSql = `update userlikedType set liked = '1' where userId = '${UserId}' and docTypeId = '${doc[0].TypeId}'`
            await dbQuery( updateSql )
        }else{
            let insertSql = `insert into userlikedtype(Doctypeid,UserId,Liked) values('${doc[0].TypeId}','${UserId}','${1}')`
            await dbQuery( insertSql )
        }
    }
    ctx.body = getResponse(true,IsLiked === 1 ? '点赞成功' : '点踩成功')
}

const sumLiked = async(ctx) =>{
    let {
        Id 
    } = ctx.session.userInfo

    let sql = `select count(*) sum from doclike where userId = "${Id}" and IsLiked = 1`
    var data = await dbQuery( sql )
    ctx.body = getResponse(true,data[0])
}
module.exports = {
    likedDoc,
    sumLiked
}