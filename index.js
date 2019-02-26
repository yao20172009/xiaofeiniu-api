/*小肥牛扫码点餐数据API子系统*/
const PORT=8090;
const express=require('express');
const cors=require('cors');
const bodyParser=require('body-parser');
const categoryRouter=require('./routes/admin/category')
//启动主服务器
var app=express();
app.listen(PORT,()=>{
    console.log('Server Listening'+PORT+'...')
});
app.use(cors());
app.use(bodyParser.json());
//挂载路由
app.use('/admin/category',categoryRouter);