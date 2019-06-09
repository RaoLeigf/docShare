const {
    getResponse,
    dbQuery
} = require('../helpers')

var sd = require('silly-datetime')

//创建文档
const createDoc = async(ctx) =>{
    let{
        Title,
        Summary,
        Content,
        TypeId,
        Img
    } = ctx.request.body

    let {
        Id,
        UserName
    } = ctx.session.userInfo

    let Datetime = sd.format(new Date(), 'YYYY-MM-DD HH:mm')

    var InsertSql = `INSERT INTO doc( Title, Summary, Content, Img, CreatorName, CreatorId, TypeId, CreatedTime) VALUES ( '${Title}', '${Summary}', '${Content}', '${Img}', '${UserName}', '${Id}', '${TypeId}', '${Datetime}')`

    let Data = await dbQuery( InsertSql )
    ctx.body = getResponse(true,Data.insertId)
}

//根据Id获取详情
const getDocDetailById = async(ctx) =>{

    const {
        DocId
    } = ctx.request.body

    let {
        Id
    } = ctx.session.userInfo

    //是否喜欢
    let IsLike = 0

    let sql = `select * from doc where Id = '${DocId}'`
    let Data = await dbQuery(sql)

    let Datetime = sd.format(new Date(), 'YYYY-MM-DD HH:mm')

    if(Data.length > 0){
        var Detail = Data[0]
        //文档阅读次数加一
        let sql2 = `update doc set ReadSum = '${Detail.ReadSum+1}' where Id = '${DocId}'`
        //保存浏览记录
        let sql3 = `INSERT INTO history( DocId, UserId, Title, Summary, CreateTime) VALUES ('${DocId}','${Id}','${Detail.Title}','${Detail.Summary}','${Datetime}')`
        
        //是否点赞或点踩 1代表点赞，2代表点踩
        let sql4 = `select * from docLike where DocId = ${DocId} and UserId =${Id}`

        await dbQuery(sql2)
        await dbQuery(sql3)
        let DataIsLike = await dbQuery(sql4)
        if(DataIsLike.length > 0){
            IsLike = DataIsLike[0].IsLike
        }
    }

    ctx.body = getResponse(true,{
        ...Data[0],
        IsLike
    })

}

//按按时间倒序所有的文档列表
const getDocListByCreateTime = async(ctx) =>{
    let sql = `select doc.*,userInfo.UserName,userinfo.HeadImg,
    (
    select count(*)
    from doclike dk
    where dk.DocId = doc.Id and dk.IsLiked = 1
    ) as likedSum,
    (
    select count(*)
    from doclike ddk
    where ddk.DocId = doc.Id and ddk.IsLiked = 0
    ) as dislikedSum
    from doc 
    inner join userinfo on doc.creatorId = userInfo.Id
    order by doc.Id desc`

    let Data = await dbQuery(sql)

    ctx.body = getResponse(true,Data)
}

//按类型查看文档列表
const getDocListByType = async(ctx) =>{
    let {
        TypeId
    } = ctx.request.body

    let sql = `select doc.*,userInfo.UserName,userinfo.HeadImg,
    (
    select count(*)
    from doclike dk
    where dk.DocId = doc.Id and dk.IsLiked = 1
    ) as likedSum,
    (
    select count(*)
    from doclike ddk
    where ddk.DocId = doc.Id and ddk.IsLiked = 0
    ) as dislikedSum
    from doc 
    inner join userinfo on doc.creatorId = userInfo.Id
    where doc.typeId = '${TypeId}'
    order by doc.Id desc`
    
    let Data = await dbQuery(sql)

    ctx.body = getResponse(true,Data)
}

