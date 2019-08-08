# 需要弄清楚以下问题
1. 自己的操作事件，互不阻塞，并发与有序
2. 自己与他人的操作，互不阻塞
3. 事务操作，提交，回滚
# ***************************************************************<br>
dao共包含以下接口：
insert  插入一条数据
insertList  批量插入
update  更新
del   删除
select  查询一条数据
selectCols  自定义列查询一条数据
list    查询一组数据
listCols 自定义列查询一组数据
count   查询数据总数记录
# ***************************************************************<br>
<br>
# 具体用法：<br>
------------------------------------------------<br>
1. insert   插入一条数据：<br>
var testEntity = require('uw-test').TestEntity;<br>
var testEntity = new TestEntity();<br>
testDao.insert(client, testEntity, function(err, data){<br>
    //data返回插入数据的id<br>
    var id = data.insertId;<br>
});<br>

insertList  批量插入<br>
var testEntity1 = new TestEntity();<br>
var testEntity2 = new TestEntity();<br>
testDao.insertList(client, [testEntity1,testEntity2], function(err, data){<br>
    //data返回空值<br>
});<br>
------------------------------------------------<br>
2. update  更新：<br>
两种使用方式<br>
一、<br>
testDao.update(client, {name:"aaa",lvl:2}, {id:1},function(err, data){<br>
    //data返回空值<br>
});<br>
二、<br>
testDao.update(client, {name:"aaa",lvl:2}, " id = ? and name = ? and name is not null ",[1,"xxx"],function(err,<br> data){<br>
    //data返回空值<br>
});<br>
------------------------------------------------<br>
3. del   删除：<br>
两种使用方式<br>
一、<br>
testDao.del(client,{id:1},function(err, data){<br>
    //data返回空值<br>
});<br>
二、<br>
testDao.del(client,  " id = ? and name = ? and name is not null ",[1,"xxx"],function(err, data){<br>
    //data返回空值<br>
});<br>

------------------------------------------------<br>
4. select  查询一条数据：<br>
两种使用方式<br>
一、<br>
testDao.select(client,{id:1},function(err, data){<br>
    //data返回object<br>
});<br>
二、<br>
testDao.select(client,  " id = ? and name = ? and name is not null ",[1,"xxx"],function(err, data){<br>
    //data返回object<br>
});<br>

select  自定义列查询一条数据：<br>
两种使用方式<br>
一、<br>
testDao.selectCols(client," name,lvl ",{id:1},function(err, data){<br>
    //data返回object，只包含name,lvl<br>
});<br>
二、<br>
testDao.selectCols(client, " name,lvl ", " id = ? and name = ? and name is not null ",[1,"xxx"],function(err, data){<br>
    //data返回object，只包含name,lvl<br>
});<br>

------------------------------------------------<br>
5. list  查询一组数据：<br>
两种使用方式<br>
一、<br>
testDao.list(client,{lvl:10},function(err, data){<br>
    //data返回数组[object,...]<br>
});<br>
二、<br>
testDao.list(client,  " id = ? and name = ? and name is not null ",[1,"xxx"],function(err, data){<br>
    //data返回[object,...]<br>
});<br>

listCols  自定义列查询一组数据：<br>
两种使用方式<br>
一、<br>
testDao.listCols(client," name,lvl ",{lvl:10},function(err, data){<br>
    //data返回[object,...]，object只包含name,lvl<br>
});<br>
二、<br>
testDao.listCols(client, " name,lvl ", " lvl = ? and name is not null ",[10,"xxx"],function(err, data){<br>
    //data返回[object,...]，object只包含name,lvl<br>
});<br>

------------------------------------------------<br>
6. count   查询数据总数记录：<br>
两种使用方式<br>
一、<br>
testDao.count(client, {lvl:10}, function(err, data){<br>
    //data返回记录总数<br>
});<br>
二、<br>
testDao.count(client, " lvl = ?  name is not null ",[10,"xxx"],function(err, data){<br>
    //data返回记录总数<br>
});<br>