-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.29 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 db_shop 的数据库结构
CREATE DATABASE IF NOT EXISTS `db_shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_shop`;


-- 导出  表 db_shop.t_catagory_one 结构
CREATE TABLE IF NOT EXISTS `t_catagory_one` (
  `t_catagory_one_id` int(11) NOT NULL AUTO_INCREMENT,
  `catagory_one_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`t_catagory_one_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  db_shop.t_catagory_one 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `t_catagory_one` DISABLE KEYS */;
INSERT INTO `t_catagory_one` (`t_catagory_one_id`, `catagory_one_name`) VALUES
	(1, '纸杯系列'),
	(2, 'PET系列'),
	(3, '饮品杯配套系列'),
	(4, '纸浆环保餐具系列'),
	(5, '纸餐盒系列'),
	(6, '刀叉勺餐具'),
	(7, '生活用纸'),
	(8, '纸袋/环保打包袋');
/*!40000 ALTER TABLE `t_catagory_one` ENABLE KEYS */;


-- 导出  表 db_shop.t_catagory_two 结构
CREATE TABLE IF NOT EXISTS `t_catagory_two` (
  `t_catagory_two_id` int(11) NOT NULL AUTO_INCREMENT,
  `catagory_one_name` varchar(20) DEFAULT NULL,
  `catagory_two_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`t_catagory_two_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- 正在导出表  db_shop.t_catagory_two 的数据：~41 rows (大约)
/*!40000 ALTER TABLE `t_catagory_two` DISABLE KEYS */;
INSERT INTO `t_catagory_two` (`t_catagory_two_id`, `catagory_one_name`, `catagory_two_name`) VALUES
	(1, '纸杯系列', '单层热饮杯'),
	(2, '纸杯系列', '双层中空杯'),
	(3, '纸杯系列', '瓦楞隔热杯'),
	(4, '纸杯系列', '双淋膜冷饮杯'),
	(5, '纸杯系列', '爆米花桶'),
	(7, '纸杯系列', '冰淇淋纸杯'),
	(8, '纸杯系列', 'PS杯盖'),
	(9, 'PET系列', 'PET透明杯'),
	(10, 'PET系列', 'PET透明盖'),
	(11, 'PET系列', 'PET透明沙拉盒'),
	(12, '饮品杯配套系列', '杯袖'),
	(13, '饮品杯配套系列', '环保纸浆杯托'),
	(14, '饮品杯配套系列', '纸杯打包袋'),
	(15, '饮品杯配套系列', '吸管'),
	(16, '饮品杯配套系列', '搅拌棒'),
	(17, '饮品杯配套系列', '杯盖'),
	(18, '纸浆环保餐具系列', '纸碟'),
	(19, '纸浆环保餐具系列', '纸碗'),
	(20, '纸浆环保餐具系列', '纸浆带盖汤碗'),
	(21, '纸浆环保餐具系列', '连体餐盒'),
	(22, '纸浆环保餐具系列', '分体餐盒'),
	(23, '纸浆环保餐具系列', '纸浆沙拉盒'),
	(24, '纸浆环保餐具系列', '纸托盘'),
	(25, '纸餐盒系列', '圆底纸餐盒'),
	(26, '纸餐盒系列', '方底纸餐盒'),
	(27, '纸餐盒系列', '三明治纸盒'),
	(28, '纸餐盒系列', '蛋糕盒'),
	(29, '纸餐盒系列', '其他纸餐盒'),
	(30, '刀叉勺餐具', 'PS刀叉勺系列'),
	(31, '刀叉勺餐具', 'PLA刀叉勺系列'),
	(32, '刀叉勺餐具', '淀粉刀叉勺系列'),
	(33, '刀叉勺餐具', '搅拌棒/吸管'),
	(34, '生活用纸', '餐巾纸'),
	(35, '生活用纸', '抽纸'),
	(36, '生活用纸', '卫生纸'),
	(37, '生活用纸', '擦手纸'),
	(38, '生活用纸', '其他纸类'),
	(39, '纸袋/环保打包袋', '纸袋'),
	(40, '纸袋/环保打包袋', '环保淀粉塑料袋'),
	(41, '纸袋/环保打包袋', 'PLA塑料袋'),
	(42, '纸袋/环保打包袋', '食品袋');
/*!40000 ALTER TABLE `t_catagory_two` ENABLE KEYS */;


-- 导出  表 db_shop.t_manager 结构
CREATE TABLE IF NOT EXISTS `t_manager` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  db_shop.t_manager 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_manager` DISABLE KEYS */;
INSERT INTO `t_manager` (`id`, `name`, `password`) VALUES
	(1, 'manager', '21232f297a57a5a743894a0e4a801fc3');
/*!40000 ALTER TABLE `t_manager` ENABLE KEYS */;


-- 导出  表 db_shop.t_orders 结构
CREATE TABLE IF NOT EXISTS `t_orders` (
  `t_orders_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单表唯一标识',
  `t_orders_zhuangtai` varchar(20) DEFAULT NULL,
  `t_orders_time` varchar(20) DEFAULT NULL,
  `t_user_id` int(10) DEFAULT NULL COMMENT '订单所属用户id',
  `t_total_price` int(10) DEFAULT NULL COMMENT '总价格，结算展示',
  `t_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='订单表，购物车展示，结算展示时使用';

-- 正在导出表  db_shop.t_orders 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `t_orders` DISABLE KEYS */;
INSERT INTO `t_orders` (`t_orders_id`, `t_orders_zhuangtai`, `t_orders_time`, `t_user_id`, `t_total_price`, `t_address`) VALUES
	(12, '已支付', '2017-12-19 01:44:06', 1004, 261, '厄齐阿斯达自行车'),
	(18, '已支付', '2017-12-353 04:30:03', 1004, 58, '的气味阿萨德'),
	(19, '已支付', '2017-12-353 04:37:09', 1004, 203, '多萨瓦11'),
	(20, '已支付', '2017-12-353 09:47:52', 1004, 500, '多萨瓦'),
	(21, '已支付', '2017-12-353 09:48:21', 1004, 556, '多萨瓦');
/*!40000 ALTER TABLE `t_orders` ENABLE KEYS */;


-- 导出  表 db_shop.t_orders_items 结构
CREATE TABLE IF NOT EXISTS `t_orders_items` (
  `orders_items_id` int(10) NOT NULL AUTO_INCREMENT,
  `wares_id` int(10) DEFAULT NULL COMMENT '商品名字',
  `wares_num` int(10) DEFAULT NULL COMMENT '商品数量',
  `wares_price` int(10) DEFAULT NULL,
  `orders_id` int(10) DEFAULT NULL COMMENT '所属订单id',
  PRIMARY KEY (`orders_items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='订单中的商品内容';

-- 正在导出表  db_shop.t_orders_items 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_orders_items` DISABLE KEYS */;
INSERT INTO `t_orders_items` (`orders_items_id`, `wares_id`, `wares_num`, `wares_price`, `orders_id`) VALUES
	(25, 4, 3, 29, 12),
	(26, 5, 3, 29, 12),
	(27, 7, 3, 29, 12),
	(39, 7, 1, 29, 18),
	(40, 4, 1, 29, 18),
	(41, 4, 5, 29, 19),
	(42, 7, 1, 29, 19),
	(43, 5, 1, 29, 19),
	(44, 2, 2, 28, 20),
	(45, 23, 1, 444, 20),
	(46, 2, 4, 28, 21),
	(47, 23, 1, 444, 21);
/*!40000 ALTER TABLE `t_orders_items` ENABLE KEYS */;


-- 导出  表 db_shop.t_vip_shop_address 结构
CREATE TABLE IF NOT EXISTS `t_vip_shop_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipients` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  db_shop.t_vip_shop_address 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `t_vip_shop_address` DISABLE KEYS */;
INSERT INTO `t_vip_shop_address` (`id`, `recipients`, `tel`, `address`, `user_id`) VALUES
	(1, 'bbbb', '15675456197', '多萨瓦', '1004'),
	(2, 'bb', '12412312', '的气味阿萨德', '1004'),
	(3, 'cc', '421321', 'dasdwadwwadadasdasadww', '1004'),
	(4, 'dd', '421321', '厄齐阿斯达自行车', '1004'),
	(5, 'ee', '4232131', '的万达速度速度', '1004');
/*!40000 ALTER TABLE `t_vip_shop_address` ENABLE KEYS */;


-- 导出  表 db_shop.t_vip_user 结构
CREATE TABLE IF NOT EXISTS `t_vip_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识',
  `user_nick_name` varchar(20) DEFAULT NULL COMMENT '用户的昵称',
  `user_pwd` varchar(100) DEFAULT NULL,
  `user_true_name` varchar(20) DEFAULT NULL COMMENT '用户的真实姓名',
  `user_tel` varchar(20) DEFAULT NULL COMMENT '用户联系方式，商家寄货业务等需要',
  `user_id_number` varchar(20) DEFAULT NULL COMMENT '用户的身份证号，保证用户合法性',
  `user_address` varchar(50) DEFAULT NULL COMMENT '用户收货地址',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8 COMMENT='会员信息表，保存会员的个人信息';

-- 正在导出表  db_shop.t_vip_user 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `t_vip_user` DISABLE KEYS */;
INSERT INTO `t_vip_user` (`user_id`, `user_nick_name`, `user_pwd`, `user_true_name`, `user_tel`, `user_id_number`, `user_address`) VALUES
	(1001, 'nick_name', NULL, 'true_name', '1321268060211', '520202199410110000', '湖南省衡阳市珠晖区衡花路18号'),
	(1002, 'VIP_2_nick_name', NULL, 'VIP_2_true_name', '13212680603', '520202199410120000', '湖南省衡阳市珠晖区衡花路19号'),
	(1003, 'VIP_3_nick_name', NULL, 'VIP_3_true_name', '13212680604', '520202199410130000', '湖南省衡阳市珠晖区衡花路20号'),
	(1004, '深兰水', '202cb962ac59075b964b07152d234b70', '代金池', '15675456197', '510321199704214656', '四川省自贡市'),
	(1016, '怎么可能不想你', '250cf8b51c773f3f8dc8b4be867a9a02', '张三', '15678486197', '1232141412', NULL);
/*!40000 ALTER TABLE `t_vip_user` ENABLE KEYS */;


-- 导出  表 db_shop.t_wares 结构
CREATE TABLE IF NOT EXISTS `t_wares` (
  `w_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品表唯一标识',
  `w_name` varchar(20) NOT NULL DEFAULT '0' COMMENT '商品名',
  `w_one_catagory` varchar(20) DEFAULT NULL COMMENT '所属一级分类名',
  `w_two_catagory` varchar(20) DEFAULT NULL COMMENT '所属二级分类名',
  `w_price` int(10) DEFAULT NULL COMMENT '商品价格',
  `w_describe` varchar(50) DEFAULT NULL COMMENT '商品规格',
  `w_count` int(10) DEFAULT NULL COMMENT '商品所剩数量',
  `w_image` varchar(50) DEFAULT NULL COMMENT '图片1',
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商品表，保存商品信息';

-- 正在导出表  db_shop.t_wares 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `t_wares` DISABLE KEYS */;
INSERT INTO `t_wares` (`w_id`, `w_name`, `w_one_catagory`, `w_two_catagory`, `w_price`, `w_describe`, `w_count`, `w_image`) VALUES
	(1, '妙洁1-1-1', '生活用纸', '卫生纸', 18, '100只/袋', 100, '1.jpg'),
	(2, '妙洁1-1-2', '纸杯系列', '单层热饮杯', 28, '100只/袋', 100, 'rdPro2.jpg'),
	(3, '妙洁1-2-1', '纸杯系列', '双层中空杯', 19, '100只/袋', 100, 'rdPro3.jpg'),
	(4, '妙洁1-2-2', '纸杯系列', '双层中空杯', 29, '100只/袋', 100, 'rdPro4.jpg'),
	(5, '妙洁2-1-2', 'PET系列', 'PET透明杯', 29, '100只/袋', 100, 'rdPro1.jpg'),
	(6, '妙洁2-1-1', 'PET系列', 'PET透明杯', 29, '100只/袋', 100, 'rdPro5.jpg'),
	(7, '妙洁2-2-1', 'PET系列', 'PET透明盖', 29, '100只/袋', 100, 'rdPro1.jpg'),
	(8, '妙洁2-2-2', 'PET系列', 'PET透明盖', 29, '100只/袋', 100, 'rdPro1.jpg'),
	(13, '5', '纸杯系列', '双层中空杯', 5, '100只/袋', 5, '13.jpg'),
	(15, '21', '纸杯系列', '单层热饮杯', 12, '100只/袋', 12, '15.jpg'),
	(16, '44', '饮品杯配套系列', '杯袖', 44, '100只/袋', 44, '16.jpg'),
	(17, '阿斯达', '纸杯系列', '单层热饮杯', 12, '100只/袋', 41, '17.jpg'),
	(18, '333', '纸杯系列', '单层热饮杯', 444, '1212', 1212, '18.jpg'),
	(19, '123', '纸杯系列', '单层热饮杯', 123, '123', 312, '19.jpg'),
	(20, '22', '纸杯系列', '单层热饮杯', 22, '22', 22, '20.jpg'),
	(21, '55', '纸杯系列', '单层热饮杯', 55, '55', 55, '21.jpg'),
	(22, '66', '纸杯系列', '单层热饮杯', 66, '66', 66, '22.jpg'),
	(23, '444', '纸杯系列', '单层热饮杯', 444, '444', 444, '23.jpg'),
	(24, '1111', '纸杯系列', '单层热饮杯', 1111, '111', 1111, '24.jpg');
/*!40000 ALTER TABLE `t_wares` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
