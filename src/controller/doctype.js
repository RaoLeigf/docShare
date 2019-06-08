const {
    getResponse,
    dbQuery
} = require('../helpers')

var sd = require('silly-datetime')

//获取所有系统类型
const getAllSystemtype = async(ctx) =>{
    
    let docTypeSql = `select * from doctype where isSystem=1`

    let doctypes = await dbQuery( docTypeSql )
    ctx.body = getResponse(true,doctypes)
}

//获取所有类型
const getAlltype = async(ctx) =>{
    
    let docTypeSql = `select * from doctype`

    let doctypes = await dbQuery( docTypeSql )
    ctx.body = getResponse(true,doctypes)
}

//用户选择文档类型（喜欢或不喜欢）
const userLikeType = async(ctx) =>{
    let{
        likes
    } = ctx.request.body

    let userId = ctx.session.userInfo.Id

    for(likeInfo of likes)
    {
        let likedSql = `select * from userlikedtype where userId = '${userId}' and docTypeId = '${likeInfo.typeId}'`
        let likedInfo = await dbQuery( likedSql )

        if(likedInfo.length > 0){
            let updateSql = `update userlikedType set liked = '${likeInfo.liked}' where userId = '${userId}' and docTypeId = '${likeInfo.typeId}'`
            await dbQuery( updateSql )
        }else{
            let insertSql = `insert into userlikedtype(Doctypeid,UserId,Liked) values('${likeInfo.typeId}','${userId}','${likeInfo.liked}')`
            await dbQuery( insertSql )
        }
    }

    ctx.body = getResponse(true,'选择成功')

}

module.exports = {
    getAllSystemtype,
    userLikeType,
    getAlltype
}