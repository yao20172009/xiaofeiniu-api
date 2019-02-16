SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu CHARSET=UTF8;
USE xiaofeiniu;
/*管理员*/
CREATE TABLE xfn_admin(
 aid INT PRIMARY KEY AUTO_INCREMENT,
 aname VARCHAR(32) UNIQUE,
 apwd VARCHAR(64)
);
INSERT INTO xfn_admin VALUES
(NULL,'admin',PASSWORD('123456')),
(NULL,'boss',PASSWORD('999999'));
/*全局设置*/
CREATE TABLE xfn_settings(
 sid INT PRIMARY KEY AUTO_INCREMENT,
 appName VARCHAR(32) UNIQUE,
 apiUrl VARCHAR(64),
 adminUrl VARCHAR(64),
 appUrl VARCHAR(64),
 icp VARCHAR(64),
 copyright VARCHAR(128)
);
INSERT INTO xfn_settings VALUES
(NULL,'小肥牛','http://127.0.0.1:8090','http://127.0.0.1:8091','http://127.0.0.1:8092','京ICP备12003709号-3','Copyright © 北京达内金桥科技有限公司版权所有');
/*桌台表*/
CREATE TABLE xfn_table(
 tid INT PRIMARY KEY AUTO_INCREMENT,
 tname VARCHAR(32) UNIQUE,
 type VARCHAR(32),
 status INT
);
INSERT INTO xfn_table VALUES
(null,'福满堂','6-8人桌',1),
(null,'金镶玉','10人桌',2),
(null,'寿天齐','4人桌',3),
(null,'全家福','2人桌',0);
/*桌台预定信息表*/
CREATE TABLE xfn_reservation(
 rid INT PRIMARY KEY AUTO_INCREMENT,
 contactName VARCHAR(32) UNIQUE,
 phone VARCHAR(32),
 contactTime BIGINT,
 dinnerTime BIGINT
);
INSERT INTO xfn_reservation VALUES
(null,'丁丁','13501234567',1550286392074,1550311200000),
(null,'当当','13501244568',1550286492074,1550311200000),
(null,'豆豆','13501254567',1550286592074,1550311200000),
(null,'美美','13501264569',1550286692074,1550311200000);
/*菜品类别表*/
CREATE TABLE xfn_category(
 cid INT PRIMARY KEY AUTO_INCREMENT,
 cname VARCHAR(32) UNIQUE
);
INSERT INTO xfn_category VALUES
(null,'肉丸'),
(null,'丸滑类'),
(null,'海鲜河鲜'),
(null,'菌菇类'),
(null,'蔬菜豆制品类');
/*菜品*/
CREATE TABLE xfn_dish(
did INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(32),
imgUrl VARCHAR(128),
price DECIMAIL(6,2),
detail VARCHAR(128),
categoryId INT,
FOREIGN KEY(categoryId) REFERENCES xfn_category(cid)
);
INSERT INTO xfn_dish VALUES
(100000,'草鱼片','r9470.jpg'),
(100000,''),
(100000,''),
(100000,''),
(100000,''),
