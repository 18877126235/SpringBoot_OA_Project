/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.49 : Database - 00_maven_springboot_oa_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `aoa_attachment_list` */

DROP TABLE IF EXISTS `aoa_attachment_list`;

CREATE TABLE `aoa_attachment_list` (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attachment_name` varchar(255) DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `attachment_shuffix` varchar(255) DEFAULT NULL,
  `attachment_size` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_attachment_list` */

insert  into `aoa_attachment_list`(`attachment_id`,`attachment_name`,`attachment_path`,`attachment_shuffix`,`attachment_size`,`attachment_type`,`model`,`upload_time`,`user_id`) values (66,'touxiang.jpg','/2017/10/光宇/ea6c9723-9a0f-46e0-adbc-1cf41b44a805.jpg','jpg','12124','image/jpeg','aoa_bursement','2017-10-12 23:25:57','18'),(67,'touxiang.jpg','/2017/10/伊丽莎白/b11342e1-bcf1-4196-b6a3-b900a5ce1c7a.jpg','jpg','12124','image/jpeg','aoa_bursement','2017-10-14 21:22:35','3'),(68,'touxiang.jpg','/2017/10/光宇/d2377f04-95b7-49a3-95d1-e7ea7d51b204.jpg','jpg','12124','image/jpeg','aoa_bursement','2017-10-15 19:17:46','18'),(90,'QQ图片20191126114906.jpg','attachment/2020/02/刘大庆/QQ图片20191126114906.jpg','jpg','3301828','image/jpeg','mail','2020-02-18 21:12:57','36'),(91,'QQ图片20191203205536.jpg','attachment/2020/02/罗密欧/QQ图片20191203205536.jpg','jpg','368417','image/jpeg','mail','2020-02-19 12:53:39','1'),(92,'QQ图片20191106185654.jpg','attachment/2020/02/刘大庆/QQ图片20191106185654.jpg','jpg','120075','image/jpeg','mail','2020-02-19 13:30:37','36'),(99,'QQ图片20190313223152.jpg','attachment/2020/03/罗密欧/QQ图片20190313223152.jpg','jpg','3358469','image/jpeg','aoa_director','2020-03-26 17:02:28','1'),(100,'XV}32SIU36~~C9DYYLAKKUH.jpg','attachment/2020/03/罗密欧/XV}32SIU36~~C9DYYLAKKUH.jpg','jpg','3529539','image/jpeg','aoa_director','2020-03-26 17:05:25','1'),(102,'QQ图片20190317202325.jpg','attachment/2020/03/罗密欧/QQ图片20190317202325.jpg','jpg','20539','image/jpeg','aoa_director','2020-03-26 17:19:14','1');

/*Table structure for table `aoa_attends_list` */

DROP TABLE IF EXISTS `aoa_attends_list`;

CREATE TABLE `aoa_attends_list` (
  `attends_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attends_ip` varchar(20) DEFAULT NULL,
  `attends_remark` varchar(20) DEFAULT NULL,
  `attends_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `attends_user_id` bigint(20) DEFAULT NULL,
  `attend_hmtime` varchar(255) DEFAULT NULL,
  `week_ofday` varchar(255) DEFAULT NULL,
  `holiday_days` double(255,0) DEFAULT '0',
  `holiday_start` date DEFAULT NULL,
  PRIMARY KEY (`attends_id`),
  KEY `FKaxgqsm98npnl1rxysh9upfjee` (`attends_user_id`),
  CONSTRAINT `FKaxgqsm98npnl1rxysh9upfjee` FOREIGN KEY (`attends_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_attends_list` */

insert  into `aoa_attends_list`(`attends_id`,`attends_ip`,`attends_remark`,`attends_time`,`status_id`,`type_id`,`attends_user_id`,`attend_hmtime`,`week_ofday`,`holiday_days`,`holiday_start`) values (67,'192.168.42.143',NULL,'2020-03-18 11:04:14',11,8,1,'11:04','星期三',NULL,NULL),(68,'192.168.42.143',NULL,'2020-03-18 11:43:36',12,9,1,'11:43','星期三',NULL,NULL),(69,'192.168.42.223','','2020-03-19 08:33:27',11,8,36,'08:33','星期四',NULL,NULL);

/*Table structure for table `aoa_bursement` */

DROP TABLE IF EXISTS `aoa_bursement`;

CREATE TABLE `aoa_bursement` (
  `bursement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `all_money` double DEFAULT NULL,
  `allinvoices` int(11) DEFAULT NULL,
  `burse_time` datetime DEFAULT NULL,
  `financial_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `operation_name` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `user_name` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bursement_id`),
  KEY `FKt3xu5y23deh0mtqkfk3ly6219` (`operation_name`),
  KEY `FK666vswh4nl3voq8qalu73v2sq` (`pro_id`),
  KEY `FKgnqp4eax31sh7mn3lt2su7olr` (`user_name`),
  CONSTRAINT `FK666vswh4nl3voq8qalu73v2sq` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`),
  CONSTRAINT `FKgnqp4eax31sh7mn3lt2su7olr` FOREIGN KEY (`user_name`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKt3xu5y23deh0mtqkfk3ly6219` FOREIGN KEY (`operation_name`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_bursement` */

/*Table structure for table `aoa_catalog` */

DROP TABLE IF EXISTS `aoa_catalog`;

CREATE TABLE `aoa_catalog` (
  `catalog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catalog_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `cata_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`catalog_id`),
  KEY `FKbsk5nkjlqmd8j9rmkarse6j1x` (`cata_user_id`),
  CONSTRAINT `FKbsk5nkjlqmd8j9rmkarse6j1x` FOREIGN KEY (`cata_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_catalog` */

insert  into `aoa_catalog`(`catalog_id`,`catalog_name`,`parent_id`,`cata_user_id`) values (1,'note',1,1),(2,'诗词记录',1,1),(9,'秒懂百科',1,2),(11,'上课要案',1,3),(12,'错题收集',1,3),(32,'规划(3)',1,1),(33,'根目录',1,NULL),(34,'规划(4)',1,1);

/*Table structure for table `aoa_comment_list` */

DROP TABLE IF EXISTS `aoa_comment_list`;

CREATE TABLE `aoa_comment_list` (
  `duiying_user_name` varchar(20) DEFAULT NULL,
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `comment_user_id` bigint(20) DEFAULT NULL,
  `reply_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK2k00kkfhh93949ybod7qn56ax` (`comment_user_id`),
  KEY `FKeopff14rxco5thbwwlu7exglo` (`reply_id`),
  CONSTRAINT `FK2k00kkfhh93949ybod7qn56ax` FOREIGN KEY (`comment_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKeopff14rxco5thbwwlu7exglo` FOREIGN KEY (`reply_id`) REFERENCES `aoa_reply_list` (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_comment_list` */

insert  into `aoa_comment_list`(`duiying_user_name`,`comment_id`,`comment`,`time`,`comment_user_id`,`reply_id`) values ('罗密欧',1,'回复内容01','2020-03-02 15:31:25',1,99),('罗密欧',132,'测试回复11','2020-03-03 14:29:37',36,99),('罗密欧',133,'我就不信了','2020-03-03 14:31:18',36,99),('罗密欧',134,'测试回复03','2020-03-03 14:33:09',36,99),('刘大庆',135,'我他妈一口盐汽水喷死你<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/11.gif\" border=\"0\" alt=\"\" />','2020-03-03 14:57:20',1,100),('罗密欧',138,'你想干嘛<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/17.gif\" alt=\"\" border=\"0\" />','2020-03-03 15:25:50',36,100),('罗密欧',139,'来呀我不怕你<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/22.gif\" alt=\"\" border=\"0\" />','2020-03-03 15:34:45',36,100),('罗密欧',140,'我哪里得罪你了','2020-03-03 15:42:48',36,100),('刘大庆',143,'哎呀，不小心犯了个小错误','2020-03-03 16:16:46',1,99),('刘大庆',144,'你滚吧呀<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/3.gif\" alt=\"\" border=\"0\" />','2020-03-03 16:18:09',1,100),('罗密欧',145,'我他么弄死你','2020-03-03 16:18:58',36,100),('刘大庆',146,'怎么回事，吵什么<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/27.gif\" alt=\"\" border=\"0\" />','2020-03-03 16:19:59',2,100),('罗密欧',147,'罗密欧你这么凶干嘛','2020-03-03 16:20:15',2,100),('罗密欧',151,'这么巧呀我这边也下雨了<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/13.gif\" alt=\"\" border=\"0\" />','2020-03-04 13:20:55',36,109),('罗密欧',152,'<img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/13.gif\" alt=\"\" border=\"0\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/13.gif\" alt=\"\" border=\"0\" />','2020-03-18 20:49:51',36,99),('刘大庆',153,'奥利华给','2020-03-18 20:52:04',1,99);

/*Table structure for table `aoa_dept` */

DROP TABLE IF EXISTS `aoa_dept`;

CREATE TABLE `aoa_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_addr` varchar(255) DEFAULT NULL,
  `dept_fax` varchar(255) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `dept_tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `deptmanager` bigint(20) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_dept` */

insert  into `aoa_dept`(`dept_id`,`dept_addr`,`dept_fax`,`dept_name`,`dept_tel`,`email`,`deptmanager`,`end_time`,`start_time`) values (1,'五楼',NULL,'总经办','888888888','hq@fjhirg.com',3,'2017-11-15 22:50:05','2017-11-07 22:50:11'),(2,'四楼',NULL,'研发部','66666666','as@fwgh',4,'2017-09-13 19:04:07','2010-05-23 00:00:00'),(3,'三楼',NULL,'财务部','233333','153@qq.com',5,'2017-09-19 16:46:26','2016-09-19 16:46:32'),(4,'六楼',NULL,'市场部','666888','aaluoxiang@foxmail.com',6,'2016-07-19 16:48:09','2014-09-19 16:48:20'),(5,'六楼',NULL,'人事部','33332222','103@qq.com',7,'2017-10-07 14:12:05','2017-05-09 14:12:14');

/*Table structure for table `aoa_detailsburse` */

DROP TABLE IF EXISTS `aoa_detailsburse`;

CREATE TABLE `aoa_detailsburse` (
  `detailsburse_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descript` varchar(255) DEFAULT NULL,
  `detailmoney` double NOT NULL,
  `invoices` int(11) DEFAULT NULL,
  `produce_time` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `bursment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`detailsburse_id`),
  KEY `FKi02w0bghxr73fsc5sbpeyqdnn` (`bursment_id`),
  CONSTRAINT `FKi02w0bghxr73fsc5sbpeyqdnn` FOREIGN KEY (`bursment_id`) REFERENCES `aoa_bursement` (`bursement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_detailsburse` */

/*Table structure for table `aoa_director` */

DROP TABLE IF EXISTS `aoa_director`;

CREATE TABLE `aoa_director` (
  `director_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `company_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `attachment_id` bigint(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  KEY `FKi6pfdnqhbc6js940e2o1vape5` (`user_id`),
  CONSTRAINT `FKi6pfdnqhbc6js940e2o1vape5` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_director` */

insert  into `aoa_director`(`director_id`,`address`,`company_number`,`email`,`attachment_id`,`phone_number`,`pinyin`,`remark`,`sex`,`user_name`,`user_id`,`companyname`) values (18,'南宁学院','530299','2468282708@qq.com',99,'18173328976','liudaqing','哈哈哈','男','刘大庆',1,'南宁学院'),(19,'防城港','530299','2468282708@qq.com',100,'18877125291','zhuoke','嘻嘻','男','著科',1,'南宁学院');

/*Table structure for table `aoa_director_users` */

DROP TABLE IF EXISTS `aoa_director_users`;

CREATE TABLE `aoa_director_users` (
  `director_users_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catelog_name` varchar(255) DEFAULT NULL,
  `is_handle` int(11) DEFAULT NULL,
  `director_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `share_user_id` bigint(20) DEFAULT NULL,
  `sharetime` datetime DEFAULT NULL,
  PRIMARY KEY (`director_users_id`),
  KEY `FK675oqfmv4kx9w6bgi9rgsb8nw` (`director_id`),
  KEY `FK7hq4xk2ja9eka4210qkqq03hi` (`user_id`),
  KEY `FKibwkjvmp9383ltkfew1kyy6ny` (`share_user_id`),
  CONSTRAINT `FK675oqfmv4kx9w6bgi9rgsb8nw` FOREIGN KEY (`director_id`) REFERENCES `aoa_director` (`director_id`),
  CONSTRAINT `FK7hq4xk2ja9eka4210qkqq03hi` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKibwkjvmp9383ltkfew1kyy6ny` FOREIGN KEY (`share_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_director_users` */

insert  into `aoa_director_users`(`director_users_id`,`catelog_name`,`is_handle`,`director_id`,`user_id`,`share_user_id`,`sharetime`) values (79,'大学同学',0,NULL,1,NULL,'2020-03-26 16:59:16'),(80,'',0,NULL,1,NULL,'2020-03-26 17:00:05'),(81,'大学同学',1,18,1,NULL,'2020-03-26 17:02:28'),(82,'大学同学',1,19,1,NULL,'2020-03-26 17:05:25'),(85,'',1,19,36,1,'2020-03-26 18:31:45');

/*Table structure for table `aoa_discuss_list` */

DROP TABLE IF EXISTS `aoa_discuss_list`;

CREATE TABLE `aoa_discuss_list` (
  `discuss_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `visit_num` int(11) DEFAULT NULL,
  `discuss_user_id` bigint(20) DEFAULT NULL,
  `vote_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`discuss_id`),
  KEY `FKt8hvx0ai5fto20mmxmy2g8j4g` (`discuss_user_id`),
  KEY `FK17yi8arj4vjdr5mm5dhjov10j` (`vote_id`),
  CONSTRAINT `FK17yi8arj4vjdr5mm5dhjov10j` FOREIGN KEY (`vote_id`) REFERENCES `aoa_vote_list` (`vote_id`),
  CONSTRAINT `FKt8hvx0ai5fto20mmxmy2g8j4g` FOREIGN KEY (`discuss_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_discuss_list` */

insert  into `aoa_discuss_list`(`discuss_id`,`attachment_id`,`content`,`create_time`,`status_id`,`title`,`type_id`,`visit_num`,`discuss_user_id`,`vote_id`,`modify_time`) values (1,NULL,'fdsfasfdsfasfsa','2017-09-29 21:48:28',NULL,'fsda',49,12,1,NULL,'2017-09-29 21:48:28'),(6,NULL,'富士达奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥奥','2017-09-29 21:48:28',NULL,'what????',48,7,2,NULL,'2017-10-04 18:06:39'),(7,NULL,'发生地方撒范德萨反反复复付付付付付付付付付付付付8','2017-09-30 13:07:03',NULL,'发生富士达',50,27,2,NULL,'2017-10-05 22:58:38'),(8,NULL,'fsdaaaaaaaaaaaaaaafsaaaaaaaaaaa','2017-09-30 13:12:33',NULL,'同一人',51,37,2,NULL,'2017-10-05 22:59:02'),(9,NULL,'发生的多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多','2017-09-30 13:16:51',NULL,'范德萨',52,15,2,NULL,'2017-09-30 13:07:03'),(12,NULL,'fsdaaaaaaaaaaaaaaafsaaaaaaaaaaa','2017-09-30 15:30:26',NULL,'修改了这个名字2333',52,97,2,NULL,'2017-10-04 21:24:09'),(13,NULL,'<p>\r\n	今天还是不错的，完成了一些内容，比如：修复了分页的小bug；还有一些其他的东西；再把讨论区好好的晚上一下\r\n</p>','2017-10-01 14:25:26',NULL,'第一天的公告,++小整合',52,357,1,NULL,'2017-10-01 14:25:26'),(14,NULL,'afsdddddddd fasdddddddddddddddd','2017-10-01 14:37:39',NULL,'fads ',52,29,1,NULL,'2017-10-01 14:37:39'),(15,NULL,'afsddddddddddddddddddddddddddddddddddddddd','2017-10-01 14:40:08',NULL,'dsaf ',52,26,1,NULL,'2017-10-01 14:40:08'),(17,NULL,'<p style=\"color:#3F3F3F;font-family:&quot;background-color:#FFFFFF;\">\r\n	每个对象在出生的时候就有一把钥匙（监视器Monitor），那么被synchronized 修饰的方法相当于给方法加了一个锁，这个方法就可以进行同步，在多线程的时候，不会出现线程安全问题。\r\n</p>\r\n<p style=\"color:#3F3F3F;font-family:&quot;background-color:#FFFFFF;\">\r\n	<span>注：Monitor是 Java中用以实现线程之间的互斥与协作的主要手段，它可以看成是对象或者 Class的锁。每一个对象都有，也仅有一个 Monitor。</span>\r\n</p>\r\n<p style=\"color:#3F3F3F;font-family:&quot;background-color:#FFFFFF;\">\r\n	下面通过一张图片进行讲解：\r\n</p>\r\n<h4 id=\"1一张图片\" style=\"font-family:&quot;font-weight:300;color:#3F3F3F;font-size:1.25em;background-color:#FFFFFF;\">\r\n	<a name=\"t0\"></a>1.一张图片\r\n</h4>\r\n<p style=\"color:#3F3F3F;font-family:&quot;background-color:#FFFFFF;\">\r\n	<span>图片看不清，请点击这里 ：</span>&nbsp;<a href=\"http://img.blog.csdn.net/20170929230249738?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMDY0ODU1NQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\" target=\"_blank\">高清大图</a>\r\n</p>\r\n<p style=\"color:#3F3F3F;font-family:&quot;background-color:#FFFFFF;\">\r\n	<img src=\"http://img.blog.csdn.net/20170929230249738?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMDY0ODU1NQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\" alt=\"这里写图片描述\" title=\"\" style=\"height:auto;\" />\r\n</p>\r\n<h4 id=\"2图片对应的代码\" style=\"font-family:&quot;font-weight:300;color:#3F3F3F;font-size:1.25em;background-color:#FFFFFF;\">\r\n	<a name=\"t1\"></a>2.图片对应的代码\r\n</h4>\r\n<pre class=\"prettyprint\"><span class=\"hljs-keyword\" style=\"color:#000088;\">import</span> java.util.Date; <span class=\"hljs-javadoc\" style=\"color:#880000;\">/**\r\n * 测试的object类\r\n *\r\n *<span class=\"hljs-javadoctag\" style=\"color:#660066;\"> @author</span>:dufy\r\n *<span class=\"hljs-javadoctag\" style=\"color:#660066;\"> @version</span>:1.0.0\r\n *<span class=\"hljs-javadoctag\" style=\"color:#660066;\"> @date</span> 2017/9/29\r\n *<span class=\"hljs-javadoctag\" style=\"color:#660066;\"> @email</span> 742981086@qq.com\r\n */</span> <span class=\"hljs-keyword\" style=\"color:#000088;\">public</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\" style=\"color:#000088;\">class</span> <span class=\"hljs-title\" style=\"color:#660066;\">ObjectTest</span> {</span> <span class=\"hljs-keyword\" style=\"color:#000088;\">public</span> <span class=\"hljs-keyword\" style=\"color:#000088;\">synchronized</span> <span class=\"hljs-keyword\" style=\"color:#000088;\">void</span> <span class=\"hljs-title\">methodA</span>(){ <span class=\"hljs-keyword\" style=\"color:#000088;\">try</span> {\r\n            System.out.println(<span class=\"hljs-string\" style=\"color:#008800;\">\"This is methodA ....\"</span> + Thread.currentThread().getName() + <span class=\"hljs-string\" style=\"color:#008800;\">\": \"</span> + <span class=\"hljs-keyword\" style=\"color:#000088;\">new</span> Date());\r\n            Thread.sleep(<span class=\"hljs-number\" style=\"color:#006666;\">1000</span>);\r\n        } <span class=\"hljs-keyword\" style=\"color:#000088;\">catch</span> (InterruptedException e) {\r\n            e.printStackTrace();\r\n        }\r\n\r\n    } <span class=\"hljs-keyword\" style=\"color:#000088;\">public</span> <span class=\"hljs-keyword\" style=\"color:#000088;\">void</span> <span class=\"hljs-title\">methodB</span>(){\r\n\r\n        System.out.println(<span class=\"hljs-string\" style=\"color:#008800;\">\"This is methodB ....\"</span> + Thread.currentThread().getName() + <span class=\"hljs-string\" style=\"color:#008800;\">\": \"</span> + <span class=\"hljs-keyword\" style=\"color:#000088;\">new</span> Date());\r\n    } <span class=\"hljs-keyword\" style=\"color:#000088;\">public</span> <span class=\"hljs-keyword\" style=\"color:#000088;\">synchronized</span> <span class=\"hljs-keyword\" style=\"color:#000088;\">void</span> <span class=\"hljs-title\">methodC</span>(){ <span class=\"hljs-keyword\" style=\"color:#000088;\">try</span> {\r\n            System.out.println(<span class=\"hljs-string\" style=\"color:#008800;\">\"This is methodC ....\"</span> + Thread.currentThread().getName() + <span class=\"hljs-string\" style=\"color:#008800;\">\": \"</span> + <span class=\"hljs-keyword\" style=\"color:#000088;\">new</span> Date());\r\n            Thread.sleep(<span class=\"hljs-number\" style=\"color:#006666;\">3000</span>);\r\n        } <span class=\"hljs-keyword\" style=\"color:#000088;\">catch</span> (InterruptedException e) {\r\n            e.printStackTrace();\r\n        }\r\n\r\n    }\r\n\r\n\r\n}</pre>','2017-10-01 15:18:40',NULL,'fsdaaaaaaaaaa ',52,8,1,NULL,'2017-10-01 15:18:40'),(23,NULL,'afdsssssssssssssssssssssssssssssssssssssssssfffffffffffffffffHHHHHHFFFFFFFFFF1111112222222','2017-10-01 16:38:44',NULL,'yyyyyyyyyyHHHHHHHHHFFFFFF11111112222',52,4,1,NULL,'2017-10-01 16:38:44'),(32,NULL,'他的44444他的44444他的44444他的44444','2017-10-03 21:55:10',NULL,'他的44444',48,73,2,2,'2017-10-03 21:55:09'),(33,NULL,'&nbsp;投票的测试&nbsp;投票的测试&nbsp;投票的测试&nbsp;投票的测试','2017-10-03 23:25:08',NULL,' 投票的测试随机颜色的测试',48,92,2,3,'2017-10-03 23:25:07'),(34,NULL,'这是一个多选的投票这是一个多选的投票这是一个多选的投票','2017-10-04 02:58:16',NULL,'这是一个多选的投票',50,16,2,4,'2017-10-04 02:58:15'),(35,NULL,'想去哪个地方，尽情发言，，，，，，，反正我们也不会去的，<img src=\"http://localhost:8080/plugins/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8080/plugins/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8080/plugins/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','2017-10-04 03:19:52',NULL,'旅欧地点投票，单选',50,24,2,5,'2017-10-04 03:19:52'),(37,NULL,'未开始时间投票测试未开始时间投票测试未开始时间投票测试','2017-10-04 15:27:36',NULL,'xiugai ；未开始时间投票测试',50,23,2,7,'2017-10-04 18:05:52'),(38,NULL,'dfasfsdfafdsfsfasddddddddddddddddddd222','2017-10-04 16:01:49',NULL,'修改d  ;我知道能够修改成功,在修改依稀呢？',50,10,2,8,'2017-10-04 18:03:16'),(39,NULL,'333333333333333333333333333333333333333333333333333333','2017-10-05 22:54:27',NULL,'电风扇',50,1,2,9,'2017-10-05 22:54:26'),(40,NULL,'<h2>\r\n	这是投票11234这是投票11234这是投票11234这是投票11234这是投票11234这是投票11234这是投票11234\r\n</h2>','2017-10-05 22:57:41',NULL,'这是投票11234',51,2,2,10,'2017-10-05 22:57:41'),(41,NULL,'4555555555555555555555555555555555555555555','2017-10-05 22:58:29',NULL,'手动阀123',51,3,2,11,'2017-10-06 17:03:53'),(42,NULL,'4444444444444这是投票11234这是投票11234','2017-10-05 23:17:52',NULL,'大师傅',51,7,7,NULL,'2017-10-05 23:17:52'),(45,NULL,'<img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/10.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/28.gif\" border=\"0\" alt=\"\" />','2020-02-29 19:18:16',NULL,'关于大庆的处分报告',51,18,1,NULL,'2020-02-29 19:18:16'),(46,NULL,'<img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/28.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />哈哈哈成功了呀','2020-02-29 20:49:25',NULL,'关于开学的延期处理',49,5,1,NULL,'2020-02-29 20:49:25'),(47,NULL,'<img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/28.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/11.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/26.gif\" border=\"0\" alt=\"\" />你开心个锤子','2020-02-29 21:18:03',NULL,'今天过生日，我好开心呀哈哈哈',50,9,1,NULL,'2020-02-29 21:18:03'),(48,NULL,'付出了很大的努力，<img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/11.gif\" alt=\"\" border=\"0\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/10.gif\" alt=\"\" border=\"0\" />，辞职不干','2020-02-29 21:24:19',NULL,'呵呵，这次公司的年终奖我一分钱没得',52,1,36,NULL,'2020-02-29 21:24:19'),(49,NULL,'<img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/27.gif\" alt=\"\" border=\"0\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/25.gif\" alt=\"\" border=\"0\" /><img src=\"http://127.0.0.1:8088/plugins/kindeditor/plugins/emoticons/images/16.gif\" alt=\"\" border=\"0\" />我烦死了妈的智障','2020-02-29 22:41:35',NULL,'什么时候开学呀在家好烦好烦',51,35,36,NULL,'2020-02-29 22:41:35'),(50,NULL,'<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/20.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />哈哈哈哈哈','2020-03-02 12:08:33',NULL,'第二',48,75,1,NULL,'2020-03-02 12:08:33');

/*Table structure for table `aoa_evection` */

DROP TABLE IF EXISTS `aoa_evection`;

CREATE TABLE `aoa_evection` (
  `evection_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`evection_id`),
  KEY `FKql1c10e5u2vefisjqjbu2d5pa` (`pro_id`),
  CONSTRAINT `FKql1c10e5u2vefisjqjbu2d5pa` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_evection` */

/*Table structure for table `aoa_evectionmoney` */

DROP TABLE IF EXISTS `aoa_evectionmoney`;

CREATE TABLE `aoa_evectionmoney` (
  `evectionmoney_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `financial_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `pro` int(255) DEFAULT NULL,
  PRIMARY KEY (`evectionmoney_id`),
  KEY `FKcpuubnshaf2cg47hns9m0h1dq` (`pro_id`),
  CONSTRAINT `FKcpuubnshaf2cg47hns9m0h1dq` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_evectionmoney` */

/*Table structure for table `aoa_file_list` */

DROP TABLE IF EXISTS `aoa_file_list`;

CREATE TABLE `aoa_file_list` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_shuffix` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `path_id` bigint(20) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `file_user_id` bigint(20) DEFAULT NULL,
  `file_istrash` bigint(1) unsigned zerofill DEFAULT '0',
  `file_isshare` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `FKfshy9n300pqxjsweo9247jgqs` (`path_id`),
  KEY `FKlj6l9qroivus28aiqluue4bew` (`file_user_id`),
  CONSTRAINT `FKfshy9n300pqxjsweo9247jgqs` FOREIGN KEY (`path_id`) REFERENCES `aoa_file_path` (`path_id`),
  CONSTRAINT `FKlj6l9qroivus28aiqluue4bew` FOREIGN KEY (`file_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_file_list` */

insert  into `aoa_file_list`(`file_id`,`file_name`,`file_path`,`file_shuffix`,`content_type`,`model`,`path_id`,`size`,`upload_time`,`file_user_id`,`file_istrash`,`file_isshare`) values (137,'325506(1)(1)(1).jpg','2020/02/刘大庆/6502ecfa-15f7-4810-8d82-272cdb31eb4c.jpg','jpg','image/jpeg',NULL,97,387654,'2020-02-22 17:02:12',36,0,1),(138,'16物联网工程3班信息表.xlsx','2020/02/刘大庆/17c02b0c-475d-4e32-9a0a-dac6b42a8fd9.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',NULL,98,15749,'2020-02-22 17:18:38',36,0,1),(139,'刘东庆20160217040-基于SpringBoot技术的政企协同办公系统设计与实现.docx','2020/02/刘大庆/6ade8c7e-ac15-4784-8f93-1ec75c16ae6c.docx','docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',NULL,97,42334,'2020-02-22 17:18:49',36,0,0),(142,'null3a905a1b44980abc.jpg','2020/02/刘大庆/8a13f369-1a18-413c-b944-0aed9a7d63ec.jpg','jpg','image/jpeg',NULL,99,62941,'2020-02-23 18:54:16',36,0,0),(143,'16物联网3班班风学风新 - ，（原）.pptx','2020/02/刘大庆/72209396-59e2-49a9-8097-774fc58d074b.pptx','pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',NULL,98,33558895,'2020-02-23 18:54:55',36,0,0),(144,'16级物联网3班-陈霞妮.docx','2020/02/刘大庆/e3ff9a3d-16f3-45d5-873a-07ac31bab50d.docx','docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',NULL,97,13925,'2020-02-24 14:53:47',36,0,0),(145,'QQ图片20190312063224.jpg','2020/02/刘大庆/b6e9c0d5-046d-4819-b267-89f05d8c0292.jpg','jpg','image/jpeg',NULL,98,168968,'2020-02-24 18:48:36',36,0,0),(146,'QQ图片20191203205536.jpg','2020/02/刘大庆/0247f001-9b87-4a0a-ae3f-2c5643bdd9dd.jpg','jpg','image/jpeg',NULL,98,368417,'2020-02-24 19:31:02',36,0,0),(147,'IMG_20190411_192124.jpg','2020/02/罗密欧/c0a0a300-3f0e-4ba7-9675-067ccd01cae7.jpg','jpg','image/jpeg',NULL,95,1262962,'2020-02-25 08:27:20',1,0,1),(148,'c2be3d154c9dc9041d13ac3bc0c186cc.jpg','2020/02/罗密欧/1e41ead4-6400-459f-ae7d-28e89d9cb2ef.jpg','jpg','image/jpeg',NULL,95,10122,'2020-02-25 08:28:40',1,0,0),(149,'Cache_-3c90c1c6cca8222a..jpg','2020/02/刘大庆/c7fadb05-bfb9-4b3a-8e3f-d596e7255045.jpg','jpg','image/jpeg',NULL,98,168874,'2020-02-25 09:49:25',36,0,0),(150,'QQ图片20191203234943.jpg','2020/02/刘大庆/2ff6b8d9-a524-487c-8c59-c3637e31f1db.jpg','jpg','image/jpeg',NULL,98,62858,'2020-02-25 09:50:34',36,0,0),(151,'QQ图片20200119122020.jpg','2020/02/刘大庆/dd89ac41-6f11-4c87-b9b3-d23eed4f41f2.jpg','jpg','image/jpeg',NULL,98,14658,'2020-02-25 09:57:43',36,0,0),(154,'拷贝 325506(1)(1)(1).jpg','2020\\02\\刘大庆/d9747dad-5736-4dbe-a285-47eafc4ff4e1.jpg','jpg','image/jpeg',NULL,99,387654,'2020-02-25 17:54:13',36,0,0),(155,'psb (4).jpg','2020/02/刘大庆/29579889-a34f-4ec5-990d-b8201fb42cbf.jpg','jpg','image/jpeg',NULL,99,36822,'2020-02-25 17:56:14',36,0,0),(156,'拷贝 psb (4).jpg','2020\\02\\刘大庆/273f92d5-c20a-4607-ad0b-b61b8f82fdb8.jpg','jpg','image/jpeg',NULL,97,36822,'2020-02-25 17:57:49',36,0,0),(157,'拷贝 IMG_20190411_192124.jpg','2020\\02\\罗密欧/9f2e7592-7f47-4aa0-912a-53b8dec77351.jpg','jpg','image/jpeg',NULL,95,1262962,'2020-02-26 11:20:46',1,1,0),(158,'刘东庆-JAVA工程师简历.docx','2020/04/罗密欧/21beea7d-276a-4b96-94c7-a46ab2e71471.docx','docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',NULL,95,232754,'2020-04-10 22:03:58',1,0,0);

/*Table structure for table `aoa_file_path` */

DROP TABLE IF EXISTS `aoa_file_path`;

CREATE TABLE `aoa_file_path` (
  `path_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `path_name` varchar(255) DEFAULT NULL,
  `path_user_id` bigint(20) DEFAULT NULL,
  `path_istrash` bigint(20) DEFAULT '0',
  PRIMARY KEY (`path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_file_path` */

insert  into `aoa_file_path`(`path_id`,`parent_id`,`path_name`,`path_user_id`,`path_istrash`) values (1,0,'根目录',NULL,0),(6,1,'罗密欧',1,0),(89,1,'无双',10,0),(90,1,'甄姬',7,0),(91,90,'新建文件夹',7,0),(92,91,'新建文件5夹',7,0),(93,1,'于彤',13,0),(94,1,'小李父斯基',4,0),(95,6,'我的文件',1,0),(97,1,'刘大庆',36,0),(98,97,'重要文件',36,0),(99,97,'测试文件夹',36,0);

/*Table structure for table `aoa_holiday` */

DROP TABLE IF EXISTS `aoa_holiday`;

CREATE TABLE `aoa_holiday` (
  `holiday_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `leave_days` int(11) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`holiday_id`),
  KEY `FK1glo2wpb4kuiop1ymjxs0knxj` (`pro_id`),
  CONSTRAINT `FK1glo2wpb4kuiop1ymjxs0knxj` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_holiday` */

/*Table structure for table `aoa_in_mail_list` */

DROP TABLE IF EXISTS `aoa_in_mail_list`;

CREATE TABLE `aoa_in_mail_list` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mail_content` text,
  `mail_create_time` datetime DEFAULT NULL,
  `mail_file_id` bigint(20) DEFAULT NULL,
  `mail_title` varchar(255) NOT NULL,
  `mail_type` bigint(20) DEFAULT NULL,
  `mail_in_push_user_id` bigint(20) DEFAULT NULL,
  `in_receiver` varchar(255) DEFAULT NULL,
  `mail_status_id` bigint(20) DEFAULT NULL,
  `mail_number_id` bigint(20) DEFAULT NULL,
  `mail_del` int(11) DEFAULT NULL,
  `mail_push` int(11) DEFAULT NULL,
  `mail_star` int(11) DEFAULT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `FK33o7j8f0xk8n8vrk576iktglc` (`mail_file_id`),
  KEY `FK933q7ouoddu584qg08rbvwvxi` (`mail_in_push_user_id`),
  KEY `FKghibt111d1yvc3f02x06sihjp` (`mail_number_id`),
  CONSTRAINT `FK33o7j8f0xk8n8vrk576iktglc` FOREIGN KEY (`mail_file_id`) REFERENCES `aoa_attachment_list` (`attachment_id`),
  CONSTRAINT `FK933q7ouoddu584qg08rbvwvxi` FOREIGN KEY (`mail_in_push_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKghibt111d1yvc3f02x06sihjp` FOREIGN KEY (`mail_number_id`) REFERENCES `aoa_mailnumber` (`mail_number_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_in_mail_list` */

insert  into `aoa_in_mail_list`(`mail_id`,`mail_content`,`mail_create_time`,`mail_file_id`,`mail_title`,`mail_type`,`mail_in_push_user_id`,`in_receiver`,`mail_status_id`,`mail_number_id`,`mail_del`,`mail_push`,`mail_star`) values (65,'<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/20.gif\" alt=\"\" border=\"0\" /><img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/13.gif\" alt=\"\" border=\"0\" />','2020-02-18 21:12:57',90,'测试01',16,36,'罗密欧',20,NULL,0,1,0),(66,'哈哈哈哈哈哈哈','2020-02-18 22:01:24',NULL,'为啥呀',16,1,'刘大庆',20,NULL,0,1,0),(67,'u回归回顾','2020-02-18 22:02:19',NULL,'怎么会这样',16,1,NULL,20,NULL,0,0,0),(68,'<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/18.gif\" alt=\"\" border=\"0\" /><img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/18.gif\" alt=\"\" border=\"0\" /><img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/28.gif\" alt=\"\" border=\"0\" />','2020-02-18 22:35:13',NULL,'测试02',16,36,'罗密欧',20,NULL,0,1,0),(69,'<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/10.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/39.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/22.gif\" border=\"0\" alt=\"\" />','2020-02-19 12:53:39',91,'部门任务完成趋向图',16,1,'刘大庆',20,NULL,0,1,0),(70,'<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/18.gif\" alt=\"\" border=\"0\" /><img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/18.gif\" alt=\"\" border=\"0\" /><img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/18.gif\" alt=\"\" border=\"0\" />','2020-02-19 13:30:37',92,'尊敬的罗密欧您好',16,36,'罗密欧',20,NULL,0,1,0),(71,'灌灌灌灌灌','2020-02-28 18:46:58',NULL,'操作成功',16,1,'刘大庆',20,NULL,0,1,0),(72,'<br />\r\n<hr />\r\nu回归回顾','2020-02-28 19:50:39',NULL,'怎么会这样',16,1,'刘大庆',20,NULL,0,1,0);

/*Table structure for table `aoa_love_discuss_user` */

DROP TABLE IF EXISTS `aoa_love_discuss_user`;

CREATE TABLE `aoa_love_discuss_user` (
  `discuss_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`discuss_id`,`user_id`),
  KEY `FKkl0fitgg3qixkg5gg9mmjp5e7` (`user_id`),
  CONSTRAINT `FKkl0fitgg3qixkg5gg9mmjp5e7` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKnhdtxclyun4is9ne5o99nqw1c` FOREIGN KEY (`discuss_id`) REFERENCES `aoa_discuss_list` (`discuss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_love_discuss_user` */

insert  into `aoa_love_discuss_user`(`discuss_id`,`user_id`) values (8,1),(12,1),(15,1),(33,1),(49,1),(7,2),(12,2),(13,2),(33,2),(37,2),(38,2),(39,2),(33,3),(33,7),(13,8),(7,36),(46,36),(49,36),(50,36);

/*Table structure for table `aoa_love_user` */

DROP TABLE IF EXISTS `aoa_love_user`;

CREATE TABLE `aoa_love_user` (
  `reply_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  KEY `FK7fv96y8gbqcnb44qao4ey4rmn` (`user_id`),
  KEY `FKcuptpmm0l1e0b9pjv0xksqqai` (`reply_id`),
  CONSTRAINT `FK7fv96y8gbqcnb44qao4ey4rmn` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKcuptpmm0l1e0b9pjv0xksqqai` FOREIGN KEY (`reply_id`) REFERENCES `aoa_reply_list` (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_love_user` */

/*Table structure for table `aoa_mail_reciver` */

DROP TABLE IF EXISTS `aoa_mail_reciver`;

CREATE TABLE `aoa_mail_reciver` (
  `pk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_read` int(11) NOT NULL,
  `mail_id` bigint(20) DEFAULT NULL,
  `mail_reciver_id` bigint(20) DEFAULT NULL,
  `is_star` int(11) DEFAULT NULL,
  `is_del` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `FKj8ki52vm052q6qdal2rkh2c9q` (`mail_id`),
  KEY `FK65vdrbmq9hu4hrhvtw6slwxlc` (`mail_reciver_id`),
  CONSTRAINT `FK65vdrbmq9hu4hrhvtw6slwxlc` FOREIGN KEY (`mail_reciver_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKj8ki52vm052q6qdal2rkh2c9q` FOREIGN KEY (`mail_id`) REFERENCES `aoa_in_mail_list` (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_mail_reciver` */

insert  into `aoa_mail_reciver`(`pk_id`,`is_read`,`mail_id`,`mail_reciver_id`,`is_star`,`is_del`) values (55,1,65,1,0,0),(56,1,66,36,0,1),(57,1,68,1,1,0),(58,1,69,36,0,0),(59,1,70,1,1,0),(60,0,71,36,0,0),(61,0,72,36,0,0);

/*Table structure for table `aoa_mailnumber` */

DROP TABLE IF EXISTS `aoa_mailnumber`;

CREATE TABLE `aoa_mailnumber` (
  `mail_number_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mail_account` varchar(255) NOT NULL,
  `mail_create_time` datetime DEFAULT NULL,
  `mail_des` varchar(255) DEFAULT NULL,
  `mail_type` bigint(20) DEFAULT NULL,
  `mail_user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` bigint(20) DEFAULT NULL,
  `mail_num_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`mail_number_id`),
  KEY `FKn9qg20uba4xn2k5m62jrcyc6c` (`mail_num_user_id`),
  CONSTRAINT `FKn9qg20uba4xn2k5m62jrcyc6c` FOREIGN KEY (`mail_num_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_mailnumber` */

insert  into `aoa_mailnumber`(`mail_number_id`,`mail_account`,`mail_create_time`,`mail_des`,`mail_type`,`mail_user_name`,`password`,`status`,`mail_num_user_id`) values (1,'1057245260@qq.com','2017-09-24 12:23:26',NULL,1,'宋佳','scdvszfjjfrpbeaa',1,1),(8,'ggg','2017-09-28 20:33:06','hhh',1,'llll','11111',1,2),(14,'ldq2468282708@163.com','2020-02-16 11:05:28','刘大庆的163邮箱账号',2,'罗密欧','ldq19980417',1,1);

/*Table structure for table `aoa_note_list` */

DROP TABLE IF EXISTS `aoa_note_list`;

CREATE TABLE `aoa_note_list` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(15000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `catalog_id` bigint(20) DEFAULT NULL,
  `attach_id` bigint(20) DEFAULT NULL,
  `is_collected` bigint(20) DEFAULT '0',
  `createman_id` bigint(20) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK3e1rxyyg851r231ln3ucnrg7q` (`catalog_id`),
  CONSTRAINT `FK3e1rxyyg851r231ln3ucnrg7q` FOREIGN KEY (`catalog_id`) REFERENCES `aoa_catalog` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_note_list` */

insert  into `aoa_note_list`(`note_id`,`content`,`create_time`,`status_id`,`title`,`type_id`,`catalog_id`,`attach_id`,`is_collected`,`createman_id`,`receiver`) values (1,'sdfa','2017-09-08 20:43:08',8,'hg',6,1,46,1,1,NULL),(90,'zxc','2017-09-07 19:12:07',8,'90',6,2,3,1,1,NULL),(93,'dfasf','2017-09-14 10:04:34',9,'93',6,1,3,1,1,NULL),(96,'哈哈','2017-09-15 11:01:08',8,'这张图片必须显示96',5,1,6,0,2,NULL),(101,'分享应该可以了吧','2017-09-15 20:11:23',8,'666101',7,1,10,1,2,NULL),(102,'快点老兄','2017-09-15 20:14:51',8,'666102',7,1,11,0,1,NULL),(111,'的说法','2017-09-15 23:53:04',8,'地方撒111',7,1,7,0,1,'小李父斯基'),(120,'dsaf','2017-09-18 11:04:48',8,'werq 120',5,1,9,1,1,NULL),(122,'dsaf但是','2017-09-18 11:06:24',8,'修改122',5,1,NULL,1,1,NULL),(126,'大','2017-09-23 11:43:05',8,'地方撒发生126',7,1,NULL,0,1,'soli;红之花'),(127,'dsfa','2017-09-23 12:34:05',8,'dfsa的127',5,1,NULL,1,1,NULL),(128,'sdaf','2017-09-23 12:37:21',8,'dsa128',6,1,42,1,1,NULL),(137,'第三方','2017-10-01 14:18:54',8,'大师傅137',7,1,NULL,0,1,';伊丽莎白'),(138,'发多少','2017-10-01 14:30:48',8,'分公司',7,1,NULL,0,1,'伊丽莎白'),(139,'士大夫','2017-10-01 14:31:26',8,'士大夫',6,1,NULL,1,1,NULL),(140,'士大夫','2017-10-01 14:36:19',8,'手动阀',7,1,NULL,0,1,'伊丽莎白;小李父斯基'),(143,'发多少','2017-10-01 14:57:13',8,'fdas ',7,1,NULL,1,1,';发给'),(145,'fd','2017-10-01 16:01:33',8,'fggfd',5,1,NULL,0,1,NULL),(146,'','2017-10-01 16:02:51',8,'新建发给',5,1,NULL,1,1,NULL),(149,'地方撒1222222222222222','2017-10-01 17:50:20',8,'范德萨',5,1,NULL,0,1,NULL),(150,'士大夫1111111111111','2017-10-01 17:55:31',8,'的是非得失',5,1,NULL,0,1,NULL),(151,'更丰富付付付付付付付付付付付付付付付付','2017-10-01 18:06:21',8,'华哥',5,1,NULL,0,1,NULL),(152,'22222222222222222222','2017-10-01 18:09:32',8,'地方撒',5,1,NULL,0,1,NULL),(153,'1111111111111111111111','2017-10-01 18:11:05',8,'大师',5,1,NULL,0,1,NULL),(154,'222222222222222222222','2017-10-01 18:19:10',8,'第三方',5,1,NULL,0,1,NULL),(155,'哈哈哈哈或或或或或或或或或或或或或或或或或或或或或或或发凡方法付付','2017-10-01 18:25:10',8,'过后会或或',5,1,NULL,0,1,NULL),(156,'东方时尚所说付发的大多多多多多多多','2017-10-01 18:30:08',8,' 胡歌封帝',5,1,NULL,1,1,NULL),(157,'东方时尚所所所所所所所所所','2017-10-01 18:35:07',8,'咯咯咯咯咯滚滚滚',5,1,NULL,0,1,NULL),(158,'333333333333333','2017-10-01 19:20:29',8,'第三方',5,1,NULL,0,1,NULL),(159,'2111111111111111111111111111','2017-10-01 19:38:13',8,'的说法',5,1,NULL,0,1,NULL),(160,'2222222222222222222222222','2017-10-01 19:42:55',8,'的说法',5,1,NULL,0,1,NULL),(161,'2222222222222222222222222222','2017-10-01 19:49:55',8,'大方法',5,1,NULL,0,1,NULL),(162,'43333333333333333333333333','2017-10-01 19:57:19',8,'的说法',5,1,NULL,0,1,NULL),(163,'444444444444444444444444444444444','2017-10-01 19:59:18',8,'第三方',5,1,NULL,0,1,NULL),(164,'55555555555555555555555555555555','2017-10-01 20:03:07',8,'的说法',5,1,NULL,0,1,NULL),(165,'3443242243333333333333','2017-10-01 20:05:10',8,'范德萨',5,1,NULL,1,1,NULL),(166,'22222222222222222222222222','2017-10-01 20:08:25',8,'大对方是否收费',5,1,NULL,0,1,NULL),(167,'3333333333333333333333','2017-10-01 20:17:13',8,'发生的',5,1,NULL,0,1,NULL),(168,'11111111111111111111111','2017-10-01 20:26:29',8,'地方撒',5,1,NULL,0,1,NULL),(169,'333333333333333333333','2017-10-01 20:26:58',8,'第',5,1,NULL,0,1,NULL),(170,'知道吗 这个世界 随处都有万有引力','2017-10-05 19:49:17',8,'无语的n此房',7,1,NULL,0,1,'罗密欧;甄姬'),(171,'11111111111111111111111111111111111','2017-10-05 20:19:31',8,'的说法',5,2,NULL,0,1,NULL),(172,'阿斯蒂芬三分333333333333','2017-10-05 20:23:02',8,'地方撒',5,2,NULL,0,1,NULL),(173,'(⊙o⊙)…334334','2017-10-05 20:23:27',8,'的说法',5,2,NULL,1,1,NULL),(174,'1321131314124','2017-10-05 20:25:30',8,'三大东方',7,2,NULL,0,1,'罗密欧;伊丽莎白'),(175,'213131对方是否收费 23','2017-10-05 20:27:17',8,'范德萨23',7,1,NULL,0,1,'罗密欧;伊丽莎白'),(176,'2222222222222222222222222222','2017-10-05 20:40:18',8,'听说对方',6,2,NULL,0,1,NULL),(177,'233333333333333333333333','2017-10-05 20:43:01',8,'发生的发生',7,2,NULL,0,1,'小李父斯基;soli'),(178,'2333333333333333333333333333333','2017-10-05 20:43:31',9,'地方撒发生',5,2,NULL,0,1,NULL),(179,'2333333333333333333333333333','2017-10-05 20:48:03',8,'大三',5,1,NULL,0,1,NULL),(180,'33333333333333333333333','2017-10-05 20:48:49',8,'地方',5,2,NULL,0,1,NULL),(181,'22222222222222222222222222222222','2017-10-05 20:50:57',8,'33333333333333',5,2,NULL,0,1,NULL),(182,'3333333333333333','2017-10-05 20:57:28',9,'地方撒',5,2,NULL,0,1,NULL),(183,'大师傅444444444444444444444','2017-10-05 21:01:41',8,'的说法',5,2,NULL,0,1,NULL),(184,'3333333333333333333333333333333333','2017-10-05 21:03:03',8,'ad231',5,2,NULL,0,1,NULL),(187,'44444444444444444444444444444444444444','2017-10-05 21:22:28',8,'安抚第三方',5,1,NULL,1,1,NULL),(188,'324242533333333333333333390','2017-10-05 22:48:20',8,'大三',5,1,NULL,0,1,NULL),(189,'dsafffffff555555555555555555555555','2017-10-06 11:15:14',8,'dfas ',5,33,NULL,0,1,NULL),(190,'3333333333333333333333333333333333333','2017-10-06 11:23:34',8,'sdfa ',5,33,NULL,0,1,NULL),(191,'222222222222222222222222222222222222222222222222','2017-10-06 11:29:14',8,'34242423',5,33,NULL,0,7,NULL),(192,'2323232323232323232323232323232323','2017-10-06 22:29:33',8,'发给',5,33,NULL,0,1,NULL),(193,'<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">1995年，互联网的蓬勃发展给了Oak机会。业界为了使死板、单调的静态网页能够“灵活”起来，急需一种软件技术来开发一种程序，这种程序可以通过网络传播并且能够跨平台运行。于是，世界各大</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/IT/16684878\">IT</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">企业为此纷纷投入了大量的人力、物力和财力。这个时候，Sun公司想起了那个被搁置起来很久的Oak，并且重新审视了那个用软件编写的试验平台，由于它是按照嵌入式系统硬件平台体系结构进行编写的，所以非常小，特别适用于网络上的传输系统，而Oak也是一种精简的语言，程序非常小，适合在网络上传输。Sun公司首先推出了可以嵌入网页并且可以随同网页在网络上传输的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/Applet\">Applet</a><i>（Applet是一种将小程序嵌入到网页中进行执行的技术）</i><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">，并将Oak更名为Java</span>','2017-10-06 22:32:04',8,'最终版本',7,33,81,0,1,'丹琪;于彤'),(194,'444444444444444444444444444444','2017-10-07 16:03:03',8,'有附件',5,33,64,0,1,NULL),(195,'322222222222222222222222222222222222222222222','2017-10-07 20:14:48',9,'范德萨',6,33,NULL,0,23,NULL),(196,'<a target=\"_blank\" href=\"https://baike.baidu.com/item/Java/85979\">Java</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">是一门</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1\">面向对象</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">编程语言，不仅吸收了</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/C%2B%2B\">C++</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">语言的各种优点，还摒弃了C++里难以理解的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%9A%E7%BB%A7%E6%89%BF\">多继承</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8C%87%E9%92%88\">指针</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程</span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">[1]</span><a name=\"ref_[1]_12654100\"></a>&nbsp;<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">&nbsp;。</span>','2017-10-08 16:22:44',8,'上课要义',5,33,77,0,1,NULL),(198,'<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">由于在开发Oak语言时，尚且不存在运行字节码的硬件平台，所以为了在开发时可以对这种语言进行实验研究，他们就在已有的硬件和软件平台基础上，按照自己所指定的规范，用软件建设了一个运行平台，整个系统除了比C++更加简单之外，没有什么大的区别。1992年的夏天，当Oak语言开发成功后，研究者们向硬件生产商进行演示了Green操作系统、Oak的程序设计语言、类库和其硬件，以说服他们使用Oak语言生产硬件芯片，但是，硬件生产商并未对此产生极大的热情。因为他们认为，在所有人对Oak语言还一无所知的情况下，就生产硬件产品的风险实在太大了，所以Oak语言也就因为缺乏硬件的支持而无法进入市场，从而被搁置了下来</span>','2017-10-18 15:39:45',8,'测试',5,33,NULL,0,1,NULL),(199,'<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">由于</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/C%2B%2B\">C++</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">所具有的优势，该项目组的研究人员首先考虑采用C++来编写程序。但对于</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A1%AC%E4%BB%B6\">硬件</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">资源极其匮乏的单片式系统来说，C++程序过于复杂和庞大。另外由于消费电子产品所采用的嵌入式处理器芯片的种类繁杂，如何让编写的程序</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B7%A8%E5%B9%B3%E5%8F%B0\">跨平台</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">运行也是个难题。为了解决困难，他们首先着眼于语言的开发，假设了一种结构简单、符合嵌入式应用需要的硬件平台体系结构并为其制定了相应的规范，其中就定义了这种硬件平台的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%8C%E8%BF%9B%E5%88%B6\">二进制</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">机器码指令系统</span><i>（即后来成为“</i><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AD%97%E8%8A%82%E7%A0%81\"><i>字节码</i></a><i>”的指令系统）</i><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">，以待语言开发成功后，能有</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%8A%E5%AF%BC%E4%BD%93%E8%8A%AF%E7%89%87\">半导体芯片</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">生产商开发和生产这种硬件平台。对于新语言的设计，Sun公司研发人员并没有开发一种全新的语言，而是根据嵌入式软件的要求，对C++进行了改造，去除了留在C++的一些不太实用及影响安全的成分，并结合嵌入式系统的实时性要求，开发了一种称为</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/Oak\">Oak</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E8%AF%AD%E8%A8%80\">面向对象语言</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">。</span>','2017-10-18 15:40:44',8,'讨论',7,33,NULL,0,1,'甄姬2;无双'),(201,'312111111111111111111111111111111111111111111111111111111111','2017-10-19 23:15:51',8,'1231321',5,33,NULL,0,10,NULL),(202,'<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">20世纪90年代，硬件领域出现了单片式计算机系统，这种价格低廉的系统一出现就立即引起了自动控制领域人员的注意，因为使用它可以大幅度提升消费类电子产品</span><i>（如电视机顶盒、面包烤箱、移动电话等）</i><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%99%BA%E8%83%BD%E5%8C%96\">智能化</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">程度。Sun公司为了抢占市场先机，在1991年成立了一个称为Green的项目小组，</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B8%95%E7%89%B9%E9%87%8C%E5%85%8B/4831889\">帕特里克</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%A9%B9%E5%A7%86%E6%96%AF%C2%B7%E9%AB%98%E6%96%AF%E6%9E%97\">詹姆斯·高斯林</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">、麦克·舍林丹和其他几个工程师一起组成的工作小组在</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8A%A0%E5%88%A9%E7%A6%8F%E5%B0%BC%E4%BA%9A\">加利福尼亚</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">州</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%97%A8%E6%B4%9B%E5%B8%95%E5%85%8B\">门洛帕克</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">市沙丘路的一个小工作室里面研究开发新技术，专攻计算机在家电产品上的嵌入式应用。</span>','2017-10-22 01:04:54',9,'2017某次笔记',7,33,79,0,1,'甄姬;甄姬2'),(203,'<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">毛不易，网综《</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%98%8E%E6%97%A5%E4%B9%8B%E5%AD%90/20478071\">明日之子</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">》参赛选手，参加海选状况不断，他是明日之子唯一一个刚上场就录了三次音的选手，结果刚开口就被薛之谦闻到一股酒味，原来他上场前喝了几两白酒来缓解紧张，好不容易开始唱了，刚弹吉他，弦就断了，节目组帮忙换掉，张大大说不管怎么样都会送给他一把吉他，看起来他是一个十分有趣的小男生，一首《</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A6%82%E6%9E%9C%E6%9C%89%E4%B8%80%E5%A4%A9%E6%88%91%E5%8F%98%E5%BE%97%E5%BE%88%E6%9C%89%E9%92%B1\">如果有一天我变得很有钱</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">》内容很有趣，但是其中的落寞自嘲讥讽味道被薛之谦敏锐的发现了，他觉得毛不易可以走向更大的舞台，最终毛不易成功晋级。此后《巨星》唱出生活中的无奈，和《</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A6%82%E6%9E%9C%E6%9C%89%E4%B8%80%E5%A4%A9%E6%88%91%E5%8F%98%E5%BE%97%E5%BE%88%E6%9C%89%E9%92%B1\">如果有一天我变得很有钱</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">》异曲同工。之后他独创的《消愁》《像我这样的人》歌词字字扎入人心，听哭无数深夜里迷茫的人，“你写词写到我想给你跪”薛之谦这样赞赏他，“你被生活打了多少巴掌？”杨幂这样问到，一夜之间毛不易的《消愁》《像我这样的人》置顶流行音乐榜单，然而扎心依旧不断，一曲《借》直接让华晨宇给了他满分，他不仅歌唱的 好，词写的好，作曲的旋律也很美妙，其词曲不华丽不酷炫，却深深击中黑暗中迷茫前进的心。</span>','2017-10-22 08:08:10',9,'变重要',7,33,80,0,1,'小李父斯基;甄姬'),(204,'<div>\r\n	<div>\r\n		<p>\r\n			从2014年以来，知乎就成为了我最重要的社交和资讯平台。<br />\r\n天涯几乎再没上过，微博都是地震了才会用一下。<br />\r\n《一人饮酒醉》这首歌。我就是上个月从这个问题知道的。<br />\r\n当时看了最高票的答案觉得挺有意思。<br />\r\n百度搜了一下，第一段就把我震地关了浏览器，太炸耳朵了。<br />\r\n转身就回来把写的不错嘲讽的答案都点了个赞。\r\n		</p>\r\n		<p>\r\n			两天以后，我反思了一下，这样好像不太好。<br />\r\n我记得自己在30岁生日的时候警醒过自己，万事不可太狭隘。<br />\r\n你不应该强烈排斥尚未真正了解的东西。<br />\r\n于是我去下了个直播软件。\r\n		</p>\r\n		<p>\r\n			我出身知识分子家庭，受过高等教育，从事传统行业，衣食无忧生活稳定。<br />\r\n说实话，我挺保守甚至有些落后。<br />\r\n天天看网上说直播怎么赚钱了，快手怎么样了，我都从来没了解过。\r\n		</p>\r\n	</div>\r\n<br />\r\n作者：柯阿卡<br />\r\n链接：https://www.zhihu.com/question/38130123/answer/131454481<br />\r\n来源：知乎<br />\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\r\n</div>','2017-10-22 08:14:15',8,'一人饮酒',7,33,NULL,0,1,'伊丽莎白;小李父斯基'),(205,'<div>\r\n	<div>\r\n		<p>\r\n			下了直播软件我都不知道怎么玩，就在推荐的热门里面一个个点开看。纯粹好奇。<br />\r\n主播小姑娘绝大多数都很漂亮，小伙子也各有风采。<br />\r\n有的真的美丽俊朗到我想不通。\r\n		</p>\r\n		<p>\r\n			直播间里放烟花一样的撒礼物，哗啦哗啦的，浓妆艳抹的小姑娘不停的谢谢哥谢谢哥谢谢哥。<br />\r\n然后那些“哥”就继续哗啦哗啦的撒礼物。<br />\r\n一个比我胖3圈的胖妹直播吃火锅粉，全程无话，就呼哧呼哧的吃。收了2000金币……<br />\r\n简直颠覆我的认知。天上掉钱是不是就这个意思？\r\n		</p>\r\n		<p>\r\n			就在我准备关掉软件直接卸载的时候，鬼使神差看到了一个小伙子，戴着个大墨镜的头像，写着满满的“喊麦”两个字。<br />\r\n巧了，进去看看你吧。\r\n		</p>\r\n	</div>\r\n<br />\r\n作者：柯阿卡<br />\r\n链接：https://www.zhihu.com/question/38130123/answer/131454481<br />\r\n来源：知乎<br />\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\r\n</div>','2017-10-22 09:12:41',8,'今日笔记',5,33,78,0,1,NULL),(206,'<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">1998年12月8日，第二代Java平台的企业版J2EE发布。1999年6月，Sun公司发布了第二代Java平台（简称为Java2）的3个版本：</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/J2ME\">J2ME</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">（Java2 Micro Edition，Java2平台的微型版），应用于移动、无线及有限资源的环境；</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/J2SE\">J2SE</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">（Java 2 Standard Edition，Java 2平台的标准版），应用于桌面环境；</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/J2EE\">J2EE</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">（Java 2Enterprise Edition，Java 2平台的企业版），应用于基于Java的应用服务器。Java 2平台的发布，是Java发展过程中最重要的一个里程碑，标志着Java的应用开始普及。</span>','2017-10-22 11:28:16',9,'论讲究',7,32,82,0,1,NULL),(207,'<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">2000年5月，JDK1.3、JDK1.4和J2SE1.3相继发布，几周后其获得了</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/Apple/3860362\">Apple</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">公司Mac OS X的工业标准的支持。2001年9月24日，J2EE1.3发布。2002年2月26日，J2SE1.4发布。自此Java的计算能力有了大幅提升，与J2SE1.3相比，其多了近62%的类和接口。在这些新特性当中，还提供了广泛的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/XML\">XML</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">支持、安全套接字</span><i>（Socket）</i><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">支持</span><i>（通过SSL与TLS协议）</i><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">、全新的I/OAPI、正则表达式、日志与断言。2004年9月30日，J2SE1.5发布，成为Java语言发展史上的又一里程碑。为了表示该版本的重要性，J2SE 1.5更名为Java SE 5.0</span><i>（内部版本号1.5.0）</i><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">，代号为“Tiger”，Tiger包含了从1996年发布1.0版本以来的最重大的更新，其中包括泛型支持、基本类型的自动装箱、改进的循环、枚举类型、格式化I/O及可变参数。</span>','2017-10-22 11:33:02',8,'我的',5,2,NULL,0,1,NULL),(208,'<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2005年6月，在Java One大会上，Sun公司发布了Java SE 6。此时，Java的各种版本已经更名，已取消其中的数字2，如J2EE更名为<a target=\"_blank\" href=\"https://baike.baidu.com/item/JavaEE\">JavaEE</a>，J2SE更名为JavaSE，J2ME更名为<a target=\"_blank\" href=\"https://baike.baidu.com/item/JavaME\">JavaME</a>。<span style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;\">[8]</span><a name=\"ref_[8]_12654100\"></a>&nbsp;\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2006年11月13日，Java技术的发明者Sun公司宣布，将Java技术作为免费软件对外发布。Sun公司正式发布的有关Java平台标准版的第一批源代码，以及Java迷你版的可执行源代码。从2007年3月起，全世界所有的开发人员均可对Java源代码进行修改<span style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;\">[9]</span><a name=\"ref_[9]_12654100\"></a>&nbsp;&nbsp;。\r\n</div>','2017-10-22 11:34:15',8,'编程',5,33,NULL,0,1,NULL),(209,'<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">2009年，甲骨文公司宣布收购Sun</span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">[10]</span><a name=\"ref_[10]_12654100\"></a>&nbsp;<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">&nbsp;。2010年，Java编程语言的共同创始人之一詹姆斯·高斯林从Oracle公司辞职。2011年，甲骨文公司举行了全球性的活动，以庆祝Java7的推出，随后Java7正式发布。2014年，甲骨文公司发布了Java8正式版</span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">[11]</span><a name=\"ref_[11]_12654100\"></a>&nbsp;<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">&nbsp;。</span>','2017-10-22 11:38:37',8,'已经建立了',5,33,NULL,0,1,NULL);

/*Table structure for table `aoa_notepaper` */

DROP TABLE IF EXISTS `aoa_notepaper`;

CREATE TABLE `aoa_notepaper` (
  `notepaper_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concent` text,
  `create_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `notepaper_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notepaper_id`),
  KEY `FKsavcqw29haox5bu7y90it8jb7` (`notepaper_user_id`),
  CONSTRAINT `FKsavcqw29haox5bu7y90it8jb7` FOREIGN KEY (`notepaper_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_notepaper` */

insert  into `aoa_notepaper`(`notepaper_id`,`concent`,`create_time`,`title`,`notepaper_user_id`) values (3,'咯咯咯咯咯','2017-09-21 22:46:21','点点滴滴',NULL),(31,'范德萨','2017-10-18 18:50:07','无标题',18),(32,'我要发大财','2020-03-18 14:21:00','努力，奋斗，啊啊啊',36),(33,'一点都不好玩','2020-03-18 14:21:28','该死的OA办公系统',36),(34,'嘻嘻嘻嘻嘻','2020-03-18 14:22:03','哈哈哈哈',36),(35,'我很牛逼哈哈哈','2020-03-18 15:04:44','今天也是愉快的一天呢',1),(36,'奥里给','2020-03-18 15:04:58','我的妈耶',1),(37,'奥里给干了兄弟们','2020-03-18 15:05:20','老八秘制汉堡',1);

/*Table structure for table `aoa_notice_list` */

DROP TABLE IF EXISTS `aoa_notice_list`;

CREATE TABLE `aoa_notice_list` (
  `notice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `is_top` int(11) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `notice_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_share` int(11) DEFAULT NULL COMMENT '是否全部人可见',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_notice_list` */

insert  into `aoa_notice_list`(`notice_id`,`content`,`is_top`,`modify_time`,`notice_time`,`status_id`,`title`,`type_id`,`url`,`user_id`,`is_share`) values (72,'新消息',0,'2020-04-15 08:03:37','2020-04-15 08:03:37',14,'公司公告1',10,'',1,1),(73,'新消息',0,'2020-04-15 08:03:49','2020-04-15 08:03:49',14,'公司公告2',10,'',1,1),(74,'新消息',0,'2020-04-15 08:03:56','2020-04-15 08:03:56',14,'公司公告3',10,'',1,1),(75,'最新消息',0,'2020-04-15 08:04:07','2020-04-15 08:04:07',14,'公司公告4',10,'',1,1),(76,'新消息',0,'2020-04-15 08:04:15','2020-04-15 08:04:15',14,'公司公告5',10,'',1,1),(77,'新消息',0,'2020-04-15 08:04:23','2020-04-15 08:04:23',14,'公司公告6',10,'',1,1),(78,'新消息',0,'2020-04-15 08:04:32','2020-04-15 08:04:32',14,'公司公告7',10,'',1,1),(79,'新消息',0,'2020-04-15 08:04:44','2020-04-15 08:04:44',14,'公司公告8',10,'',1,1),(80,'新消息',0,'2020-04-15 08:05:13','2020-04-15 08:05:13',14,'公司公告9',10,'',1,1),(81,'新消息',0,'2020-04-15 08:05:27','2020-04-15 08:05:27',14,'公司公告10',10,'',1,1),(82,'新消息',0,'2020-04-15 08:05:38','2020-04-15 08:05:38',14,'公司公告11',10,'',1,1),(84,'新消息',0,'2020-04-15 08:07:20','2020-04-15 08:07:20',14,'部门公告2',10,'',1,0),(85,'新消息',0,'2020-04-15 08:07:31','2020-04-15 08:07:31',14,'部门公告3',10,'',1,0),(86,'新消息',0,'2020-04-15 08:08:29','2020-04-15 08:08:29',14,'部门公告4',10,'',1,0);

/*Table structure for table `aoa_notice_user_relation` */

DROP TABLE IF EXISTS `aoa_notice_user_relation`;

CREATE TABLE `aoa_notice_user_relation` (
  `relatin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_read` int(11) DEFAULT NULL,
  `relatin_notice_id` bigint(20) DEFAULT NULL,
  `relatin_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`relatin_id`),
  KEY `FKhxq8glkpb5qi1smn5gu142rky` (`relatin_notice_id`),
  KEY `FK52evvby6j47j24624ydi0o221` (`relatin_user_id`),
  CONSTRAINT `FK52evvby6j47j24624ydi0o221` FOREIGN KEY (`relatin_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKhxq8glkpb5qi1smn5gu142rky` FOREIGN KEY (`relatin_notice_id`) REFERENCES `aoa_notice_list` (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=699 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_notice_user_relation` */

insert  into `aoa_notice_user_relation`(`relatin_id`,`is_read`,`relatin_notice_id`,`relatin_user_id`) values (274,1,72,1),(275,0,72,2),(276,0,72,3),(277,1,72,4),(278,0,72,5),(279,0,72,6),(280,0,72,7),(281,0,72,8),(282,0,72,9),(283,0,72,10),(284,0,72,11),(285,0,72,12),(286,0,72,13),(287,0,72,14),(288,0,72,15),(289,0,72,16),(290,0,72,17),(291,0,72,18),(292,0,72,19),(293,0,72,20),(294,0,72,21),(295,0,72,22),(296,0,72,23),(297,0,72,24),(298,0,72,25),(299,0,72,26),(300,0,72,27),(301,0,72,28),(302,0,72,35),(303,0,72,36),(304,1,73,1),(305,0,73,2),(306,0,73,3),(307,0,73,4),(308,0,73,5),(309,0,73,6),(310,0,73,7),(311,0,73,8),(312,0,73,9),(313,0,73,10),(314,0,73,11),(315,0,73,12),(316,0,73,13),(317,0,73,14),(318,0,73,15),(319,0,73,16),(320,0,73,17),(321,0,73,18),(322,0,73,19),(323,0,73,20),(324,0,73,21),(325,0,73,22),(326,0,73,23),(327,0,73,24),(328,0,73,25),(329,0,73,26),(330,0,73,27),(331,0,73,28),(332,0,73,35),(333,0,73,36),(334,1,74,1),(335,0,74,2),(336,0,74,3),(337,0,74,4),(338,0,74,5),(339,0,74,6),(340,0,74,7),(341,0,74,8),(342,0,74,9),(343,0,74,10),(344,0,74,11),(345,0,74,12),(346,0,74,13),(347,0,74,14),(348,0,74,15),(349,0,74,16),(350,0,74,17),(351,0,74,18),(352,0,74,19),(353,0,74,20),(354,0,74,21),(355,0,74,22),(356,0,74,23),(357,0,74,24),(358,0,74,25),(359,0,74,26),(360,0,74,27),(361,0,74,28),(362,0,74,35),(363,0,74,36),(364,1,75,1),(365,0,75,2),(366,0,75,3),(367,0,75,4),(368,0,75,5),(369,0,75,6),(370,0,75,7),(371,0,75,8),(372,0,75,9),(373,0,75,10),(374,0,75,11),(375,0,75,12),(376,0,75,13),(377,0,75,14),(378,0,75,15),(379,0,75,16),(380,0,75,17),(381,0,75,18),(382,0,75,19),(383,0,75,20),(384,0,75,21),(385,0,75,22),(386,0,75,23),(387,0,75,24),(388,0,75,25),(389,0,75,26),(390,0,75,27),(391,0,75,28),(392,0,75,35),(393,0,75,36),(394,1,76,1),(395,0,76,2),(396,0,76,3),(397,0,76,4),(398,0,76,5),(399,0,76,6),(400,0,76,7),(401,0,76,8),(402,0,76,9),(403,0,76,10),(404,0,76,11),(405,0,76,12),(406,0,76,13),(407,0,76,14),(408,0,76,15),(409,0,76,16),(410,0,76,17),(411,0,76,18),(412,0,76,19),(413,0,76,20),(414,0,76,21),(415,0,76,22),(416,0,76,23),(417,0,76,24),(418,0,76,25),(419,0,76,26),(420,0,76,27),(421,0,76,28),(422,0,76,35),(423,0,76,36),(424,1,77,1),(425,0,77,2),(426,0,77,3),(427,0,77,4),(428,0,77,5),(429,0,77,6),(430,0,77,7),(431,0,77,8),(432,0,77,9),(433,0,77,10),(434,0,77,11),(435,0,77,12),(436,0,77,13),(437,0,77,14),(438,0,77,15),(439,0,77,16),(440,0,77,17),(441,0,77,18),(442,0,77,19),(443,0,77,20),(444,0,77,21),(445,0,77,22),(446,0,77,23),(447,0,77,24),(448,0,77,25),(449,0,77,26),(450,0,77,27),(451,0,77,28),(452,0,77,35),(453,0,77,36),(454,1,78,1),(455,0,78,2),(456,0,78,3),(457,0,78,4),(458,0,78,5),(459,0,78,6),(460,0,78,7),(461,0,78,8),(462,0,78,9),(463,0,78,10),(464,0,78,11),(465,0,78,12),(466,0,78,13),(467,0,78,14),(468,0,78,15),(469,0,78,16),(470,0,78,17),(471,0,78,18),(472,0,78,19),(473,0,78,20),(474,0,78,21),(475,0,78,22),(476,0,78,23),(477,0,78,24),(478,0,78,25),(479,0,78,26),(480,0,78,27),(481,0,78,28),(482,0,78,35),(483,0,78,36),(484,1,79,1),(485,0,79,2),(486,0,79,3),(487,0,79,4),(488,0,79,5),(489,0,79,6),(490,0,79,7),(491,0,79,8),(492,0,79,9),(493,0,79,10),(494,0,79,11),(495,0,79,12),(496,0,79,13),(497,0,79,14),(498,0,79,15),(499,0,79,16),(500,0,79,17),(501,0,79,18),(502,0,79,19),(503,0,79,20),(504,0,79,21),(505,0,79,22),(506,0,79,23),(507,0,79,24),(508,0,79,25),(509,0,79,26),(510,0,79,27),(511,0,79,28),(512,0,79,35),(513,0,79,36),(514,1,80,1),(515,0,80,2),(516,0,80,3),(517,0,80,4),(518,0,80,5),(519,0,80,6),(520,0,80,7),(521,0,80,8),(522,0,80,9),(523,0,80,10),(524,0,80,11),(525,0,80,12),(526,0,80,13),(527,0,80,14),(528,0,80,15),(529,0,80,16),(530,0,80,17),(531,0,80,18),(532,0,80,19),(533,0,80,20),(534,0,80,21),(535,0,80,22),(536,0,80,23),(537,0,80,24),(538,0,80,25),(539,0,80,26),(540,0,80,27),(541,0,80,28),(542,0,80,35),(543,1,80,36),(544,1,81,1),(545,0,81,2),(546,0,81,3),(547,0,81,4),(548,0,81,5),(549,0,81,6),(550,0,81,7),(551,0,81,8),(552,0,81,9),(553,0,81,10),(554,0,81,11),(555,0,81,12),(556,0,81,13),(557,0,81,14),(558,0,81,15),(559,0,81,16),(560,0,81,17),(561,0,81,18),(562,0,81,19),(563,0,81,20),(564,0,81,21),(565,0,81,22),(566,0,81,23),(567,0,81,24),(568,0,81,25),(569,0,81,26),(570,0,81,27),(571,0,81,28),(572,0,81,35),(573,1,81,36),(574,1,82,1),(575,0,82,2),(576,0,82,3),(577,0,82,4),(578,0,82,5),(579,0,82,6),(580,0,82,7),(581,0,82,8),(582,0,82,9),(583,0,82,10),(584,0,82,11),(585,0,82,12),(586,0,82,13),(587,0,82,14),(588,0,82,15),(589,0,82,16),(590,0,82,17),(591,0,82,18),(592,0,82,19),(593,0,82,20),(594,0,82,21),(595,0,82,22),(596,0,82,23),(597,0,82,24),(598,0,82,25),(599,0,82,26),(600,0,82,27),(601,0,82,28),(602,0,82,35),(603,1,82,36),(635,0,84,2),(636,0,84,3),(637,0,84,35),(638,1,84,36),(639,1,85,1),(640,0,85,2),(641,0,85,3),(642,0,85,4),(643,0,85,5),(644,0,85,6),(645,0,85,7),(646,0,85,8),(647,0,85,9),(648,0,85,10),(649,0,85,11),(650,0,85,12),(651,0,85,13),(652,0,85,14),(653,0,85,15),(654,0,85,16),(655,0,85,17),(656,0,85,18),(657,0,85,19),(658,0,85,20),(659,0,85,21),(660,0,85,22),(661,0,85,23),(662,0,85,24),(663,0,85,25),(664,0,85,26),(665,0,85,27),(666,0,85,28),(667,0,85,35),(668,1,85,36),(669,1,86,1),(670,0,86,2),(671,0,86,3),(672,0,86,4),(673,0,86,5),(674,0,86,6),(675,0,86,7),(676,0,86,8),(677,0,86,9),(678,0,86,10),(679,0,86,11),(680,0,86,12),(681,0,86,13),(682,0,86,14),(683,0,86,15),(684,0,86,16),(685,0,86,17),(686,0,86,18),(687,0,86,19),(688,0,86,20),(689,0,86,21),(690,0,86,22),(691,0,86,23),(692,0,86,24),(693,0,86,25),(694,0,86,26),(695,0,86,27),(696,0,86,28),(697,0,86,35),(698,1,86,36);

/*Table structure for table `aoa_overtime` */

DROP TABLE IF EXISTS `aoa_overtime`;

CREATE TABLE `aoa_overtime` (
  `overtime_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`overtime_id`),
  KEY `FK5o36fvdsrrhvr9q4dvffxkuoc` (`pro_id`),
  CONSTRAINT `FK5o36fvdsrrhvr9q4dvffxkuoc` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_overtime` */

/*Table structure for table `aoa_plan_list` */

DROP TABLE IF EXISTS `aoa_plan_list`;

CREATE TABLE `aoa_plan_list` (
  `plan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `plan_comment` varchar(5000) DEFAULT '',
  `plan_content` varchar(10000) DEFAULT NULL,
  `plan_summary` varchar(800) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `plan_user_id` bigint(20) DEFAULT NULL,
  `attach_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`plan_id`,`start_time`),
  KEY `FKsqqfaj3e7rdl3jalr2sm0y4ln` (`plan_user_id`),
  CONSTRAINT `FKsqqfaj3e7rdl3jalr2sm0y4ln` FOREIGN KEY (`plan_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_plan_list` */

insert  into `aoa_plan_list`(`plan_id`,`create_time`,`end_time`,`label`,`plan_comment`,`plan_content`,`plan_summary`,`start_time`,`status_id`,`title`,`type_id`,`plan_user_id`,`attach_id`) values (1,'2017-08-04 20:29:27','2017-09-27 20:37:29','无语','dsadsa','sadadfa1的说法3222222222222','','2017-09-22 20:37:29',17,'sadadfadsfds1',13,1,9),(3,'2017-09-26 20:37:46','2017-09-09 16:59:49','','发大水saddsf dsf dsfafdds ','sadadfad2','nice','2017-09-23 16:59:49',18,'sadadfadsfds3',13,1,47),(5,'2017-10-07 20:46:42','2017-09-07 20:37:29','','','sadadfad3','','2017-09-22 20:37:29',18,'sadadfadsfds5',13,5,NULL),(6,'2017-09-28 20:48:43','2017-08-04 20:37:29','','sdfafdsadsf22233dfaf111','sadadfads4','','2017-09-22 20:37:29',18,'sadadfadsfds6',13,5,NULL),(7,'2017-09-22 20:58:41','2017-09-23 20:37:29','','fdasdsfdfsd','sadadfad5','','2017-09-22 20:37:29',18,'sadadfadsfds7',13,2,NULL),(11,'2017-09-30 18:27:42','2017-10-01 18:27:29','','sa','dsafdfsafssdadsdsadfsadsaf','','2017-09-30 18:27:29',17,'adsfsaf的',13,3,NULL),(12,'2017-09-30 19:44:37','2017-10-07 19:44:34','','','asddddddddffffffffffffffffffffffffffffffffffffffffffffffffff','','2017-09-30 19:44:34',17,'dasfasfdsa',14,1,NULL),(13,'2017-09-30 20:13:50','2017-10-01 20:13:43','','','sadffdsadafsadffdsadafsadffdsadafsadffdsadaf','','2017-09-30 20:13:43',17,'sadffdsadaf',13,1,NULL),(14,'2017-09-30 20:14:00','2017-10-01 20:13:53','','','sadffdsadafsadffdsadafsadffdsadafsadffdsadaf','','2017-09-30 20:13:53',17,'sadffdsadaf',13,1,NULL),(18,'2017-09-30 20:14:36','2017-10-01 20:14:30','','','sadffdsadafsadffdsadafsadffdsadaf','','2017-09-30 20:14:30',17,'sadffdsadaf',13,1,NULL),(20,'2017-09-30 20:14:51','2017-10-01 20:14:47','','hah ','sadffdsadafsadffdsadafsadffdsadaf','','2017-09-30 20:14:47',17,'sadffdsadaf',13,1,NULL),(21,'2017-10-01 20:12:31','2017-10-02 20:12:22','','','2222222222222222222222222222222222222222','','2017-10-01 20:12:22',17,'创造性',13,1,NULL),(24,'2017-10-09 14:17:25','2017-10-10 14:17:13','dsf','sd','33333333333333333333333333333333333333333333333','33333333333333333333333333333333333333333333333','2017-10-09 14:17:13',17,'sdf ',13,2,NULL),(25,'2017-10-09 14:53:50','2017-10-10 14:53:33','dsfad','dsafdsffdsfds哈哈的说法但是哈哈','3333333333333333333333333333324','ewwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww','2017-10-09 14:53:33',18,'dsfdf',14,2,NULL),(27,'2017-10-18 15:46:49','2017-10-19 15:46:27','',NULL,'321444444444444444444444444444444444444444444','','2017-10-18 15:46:27',17,'地方',13,1,NULL),(29,'2017-10-18 16:13:02','2017-10-19 16:12:22','哈哈',NULL,'带你去看海带你去看海带你去看海带你去看海','','2017-10-18 16:12:22',18,'带你去看海',13,1,71),(32,'2017-10-18 16:23:34','2017-10-25 16:23:16','','感觉啥都没有干 库','无语的n此房无语的n此房无语的n此房无语的n此房无语的n此房','','2017-10-18 16:23:16',17,'无语的n此房',14,3,NULL),(33,'2017-10-18 16:23:58','2017-11-18 16:23:43','',NULL,'我也很无奈我也很无奈我也很无奈我也很无奈我也很无奈我也很无奈','','2017-10-18 16:23:43',17,'我也很无奈',15,3,NULL),(34,'2017-10-18 16:31:41','2017-10-19 16:31:25','','666','也无语是吧也无语是吧也无语是吧也无语是吧也无语是吧也无语是吧','','2017-10-18 16:31:25',17,'也无语是吧',15,3,NULL),(36,'2017-10-20 10:22:31','2017-10-27 10:21:44','在人间彷徨',NULL,'三月春花三月春花三月春花三月春花三月春花三月春花','','2017-10-20 10:21:44',18,'三月春花',14,5,NULL),(37,'2017-10-20 10:23:09','2017-10-21 10:22:37','远方有情',NULL,'轻轻唱轻轻唱轻轻唱轻轻唱轻轻唱轻轻唱轻轻唱轻轻唱轻轻唱','','2017-10-20 10:22:37',17,'轻轻唱',13,5,NULL),(38,'2017-10-20 10:23:49','2017-11-20 10:23:18','泪已拆两行',NULL,'雨打死了眼眶雨打死了眼眶雨打死了眼眶雨打死了眼眶雨打死了眼眶雨打死了眼眶','','2017-10-20 10:23:18',18,'雨打死了眼眶',15,5,NULL),(39,'2017-10-20 10:24:39','2017-10-27 10:23:54','轻轻唱',NULL,'折菊寄到你身旁折菊寄到你身旁折菊寄到你身旁折菊寄到你身旁折菊寄到你身旁折菊寄到你身旁','','2017-10-20 10:23:54',18,'折菊寄到你身旁',14,5,NULL),(40,'2017-10-20 10:25:58','2017-10-21 10:24:44','谁一颦一笑摇曳了星云',NULL,'多年不减你深情多年不减你深情多年不减你深情多年不减你深情多年不减你深情','','2017-10-20 10:24:44',17,'多年不减你深情',13,5,NULL),(41,'2017-10-20 10:29:20','2017-10-27 10:26:14','和落下的老爷爷一样','小伙子可以啊','又是一个安静的晚上又是一个安静的晚上又是一个安静的晚上又是一个安静的晚上又是一个安静的晚上又是一个安静的晚上','','2017-10-20 10:26:14',18,'又是一个安静的晚上',14,5,NULL),(42,'2017-10-20 10:30:13','2017-11-20 10:29:29','素面朝天要多纯洁有多纯洁',NULL,'我做我的改成又何必纠结我做我的改成又何必纠结我做我的改成又何必纠结我做我的改成又何必纠结我做我的改成又何必纠结','','2017-10-20 10:29:29',17,'我做我的改成又何必纠结',15,5,NULL),(43,'2017-10-20 10:32:37','2017-10-21 10:32:14','',NULL,'曾经对上的瞬间曾经对上的瞬间曾经对上的瞬间曾经对上的瞬间曾经对上的瞬间曾经对上的瞬间','','2017-10-20 10:32:14',17,'曾经对上的瞬间',13,4,NULL),(44,'2017-10-20 10:34:10','2017-10-27 10:32:45','',NULL,'瘦马未得好歌瘦马未得好歌瘦马未得好歌瘦马未得好歌瘦马未得好歌瘦马未得好歌','','2017-10-20 10:32:45',17,'瘦马未得好歌',14,4,NULL),(45,'2017-10-20 10:34:28','2017-10-27 10:34:15','',NULL,'千百度千百度千百度千百度千百度千百度千百度千百度千百度千百度千百度千百度','','2017-10-20 10:34:15',18,'千百度',14,4,NULL),(46,'2017-10-20 10:35:00','2017-11-20 10:34:36','',NULL,'课你却不在灯火阑珊处课你却不在灯火阑珊处课你却不在灯火阑珊处课你却不在灯火阑珊处课你却不在灯火阑珊处课你却不在灯火阑珊处','','2017-10-20 10:34:36',17,'课你却不在灯火阑珊处',15,4,74),(47,'2017-10-20 10:36:07','2017-10-21 10:35:23','',NULL,'日出到迟暮日出到迟暮日出到迟暮日出到迟暮日出到迟暮日出到迟暮日出到迟暮日出到迟暮日出到迟暮','','2017-10-20 10:35:23',17,'日出到迟暮',13,4,75),(48,'2017-10-20 10:36:33','2017-10-21 10:36:18','','df','灯火阑珊处灯火阑珊处灯火阑珊处灯火阑珊处灯火阑珊处灯火阑珊处灯火阑珊处灯火阑珊处灯火阑珊处','','2017-10-20 10:36:18',17,'灯火阑珊处',13,4,NULL),(49,'2017-10-20 10:37:59','2017-10-21 10:37:16','',NULL,'为你解冻冰河为你解冻冰河为你解冻冰河为你解冻冰河为你解冻冰河为你解冻冰河为你解冻冰河','','2017-10-20 10:37:16',17,'如果有时不那么开心',13,7,NULL),(50,'2017-10-20 10:38:23','2017-10-27 10:38:04','',NULL,'为你辗转反侧为你辗转反侧为你辗转反侧为你辗转反侧为你辗转反侧为你辗转反侧为你辗转反侧','','2017-10-20 10:38:04',17,'为你辗转反侧',14,7,NULL),(51,'2017-10-20 10:38:52','2017-10-21 10:38:27','',NULL,'天空好像下雨天空好像下雨天空好像下雨天空好像下雨天空好像下雨天空好像下雨天空好像下雨','','2017-10-20 10:38:27',17,'天空好像下雨',13,7,NULL),(52,'2017-10-20 10:39:16','2017-10-27 10:38:58','',NULL,'亲手买冰激凌亲手买冰激凌亲手买冰激凌亲手买冰激凌亲手买冰激凌亲手买冰激凌','','2017-10-20 10:38:58',17,'亲手买冰激凌',14,7,NULL),(53,'2017-10-20 10:39:41','2017-10-21 10:39:20','',NULL,'为你做一只铺货的飞蛾为你做一只铺货的飞蛾为你做一只铺货的飞蛾为你做一只铺货的飞蛾为你做一只铺货的飞蛾为你做一只铺货的飞蛾','','2017-10-20 10:39:20',18,'为你做一只铺货的飞蛾',13,7,NULL),(54,'2017-10-20 10:40:03','2017-10-27 10:39:48','',NULL,'啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦','','2017-10-20 10:39:48',19,'啦啦啦啦',14,7,76),(55,'2017-10-22 10:32:33','2017-10-23 10:29:49','这次计划','这个计划 nice','1996年1月，Sun公司发布了Java的第一个开发工具包（JDK 1.0），这是Java发展历程中的重要里程碑，标志着Java成为一种独立的开发工具。9月，约8.3万个网页应用了Java技术来制作。10月，Sun公司发布了Java平台的第一个即时（JIT）编译器。\r\n1997年2月，JDK 1.1面世，在随后的3周时间里，达到了22万次的下载量。4月2日，Java One会议召开，参会者逾一万人，创当时全球同类会议规模之纪录。9月，Java Developer Connection社区成员超过10万。','Java One会议召开，参会者逾一万人，创当时全球同类会议规模之纪录。9月，Java Developer Connection社区成员超过10万。','2017-10-22 10:29:49',19,'周计划',14,7,NULL),(56,'2020-03-04 20:59:22','2020-03-05 20:57:57','工作计划',NULL,'今日完成页面美化和其他功能的完善哈哈哈真棒的','66666666666666666666666666666666666666666完美nace','2020-03-04 20:57:57',18,'今日计划完成页面美化',13,36,NULL),(57,'2020-03-19 10:22:06','2020-03-20 00:00:00','重要',NULL,'完成计划管理模块，还有完成论文至少20页','','2020-03-19 00:00:00',17,'3/19的计划',13,36,NULL);

/*Table structure for table `aoa_position` */

DROP TABLE IF EXISTS `aoa_position`;

CREATE TABLE `aoa_position` (
  `position_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `describtion` varchar(255) DEFAULT NULL,
  `deptid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_position` */

insert  into `aoa_position`(`position_id`,`level`,`name`,`describtion`,`deptid`) values (1,1,'主管','管理系统最高权限',1),(2,2,'副主管','权限仅次于超级管理员',1),(3,3,'总经理','总经理',1),(4,4,'研发部经理',NULL,2),(5,5,'财务部经理',NULL,3),(6,6,'市场部经理',NULL,4),(7,7,'人事部经理',NULL,5),(8,8,'人事专员',NULL,5),(9,9,'劳资专员',NULL,5),(10,10,'程序员',NULL,2),(11,11,'初级工程师',NULL,2),(12,12,'中级工程师',NULL,2),(13,13,'高级工程师',NULL,2),(14,14,'系统架构师',NULL,2),(15,15,'需求分析师',NULL,2),(16,16,'调查专员',NULL,4),(17,17,'企业推广员',NULL,4),(18,18,'平面设计师',NULL,4),(19,19,'培训专员',NULL,4),(20,20,'市场督导员',NULL,4),(21,21,'核算会计',NULL,3),(22,22,'税务会计',NULL,3),(23,23,'出纳员',NULL,3),(25,2222,'测试岗位！~','emmm！~~',NULL),(26,24,'普通员工','默认职位',5),(27,NULL,'后勤','后勤打杂',1);

/*Table structure for table `aoa_process_list` */

DROP TABLE IF EXISTS `aoa_process_list`;

CREATE TABLE `aoa_process_list` (
  `process_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` datetime DEFAULT NULL,
  `deeply_id` bigint(20) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `process_des` text,
  `process_name` varchar(255) DEFAULT NULL,
  `procsee_days` int(11) DEFAULT NULL,
  `is_checked` int(10) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `pro_file_id` bigint(20) DEFAULT NULL,
  `process_user_id` bigint(20) DEFAULT NULL,
  `shenuser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`process_id`),
  KEY `FKiltoi9iw3vjixl6u4cd60fi1p` (`pro_file_id`),
  KEY `FKhtdg4du5ryotah5v1dgyjfh2t` (`process_user_id`),
  CONSTRAINT `FKhtdg4du5ryotah5v1dgyjfh2t` FOREIGN KEY (`process_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKiltoi9iw3vjixl6u4cd60fi1p` FOREIGN KEY (`pro_file_id`) REFERENCES `aoa_attachment_list` (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_process_list` */

/*Table structure for table `aoa_receiver_note` */

DROP TABLE IF EXISTS `aoa_receiver_note`;

CREATE TABLE `aoa_receiver_note` (
  `note_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `id` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK904cmor3q468pj3ft6mdrnqwk` (`user_id`),
  KEY `FKcx7spjjefkofw62v8yxmgjxao` (`note_id`),
  CONSTRAINT `FK904cmor3q468pj3ft6mdrnqwk` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKcx7spjjefkofw62v8yxmgjxao` FOREIGN KEY (`note_id`) REFERENCES `aoa_note_list` (`note_id`),
  CONSTRAINT `FK_NOTE_LIST` FOREIGN KEY (`note_id`) REFERENCES `aoa_note_list` (`note_id`),
  CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_receiver_note` */

insert  into `aoa_receiver_note`(`note_id`,`user_id`,`id`) values (128,1,19),(122,1,22),(127,1,24),(120,1,25),(137,3,42),(126,6,43),(126,5,44),(111,4,45),(138,3,46),(139,1,47),(140,4,48),(140,3,49),(1,1,57),(143,1,59),(145,1,61),(146,1,63),(149,1,66),(150,1,67),(151,1,68),(152,1,69),(153,1,70),(154,1,71),(155,1,72),(156,1,73),(157,1,74),(158,1,75),(159,1,76),(160,1,77),(161,1,78),(162,1,79),(163,1,80),(164,1,81),(165,1,82),(166,1,83),(167,1,84),(168,1,85),(169,1,87),(170,7,117),(171,1,118),(172,1,119),(173,1,120),(174,1,121),(174,3,122),(175,1,123),(175,3,124),(176,1,125),(177,1,126),(177,4,127),(177,5,128),(178,1,129),(179,1,130),(180,1,131),(181,1,132),(182,1,133),(183,1,134),(184,1,135),(187,1,142),(189,1,144),(190,1,145),(191,7,146),(192,1,147),(194,1,151),(195,23,152),(188,1,155),(201,10,162),(204,4,170),(204,3,171),(204,1,172),(205,1,174),(196,1,175),(203,4,193),(203,7,194),(203,1,195),(199,10,199),(199,1,200),(199,8,201),(198,1,202),(193,12,218),(193,13,219),(193,1,220),(202,1,221),(202,7,222),(202,8,223);

/*Table structure for table `aoa_regular` */

DROP TABLE IF EXISTS `aoa_regular`;

CREATE TABLE `aoa_regular` (
  `regular_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `deficiency` varchar(255) DEFAULT NULL,
  `dobetter` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  `pullulate` varchar(255) DEFAULT NULL,
  `understand` varchar(255) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`regular_id`),
  KEY `FK96uphskhww1otsi3fe916dfor` (`pro_id`),
  CONSTRAINT `FK96uphskhww1otsi3fe916dfor` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_regular` */

/*Table structure for table `aoa_reply_list` */

DROP TABLE IF EXISTS `aoa_reply_list`;

CREATE TABLE `aoa_reply_list` (
  `reply_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `replay_time` datetime DEFAULT NULL,
  `discuss_id` bigint(20) DEFAULT NULL,
  `reply_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `FK94s0c9f8hxomde6bede3d20y2` (`discuss_id`),
  KEY `FK2bn8fpyqw7mom14ks4kvrhtp9` (`reply_user_id`),
  CONSTRAINT `FK2bn8fpyqw7mom14ks4kvrhtp9` FOREIGN KEY (`reply_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FK94s0c9f8hxomde6bede3d20y2` FOREIGN KEY (`discuss_id`) REFERENCES `aoa_discuss_list` (`discuss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_reply_list` */

insert  into `aoa_reply_list`(`reply_id`,`content`,`replay_time`,`discuss_id`,`reply_user_id`) values (99,'哈哈哈','2020-03-02 13:17:34',50,1),(100,'笑你妹<img src=\"http://localhost:8088/plugins/kindeditor/plugins/emoticons/images/29.gif\" alt=\"\" border=\"0\" /><br />','2020-03-02 13:21:15',50,36),(101,'会是测试1','2020-03-02 13:28:03',50,36),(102,'罗密欧我去你大爷','2020-03-02 13:42:01',50,36),(104,'新的评论02','2020-03-02 14:14:20',50,36),(105,'测试评论03','2020-03-03 09:08:17',49,1),(106,'测试评论04','2020-03-03 22:24:55',50,36),(108,'很想要对吧','2020-03-04 00:30:40',49,1),(109,'今天下雨了，心情好好呢','2020-03-04 12:19:35',49,1);

/*Table structure for table `aoa_resign` */

DROP TABLE IF EXISTS `aoa_resign`;

CREATE TABLE `aoa_resign` (
  `resign_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `financial_advice` varchar(255) DEFAULT NULL,
  `is_finish` bit(1) DEFAULT NULL,
  `nofinish` varchar(255) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  `suggest` varchar(255) DEFAULT NULL,
  `hand_user` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resign_id`),
  KEY `FK3t0d1mt9o7g5q59ha10e3mwpr` (`hand_user`),
  KEY `FKam7ii5j1kdforxq8s6q3mm13n` (`pro_id`),
  CONSTRAINT `FK3t0d1mt9o7g5q59ha10e3mwpr` FOREIGN KEY (`hand_user`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKam7ii5j1kdforxq8s6q3mm13n` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_resign` */

/*Table structure for table `aoa_reviewed` */

DROP TABLE IF EXISTS `aoa_reviewed`;

CREATE TABLE `aoa_reviewed` (
  `reviewed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `reviewed_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `del` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewed_id`),
  KEY `FKevjvy6myxg1l0ibiuph3i7jw2` (`pro_id`),
  KEY `FK2iljei0wvy0cylwwyfh5dr9yk` (`user_id`),
  CONSTRAINT `FK2iljei0wvy0cylwwyfh5dr9yk` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKevjvy6myxg1l0ibiuph3i7jw2` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_reviewed` */

/*Table structure for table `aoa_role_` */

DROP TABLE IF EXISTS `aoa_role_`;

CREATE TABLE `aoa_role_` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_role_` */

insert  into `aoa_role_`(`role_id`,`role_name`,`role_value`) values (1,'超级管理员',NULL),(2,'管理员',NULL),(3,'总经理',NULL),(4,'部门经理',NULL),(5,'职员',NULL),(6,'实习生',NULL),(7,'试用生',NULL);

/*Table structure for table `aoa_role_power_list` */

DROP TABLE IF EXISTS `aoa_role_power_list`;

CREATE TABLE `aoa_role_power_list` (
  `pk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` int(11) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `FK2f9f91f213gwtglofko5r429s` (`menu_id`),
  KEY `FK7b71lfkstl47tston4lrd8066` (`role_id`),
  CONSTRAINT `FK2f9f91f213gwtglofko5r429s` FOREIGN KEY (`menu_id`) REFERENCES `aoa_sys_menu` (`menu_id`),
  CONSTRAINT `FK7b71lfkstl47tston4lrd8066` FOREIGN KEY (`role_id`) REFERENCES `aoa_role_` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=696 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_role_power_list` */

insert  into `aoa_role_power_list`(`pk_id`,`is_show`,`menu_id`,`role_id`) values (56,1,1,1),(57,1,2,1),(58,1,3,1),(59,1,4,1),(60,1,5,1),(61,1,6,1),(62,1,7,1),(63,1,8,1),(64,1,9,1),(65,1,10,1),(66,1,11,1),(67,1,12,1),(68,1,13,1),(69,1,14,1),(70,1,15,1),(71,1,16,1),(72,1,17,1),(73,1,18,1),(74,1,19,1),(75,1,20,1),(76,1,21,1),(77,1,22,1),(78,1,23,1),(79,1,24,1),(80,1,25,1),(81,1,26,1),(82,1,27,1),(83,1,28,1),(84,1,29,1),(85,1,30,1),(86,1,31,1),(87,1,32,1),(88,1,33,1),(89,1,34,1),(90,1,35,1),(91,1,36,1),(92,1,37,1),(93,1,38,1),(94,1,39,1),(95,1,40,1),(96,1,41,1),(97,1,42,1),(98,1,67,1),(109,1,89,1),(110,1,90,1),(111,0,1,2),(112,1,2,2),(113,1,3,2),(114,1,4,2),(115,1,5,2),(116,1,6,2),(117,1,7,2),(118,1,8,2),(119,1,9,2),(120,1,10,2),(121,1,11,2),(122,1,12,2),(123,1,13,2),(124,0,14,2),(125,0,15,2),(126,0,16,2),(127,1,17,2),(128,1,18,2),(129,1,19,2),(130,0,20,2),(131,1,21,2),(132,1,22,2),(133,1,23,2),(134,1,24,2),(135,0,25,2),(136,1,26,2),(137,1,27,2),(138,1,28,2),(139,1,29,2),(140,1,30,2),(141,1,31,2),(142,1,32,2),(143,1,33,2),(144,1,34,2),(145,1,35,2),(146,1,36,2),(147,1,37,2),(148,1,38,2),(149,1,39,2),(150,1,40,2),(151,1,41,2),(152,1,42,2),(153,1,67,2),(164,1,89,2),(165,0,90,2),(166,0,1,3),(167,1,2,3),(168,1,3,3),(169,1,4,3),(170,1,5,3),(171,1,6,3),(172,1,7,3),(173,1,8,3),(174,1,9,3),(175,1,10,3),(176,1,11,3),(177,1,12,3),(178,1,13,3),(179,0,14,3),(180,0,15,3),(181,0,16,3),(182,1,17,3),(183,1,18,3),(184,1,19,3),(185,1,20,3),(186,1,21,3),(187,1,22,3),(188,1,23,3),(189,1,24,3),(190,1,25,3),(191,1,26,3),(192,1,27,3),(193,1,28,3),(194,1,29,3),(195,1,30,3),(196,1,31,3),(197,1,32,3),(198,1,33,3),(199,1,34,3),(200,1,35,3),(201,1,36,3),(202,1,37,3),(203,1,38,3),(204,1,39,3),(205,1,40,3),(206,1,41,3),(207,1,42,3),(208,1,67,3),(219,0,89,3),(220,1,90,3),(221,0,1,4),(222,1,2,4),(223,0,3,4),(224,1,4,4),(225,1,5,4),(226,1,6,4),(227,1,7,4),(228,1,8,4),(229,1,9,4),(230,1,10,4),(231,1,11,4),(232,1,12,4),(233,1,13,4),(234,0,14,4),(235,0,15,4),(236,0,16,4),(237,1,17,4),(238,1,18,4),(239,1,19,4),(240,1,20,4),(241,0,21,4),(242,1,22,4),(243,1,23,4),(244,1,24,4),(245,1,25,4),(246,1,26,4),(247,1,27,4),(248,1,28,4),(249,1,29,4),(250,1,30,4),(251,1,31,4),(252,1,32,4),(253,1,33,4),(254,1,34,4),(255,1,35,4),(256,1,36,4),(257,1,37,4),(258,1,38,4),(259,1,39,4),(260,1,40,4),(261,1,41,4),(262,1,42,4),(263,1,67,4),(274,0,89,4),(275,1,90,4),(276,0,1,5),(277,0,2,5),(278,0,3,5),(279,1,4,5),(280,1,5,5),(281,1,6,5),(282,1,7,5),(283,1,8,5),(284,1,9,5),(285,1,10,5),(286,1,11,5),(287,1,12,5),(288,1,13,5),(289,0,14,5),(290,0,15,5),(291,0,16,5),(292,0,17,5),(293,0,18,5),(294,0,19,5),(295,0,20,5),(296,0,21,5),(297,0,22,5),(298,0,23,5),(299,0,24,5),(300,1,25,5),(301,0,26,5),(302,0,27,5),(303,1,28,5),(304,0,29,5),(305,1,30,5),(306,0,31,5),(307,1,32,5),(308,1,33,5),(309,1,34,5),(310,1,35,5),(311,1,36,5),(312,1,37,5),(313,1,38,5),(314,1,39,5),(315,1,40,5),(316,1,41,5),(317,1,42,5),(318,1,67,5),(329,0,89,5),(330,1,90,5),(331,0,1,6),(332,0,2,6),(333,0,3,6),(334,0,4,6),(335,0,5,6),(336,0,6,6),(337,0,7,6),(338,0,8,6),(339,0,9,6),(340,0,10,6),(341,0,11,6),(342,0,12,6),(343,0,13,6),(344,0,14,6),(345,0,15,6),(346,0,16,6),(347,0,17,6),(348,0,18,6),(349,0,19,6),(350,0,20,6),(351,0,21,6),(352,0,22,6),(353,0,23,6),(354,0,24,6),(355,0,25,6),(356,0,26,6),(357,0,27,6),(358,0,28,6),(359,0,29,6),(360,0,30,6),(361,0,31,6),(362,0,32,6),(363,0,33,6),(364,0,34,6),(365,0,35,6),(366,0,36,6),(367,0,37,6),(368,0,38,6),(369,0,39,6),(370,0,40,6),(371,0,41,6),(372,0,42,6),(373,0,67,6),(384,0,89,6),(385,0,90,6),(386,0,1,7),(387,0,2,7),(388,0,3,7),(389,0,4,7),(390,0,5,7),(391,0,6,7),(392,0,7,7),(393,0,8,7),(394,0,9,7),(395,1,10,7),(396,0,11,7),(397,0,12,7),(398,0,13,7),(399,0,14,7),(400,0,15,7),(401,0,16,7),(402,0,17,7),(403,0,18,7),(404,0,19,7),(405,0,20,7),(406,0,21,7),(407,0,22,7),(408,0,23,7),(409,0,24,7),(410,0,25,7),(411,0,26,7),(412,0,27,7),(413,0,28,7),(414,0,29,7),(415,0,30,7),(416,0,31,7),(417,0,32,7),(418,1,33,7),(419,1,34,7),(420,1,35,7),(421,0,36,7),(422,0,37,7),(423,0,38,7),(424,0,39,7),(425,0,40,7),(426,0,41,7),(427,0,42,7),(428,0,67,7),(439,0,89,7),(440,0,90,7),(441,1,91,1),(442,0,91,2),(443,0,91,3),(444,0,91,4),(445,0,91,5),(446,0,91,6),(447,0,91,7),(448,1,92,1),(449,0,92,2),(450,0,92,3),(451,0,92,4),(452,0,92,5),(453,0,92,6),(454,0,92,7),(455,1,93,1),(456,0,93,2),(457,0,93,3),(458,0,93,4),(459,0,93,5),(460,0,93,6),(461,0,93,7),(462,1,94,1),(463,1,94,2),(464,0,94,3),(465,0,94,4),(466,1,94,5),(467,0,94,6),(468,0,94,7),(528,1,95,1),(529,0,95,2),(530,0,95,3),(531,1,95,4),(532,1,95,5),(533,0,95,6),(534,0,95,7),(556,1,99,1),(557,0,99,2),(558,0,99,3),(559,0,99,4),(560,0,99,5),(561,0,99,6),(562,0,99,7),(563,1,100,1),(564,1,100,2),(565,1,100,3),(566,1,100,4),(567,1,100,5),(568,1,100,6),(569,1,100,7),(570,1,101,1),(571,1,101,2),(572,1,101,3),(573,1,101,4),(574,1,101,5),(575,1,101,6),(576,1,101,7),(577,1,102,1),(578,1,102,2),(579,1,102,3),(580,1,102,4),(581,1,102,5),(582,1,102,6),(583,1,102,7),(584,1,103,1),(585,1,103,2),(586,1,103,3),(587,1,103,4),(588,1,103,5),(589,1,103,6),(590,1,103,7),(591,1,104,1),(592,0,104,2),(593,0,104,3),(594,0,104,4),(595,0,104,5),(596,0,104,6),(597,0,104,7),(605,1,106,1),(606,0,106,2),(607,0,106,3),(608,0,106,4),(609,1,106,5),(610,0,106,6),(611,0,106,7),(612,1,107,1),(613,0,107,2),(614,0,107,3),(615,0,107,4),(616,0,107,5),(617,0,107,6),(618,0,107,7),(619,1,108,1),(620,0,108,2),(621,0,108,3),(622,0,108,4),(623,0,108,5),(624,0,108,6),(625,0,108,7),(626,1,109,1),(627,0,109,2),(628,0,109,3),(629,0,109,4),(630,0,109,5),(631,0,109,6),(632,0,109,7),(633,1,110,1),(634,0,110,2),(635,0,110,3),(636,0,110,4),(637,0,110,5),(638,0,110,6),(639,0,110,7),(640,1,111,1),(641,0,111,2),(642,0,111,3),(643,0,111,4),(644,1,111,5),(645,0,111,6),(646,0,111,7),(647,1,112,1),(648,0,112,2),(649,0,112,3),(650,0,112,4),(651,1,112,5),(652,0,112,6),(653,0,112,7),(654,1,113,1),(655,0,113,2),(656,0,113,3),(657,0,113,4),(658,1,113,5),(659,0,113,6),(660,0,113,7),(661,1,114,1),(662,0,114,2),(663,0,114,3),(664,0,114,4),(665,0,114,5),(666,0,114,6),(667,0,114,7),(668,1,115,1),(669,1,115,2),(670,0,115,3),(671,0,115,4),(672,1,115,5),(673,0,115,6),(674,0,115,7),(675,1,116,1),(676,0,116,2),(677,0,116,3),(678,0,116,4),(679,0,116,5),(680,0,116,6),(681,0,116,7),(682,1,117,1),(683,0,117,2),(684,0,117,3),(685,0,117,4),(686,0,117,5),(687,0,117,6),(688,0,117,7),(689,1,118,1),(690,0,118,2),(691,0,118,3),(692,0,118,4),(693,0,118,5),(694,0,118,6),(695,0,118,7);

/*Table structure for table `aoa_schedule_list` */

DROP TABLE IF EXISTS `aoa_schedule_list`;

CREATE TABLE `aoa_schedule_list` (
  `rc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `filedescribe` varchar(255) DEFAULT NULL,
  `is_remind` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `miaoshu` varchar(255) DEFAULT NULL,
  `isreminded` int(11) DEFAULT NULL,
  PRIMARY KEY (`rc_id`),
  KEY `FKgcip21xf5ihmgm2bnh5o4jv15` (`user_id`),
  CONSTRAINT `FKgcip21xf5ihmgm2bnh5o4jv15` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_schedule_list` */

insert  into `aoa_schedule_list`(`rc_id`,`create_time`,`end_time`,`filedescribe`,`is_remind`,`start_time`,`status_id`,`title`,`type_id`,`user_id`,`miaoshu`,`isreminded`) values (14,'2020-03-06 20:13:27','2020-03-07 20:13:04',NULL,1,'2020-03-06 20:13:04',27,'刘大庆的日程01',44,36,'测试日程的发布',0),(17,'2020-03-08 18:37:45','2020-03-10 00:00:00',NULL,0,'2020-03-09 00:00:00',27,'3月9号的日程安排',44,1,'完成任务管理模块',1),(18,'2020-03-08 17:20:20','2020-03-10 00:00:00',NULL,1,'2020-03-09 00:00:00',27,'九号的日程02',44,1,'测试就好的日程',1),(29,'2020-03-08 23:31:01','2020-03-09 00:00:00',NULL,0,'2020-03-08 00:00:00',27,'只能换种格式了呀',44,1,'没办法了，框架出问题了',0),(30,'2020-03-09 10:40:15','2020-03-10 10:38:49',NULL,1,'2020-03-09 10:38:49',27,'九号的日程03',44,1,'哈哈哈哈哈',0);

/*Table structure for table `aoa_schedule_user` */

DROP TABLE IF EXISTS `aoa_schedule_user`;

CREATE TABLE `aoa_schedule_user` (
  `rcid` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `su_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`su_id`),
  KEY `FKh6hw8vp7p2lgfovi0o7bhhlyp` (`user_id`),
  KEY `FKcmd578ftbv7i53l6mxbbva137` (`rcid`),
  CONSTRAINT `FKcmd578ftbv7i53l6mxbbva137` FOREIGN KEY (`rcid`) REFERENCES `aoa_schedule_list` (`rc_id`),
  CONSTRAINT `FKh6hw8vp7p2lgfovi0o7bhhlyp` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_schedule_user` */

insert  into `aoa_schedule_user`(`rcid`,`user_id`,`su_id`) values (18,36,3),(17,36,4),(30,36,10);

/*Table structure for table `aoa_status_list` */

DROP TABLE IF EXISTS `aoa_status_list`;

CREATE TABLE `aoa_status_list` (
  `status_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_color` varchar(255) DEFAULT NULL,
  `status_model` varchar(255) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `sort_value` int(11) DEFAULT NULL,
  `sort_precent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_status_list` */

insert  into `aoa_status_list`(`status_id`,`status_color`,`status_model`,`status_name`,`sort_value`,`sort_precent`) values (1,'label-success','aoa_mailnumber','有效',0,NULL),(2,'label-default','aoa_mailnumber','无效',1,NULL),(3,'label-warning','aoa_task_list','新任务',0,'20%'),(4,'label-info','aoa_task_list','已接收',1,'40%'),(5,'label-primary','aoa_task_list','进行中',2,'60%'),(6,'label-danger','aoa_task_list','已提交',3,'80%'),(7,'label-success','aoa_task_list','已完成',4,'100%'),(8,'label-info','aoa_note_list','一般',0,NULL),(9,'label-danger','aoa_note_list','重要',1,NULL),(10,'label-info','aoa_attends_list','正常',0,NULL),(11,'label-warning','aoa_attends_list','迟到',1,NULL),(12,'label-danger','aoa_attends_list','早退',2,NULL),(13,'label-danger','a','旷工',3,NULL),(14,'label-primary','inform','一般',0,NULL),(15,'label-warning','inform','重要',1,''),(16,'label-danger','inform','紧急',2,NULL),(17,'label-warning','aoa_plan_list','未完成',0,NULL),(18,'label-success','aoa_plan_list','已完成',1,NULL),(19,'label-info','aoa_plan_list','已取消',2,NULL),(20,'label-primary','aoa_in_mail_list','一般',0,NULL),(21,'label-warning','aoa_in_mail_list','重要',1,NULL),(22,'label-danger','aoa_in_mail_list','紧急',2,NULL),(23,'label-info','aoa_process_list','未处理',0,NULL),(24,'label-primary','aoa_process_list','处理中',1,NULL),(25,'label-success','aoa_process_list','已批准',2,NULL),(26,'label-danger','aoa_process_list','未通过',3,NULL),(27,'label-primary','aoa_schedule_list','一般',0,NULL),(28,'label-warning','aoa_schedule_list','重要',1,NULL),(29,'label-danger','aoa_schedule_list','紧急',2,NULL);

/*Table structure for table `aoa_stay` */

DROP TABLE IF EXISTS `aoa_stay`;

CREATE TABLE `aoa_stay` (
  `stay_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `day` int(11) DEFAULT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `leave_time` datetime DEFAULT NULL,
  `stay_city` varchar(255) DEFAULT NULL,
  `stay_money` double DEFAULT NULL,
  `stay_time` datetime DEFAULT NULL,
  `evemoney_id` bigint(20) DEFAULT NULL,
  `user_name` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`stay_id`),
  KEY `FK50vbdodv3kd8dixbmyf9ixyc` (`evemoney_id`),
  KEY `FKho0k9o03kbn6dd96l57xvcx3y` (`user_name`),
  CONSTRAINT `FK50vbdodv3kd8dixbmyf9ixyc` FOREIGN KEY (`evemoney_id`) REFERENCES `aoa_evectionmoney` (`evectionmoney_id`),
  CONSTRAINT `FKho0k9o03kbn6dd96l57xvcx3y` FOREIGN KEY (`user_name`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_stay` */

/*Table structure for table `aoa_subject` */

DROP TABLE IF EXISTS `aoa_subject`;

CREATE TABLE `aoa_subject` (
  `subject_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_subject` */

insert  into `aoa_subject`(`subject_id`,`name`,`parent_id`) values (27,'出差消费',1),(28,'基础设施费',1),(29,'业务费',1),(30,'汽车相关费用',1),(31,'办公费用',1),(32,'乘车/出租',27),(33,'住宿/餐饮',27),(34,'办公用品',28),(35,'设备维修',28),(36,'业务招待',29),(37,'礼品费用',29),(38,'年检/维修',30),(39,'油费',30),(40,'物资采购',31),(41,'其他',31);

/*Table structure for table `aoa_sys_menu` */

DROP TABLE IF EXISTS `aoa_sys_menu`;

CREATE TABLE `aoa_sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` int(11) DEFAULT NULL,
  `menu_grade` int(11) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_sys_menu` */

insert  into `aoa_sys_menu`(`menu_id`,`is_show`,`menu_grade`,`menu_icon`,`menu_name`,`menu_url`,`parent_id`,`sort_id`) values (1,1,NULL,'glyphicon-cog','系统管理','##',0,1),(2,1,NULL,'glyphicon-education','人事管理','#',0,2),(3,1,NULL,'glyphicon-user','角色管理','#',0,3),(4,1,NULL,'glyphicon-time','考勤管理','#',0,4),(5,1,NULL,'glyphicon-hourglass','流程管理','#',0,5),(6,1,NULL,'glyphicon-bell','通知中心','#',0,6),(7,1,NULL,'glyphicon-envelope','邮件管理','#',0,7),(8,1,NULL,'glyphicon-flag','任务管理','#',0,8),(9,1,NULL,'glyphicon-calendar','日程管理','#',0,9),(10,0,NULL,'glyphicon-plane','工作计划','#',9999,10),(11,1,NULL,'glyphicon-folder-open','文件管理','#',0,11),(12,0,NULL,'glyphicon-edit','笔记管理','#',12,12),(13,1,NULL,'glyphicon-comment','论坛中心','#',0,14),(14,1,NULL,'glyphicon-record','菜单管理','/testsysmenu',1,0),(15,1,NULL,'glyphicon-record','类型管理','/testsystype',1,2),(16,1,NULL,'glyphicon-record','状态管理','/testsysstatus',1,3),(17,1,NULL,'glyphicon-record','部门管理','/deptmanage',2,1),(18,1,NULL,'glyphicon-record','职位管理','/positionmanage',2,3),(19,1,NULL,'glyphicon-record','用户管理','/usermanage',2,4),(20,1,NULL,'glyphicon-record','登录日记','/morelogrecord',1,7),(21,1,NULL,'glyphicon-record','角色列表','/rolemanage',3,1),(22,1,NULL,'glyphicon-record','考勤管理','/attendceatt',4,1),(23,1,NULL,'glyphicon-record','考勤周报','/attendceweek',4,2),(24,1,NULL,'glyphicon-record','考勤月报','/attendcemonth',4,3),(25,1,NULL,'glyphicon-record','我的申请','/flowmanage',5,1),(26,1,NULL,'glyphicon-record','我的审核','/audit',5,2),(27,1,NULL,'glyphicon-record','我的管理','/infrommanage',6,1),(28,0,NULL,'glyphicon-record','部门通知列表','/infromlist',6,2),(29,1,NULL,'glyphicon-record','账号管理','/accountmanage',7,1),(30,1,NULL,'glyphicon-record','我的邮箱','/mail',7,2),(31,1,NULL,'glyphicon-record','任务管理','/taskmanage',8,1),(32,1,NULL,'glyphicon-record','我的任务','/mytask',8,2),(33,1,NULL,'glyphicon-record','我的日程','/daymanage',9,1),(34,1,NULL,'glyphicon-record','个人日程表','/daycalendar',9,2),(35,1,NULL,'glyphicon-record','计划管理','/planview',10,1),(36,1,NULL,'glyphicon-record','计划报表','/myplan',10,2),(37,1,NULL,'glyphicon-record','文件管理','/filemanage',11,1),(38,1,NULL,'glyphicon-record','笔记管理','/noteview',12,0),(39,1,NULL,'glyphicon-earphone','通讯聊天','#',0,13),(40,1,NULL,'glyphicon-record','通讯录','/addrmanage',39,1),(41,0,NULL,'glyphicon-record','我的管理','/chatmanage',13,1),(42,0,NULL,'glyphicon-record','讨论区列表','/chatlist',13,2),(67,1,NULL,'glyphicon-record','个人记录','/attendcelist',4,4),(89,0,NULL,'glyphicon-record','超级管理员','/adminmanage',13,0),(90,1,NULL,'glyphicon-record','新建流程','/xinxeng',5,0),(91,1,NULL,'glyphicon glyphicon-remove','关闭系统','/closeSystem',91,4),(92,0,NULL,'glyphicon-record','关闭系统','/closeSystem',1,5),(93,1,NULL,'glyphicon-record','在线用户','/zaixianyonghu',1,4),(94,0,NULL,'glyphicon-record','最新公告','/newmasege',6,0),(95,1,NULL,'glyphicon-record','通知列表','/nitifyall',6,5),(99,1,NULL,'glyphicon-record','系统日志','/systemrizhi',1,6),(100,1,NULL,'glyphicon-record','论坛中心','/ForumCenter',13,3),(101,1,NULL,'glyphicon-record','系统反馈','/xitongfankui',999,999),(102,1,NULL,'glyphicon glyphicon-th-large','个人中心','#',0,15),(103,1,NULL,'glyphicon-record','个人信息','/userpanel',102,0),(104,1,NULL,'glyphicon-record','测试菜单','/4554',999,1),(106,1,NULL,'glyphicon-record','新闻看点','/123xxx',13,6),(107,1,NULL,'glyphicon-record','及你太美','/hhhh',999,2),(108,1,NULL,'glyphicon-record','奥里给','/xxxxxx',999,3),(109,1,NULL,'glyphicon-record','及你太美','/hhhh',999,2),(110,1,NULL,'glyphicon-record','测试菜单','#',999,20),(111,1,NULL,'glyphicon glyphicon-pencil','系统反馈','#',0,15),(112,1,NULL,'glyphicon-record','系统介绍','/xxxxxxxx',111,0),(113,1,NULL,'glyphicon-record','使用反馈','/xxxxxxx',111,1),(114,1,NULL,'glyphicon-record','反馈记录','/xxxxx',111,2),(115,1,NULL,'glyphicon-record','聊天室','/testController01',39,2),(116,1,NULL,'glyphicon-record','通知列表2','/all',999,5),(117,1,NULL,'glyphicon-record','通知列表2','/all',999,5),(118,0,NULL,'glyphicon-record','日记管理','/rizhiguanli',1,8);

/*Table structure for table `aoa_task_list` */

DROP TABLE IF EXISTS `aoa_task_list`;

CREATE TABLE `aoa_task_list` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_cancel` int(11) DEFAULT '0',
  `is_top` int(11) DEFAULT '0',
  `modify_time` datetime DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `star_time` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `task_describe` varchar(255) NOT NULL,
  `ticking` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `task_push_user_id` bigint(20) DEFAULT NULL,
  `reciverlist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK7qch0fh6s2y73dvngy1m87aw7` (`task_push_user_id`),
  CONSTRAINT `FK7qch0fh6s2y73dvngy1m87aw7` FOREIGN KEY (`task_push_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_task_list` */

insert  into `aoa_task_list`(`task_id`,`comment`,`end_time`,`is_cancel`,`is_top`,`modify_time`,`publish_time`,`star_time`,`status_id`,`task_describe`,`ticking`,`title`,`type_id`,`task_push_user_id`,`reciverlist`) values (51,'','2020-03-11 00:00:00',0,0,'2020-03-12 15:14:21','2020-03-12 15:14:21','2020-03-10 00:00:00',7,'三天内完成任务管理模块',NULL,'刘大庆的任务01',4,1,'刘大庆'),(53,'','2020-03-14 00:00:00',0,0,'2020-03-13 23:45:55','2020-03-13 23:45:55','2020-03-13 00:00:00',5,'速度得加紧了，三月结束前把审批模块完成',NULL,'三月份任务计划',3,1,'朱丽叶;刘大庆'),(55,'','2020-03-15 00:00:00',0,0,'2020-03-14 00:26:08','2020-03-14 00:26:08','2020-03-14 00:00:00',3,'哈哈哈哈哈',NULL,'计划003',3,1,'刘大庆');

/*Table structure for table `aoa_task_logger` */

DROP TABLE IF EXISTS `aoa_task_logger`;

CREATE TABLE `aoa_task_logger` (
  `logger_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `logger_ticking` varchar(255) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `logger_statusid` int(11) DEFAULT NULL,
  PRIMARY KEY (`logger_id`),
  KEY `FK5gu0thq54i7ujc6cict009h4y` (`task_id`),
  CONSTRAINT `FK5gu0thq54i7ujc6cict009h4y` FOREIGN KEY (`task_id`) REFERENCES `aoa_task_list` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_task_logger` */

insert  into `aoa_task_logger`(`logger_id`,`create_time`,`logger_ticking`,`task_id`,`username`,`logger_statusid`) values (43,'2020-03-11 14:23:34','你妹的，有本事你给我一月时间',51,'刘大庆',NULL),(44,'2020-03-11 14:24:05','这么难谁能完成呀',51,'刘大庆',NULL),(45,'2020-03-12 12:47:45','不好意思，工资太低不干',51,'刘大庆',NULL),(46,'2020-03-12 13:06:22','这么难的要求我去',51,'刘大庆',NULL),(51,'2020-03-12 14:50:01',NULL,51,'刘大庆',5),(54,'2020-03-13 22:56:56',NULL,51,'刘大庆',6),(55,'2020-03-14 00:04:44',NULL,53,'刘大庆',5),(57,'2020-03-15 14:37:24',NULL,51,'罗密欧',5),(59,'2020-03-15 14:43:51',NULL,51,'刘大庆',6),(60,'2020-03-15 18:55:11',NULL,51,'罗密欧',7);

/*Table structure for table `aoa_task_user` */

DROP TABLE IF EXISTS `aoa_task_user`;

CREATE TABLE `aoa_task_user` (
  `pk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `task_recive_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `FK2714kl5ywm5chya4dxte8c788` (`task_id`),
  KEY `FK654dfo0oouy3fk07fs7rqo4ld` (`task_recive_user_id`),
  CONSTRAINT `FK2714kl5ywm5chya4dxte8c788` FOREIGN KEY (`task_id`) REFERENCES `aoa_task_list` (`task_id`),
  CONSTRAINT `FK654dfo0oouy3fk07fs7rqo4ld` FOREIGN KEY (`task_recive_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_task_user` */

insert  into `aoa_task_user`(`pk_id`,`status_id`,`task_id`,`task_recive_user_id`) values (70,7,51,36),(72,3,53,2),(73,5,53,36),(75,3,55,36);

/*Table structure for table `aoa_traffic` */

DROP TABLE IF EXISTS `aoa_traffic`;

CREATE TABLE `aoa_traffic` (
  `traffic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) DEFAULT NULL,
  `depart_time` datetime DEFAULT NULL,
  `reach_name` varchar(255) DEFAULT NULL,
  `seat_type` varchar(255) DEFAULT NULL,
  `traffic_money` double DEFAULT NULL,
  `traffic_name` varchar(255) DEFAULT NULL,
  `evection_id` bigint(20) DEFAULT NULL,
  `user_name` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`traffic_id`),
  KEY `FKt5gk2fg5t802gnq8y03p9e7di` (`evection_id`),
  KEY `FKejkemcx58mfj2lgi2jo2rlih3` (`user_name`),
  CONSTRAINT `FKejkemcx58mfj2lgi2jo2rlih3` FOREIGN KEY (`user_name`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKt5gk2fg5t802gnq8y03p9e7di` FOREIGN KEY (`evection_id`) REFERENCES `aoa_evectionmoney` (`evectionmoney_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_traffic` */

/*Table structure for table `aoa_type_list` */

DROP TABLE IF EXISTS `aoa_type_list`;

CREATE TABLE `aoa_type_list` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_color` varchar(255) DEFAULT NULL,
  `type_model` varchar(255) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `sort_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_type_list` */

insert  into `aoa_type_list`(`type_id`,`type_color`,`type_model`,`type_name`,`sort_value`) values (1,'red','aoa_mailnumber','系统邮件',0),(2,'red','aoa_mailnumber','公司邮件',1),(3,'red','aoa_task_list','多人任务',0),(4,'red','aoa_task_list','私人任务',1),(5,'red','aoa_note_list','我的笔记',0),(6,'red','aoa_note_list','公司笔记',1),(7,'red','aoa_note_list','共享笔记',2),(8,'red','aoa_attends_list','上班',1),(9,'red','aoa_attends_list','下班',2),(10,'red','inform','公告',0),(11,'red','inform','通知',1),(12,'red','inform','投票',2),(13,'red','aoa_plan_list','日计划',0),(14,'red','aoa_plan_list','周计划',1),(15,'red','aoa_plan_list','月计划',2),(16,'red','aoa_in_mail_list','邮件',0),(17,'red','aoa_in_mail_list','通知',1),(18,'red','aoa_in_mail_list','公告',2),(19,'label-danger','chat','公告',0),(20,'label-success','chat','讨论',1),(21,'label-warning','chat','投票',2),(22,'red','aoa_process_list','正常',0),(23,'red','aoa_process_list','重要',1),(24,'red','aoa_process_list','紧急',2),(25,'red','aoa_bursement','银行卡',0),(26,'red','aoa_bursement','现金',1),(27,'red','aoa_bursement','其他',2),(28,'red','aoa_evection','销售拜访',0),(29,'red','aoa_evection','售前支持',1),(30,'red','aoa_evection','项目支持',2),(31,'red','aoa_evection','客服外出',3),(32,'red','aoa_evection','其他',4),(33,'red','aoa_overtime','工作日',0),(34,'red','aoa_overtime','休息日',1),(35,'red','aoa_overtime','节假日',2),(36,'red','aoa_overtime','其他',3),(37,'1、年假：工作满一年以上每年可享受带薪年假，当年的年假使用期至次年3月1日止；未经用人单位批准，员工不得自行休假。','aoa_holiday','年假',7),(38,'2、事假：按照平均工作日扣发薪资（包含工资及各类补贴福利）；单次事假原则上不应超过3天，当年累计事假超过15天的视为主动放弃继续履行岗位职责的权利，特殊情况除外。  ','aoa_holiday','事假',4),(39,'3、病假：两天及以上病假必须持工作地二级甲等以上医院相关病假证明单或就医记录证明，否则无法享受病假工资；单次病假超过5天，应当持有工作所在地三级甲等医院提供的病假证明单。原则上当年累计病假超过15天应视为不具备继续履行岗位职责身体条件，特殊情况除外。  ','aoa_holiday','病假',NULL),(40,'4、婚假：婚假为十天，包含休息日，请婚假必须持结婚证明，结婚证必须在泛微工作期间领取，且婚假必须在一年内使用完毕，不得分次休假，国家或地方政府有其他规定的按照当地要求执行；  ','aoa_holiday','婚假',10),(41,'5、产假及哺乳假：按国家及地方法律法规执行，包含休息日与法定节假日；  ','aoa_holiday','产假及哺乳假',180),(42,'6、陪产假：泛微正式男性员工在工作期间配偶生育的，可凭子女出生证明，享受十个自然日陪产假。  ','aoa_holiday','陪产假',10),(43,'7、丧假：直系亲属：配偶、子女、父母可享受三天，岳父母、祖父母、外祖父母可享受一天','aoa_holiday','丧假',NULL),(44,'','aoa_schedule_list','日程提醒',0),(45,'','aoa_schedule_list','假日安排',1),(46,'red','aoa_attends_list','请假',3),(47,'red','aoa_attends_list','出差',4),(48,'label-warning','aoa_chat','技术',NULL),(49,'label-success','aoa_chat','工作',NULL),(50,'label-primary','aoa_chat','好玩',NULL),(51,'label-info','aoa_chat','生活',NULL),(52,'label-default','aoa_chat','创意',NULL),(53,'red','aoa_mailnumber','系统邮件',0);

/*Table structure for table `aoa_user` */

DROP TABLE IF EXISTS `aoa_user`;

CREATE TABLE `aoa_user` (
  `is_login` int(11) DEFAULT NULL COMMENT '在线状态',
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `eamil` varchar(255) DEFAULT NULL,
  `father_id` bigint(20) DEFAULT NULL,
  `hire_time` datetime DEFAULT NULL,
  `user_idcard` varchar(255) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `is_lock` int(11) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user_id` bigint(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `user_school` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `theme_skin` varchar(255) DEFAULT NULL,
  `user_edu` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_sign` varchar(255) DEFAULT NULL,
  `user_tel` varchar(255) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `superman` int(11) DEFAULT NULL,
  `holiday` int(11) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FKt0vmot9xfbgq14oyij0gwh3gh` (`dept_id`),
  KEY `FKadtg9xju7q1ijcyxlkl9gwv5t` (`position_id`),
  KEY `FKl738mmblfx0uia6671rl17cj9` (`role_id`),
  CONSTRAINT `FKadtg9xju7q1ijcyxlkl9gwv5t` FOREIGN KEY (`position_id`) REFERENCES `aoa_position` (`position_id`),
  CONSTRAINT `FKl738mmblfx0uia6671rl17cj9` FOREIGN KEY (`role_id`) REFERENCES `aoa_role_` (`role_id`),
  CONSTRAINT `FKt0vmot9xfbgq14oyij0gwh3gh` FOREIGN KEY (`dept_id`) REFERENCES `aoa_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_user` */

insert  into `aoa_user`(`is_login`,`user_id`,`address`,`bank`,`birth`,`eamil`,`father_id`,`hire_time`,`user_idcard`,`img_path`,`is_lock`,`last_login_ip`,`last_login_time`,`modify_time`,`modify_user_id`,`password`,`real_name`,`salary`,`user_school`,`sex`,`theme_skin`,`user_edu`,`user_name`,`user_sign`,`user_tel`,`dept_id`,`position_id`,`role_id`,`superman`,`holiday`,`pinyin`) values (0,1,'伦敦','62175555555555444','1986-02-03 00:00:00','2468282708@qq.com',3,'2017-09-22 19:35:40','510322198602030429','6aea3f2567da48bbaea93acca1887f55_QQ图片20200119122020.jpg',0,NULL,NULL,NULL,NULL,'123456','小明',99999,'南宁学院','男','blue','本科','罗密欧','刘大庆NB','18877126235',1,1,1,1,NULL,'luomiou'),(NULL,2,'中国广东','12345','1994-03-28 00:00:00','aaluoxiang@foxmail.com',3,'2008-03-06 00:00:00','510322199403280426','simpletest.jpeg',0,NULL,NULL,NULL,NULL,'123456','小梅',1000,'南宁学院','女','green','硕士','朱丽叶','天天向上','13203318185',1,2,2,0,NULL,'zhuliye'),(NULL,3,'中国广东','6217002940101998752','1995-03-05 00:00:00','255@qq.com',3,'2009-05-24 00:00:00','510322199503052485','test1.jpg',0,NULL,NULL,NULL,NULL,'123456','芳芳',1000,'南宁学院','女','yellow','硕士','伊丽莎白','好学','18683688154',1,3,3,0,NULL,'yilishabai'),(NULL,4,'清华大学','6231334758912365','1994-09-19 16:52:11','164@qq.com',4,'2013-09-19 16:52:40','432524199612188018','test2.jpeg',0,NULL,NULL,NULL,NULL,'123456','李明',3000,'南宁学院','男','blue','硕士','小李父斯基','天天努力','18173328888',2,4,4,0,NULL,'xiaolifusiji'),(NULL,5,'中南大学','7777','1996-09-19 16:56:50','173@126.com',5,'2014-09-19 16:57:21','432524199612188016','test3.JPG',0,NULL,NULL,NULL,NULL,'123456','小罗',4000,'中南大学','男','blue','博士','soli','iinteresting','18173328976',3,5,4,0,NULL,'soli'),(NULL,6,'泰山西路','9999','1997-09-19 16:59:29','188@qq.com',6,'2014-09-19 17:00:21','432524199712188019','test4.jpg',0,NULL,NULL,NULL,NULL,'123456','小红',3700,'上海交大','女','green','本科','红之花','每天美一点','18868688866',4,6,4,0,NULL,'hongzhihua'),(NULL,7,'湖南工业大学','6666','2017-10-01 15:20:20','188@qq.com',4,'2017-10-05 15:20:39','432524199712188020','test5.jpeg',0,NULL,NULL,NULL,NULL,'123456','小喻',5000,'湖南工业大学','男','yellow','本科','甄姬',NULL,'13117336953',5,7,4,0,NULL,'zhengji'),(NULL,8,'中国广东','62175555555555444','2017-10-04 15:20:20','188@qq.com',4,'2017-10-02 15:20:39','432524199712188021','test6.png',0,NULL,NULL,NULL,NULL,'123456','小费',5000,'湖南工业大学','女','red','本科','甄姬2',NULL,'13117336954',2,10,5,0,NULL,'zhengji2'),(NULL,9,'中国广东','5555444','2017-10-03 14:23:10','55@qq.com',4,'2017-10-11 14:23:32','432524199712188021','test7.JPG',0,NULL,NULL,NULL,NULL,'123456','小花',3111,'湖南工业大学','女','blue','本科','甄嬛',NULL,'13034507214',2,11,5,0,NULL,'zhenghuan'),(NULL,10,'清华大学','4444','2017-10-18 14:26:17','66@qq.com',4,'2017-10-07 14:26:37','432524199712188021','test8.JPG',0,NULL,NULL,NULL,NULL,'123456','花红',2555,'湖大','女','green','本科','无双',NULL,'13117336954',2,12,5,0,NULL,'wushuang'),(NULL,11,'中南大学','62175555555555444','2017-10-07 14:27:54','1057@qq.com',4,'2017-10-07 14:28:06','432524199712188021','test9.jpg',0,NULL,NULL,NULL,NULL,'123456','兰瑞',5000,'中南','男','yellow','硕士','瑞王',NULL,'13117336953',2,13,5,0,NULL,'ruiwang'),(NULL,12,'泰山西路','62175555555555444','1986-02-03 00:00:00','aaluoxiang@foxmail.com',4,'2014-09-19 16:57:21','510322198602030429','test10.jpg',0,NULL,NULL,NULL,NULL,'123456','雨果',2000,'湖南工业大学','男','red','本科','丹琪',NULL,'13117336953',2,14,5,0,NULL,'danqi'),(NULL,13,'湖南工业大学','12345','1994-03-28 00:00:00','255@qq.com',4,'2014-09-19 17:00:21','510322199403280426','test11.JPG',0,NULL,NULL,NULL,NULL,'123456','毛羽',1000,'中南大学','女','blue','硕士','于彤',NULL,'13117336954',2,15,5,0,NULL,'yutong'),(NULL,14,'中国广东','123478','1995-03-05 00:00:00','164@qq.com',5,'2017-10-05 15:20:39','510322199503052485','test12.png',0,NULL,NULL,NULL,NULL,'123456','黑椰',1000,'湖南大学','女','green','硕士','盛如思',NULL,'18868688866',3,21,5,0,NULL,'shengrusi'),(NULL,15,'中国广东','6666','1994-09-19 16:52:11','173@126.com',5,'2017-10-02 15:20:39','432524199612188018','test13.JPG',0,NULL,NULL,NULL,NULL,'123456','车寿山',3000,'清华大学','男','yellow','硕士','李楚堂',NULL,'13117336953',3,22,5,0,NULL,'lichutang'),(NULL,16,'清华大学','7777','1996-09-19 16:56:50','188@qq.com',5,'2017-10-11 14:23:32','432524199612188016','test14.jpg',0,NULL,NULL,NULL,NULL,'123456','白秋生',4000,'中南大学','男','red','博士','支晓璇',NULL,'13117336954',3,23,5,0,NULL,'zhixiaoxuan'),(NULL,17,'中南大学','9999','1997-09-19 16:59:29','188@qq.com',6,'2017-10-07 14:26:37','432524199712188019','test15.jpg',0,NULL,NULL,NULL,NULL,'123456','饶子和',3700,'上海交大','女','blue','本科','薛邵琴',NULL,'13034507214',4,16,5,0,NULL,'xueshanqin'),(NULL,18,'泰山西路','6666','2017-10-01 15:20:20','188@qq.com',6,'2017-10-07 14:28:06','432524199712188020','test16.jpg',0,NULL,NULL,NULL,NULL,'123456','王秋阳',5000,'湖南工业大学','男','green','本科','光宇',NULL,'13117336954',4,17,5,0,NULL,'guangyu'),(NULL,19,'湖南工业大学','62175555555555444','2017-10-04 15:20:20','55@qq.com',6,'2014-09-19 16:57:21','432524199712188021','test17.jpg',0,NULL,NULL,NULL,NULL,'123456','叶知秋',5000,'湖南工业大学','女','yellow','本科','朱茵',NULL,'13117336953',4,18,5,0,NULL,'zhuyin'),(NULL,20,'中国广东','5555444','2017-10-03 14:23:10','66@qq.com',6,'2014-09-19 16:57:21','432524199712188021','test18.png',0,NULL,NULL,NULL,NULL,'123456','刘湛秋',3111,'湖南工业大学','女','red','本科','朱颖',NULL,'13117336953',4,19,5,0,NULL,'zhuyin'),(NULL,21,'中国广东','4444','2017-10-18 14:26:17','88@qq.com',6,'2014-09-19 16:57:21','432524199712188021','test.jpg',0,NULL,NULL,NULL,NULL,'123456','李发友',2555,'湖大','女','blue','本科','杨晓木',NULL,'18868688866',4,20,5,0,NULL,'yangxiaomu'),(NULL,22,'清华大学','6666','2017-10-07 14:27:54','1057@qq.com',7,'2014-09-19 16:57:21','5824566822688','test.jpg',0,NULL,NULL,NULL,NULL,'123456','金燕西',5000,'中南','男','green','硕士','陈晓吉',NULL,'13117336953',5,8,5,0,NULL,'chenxiaoji'),(NULL,23,'中南大学','6666\r\n62175555555555444\r\n12345','2017-10-07 14:27:54','aaluoxiang@foxmail.com',7,'2014-09-19 16:57:21','25852255','test.jpg',0,NULL,NULL,NULL,NULL,'123456','修璃',6000,'中南','女','yellow','博士','刘恋','','13117336954',5,9,5,0,NULL,'liulian'),(NULL,24,'中南大学','6666\r\n62175555555555444\r\n12345','2017-10-07 14:27:54','aaluoxiang@foxmail.com',7,'2014-09-19 16:57:21','25852255','test.jpg',0,NULL,NULL,NULL,NULL,'123456','张柳',6000,'中南','女','yellow','博士','张柳','','13117336954',5,9,5,0,NULL,'zhangliu'),(NULL,25,'湖南工业大学','62175555555555444','2017-10-04 15:20:20','55@qq.com',6,'2014-09-19 16:57:21','432524199712188021','test.jpg',0,NULL,NULL,NULL,NULL,'123456','张秋',5000,'湖南工业大学','女','yellow','本科','张秋',NULL,'13117336953',4,18,5,0,NULL,'zhangqiu'),(NULL,26,'清华大学','7777','1996-09-19 16:56:50','188@qq.com',5,'2017-10-11 14:23:32','432524199612188016','test.jpg',0,NULL,NULL,NULL,NULL,'123456','张秋生',4000,'中南大学','男','red','博士','张秋生',NULL,'13117336954',3,23,5,0,NULL,'zhangqiusheng'),(NULL,27,'中国广东','4444','2017-10-18 14:26:17','88@qq.com',6,'2014-09-19 16:57:21','432524199712188021','test.jpg',0,NULL,NULL,NULL,NULL,'123456','张宇',2555,'湖大','女','blue','本科','张宇',NULL,'18868688866',4,20,5,0,NULL,'zhangyu'),(NULL,28,'中国广东','55555','2017-10-14 21:51:42','55@qq.com',4,'2017-10-14 21:52:15','432524199712188021','test.jpg',0,NULL,NULL,NULL,NULL,'123456','薛之谦',222,'湖大','男','blue','硕士','上上签',NULL,'18868688866',2,10,6,0,NULL,'shangshangqian'),(NULL,35,'wqasd','6217002940101998752','2017-10-16 00:00:00','qq@qq.com',3,'2017-10-16 00:00:00','430602199501121115',NULL,0,NULL,NULL,NULL,NULL,'123456','总金办测试用户',123213,'asdas','男','blue','qwewq','wuianan',NULL,'13600003532',1,27,5,0,NULL,NULL),(0,36,'南宁','623133123456789123','1998-04-17 00:00:00','2468282708@qq.com',3,'2020-02-11 00:00:00','450923199804172536','77708f3f6469470285cada4a794b5a50_QQ图片20190317202325.jpg',0,NULL,NULL,NULL,NULL,'123456','刘东庆',3000,'南宁学院','男','blue','本科','刘大庆','你大爷','18877126235',1,27,5,0,NULL,'liudaqing');

/*Table structure for table `aoa_user_log` */

DROP TABLE IF EXISTS `aoa_user_log`;

CREATE TABLE `aoa_user_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(255) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `FKherb88q97dxbtcge09ii875qm` (`user_id`),
  CONSTRAINT `FKherb88q97dxbtcge09ii875qm` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2910 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_user_log` */

insert  into `aoa_user_log`(`log_id`,`ip_addr`,`log_time`,`title`,`url`,`user_id`) values (2731,'192.168.42.248','2020-04-16 11:03:12','菜单管理','/testsysmenu',1),(2732,'192.168.42.248','2020-04-16 15:49:56','类型管理','/testsystype',1),(2733,'192.168.42.248','2020-04-16 15:54:00','系统日志','/systemrizhi',1),(2734,'192.168.42.248','2020-04-16 16:06:09','状态管理','/testsysstatus',1),(2735,'192.168.42.248','2020-04-16 16:06:12','登录日记','/morelogrecord',1),(2736,'192.168.42.248','2020-04-16 16:06:16','状态管理','/testsysstatus',1),(2737,'192.168.42.248','2020-04-16 16:12:37','系统日志','/systemrizhi',1),(2738,'192.168.42.248','2020-04-16 16:23:22','类型管理','/testsystype',1),(2739,'192.168.42.248','2020-04-16 16:32:05','系统日志','/systemrizhi',1),(2740,'192.168.42.248','2020-04-16 16:40:16','类型管理','/testsystype',1),(2741,'192.168.42.248','2020-04-16 16:43:02','系统日志','/systemrizhi',1),(2742,'192.168.42.248','2020-04-16 16:57:16','个人记录','/attendcelist',36),(2743,'192.168.42.248','2020-04-16 17:06:41','我的任务','/mytask',1),(2744,'192.168.42.248','2020-04-16 17:06:42','任务管理','/taskmanage',1),(2745,'192.168.42.248','2020-04-16 17:12:13','我的任务','/mytask',36),(2746,'192.168.42.248','2020-04-16 19:24:00','我的任务','/mytask',1),(2747,'192.168.42.187','2020-04-17 08:54:24','菜单管理','/testsysmenu',1),(2748,'192.168.42.187','2020-04-17 08:54:54','新建流程','/xinxeng',36),(2749,'192.168.42.187','2020-04-17 09:16:58','个人记录','/attendcelist',36),(2750,'192.168.42.187','2020-04-17 09:17:32','新建流程','/xinxeng',36),(2751,'192.168.42.187','2020-04-17 09:17:34','我的申请','/flowmanage',36),(2752,'192.168.42.187','2020-04-17 09:17:36','新建流程','/xinxeng',36),(2753,'192.168.42.187','2020-04-17 09:23:51','新建流程','/xinxeng',36),(2754,'192.168.42.187','2020-04-17 09:23:54','我的申请','/flowmanage',36),(2755,'192.168.42.187','2020-04-17 09:28:21','我的审核','/audit',1),(2756,'192.168.42.187','2020-04-17 09:28:36','新建流程','/xinxeng',36),(2757,'192.168.42.187','2020-04-17 10:04:57','新建流程','/xinxeng',36),(2758,'192.168.42.187','2020-04-17 11:06:19','新建流程','/xinxeng',36),(2759,'192.168.42.187','2020-04-17 11:08:22','新建流程','/xinxeng',36),(2760,'192.168.42.187','2020-04-17 11:09:42','我的申请','/flowmanage',36),(2761,'192.168.42.187','2020-04-17 11:09:44','我的申请','/flowmanage',36),(2762,'192.168.42.187','2020-04-17 11:25:38','新建流程','/xinxeng',36),(2763,'192.168.42.187','2020-04-17 11:27:18','新建流程','/xinxeng',36),(2764,'192.168.42.187','2020-04-17 12:11:22','我的申请','/flowmanage',36),(2765,'192.168.42.187','2020-04-17 12:18:53','我的申请','/flowmanage',36),(2766,'192.168.42.187','2020-04-17 12:22:37','我的申请','/flowmanage',36),(2767,'192.168.42.187','2020-04-17 12:30:28','我的申请','/flowmanage',36),(2768,'192.168.42.187','2020-04-17 12:35:16','我的申请','/flowmanage',36),(2769,'192.168.42.187','2020-04-17 12:35:51','我的申请','/flowmanage',36),(2770,'192.168.42.187','2020-04-17 12:36:39','新建流程','/xinxeng',36),(2771,'192.168.42.187','2020-04-17 12:39:08','新建流程','/xinxeng',36),(2772,'192.168.42.187','2020-04-17 12:39:10','我的申请','/flowmanage',36),(2773,'192.168.42.187','2020-04-17 12:42:58','我的申请','/flowmanage',36),(2774,'192.168.42.187','2020-04-17 12:49:56','我的申请','/flowmanage',36),(2775,'192.168.42.187','2020-04-17 12:50:01','我的申请','/flowmanage',36),(2776,'192.168.42.187','2020-04-17 13:19:53','我的申请','/flowmanage',36),(2777,'192.168.42.187','2020-04-17 13:20:57','我的申请','/flowmanage',36),(2778,'192.168.42.187','2020-04-17 13:20:58','新建流程','/xinxeng',36),(2779,'192.168.42.187','2020-04-17 13:21:25','我的申请','/flowmanage',36),(2780,'192.168.42.187','2020-04-17 13:21:26','新建流程','/xinxeng',36),(2781,'192.168.42.187','2020-04-17 15:43:46','我的申请','/flowmanage',36),(2782,'192.168.42.187','2020-04-17 15:45:53','新建流程','/xinxeng',36),(2783,'192.168.42.187','2020-04-17 15:48:12','新建流程','/xinxeng',36),(2784,'192.168.42.187','2020-04-17 15:59:03','新建流程','/xinxeng',36),(2785,'192.168.42.187','2020-04-17 16:01:52','新建流程','/xinxeng',36),(2786,'192.168.42.187','2020-04-17 16:08:34','我的申请','/flowmanage',36),(2787,'192.168.42.187','2020-04-17 16:08:34','新建流程','/xinxeng',36),(2788,'192.168.42.187','2020-04-17 16:09:32','新建流程','/xinxeng',36),(2789,'192.168.42.195','2020-04-18 09:52:33','我的申请','/flowmanage',36),(2790,'192.168.42.195','2020-04-18 09:52:36','新建流程','/xinxeng',36),(2791,'192.168.42.195','2020-04-18 10:04:25','新建流程','/xinxeng',36),(2792,'192.168.42.195','2020-04-18 10:04:56','新建流程','/xinxeng',36),(2793,'192.168.42.195','2020-04-18 10:06:29','新建流程','/xinxeng',36),(2794,'192.168.42.195','2020-04-18 10:06:32','我的申请','/flowmanage',36),(2795,'192.168.42.195','2020-04-18 10:10:06','我的申请','/flowmanage',3),(2796,'192.168.42.195','2020-04-18 10:11:39','新建流程','/xinxeng',36),(2797,'192.168.42.195','2020-04-18 10:18:17','新建流程','/xinxeng',36),(2798,'192.168.42.195','2020-04-18 10:22:05','新建流程','/xinxeng',36),(2799,'192.168.42.195','2020-04-18 10:24:00','新建流程','/xinxeng',36),(2800,'192.168.42.195','2020-04-18 10:25:19','新建流程','/xinxeng',36),(2801,'192.168.42.195','2020-04-18 10:26:33','新建流程','/xinxeng',36),(2802,'192.168.42.195','2020-04-18 10:27:16','新建流程','/xinxeng',36),(2803,'192.168.42.195','2020-04-18 10:28:07','新建流程','/xinxeng',36),(2804,'192.168.42.195','2020-04-18 10:32:18','新建流程','/xinxeng',36),(2805,'192.168.42.195','2020-04-18 10:43:03','新建流程','/xinxeng',36),(2806,'192.168.42.195','2020-04-18 10:44:20','新建流程','/xinxeng',36),(2807,'192.168.42.195','2020-04-18 10:47:39','我的申请','/flowmanage',36),(2808,'192.168.42.195','2020-04-18 10:47:58','我的申请','/flowmanage',36),(2809,'192.168.42.195','2020-04-18 10:56:18','职位管理','/positionmanage',3),(2810,'192.168.42.195','2020-04-18 11:06:45','我的申请','/flowmanage',3),(2811,'192.168.42.195','2020-04-18 11:07:12','我的申请','/flowmanage',36),(2812,'192.168.42.195','2020-04-18 11:25:42','职位管理','/positionmanage',3),(2813,'192.168.42.195','2020-04-18 11:34:47','我的申请','/flowmanage',36),(2814,'192.168.42.195','2020-04-18 11:35:01','我的申请','/flowmanage',36),(2815,'192.168.42.195','2020-04-18 11:43:54','我的申请','/flowmanage',36),(2816,'192.168.42.195','2020-04-18 11:44:06','我的申请','/flowmanage',36),(2817,'192.168.42.195','2020-04-18 11:44:43','我的申请','/flowmanage',36),(2818,'192.168.42.195','2020-04-18 11:44:45','新建流程','/xinxeng',36),(2819,'192.168.42.195','2020-04-18 11:45:25','新建流程','/xinxeng',36),(2820,'192.168.42.195','2020-04-18 11:45:27','我的申请','/flowmanage',36),(2821,'192.168.42.195','2020-04-18 11:51:22','我的申请','/flowmanage',36),(2822,'192.168.42.195','2020-04-18 11:52:21','我的申请','/flowmanage',36),(2823,'192.168.42.195','2020-04-18 11:53:34','我的申请','/flowmanage',3),(2824,'192.168.42.195','2020-04-18 12:00:52','我的申请','/flowmanage',3),(2825,'192.168.42.195','2020-04-18 12:01:41','我的申请','/flowmanage',36),(2826,'192.168.42.195','2020-04-18 12:01:45','我的申请','/flowmanage',36),(2827,'192.168.42.195','2020-04-18 12:04:05','我的申请','/flowmanage',36),(2828,'192.168.42.195','2020-04-18 12:04:26','我的申请','/flowmanage',36),(2829,'192.168.42.195','2020-04-18 12:04:33','我的申请','/flowmanage',36),(2830,'192.168.42.195','2020-04-18 12:05:08','新建流程','/xinxeng',36),(2831,'192.168.42.195','2020-04-18 12:06:22','新建流程','/xinxeng',36),(2832,'192.168.42.195','2020-04-18 12:06:24','我的申请','/flowmanage',36),(2833,'192.168.42.195','2020-04-18 12:06:26','我的申请','/flowmanage',36),(2834,'192.168.42.195','2020-04-18 12:06:49','我的申请','/flowmanage',36),(2835,'192.168.42.195','2020-04-18 12:07:03','新建流程','/xinxeng',36),(2836,'192.168.42.195','2020-04-18 12:07:36','新建流程','/xinxeng',36),(2837,'192.168.42.195','2020-04-18 12:07:38','我的申请','/flowmanage',36),(2838,'192.168.42.195','2020-04-18 12:08:12','新建流程','/xinxeng',36),(2839,'192.168.42.195','2020-04-18 17:48:26','新建流程','/xinxeng',36),(2840,'192.168.42.195','2020-04-18 17:49:45','新建流程','/xinxeng',36),(2841,'192.168.42.195','2020-04-18 17:51:53','我的申请','/flowmanage',36),(2842,'192.168.42.195','2020-04-18 17:51:55','新建流程','/xinxeng',36),(2843,'192.168.42.195','2020-04-18 17:52:30','新建流程','/xinxeng',36),(2844,'192.168.42.195','2020-04-18 17:54:49','新建流程','/xinxeng',36),(2845,'192.168.42.195','2020-04-18 17:55:43','新建流程','/xinxeng',36),(2846,'192.168.42.195','2020-04-18 17:58:43','新建流程','/xinxeng',36),(2847,'192.168.42.195','2020-04-18 17:58:51','我的申请','/flowmanage',36),(2848,'192.168.42.195','2020-04-19 09:27:25','我的申请','/flowmanage',36),(2849,'192.168.42.195','2020-04-19 09:40:26','我的申请','/flowmanage',36),(2850,'192.168.42.195','2020-04-19 09:49:56','我的申请','/flowmanage',36),(2851,'192.168.42.195','2020-04-19 09:52:42','我的申请','/flowmanage',36),(2852,'192.168.42.195','2020-04-19 09:54:18','我的申请','/flowmanage',36),(2853,'192.168.42.195','2020-04-19 09:54:33','我的申请','/flowmanage',36),(2854,'192.168.42.195','2020-04-19 09:54:42','我的申请','/flowmanage',36),(2855,'192.168.42.195','2020-04-19 09:56:45','我的申请','/flowmanage',36),(2856,'192.168.42.195','2020-04-19 09:56:58','我的申请','/flowmanage',36),(2857,'192.168.42.195','2020-04-19 09:57:27','我的申请','/flowmanage',36),(2858,'192.168.42.195','2020-04-19 09:57:43','我的申请','/flowmanage',36),(2859,'192.168.42.195','2020-04-19 09:57:53','我的申请','/flowmanage',36),(2860,'192.168.42.195','2020-04-19 09:58:36','我的申请','/flowmanage',36),(2861,'192.168.42.195','2020-04-19 09:58:37','新建流程','/xinxeng',36),(2862,'192.168.42.195','2020-04-19 09:58:38','我的申请','/flowmanage',36),(2863,'192.168.42.195','2020-04-19 09:58:44','我的申请','/flowmanage',36),(2864,'192.168.42.195','2020-04-19 09:59:53','我的申请','/flowmanage',36),(2865,'192.168.42.195','2020-04-19 10:02:05','我的申请','/flowmanage',36),(2866,'192.168.42.195','2020-04-19 10:02:24','我的申请','/flowmanage',36),(2867,'192.168.42.195','2020-04-19 10:08:20','新建流程','/xinxeng',3),(2868,'192.168.42.195','2020-04-19 11:02:43','我的申请','/flowmanage',36),(2869,'192.168.42.195','2020-04-19 11:03:44','新建流程','/xinxeng',36),(2870,'192.168.42.195','2020-04-19 11:04:11','新建流程','/xinxeng',36),(2871,'192.168.42.195','2020-04-19 11:04:15','新建流程','/xinxeng',36),(2872,'192.168.42.195','2020-04-19 11:21:37','我的申请','/flowmanage',36),(2873,'192.168.42.195','2020-04-19 11:21:38','新建流程','/xinxeng',36),(2874,'192.168.42.195','2020-04-19 11:22:11','新建流程','/xinxeng',36),(2875,'192.168.42.195','2020-04-19 11:22:35','新建流程','/xinxeng',36),(2876,'192.168.42.195','2020-04-19 11:23:41','通讯录','/addrmanage',36),(2877,'192.168.42.195','2020-04-19 11:23:59','个人信息','/userpanel',36),(2878,'192.168.42.195','2020-04-19 11:24:04','通讯录','/addrmanage',36),(2879,'192.168.42.195','2020-04-19 11:24:12','通讯录','/addrmanage',36),(2880,'192.168.42.195','2020-04-19 11:25:14','新建流程','/xinxeng',36),(2881,'192.168.42.195','2020-04-19 11:26:57','新建流程','/xinxeng',36),(2882,'192.168.42.195','2020-04-19 11:37:22','新建流程','/xinxeng',36),(2883,'192.168.42.195','2020-04-19 11:38:41','新建流程','/xinxeng',36),(2884,'192.168.42.195','2020-04-19 11:39:17','新建流程','/xinxeng',36),(2885,'192.168.42.195','2020-04-19 11:44:22','新建流程','/xinxeng',36),(2886,'192.168.42.195','2020-04-19 11:46:43','新建流程','/xinxeng',36),(2887,'192.168.42.195','2020-04-19 11:48:25','新建流程','/xinxeng',36),(2888,'192.168.42.195','2020-04-19 11:54:28','新建流程','/xinxeng',36),(2889,'192.168.42.195','2020-04-19 11:58:36','新建流程','/xinxeng',36),(2890,'192.168.42.195','2020-04-19 12:04:52','新建流程','/xinxeng',36),(2891,'192.168.42.195','2020-04-19 12:09:20','新建流程','/xinxeng',36),(2892,'192.168.42.195','2020-04-19 12:11:12','新建流程','/xinxeng',36),(2893,'192.168.42.195','2020-04-19 12:16:26','新建流程','/xinxeng',36),(2894,'192.168.42.195','2020-04-19 12:19:35','新建流程','/xinxeng',36),(2895,'192.168.42.195','2020-04-19 12:20:16','新建流程','/xinxeng',36),(2896,'192.168.42.195','2020-04-19 12:21:03','新建流程','/xinxeng',36),(2897,'192.168.42.195','2020-04-19 12:21:26','新建流程','/xinxeng',36),(2898,'192.168.42.195','2020-04-19 12:24:10','新建流程','/xinxeng',36),(2899,'192.168.42.195','2020-04-19 12:25:58','新建流程','/xinxeng',36),(2900,'192.168.42.195','2020-04-19 12:28:50','新建流程','/xinxeng',36),(2901,'192.168.42.195','2020-04-19 12:33:12','新建流程','/xinxeng',36),(2902,'192.168.42.195','2020-04-19 12:33:57','新建流程','/xinxeng',36),(2903,'192.168.42.195','2020-04-19 12:34:23','新建流程','/xinxeng',36),(2904,'192.168.42.195','2020-04-19 12:36:15','新建流程','/xinxeng',36),(2905,'192.168.42.195','2020-04-19 12:37:19','新建流程','/xinxeng',36),(2906,'192.168.42.195','2020-04-19 12:39:53','新建流程','/xinxeng',36),(2907,'192.168.42.195','2020-04-19 12:40:26','新建流程','/xinxeng',36),(2908,'192.168.42.195','2020-04-19 12:40:36','新建流程','/xinxeng',36),(2909,'192.168.42.165','2020-04-19 19:30:16','菜单管理','/testsysmenu',1);

/*Table structure for table `aoa_user_login_record` */

DROP TABLE IF EXISTS `aoa_user_login_record`;

CREATE TABLE `aoa_user_login_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) DEFAULT NULL,
  `ip_addr` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `FKks6qpqj3ss4e4timjt0xok1p0` (`user_id`),
  CONSTRAINT `FKks6qpqj3ss4e4timjt0xok1p0` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_user_login_record` */

insert  into `aoa_user_login_record`(`record_id`,`browser`,`ip_addr`,`login_time`,`session_id`,`user_id`) values (626,'Chrome/78.0.3904.108','192.168.42.134','2020-03-28 23:19:37',NULL,1),(627,'Chrome/78.0.3904.108','192.168.42.112','2020-03-29 19:39:39',NULL,1),(628,'Firefox 7/74.0','192.168.42.217','2020-03-30 21:01:47',NULL,1),(629,'Firefox 7/74.0','192.168.42.217','2020-03-30 22:23:35',NULL,1),(630,'Firefox 7/74.0','192.168.42.217','2020-03-30 22:29:12',NULL,1),(631,'Chrome/78.0.3904.108','192.168.42.103','2020-03-31 20:35:38',NULL,1),(632,'Chrome/78.0.3904.108','192.168.42.103','2020-04-01 17:06:25',NULL,1),(633,'Chrome/78.0.3904.108','192.168.42.103','2020-04-01 18:26:07',NULL,1),(634,'Chrome/78.0.3904.108','192.168.42.103','2020-04-02 09:23:43',NULL,1),(635,'Chrome/78.0.3904.108','192.168.42.103','2020-04-02 09:54:53',NULL,1),(636,'Chrome/78.0.3904.108','192.168.42.103','2020-04-02 10:26:39',NULL,1),(637,'Chrome/78.0.3904.108','192.168.42.103','2020-04-02 10:36:12',NULL,1),(638,'Chrome/78.0.3904.108','192.168.42.103','2020-04-02 11:01:45',NULL,1),(639,'Chrome/78.0.3904.108','192.168.42.103','2020-04-02 16:46:01',NULL,1),(640,'Chrome/78.0.3904.108','192.168.42.103','2020-04-02 17:14:27',NULL,1),(641,'Chrome/78.0.3904.108','192.168.42.103','2020-04-02 21:03:56',NULL,1),(642,'Chrome/78.0.3904.108','192.168.42.103','2020-04-03 08:35:34',NULL,1),(643,'Chrome/78.0.3904.108','192.168.42.103','2020-04-03 08:52:19',NULL,1),(644,'Chrome/78.0.3904.108','192.168.42.103','2020-04-03 09:36:12',NULL,1),(645,'Chrome/78.0.3904.108','192.168.42.103','2020-04-03 10:47:13',NULL,1),(646,'Chrome/78.0.3904.108','192.168.42.103','2020-04-04 11:01:59',NULL,1),(647,'Chrome/78.0.3904.108','192.168.42.103','2020-04-04 19:59:18',NULL,1),(648,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 13:51:16',NULL,1),(649,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 14:16:43',NULL,1),(650,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 14:55:00',NULL,1),(651,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 15:14:06',NULL,1),(652,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 15:15:51',NULL,1),(653,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 15:41:17',NULL,1),(654,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 20:50:49',NULL,1),(655,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 21:36:52',NULL,1),(656,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 21:48:51',NULL,1),(657,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 21:53:10',NULL,1),(658,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 21:56:37',NULL,1),(659,'Chrome/78.0.3904.108','192.168.42.103','2020-04-05 22:02:07',NULL,1),(660,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 10:28:57',NULL,1),(661,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 12:20:55',NULL,1),(662,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 12:34:28',NULL,1),(663,'Firefox 7/74.0','192.168.42.103','2020-04-06 12:59:26',NULL,36),(664,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 14:04:47',NULL,1),(665,'Firefox 7/74.0','192.168.42.103','2020-04-06 14:27:54',NULL,36),(666,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 14:43:44',NULL,1),(667,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 19:49:01',NULL,1),(668,'Firefox 7/74.0','192.168.42.103','2020-04-06 20:59:53',NULL,36),(669,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 21:32:18',NULL,1),(670,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 21:36:54',NULL,1),(671,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 21:44:16',NULL,1),(672,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 21:47:32',NULL,1),(673,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 21:58:56',NULL,1),(674,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 22:02:02',NULL,1),(675,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 22:03:12',NULL,1),(676,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 22:07:03',NULL,1),(677,'Chrome/78.0.3904.108','192.168.42.103','2020-04-06 22:12:20',NULL,1),(678,'Firefox 7/74.0','192.168.42.103','2020-04-06 22:43:28',NULL,36),(679,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 08:08:41',NULL,1),(680,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 08:28:41',NULL,1),(681,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 08:31:53',NULL,1),(682,'Firefox 7/74.0','192.168.42.103','2020-04-07 08:34:29',NULL,36),(683,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 08:54:21',NULL,1),(684,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 09:08:26',NULL,1),(685,'Firefox 7/74.0','192.168.42.103','2020-04-07 09:08:51',NULL,36),(686,'Firefox 7/74.0','192.168.42.103','2020-04-07 09:45:35',NULL,36),(687,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 15:29:44',NULL,1),(688,'Firefox 7/74.0','192.168.42.103','2020-04-07 15:33:54',NULL,36),(689,'Firefox 7/74.0','192.168.42.103','2020-04-07 16:53:03',NULL,36),(690,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 16:53:10',NULL,1),(691,'Firefox 7/74.0','192.168.42.103','2020-04-07 19:38:23',NULL,36),(692,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 20:16:51',NULL,1),(693,'Chrome/78.0.3904.108','192.168.42.103','2020-04-07 21:57:38',NULL,1),(694,'Firefox 7/74.0','192.168.42.103','2020-04-07 22:08:58',NULL,36),(695,'Chrome/78.0.3904.108','192.168.42.103','2020-04-08 06:25:58',NULL,1),(696,'Chrome/78.0.3904.108','192.168.42.103','2020-04-08 07:12:01',NULL,1),(697,'Chrome/78.0.3904.108','192.168.42.103','2020-04-08 07:21:38',NULL,1),(698,'Firefox 7/74.0','192.168.42.103','2020-04-08 07:40:06',NULL,36),(699,'Chrome/78.0.3904.108','192.168.42.217','2020-04-08 08:36:18',NULL,1),(700,'Chrome/78.0.3904.108','192.168.42.217','2020-04-08 08:46:51',NULL,1),(701,'Chrome/78.0.3904.108','192.168.42.25','2020-04-08 14:23:48',NULL,1),(702,'Firefox 7/74.0','192.168.42.25','2020-04-08 14:58:08',NULL,2),(703,'Firefox 7/74.0','192.168.42.25','2020-04-08 17:14:36',NULL,2),(704,'Chrome/78.0.3904.108','192.168.42.25','2020-04-08 17:55:42',NULL,1),(705,'Chrome/78.0.3904.108','192.168.42.25','2020-04-09 07:53:54',NULL,1),(706,'Chrome/78.0.3904.108','192.168.42.25','2020-04-09 17:51:06',NULL,1),(707,'Chrome/78.0.3904.108','192.168.42.25','2020-04-09 21:29:15',NULL,1),(708,'Chrome/78.0.3904.108','192.168.42.25','2020-04-10 08:56:51',NULL,1),(709,'Chrome/78.0.3904.108','192.168.42.25','2020-04-10 09:48:55',NULL,1),(710,'Firefox 7/74.0','192.168.42.25','2020-04-10 10:33:24',NULL,36),(711,'Chrome/78.0.3904.108','192.168.42.25','2020-04-10 21:36:47',NULL,1),(712,'Chrome/78.0.3904.108','192.168.42.25','2020-04-11 10:04:18',NULL,1),(713,'Chrome/78.0.3904.108','192.168.42.25','2020-04-11 10:15:41',NULL,1),(714,'Firefox 7/75.0','192.168.42.25','2020-04-11 12:52:56',NULL,4),(715,'Firefox 7/75.0','192.168.42.25','2020-04-11 13:00:47',NULL,36),(716,'Chrome/78.0.3904.108','192.168.42.248','2020-04-14 22:13:20',NULL,1),(717,'Chrome/78.0.3904.108','192.168.42.248','2020-04-15 05:57:16',NULL,1),(718,'Firefox 7/75.0','192.168.42.248','2020-04-15 06:20:20',NULL,4),(719,'Chrome/78.0.3904.108','192.168.42.248','2020-04-15 16:18:55',NULL,1),(720,'Chrome/78.0.3904.108','192.168.42.248','2020-04-15 17:15:56',NULL,1),(721,'Firefox 7/75.0','192.168.42.248','2020-04-15 17:38:37',NULL,4),(722,'Firefox 7/75.0','192.168.42.248','2020-04-15 17:39:13',NULL,36),(723,'Chrome/78.0.3904.108','192.168.42.248','2020-04-15 18:51:40',NULL,1),(724,'Firefox 7/75.0','192.168.42.248','2020-04-15 20:30:25',NULL,36),(725,'Chrome/78.0.3904.108','192.168.42.248','2020-04-16 06:25:49',NULL,1),(726,'Firefox 7/75.0','192.168.42.248','2020-04-16 08:49:05',NULL,36),(727,'Chrome/78.0.3904.108','192.168.42.248','2020-04-16 09:06:19',NULL,1),(728,'Firefox 7/75.0','192.168.42.248','2020-04-16 09:06:32',NULL,36),(729,'Chrome/78.0.3904.108','192.168.42.248','2020-04-16 10:37:45',NULL,1),(730,'Chrome/78.0.3904.108','192.168.42.248','2020-04-16 15:48:31',NULL,1),(731,'Chrome/78.0.3904.108','192.168.42.248','2020-04-16 16:12:22',NULL,1),(732,'Firefox 7/75.0','192.168.42.248','2020-04-16 16:57:01',NULL,36),(733,'Firefox 7/75.0','192.168.42.248','2020-04-16 19:24:11',NULL,36),(734,'Chrome/78.0.3904.108','192.168.42.187','2020-04-17 08:53:11',NULL,1),(735,'Firefox 7/75.0','192.168.42.187','2020-04-17 08:53:58',NULL,36),(736,'Firefox 7/75.0','192.168.42.187','2020-04-17 12:19:15',NULL,3),(737,'Firefox 7/75.0','192.168.42.187','2020-04-17 12:22:06',NULL,36),(738,'Chrome/78.0.3904.108','192.168.42.187','2020-04-17 12:29:10',NULL,3),(739,'Firefox 7/75.0','192.168.42.187','2020-04-17 15:43:32',NULL,36),(740,'Firefox 7/75.0','192.168.42.187','2020-04-17 16:08:01',NULL,36),(741,'Chrome/78.0.3904.108','192.168.42.187','2020-04-17 16:08:08',NULL,3),(742,'Chrome/78.0.3904.108','192.168.42.187','2020-04-17 18:32:52',NULL,1),(743,'Chrome/78.0.3904.108','192.168.42.117','2020-04-17 23:31:36',NULL,1),(744,'Chrome/78.0.3904.108','192.168.42.195','2020-04-18 09:45:27',NULL,3),(745,'Firefox 7/75.0','192.168.42.195','2020-04-18 09:46:19',NULL,36),(746,'Firefox 7/75.0','192.168.42.195','2020-04-18 17:44:45',NULL,36),(747,'Chrome/78.0.3904.108','192.168.42.195','2020-04-18 17:44:58',NULL,3),(748,'Chrome/78.0.3904.108','192.168.42.195','2020-04-18 21:08:23',NULL,3),(749,'Chrome/78.0.3904.108','192.168.42.195','2020-04-19 09:23:56',NULL,3),(750,'Firefox 7/75.0','192.168.42.195','2020-04-19 09:27:21',NULL,36),(751,'Chrome/78.0.3904.108','192.168.42.195','2020-04-19 09:30:27',NULL,3),(752,'Chrome/78.0.3904.108','192.168.42.195','2020-04-19 09:31:01',NULL,5),(753,'Firefox 7/75.0','192.168.42.195','2020-04-19 10:02:15',NULL,36),(754,'Chrome/78.0.3904.108','192.168.42.165','2020-04-19 19:28:07',NULL,1);

/*Table structure for table `aoa_vote_list` */

DROP TABLE IF EXISTS `aoa_vote_list`;

CREATE TABLE `aoa_vote_list` (
  `vote_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` datetime DEFAULT NULL,
  `selectone` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_vote_list` */

insert  into `aoa_vote_list`(`vote_id`,`end_time`,`selectone`,`start_time`) values (1,'2017-10-04 21:52:48',1,'2017-10-03 21:52:48'),(2,'2017-10-04 21:54:36',1,'2017-10-03 21:54:36'),(3,'2017-10-04 23:18:52',1,'2017-10-03 23:18:52'),(4,'2017-10-03 02:57:33',2,'2017-10-04 02:57:33'),(5,'2017-10-05 03:18:25',1,'2017-10-04 03:18:25'),(7,'2017-10-30 15:27:03',2,'2017-10-27 15:27:03'),(8,'2017-10-18 16:01:25',2,'2017-10-04 16:01:25'),(9,'2017-10-06 22:53:22',2,'2017-10-05 22:53:22'),(10,'2017-10-06 22:56:45',2,'2017-10-05 22:56:45'),(11,'2017-10-06 22:57:59',1,'2017-10-05 22:57:59'),(12,'2017-10-13 23:25:24',1,'2017-10-12 23:25:24');

/*Table structure for table `aoa_vote_title_user` */

DROP TABLE IF EXISTS `aoa_vote_title_user`;

CREATE TABLE `aoa_vote_title_user` (
  `vote_title_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vote_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `title_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`vote_title_user_id`),
  KEY `FKb2pou179gr3wf10lx0wy6qrli` (`user_id`),
  KEY `FK79ia8m9w7faxi7wmth7or8mqg` (`title_id`),
  CONSTRAINT `FK79ia8m9w7faxi7wmth7or8mqg` FOREIGN KEY (`title_id`) REFERENCES `aoa_vote_titles` (`title_id`),
  CONSTRAINT `FKb2pou179gr3wf10lx0wy6qrli` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_vote_title_user` */

insert  into `aoa_vote_title_user`(`vote_title_user_id`,`vote_id`,`user_id`,`title_id`) values (1,3,1,7),(2,3,2,8),(3,3,3,9),(4,3,4,7),(5,1,2,2),(6,2,2,4),(7,4,2,11),(8,4,2,12),(9,4,2,13),(13,5,2,15),(17,8,2,23),(18,8,2,24),(19,8,2,25),(20,11,2,32),(21,8,1,23),(22,8,1,24),(23,8,1,25);

/*Table structure for table `aoa_vote_titles` */

DROP TABLE IF EXISTS `aoa_vote_titles`;

CREATE TABLE `aoa_vote_titles` (
  `title_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `vote_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`title_id`),
  KEY `FKnl21d99b8hc6gtfrrfsc9alge` (`vote_id`),
  CONSTRAINT `FKnl21d99b8hc6gtfrrfsc9alge` FOREIGN KEY (`vote_id`) REFERENCES `aoa_vote_list` (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aoa_vote_titles` */

insert  into `aoa_vote_titles`(`title_id`,`color`,`title`,`vote_id`) values (1,'#5bc0de','22222',1),(2,'#5bc0de','111111',1),(3,'#5bc0de','33333',1),(4,'#5bc0de','我的33333',2),(5,'#5bc0de','你的2222222',2),(6,'#5bc0de','他的44444',2),(7,'#7589d2','fsdfadsf',3),(8,'#292fce','fsafas',3),(9,'#5af4a3','dfa ',3),(10,'#5bc0de','他的44444',3),(11,'#8d0282','多选2 ',4),(12,'#57427f','多选三',4),(13,'#29bcfc','多选1',4),(14,'#79d8b7','去泰国',5),(15,'#4a7647','哇塞，去香港',5),(16,'#5627a7','去北京',5),(20,'#6653e0','222',7),(21,'#af8675','1111',7),(22,'#4414e5','333',7),(23,'#9cb08f','32131',8),(24,'#72e6e2','31231',8),(25,'#9a46f7','112312',8),(26,'#8da9b7','大师傅3',9),(27,'#efe79f','大师傅',9),(28,'#118a0a','这是投票4',10),(29,'#1c6035','这是投票1',10),(30,'#bf617e','这是投票3',10),(31,'#97dc10','这是投票2',10),(32,'#b90601','范德萨',11),(33,'#4c6a51','电风扇',11),(34,'#4504de','范德萨',12),(35,'#530145','地方撒',12);

/*Table structure for table `chat_friends` */

DROP TABLE IF EXISTS `chat_friends`;

CREATE TABLE `chat_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) DEFAULT NULL COMMENT '用户id',
  `fuserid` varchar(64) DEFAULT NULL COMMENT '好友id',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

/*Data for the table `chat_friends` */

insert  into `chat_friends`(`id`,`userid`,`fuserid`,`addtime`) values (1,'1571476959767947441','1571476959767947449','2019-12-01 17:14:56'),(2,'1571476959767947449','1571476959767947441','2019-12-01 17:15:01'),(3,'1571476959767947449','1571476959767947427','2019-12-01 17:24:04'),(4,'1575254996716916627','1571476959767947449','2019-12-02 10:50:24'),(5,'1571476959767947449','1575254996716916627','2019-12-02 10:50:29'),(6,'1571476959767947427','1571476959767947449','2019-12-02 13:58:11'),(7,'1571476959767947449','1571476959767947427','2019-12-02 13:58:11'),(8,'1571476959767947427','1571476959767947441','2019-12-02 13:58:24'),(9,'1571476959767947441','1571476959767947427','2019-12-02 13:58:24'),(10,'1571476959767947441','1575254996716916627','2020-03-26 21:45:22'),(11,'1575254996716916627','1571476959767947441','2020-03-26 21:45:22'),(12,'1','36','2020-04-06 13:09:44'),(13,'36','1','2020-04-06 13:13:55'),(16,'1','2','2020-04-07 21:16:03'),(17,'2','1','2020-04-07 21:16:03'),(26,'1','3','2020-04-08 06:52:37'),(27,'3','1','2020-04-08 06:52:37'),(28,'1','4','2020-04-08 07:28:49'),(29,'4','1','2020-04-08 07:28:49'),(30,'36','2','2020-04-08 07:42:31'),(31,'2','36','2020-04-08 07:42:31');

/*Table structure for table `chat_msg` */

DROP TABLE IF EXISTS `chat_msg`;

CREATE TABLE `chat_msg` (
  `senduserid` varchar(64) DEFAULT NULL COMMENT '发送者id',
  `reciveuserid` varchar(64) DEFAULT NULL COMMENT '接收者id',
  `sendtext` text COMMENT '发送内容',
  `sendtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `msgtype` varchar(64) DEFAULT NULL COMMENT '消息类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `chat_msg` */

insert  into `chat_msg`(`senduserid`,`reciveuserid`,`sendtext`,`sendtime`,`msgtype`) values ('1571476959767947441','1571476959767947449','<p>你好</p>','2020-03-26 22:19:35','0'),('1571476959767947449','1571476959767947441','你好啊','2020-03-26 22:19:43','0'),('1571476959767947441','1571476959767947449','hello world','2020-03-26 22:19:57','0'),('1571476959767947441','1571476959767947449','<img src=\"http://localhost:8080/static/layui/images/face/36.gif\" alt=\"[酷]\">','2020-03-26 22:20:03','0'),('1571476959767947449','1571476959767947441','<img src=\"http://localhost:8080/static/layui/images/face/5.gif\" alt=\"[挖鼻]\">','2020-03-26 22:20:09','0'),('1571476959767947441','1571476959767947449','<img src=\"/pic/0de577a2da8d4202b2659f644145411a.png\" alt=\"undefined\">','2020-03-26 22:20:26','0'),('1571476959767947449','1571476959767947441','<img src=\"/pic/c4cd234427584ad5b3735c12a9efa2ba.png\" alt=\"undefined\">','2020-03-26 22:20:38','0'),('36','1','罗密欧你好呀<br>','2020-04-07 08:54:51','0'),('36','1','这是怎么回事呀','2020-04-07 08:58:06','0'),('1','36','嗯嗯','2020-04-07 09:08:37','0'),('36','1','<img src=\"http://localhost:8888/static/layui/images/face/1.gif\" alt=\"[嘻嘻]\"><img src=\"http://localhost:8888/static/layui/images/face/31.gif\" alt=\"[汗]\">','2020-04-07 09:09:24','0'),('1','36','你这个智障','2020-04-07 09:09:37','0'),('36','1','我直接开花','2020-04-07 09:40:33','0'),('36','1','你知道吗我有多爱你','2020-04-07 09:40:49','0'),('1','36','哦哦知道了','2020-04-07 09:41:21','0'),('1','36','可是我已经有男朋友了','2020-04-07 09:41:38','0'),('36','1','那又怎样，没有挖不动的墙角','2020-04-07 09:41:52','0'),('36','1','放心，我会等你的<br>','2020-04-07 09:42:02','0'),('36','1','我是不会放弃的','2020-04-07 09:42:10','0'),('1','36','傻瓜<img src=\"http://localhost:8888/static/layui/images/face/13.gif\" alt=\"[偷笑]\">','2020-04-07 15:36:04','0'),('36','1','哈哈<br>','2020-04-07 15:36:31','0'),('36','1','<img src=\"/pic/fb02090c3bcb4826a6e36a9c12645c4d.jpg\" alt=\"undefined\">','2020-04-07 15:53:11','0'),('1','36','<img src=\"/pic/8b23ba7225d943f5be74fee7b8021aaa.jpg\" alt=\"undefined\">','2020-04-07 15:55:39','0'),('36','1','哈哈哈，刘大庆牛逼<br>','2020-04-07 23:03:29','0'),('1','2','<p><br></p><p><br></p>','2020-04-08 06:29:41','0'),('1','2','朱丽叶我想你了','2020-04-08 14:57:36','0'),('2','1','哈哈，我也想你了呢<img src=\"http://localhost:8888/static/layui/images/face/37.gif\" alt=\"[色]\"><br>','2020-04-08 15:02:43','0'),('1','2','周末一起吃饭吧','2020-04-08 15:03:11','0'),('2','1','好呀','2020-04-08 15:03:16','0'),('1','36','<p>我操你大爷</p>','2020-04-11 12:51:14','0');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uid',
  `userid` varchar(64) DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `usign` varchar(512) DEFAULT NULL,
  `uimg` varchar(512) DEFAULT '/pic/userdefaultimg.jpg' COMMENT '用户头像',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `userinfo` */

insert  into `userinfo`(`uid`,`userid`,`nickname`,`usign`,`uimg`) values (1,'1571476959767947441','小A','无冥冥之志者，无昭昭之明；无惛惛之事者，无赫赫之功。','/pic/xa.png'),(2,'1571476959767947449','小B','与我捻熄灯，同我书半生。问我粥可温，同我立黄昏。','/pic/xb.png'),(3,'1571476959767947427','小C','人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。','/pic/xc.png'),(4,'1575254996716916627','小D','心之所向，素履以往，生如逆旅，一苇以航。','/pic/xd.png'),(5,'1','罗密欧','刘大庆NB','6aea3f2567da48bbaea93acca1887f55_QQ图片20200119122020.jpg'),(7,'36','刘大庆','你大爷','77708f3f6469470285cada4a794b5a50_QQ图片20190317202325.jpg'),(9,'2','朱丽叶','天天向上','/simpletest.jpeg'),(14,'3','伊丽莎白','好学','/test1.jpg'),(15,'4','小李父斯基','天天努力','/test2.jpeg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
