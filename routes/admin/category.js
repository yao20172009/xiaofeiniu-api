// 菜品类别相关的路由
//创建路由器
const express=require('express');
const pool=require('../../pool');
var router=express.Router();
module.exports=router;
//功能一：查询菜品
router.get('/',(req,res)=>{
    pool.query('SELECT * FROM xfn_category ORDER BY cid',(err,result)=>{
        if(err) throw err;
        var jsonDate=JSON.stringify(result)
        res.send('dodata('+jsonDate+')')
    })
});
//功能二：删除菜品
router.delete('/:cid', (req, res) => {
    //注意：删除菜品类别前必须先把属于该类别的菜品的类别编号设置为NULL
    pool.query('UPDATE xfn_dish SET categoryId=NULL WHERE categoryId=?', req.params.cid, (err, result) => {
      if (err) throw err;
      //至此指定类别的菜品已经修改完毕
      pool.query('DELETE FROM xfn_category WHERE cid=?', req.params.cid, (err, result) => {
        if (err) throw err;
        //获取DELETE语句在数据库中影响的行数
        if (result.affectedRows > 0) {
          res.send({ code: 200, msg: '1 category deleted' })
        } else {
          res.send({ code: 400, msg: '0 category deleted' })
        }
      })
    })
  })
//功能三：更新菜品
router.post('/',(req,res)=>{
    var data=req.body;
    pool.query('INSERT INTO xfn_category SET ?',data,(err,result)=>{
        if(err) throw err;
        res.send({code:200,msg:"1 category added"})
    })
})
//功能三：修改菜品
/*router.get('/:cid',(req,res)=>{
    pool.query('UPDATE xfn_category SET cname=? WHERE cid=?'),(err,result)=>{
        if(err) throw err;
        var 
    }
})*/