//根据用户喜好推荐文档列表
const getDocListByLike = async(ctx) =>{
    let Id = ctx.session.userInfo.Id
    let like = 5
    let history = 5
    var recommendsql = `select * from recommend where userId = ${Id}`
    let recommendData = await dbQuery( recommendsql )
    //查询推荐的比例
    if(!recommendData.length == 0){
        let like2 = recommendData[0].like
        let history2 = recommendData[0].history
        if( like2 == 0 && history2 == 0){
         like = 5
         history = 5
        }else if(like2 == 0 && history2 != 0){
         like = 0
         history = 10
        }else if(like2 != 0 && history2 == 0){
         like = 10
         history = 0
        }

        like = Math.floor((like2*10)/(like2 + history2))
        history = 10 - like
    }

    
    let likesql = `select doc.*,userInfo.UserName,userinfo.HeadImg,'like' tag,
    (
    select count(*)
    from doclike dk
    where dk.DocId = doc.Id and dk.IsLiked = 1
    ) as likedSum,
    (
    select count(*)
    from doclike ddk
    where ddk.DocId = doc.Id and ddk.IsLiked = 0
    ) as dislikedSum
    from doc 
    inner join userinfo on doc.creatorId = userInfo.Id
		where doc.typeId in (
		select u.doctypeId
		from userlikedtype u 
		where UserId = '${Id}'
)
    order by doc.Id desc
    limit ${like}
`  
    let likeData = await dbQuery(likesql)
    
    let historylikesql = `select doc.*,userInfo.UserName,userinfo.HeadImg,'history' tag,
    (
    select count(*)
    from doclike dk
    where dk.DocId = doc.Id and dk.IsLiked = 1
    ) as likedSum,
    (
    select count(*)
    from doclike ddk
    where ddk.DocId = doc.Id and ddk.IsLiked = 0
    ) as dislikedSum
    from doc 
    inner join userinfo on doc.creatorId = userInfo.Id
		where doc.typeId in (
		select d.typeId
        from history h 
        inner join doc d on d.Id = h.docId
        where h.UserId = '${Id}' 
        )
    and doc.Id not in (`
    if(likeData.length > 0){
        for(let i = 0; i < likeData.length; i++){
            historylikesql+=`${likeData[i].Id}`
            if(i != likeData.length-1){
                historylikesql+=`,`
            }else{
                historylikesql+=`)`
            }
        }
    }else{
        historylikesql+=`0)`
    }
    historylikesql+=`
    order by doc.Id desc
    limit ${history}`
    
    let historyData = await dbQuery(historylikesql)

    if(likeData.length == 0 && historyData.length == 0){
        sql =  `select doc.*,userInfo.UserName,userinfo.HeadImg,'all' tag,
        (
        select count(*)
        from doclike dk
        where dk.DocId = doc.Id and dk.IsLiked = 1
        ) as likedSum,
        (
        select count(*)
        from doclike ddk
        where ddk.DocId = doc.Id and ddk.IsLiked = 0
        ) as dislikedSum
        from doc 
        inner join userinfo on doc.creatorId = userInfo.Id
        order by doc.Id desc`
    
        Data = await dbQuery(sql)
        ctx.body = getResponse(true,Data)
        return 
    }
    let totleData = new Array()
    for(let i = 0; i < likeData.length; i++){
        totleData.push(likeData[i])
    }
    for(let i = 0; i < historyData.length; i++){
        totleData.push(historyData[i])
    }
    ctx.body = getResponse(true,totleData)
    
}

//查看我创建的文档
const getMyDocs = async(ctx) =>{
    var Id = ctx.session.userInfo.Id
    let sql = `select doc.*,userInfo.UserName,userinfo.HeadImg,
    (
    select count(*)
    from doclike dk
    where dk.DocId = doc.Id and dk.IsLiked = 1
    ) as likedSum,
    (
    select count(*)
    from doclike ddk
    where ddk.DocId = doc.Id and ddk.IsLiked = 0
    ) as dislikedSum
    from doc 
    inner join userinfo on doc.creatorId = userInfo.Id
    where doc.creatorId = '${Id}'
    order by doc.Id desc`

    let Data = await dbQuery(sql)

    ctx.body = getResponse(true,Data)
}

//删除文档
const deleteDoc = async(ctx) =>{
    let{
        DocId
    } = ctx.request.body

    var sql = `delete from doc where Id = '${DocId}'`

    await dbQuery(sql)

    ctx.body = getResponse(true,'删除成功')
}

//查看我创建的文档数
const sumMyDocs = async(ctx) =>{
    var Id = ctx.session.userInfo.Id
    let sql = `select count(*) sum from doc where creatorId = '${Id}' `

    let Data = await dbQuery(sql)

    ctx.body = getResponse(true,Data[0])
}

const commond = async(ctx) =>{
    var Id = ctx.session.userInfo.Id
    let {
        Tag
    } = ctx.request.body
    var sql1 = `select * from recommend where userId = '${Id}' `
    let data1 = await dbQuery(sql1)

    if(data1.length > 0 ){
        var sql2 = `		update recommend
		set \`${Tag}\` = \`${Tag}\`+1
        where userId = '${Id}' `
        let data2 = await dbQuery(sql2)
    }else if (Tag == 'like'){
        var sql3 = `INSERT INTO \`recommend\`(\`like\`, \`history\`, \`userId\`) VALUES (1, 0, ${Id})`
        let data3 = await dbQuery(sql3)
    }else{
        var sql4 = `INSERT INTO \`recommend\`(\`like\`, \`history\`, \`userId\`) VALUES (1, 0, ${Id})`
        let data4 = await dbQuery(sql4)
    }

    ctx.body = getResponse(true,true)
}

module.exports = {
    createDoc,
    getDocDetailById,
    getDocListByCreateTime,
    getDocListByType,
    getDocListByLike,
    getMyDocs,
    deleteDoc,
    sumMyDocs,
    commond
}