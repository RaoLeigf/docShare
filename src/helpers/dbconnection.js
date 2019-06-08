const mysql = require('mysql')
const {dbconfig} = require('../../config')


//建立数据库连接池
const dbPool = mysql.createPool({
    ...dbconfig
})

const dbQuery = function( sql, values ) {
    return new Promise(( resolve, reject ) => {
      dbPool.getConnection(function(err, connection) {
        if (err) {
          reject( err )
        } else {
          connection.query(sql, values, ( err, rows) => {
  
            if ( err ) {
              reject( err )
            } else {
              resolve( rows )
            }
            connection.release()
          })
        }
      })
    })
  }
module.exports = {
    dbQuery
}