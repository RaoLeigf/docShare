//服务器端口
const port = 3000
//数据库连接属性
const dbconfig ={
    database: 'lego',//数据库名
    user: 'lego_devadmin',//用户名
    password: 'NV3CslPe1dO2dew5',//密码
    port: '3306',
    host: '192.168.50.208'
}
module.exports = {
    port,
    dbconfig
}