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
});
router.delete('/:cid',(req,res)=>{
    pool.query('DELETE FROM xfn_category WHERE cid=?',req.params.cid,(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
        res.send({code:200,msg:"1 category deleted"})
    }else{
        res.send({code:400,msg:"0 category deleted"})
    }
    })
})