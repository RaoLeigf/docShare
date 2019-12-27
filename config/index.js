//服务器端口
const port = 3001
//数据库连接属性
const dbconfig ={
    database: 'docshare',//数据库名
    user: 'root',//用户名
    password: '123456',//密码
    port: '3306',
    host: 'localhost'
}
//Session属性
const sessionConfig = {
    key: 'koa:sess',   //cookie key (default is koa:sess)
    maxAge: 86400000,  // cookie的过期时间 maxAge in ms (default is 1 days)
    overwrite: true,  //是否可以overwrite    (默认default true)
    httpOnly: true, //cookie是否只有服务器端可以访问 httpOnly or not (default true)
    signed: false,   //签名默认true
    rolling: false,  //在每次请求时强行设置cookie，这将重置cookie过期时间（默认：false）
    renew: false,  //(boolean) renew session when session is nearly expired,
}

module.exports = {
    port,
    dbconfig,
    sessionConfig
}