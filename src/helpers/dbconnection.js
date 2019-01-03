const mysql = require('mysql')
const {dbconfig} = require('../../config')


//建立数据库连接池
const dbPool = mysql.createPool({
    ...dbconfig
})

module.exports = {
    dbPool
}