const errors = require('./error')
const {
    dbQuery
} = require('./dbconnection')

var getResponse = (success,data)=>{
    let re
    if(success){
        re = {
            data:data||{},
            success:true
        }
    }else{
        re = {
            success:false,
            error:data||"",
            errorMsg:errors[data]||"未知错误"
        }
    }

    return re
}

module.exports = {
    getResponse,
    dbQuery,
    errors
}