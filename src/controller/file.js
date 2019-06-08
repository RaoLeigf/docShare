const {
    getResponse,
    dbQuery
} = require('../helpers')
const fs = require('fs');
const path = require('path');

const uploadImg = async(ctx) =>{
    const file = ctx.request.files.img; // 上传的文件在ctx.request.files.file
    // 创建可读流
    const reader = fs.createReadStream(file.path);
    // 修改文件的名称
    var myDate = new Date();
    var newFilename = myDate.getTime()+'.'+file.name;
    var targetPath = "E:\\Learn\\Code\\docShare-master\\src\\img\\"+ `${newFilename}`;
    //创建可写流
    const upStream = fs.createWriteStream(targetPath);
    // 可读流通过管道写入可写流
    reader.pipe(upStream);
    //返回保存的路径
    ctx.body = getResponse(true,'http://localhost:3000/' + newFilename);

}

module.exports = {
    uploadImg
}