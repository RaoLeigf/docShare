const {
    getResponse,
    dbQuery
} = require('../helpers')

var sd = require('silly-datetime')

//注册
const register = async(ctx) =>{
    let {
        UserName,
        Password,
        Sex,
        HeadImg
    } = ctx.request.body

    //判断用户名是否重复
    let UserInfoSql = `select * from userinfo where username='${UserName}'`
    let UserInfo = await dbQuery( UserInfoSql )
    if(UserInfo.length > 0){
        ctx.body = getResponse(false,'e002')
        return 
    }

    let Datetime = sd.format(new Date(), 'YYYY-MM-DD HH:mm')

    let Sql = `insert into userinfo(username,password,sex,CreateTime,HeadImg) Values('${UserName}','${Password}','${Sex}','${Datetime}','${HeadImg}')`

    let Data = await dbQuery( Sql )
    var Id = Data.insertId
    //设置session
    ctx.session.userInfo = {
        Id,
        UserName,
        Password,
        Sex,
        HeadImg
    }
    ctx.body = getResponse(true,Id)
}

//登录 
const login = async(ctx) =>{
    let {
        UserName,
        Password
    } = ctx.request.body

    let sql = `select * from userinfo where username='${UserName}' and password='${Password}'`
    let data = await dbQuery( sql )
    
    if(data.length > 0){
        //设置session
        ctx.session.userInfo = {
            ...data[0]
        }
        ctx.body = getResponse(true,'登录成功')
    }else{
        ctx.body = getResponse(false,'e001')
    }
}

//获取用户信息
const getUserInfo = async(ctx) =>{
    let{
        Id,
        UserName,
        Sex
    } = ctx.session.userInfo

    if(!Id || Id <= 0){
        ctx.body = getResponse(false,'e003')
    }
    
    ctx.body = getResponse(true,{
        Id,
        UserName,
        Sex
    })
}
const getUserInfoById = async(ctx) =>{
    let{
        Id
    } = ctx.request.body

    var sql = `select * from userinfo where Id ='${Id}'`
    let data = await dbQuery(sql)
    ctx.body = getResponse(true,data[0])
}
module.exports = {
    register,
    login,
    getUserInfo,
    getUserInfoById
}