// 菜品类别相关的路由
//创建路由器
const express=require('express');
const pool=require('../../pool');
var router=express.Router();
module.exports=router;
router.get('/',(req,res)=>{
    pool.query('SELECT * FROM xfn_category ORDER BY cid',(err,result)=>{
        if(err) throw err;
        res.send(result)
    })
})