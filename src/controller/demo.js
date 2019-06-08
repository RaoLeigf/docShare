const {
    getResponse,
    dbQuery
} = require('../helpers')


//demo
const controllerDemo = async(ctx) =>{


      let sql = 'SELECT * FROM userinfo'
      let data = await dbQuery( sql )
      console.log(data)
      ctx.session.id = 1
    ctx.body = getResponse(true,data)
}

module.exports = {
    controllerDemo
}