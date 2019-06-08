const {
    getResponse,
    dbQuery
} = require('../helpers')

var sd = require('silly-datetime')

//获取所有浏览历史
const getUserHistory = async(ctx) =>{
    let sql = `select doc.*,userInfo.UserName,userinfo.HeadImg,
    (
    select count(*)
    from doclike dk
    where dk.DocId = doc.Id and dk.IsLiked = 1
    ) as likedSum,
    (
    select count(*)
    from doclike ddk
    where ddk.DocId = doc.Id and ddk.IsLiked = 2
    ) as dislikedSum
    from doc 
    inner join userinfo on doc.creatorId = userInfo.Id
    inner join history on history.docId = doc.Id
    where history.userId='${ctx.session.userInfo.Id}'
    order by doc.Id desc`

    let Data = await dbQuery(sql)

    ctx.body = getResponse(true,Data)
}

module.exports = {
    getUserHistory
}