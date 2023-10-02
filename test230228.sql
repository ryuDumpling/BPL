/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2023/2/28 16:04:49
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for administratorpc
-- ----------------------------
DROP TABLE IF EXISTS `administratorpc`;
CREATE TABLE `administratorpc` (
  `administratorpc_name` char(5) NOT NULL default '',
  `administratorpc_password` char(6) default NULL,
  PRIMARY KEY  (`administratorpc_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dtsc
-- ----------------------------
DROP TABLE IF EXISTS `dtsc`;
CREATE TABLE `dtsc` (
  `dtsc_id` varchar(5) NOT NULL,
  `dtsc_yh_id` char(10) NOT NULL,
  `dtsc_dt_id` varchar(5) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`dtsc_id`),
  KEY `fk_dtsc_yh_id` (`dtsc_yh_id`),
  KEY `fk_dtsc_dt_id` (`dtsc_dt_id`),
  CONSTRAINT `fk_dtsc_dt_id` FOREIGN KEY (`dtsc_dt_id`) REFERENCES `mfdt` (`mfdt_id`),
  CONSTRAINT `fk_dtsc_yh_id` FOREIGN KEY (`dtsc_yh_id`) REFERENCES `yh` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dy
-- ----------------------------
DROP TABLE IF EXISTS `dy`;
CREATE TABLE `dy` (
  `dy_id` varchar(5) NOT NULL,
  `dy_yh_id` char(10) NOT NULL,
  `dy_tm` text NOT NULL,
  `dy_nr` text NOT NULL,
  `dy_sj` datetime NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`dy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dypl
-- ----------------------------
DROP TABLE IF EXISTS `dypl`;
CREATE TABLE `dypl` (
  `dypl_id` varchar(5) NOT NULL,
  `dypl_yh_id` char(10) NOT NULL,
  `dypl__dy_id` varchar(5) NOT NULL,
  `dypl_nr` text NOT NULL,
  `dypl_sj` datetime NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`dypl_id`),
  KEY `fk_dypl_yh_id` (`dypl_yh_id`),
  KEY `fk_dypl__dy_id` (`dypl__dy_id`),
  CONSTRAINT `fk_dypl_yh_id` FOREIGN KEY (`dypl_yh_id`) REFERENCES `yh` (`yh_id`),
  CONSTRAINT `fk_dypl__dy_id` FOREIGN KEY (`dypl__dy_id`) REFERENCES `dy` (`dy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for first_page
-- ----------------------------
DROP TABLE IF EXISTS `first_page`;
CREATE TABLE `first_page` (
  `page_no` char(10) NOT NULL,
  `tea_no` char(10) NOT NULL,
  `page_kind_article` text NOT NULL,
  `page_kind_article_name` text NOT NULL,
  `page_kind_article_pname` varchar(20) default NULL,
  `page_delete` int(1) NOT NULL default '0',
  `read_1` varchar(20) NOT NULL default '0',
  PRIMARY KEY  (`page_no`),
  KEY `fk_first_page` (`tea_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for flyzzx
-- ----------------------------
DROP TABLE IF EXISTS `flyzzx`;
CREATE TABLE `flyzzx` (
  `flyzzx_id` varchar(5) NOT NULL,
  `flyzzx_mc` varchar(99) NOT NULL,
  `flyzzx_js` text NOT NULL,
  `flyzzx_dh` char(99) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`flyzzx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for flyzzxpl
-- ----------------------------
DROP TABLE IF EXISTS `flyzzxpl`;
CREATE TABLE `flyzzxpl` (
  `flyzzxpl_id` varchar(5) NOT NULL,
  `flyzzxpl_yh_id` char(10) default NULL,
  `flyzzx_id` varchar(5) default NULL,
  `flyzzxpl_nr` text,
  `flyzzxpl_sj` datetime default NULL,
  `is_delete` int(1) default '0',
  PRIMARY KEY  (`flyzzxpl_id`),
  KEY `fk_flyzzxpl_yh_id` (`flyzzxpl_yh_id`),
  KEY `fk_flyzzx_id` (`flyzzx_id`),
  CONSTRAINT `fk_flyzzxpl_yh_id` FOREIGN KEY (`flyzzxpl_yh_id`) REFERENCES `yh` (`yh_id`),
  CONSTRAINT `fk_flyzzx_id` FOREIGN KEY (`flyzzx_id`) REFERENCES `flyzzx` (`flyzzx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsmfdzl
-- ----------------------------
DROP TABLE IF EXISTS `hsmfdzl`;
CREATE TABLE `hsmfdzl` (
  `hsmfdzl_id` varchar(5) NOT NULL,
  `hsmfdzl_mc` varchar(10) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`hsmfdzl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jdal
-- ----------------------------
DROP TABLE IF EXISTS `jdal`;
CREATE TABLE `jdal` (
  `jdal_id` varchar(5) NOT NULL,
  `jdal_mc` varchar(99) NOT NULL,
  `jdal_jdalfl_id` varchar(5) NOT NULL,
  `jdal_nr` text NOT NULL,
  `is_delete` int(1) default '0',
  `ah` varchar(99) default NULL,
  PRIMARY KEY  (`jdal_id`),
  KEY `fk_jdal_jdalfl_id` (`jdal_jdalfl_id`),
  CONSTRAINT `fk_jdal_jdalfl_id` FOREIGN KEY (`jdal_jdalfl_id`) REFERENCES `jdalfl` (`jdalfl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jdalfl
-- ----------------------------
DROP TABLE IF EXISTS `jdalfl`;
CREATE TABLE `jdalfl` (
  `jdalfl_id` varchar(5) NOT NULL,
  `jdalfl_mc` varchar(20) NOT NULL,
  `is_delete` int(1) default '0',
  PRIMARY KEY  (`jdalfl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jdaltp
-- ----------------------------
DROP TABLE IF EXISTS `jdaltp`;
CREATE TABLE `jdaltp` (
  `jdaltp_id` varchar(5) NOT NULL,
  `jdaltp_mc` varchar(20) NOT NULL default 'jdaltp.png',
  `jdaltp_jdal_id` varchar(5) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`jdaltp_id`),
  CONSTRAINT `fk_jdaltp_id` FOREIGN KEY (`jdaltp_id`) REFERENCES `jdal` (`jdal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ls
-- ----------------------------
DROP TABLE IF EXISTS `ls`;
CREATE TABLE `ls` (
  `ls_id` varchar(5) NOT NULL,
  `ls_xm` varchar(20) NOT NULL,
  `ls_xb` char(2) NOT NULL,
  `ls_nl` int(3) NOT NULL,
  `ls_tx` varchar(20) NOT NULL,
  `ls_xxjs` text NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  `ls_tp` varchar(5) NOT NULL,
  PRIMARY KEY  (`ls_id`),
  KEY `lstp_ID` (`ls_tp`),
  CONSTRAINT `lstp_ID` FOREIGN KEY (`ls_tp`) REFERENCES `lstp` (`lstp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lsdy
-- ----------------------------
DROP TABLE IF EXISTS `lsdy`;
CREATE TABLE `lsdy` (
  `lsdy_id` varchar(5) NOT NULL,
  `lsdy_yh_id` char(10) NOT NULL,
  `lsdy_ls_id` varchar(5) NOT NULL,
  `lsdy_dy_id` varchar(5) NOT NULL,
  `lsdy_jd` text NOT NULL,
  `lsdy_sj` datetime NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`lsdy_id`),
  KEY `fk_lsdy_yh_id` (`lsdy_yh_id`),
  KEY `fk_lsdy_ls_id` (`lsdy_ls_id`),
  KEY `fk_lsdy_dy_id` (`lsdy_dy_id`),
  CONSTRAINT `fk_lsdy_dy_id` FOREIGN KEY (`lsdy_dy_id`) REFERENCES `dy` (`dy_id`),
  CONSTRAINT `fk_lsdy_ls_id` FOREIGN KEY (`lsdy_ls_id`) REFERENCES `ls` (`ls_id`),
  CONSTRAINT `fk_lsdy_yh_id` FOREIGN KEY (`lsdy_yh_id`) REFERENCES `yh` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lssc
-- ----------------------------
DROP TABLE IF EXISTS `lssc`;
CREATE TABLE `lssc` (
  `lssc_id` varchar(5) NOT NULL,
  `lssc_yh_id` char(10) NOT NULL,
  `lssc_ls_id` varchar(5) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`lssc_id`),
  KEY `fk_lssc_yh_id` (`lssc_yh_id`),
  KEY `fk_lssc_ls_id` (`lssc_ls_id`),
  CONSTRAINT `fk_lssc_ls_id` FOREIGN KEY (`lssc_ls_id`) REFERENCES `ls` (`ls_id`),
  CONSTRAINT `fk_lssc_yh_id` FOREIGN KEY (`lssc_yh_id`) REFERENCES `yh` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lstp
-- ----------------------------
DROP TABLE IF EXISTS `lstp`;
CREATE TABLE `lstp` (
  `lstp_id` varchar(5) NOT NULL,
  `ls_id` varchar(5) NOT NULL,
  `lstp` varchar(20) NOT NULL default 'lstp_default.png',
  PRIMARY KEY  (`lstp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mfdptsfjs
-- ----------------------------
DROP TABLE IF EXISTS `mfdptsfjs`;
CREATE TABLE `mfdptsfjs` (
  `mfdptsfjs_id` varchar(5) NOT NULL,
  `mfdptsfjs_mc` varchar(99) default NULL,
  `mfdptsfjs_fl` varchar(5) default NULL,
  `mfdptsfjs_jsnr` text,
  `is_delete` int(1) default '0',
  `ts` varchar(99) default NULL,
  PRIMARY KEY  (`mfdptsfjs_id`),
  KEY `fk_mfdptsfjs_fl` (`mfdptsfjs_fl`),
  CONSTRAINT `fk_mfdptsfjs_fl` FOREIGN KEY (`mfdptsfjs_fl`) REFERENCES `mfdptsfjsfl` (`mfdptsfjsfl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mfdptsfjsfl
-- ----------------------------
DROP TABLE IF EXISTS `mfdptsfjsfl`;
CREATE TABLE `mfdptsfjsfl` (
  `mfdptsfjsfl_id` varchar(5) NOT NULL,
  `mfdptsfjsfl_flmc` varchar(20) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`mfdptsfjsfl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mfdsfjs
-- ----------------------------
DROP TABLE IF EXISTS `mfdsfjs`;
CREATE TABLE `mfdsfjs` (
  `mfdsfjs_id` varchar(5) NOT NULL,
  `mfdsfjs_jsmc` varchar(99) default NULL,
  `mfdsfjs_fl` varchar(20) default NULL,
  `mfdsfjs_ptnr` text,
  `is_delete` int(1) default '0',
  `ts` varchar(99) default NULL,
  PRIMARY KEY  (`mfdsfjs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mfdt
-- ----------------------------
DROP TABLE IF EXISTS `mfdt`;
CREATE TABLE `mfdt` (
  `mfdt_id` varchar(5) NOT NULL,
  `mfdt_mc` text NOT NULL,
  `mfdt_zl_id` varchar(5) NOT NULL,
  `mfdt_rq` datetime NOT NULL,
  `mfdt_zz` varchar(20) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`mfdt_id`),
  KEY `fk_mfdt_zl_id` (`mfdt_zl_id`),
  CONSTRAINT `fk_mfdt_zl_id` FOREIGN KEY (`mfdt_zl_id`) REFERENCES `mfdtzl` (`mfdtzl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mfdtzl
-- ----------------------------
DROP TABLE IF EXISTS `mfdtzl`;
CREATE TABLE `mfdtzl` (
  `mfdtzl_id` varchar(5) NOT NULL,
  `mfdtzl_mc` varchar(20) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`mfdtzl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mh
-- ----------------------------
DROP TABLE IF EXISTS `mh`;
CREATE TABLE `mh` (
  `mh_id` varchar(5) NOT NULL,
  `mh_tm` varchar(20) NOT NULL,
  `mh_zl_id` varchar(5) NOT NULL,
  `mh_rq` datetime NOT NULL,
  `mh_zz` varchar(20) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`mh_id`),
  KEY `fk_mh_zl_id` (`mh_zl_id`),
  CONSTRAINT `fk_mh_zl_id` FOREIGN KEY (`mh_zl_id`) REFERENCES `hsmfdzl` (`hsmfdzl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mhsc
-- ----------------------------
DROP TABLE IF EXISTS `mhsc`;
CREATE TABLE `mhsc` (
  `mhsc_id` varchar(5) NOT NULL,
  `mhsc_yh_id` char(10) NOT NULL,
  `mhsc_mh_id` varchar(5) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`mhsc_id`),
  KEY `fk_mhsc_yh_id` (`mhsc_yh_id`),
  KEY `fk_mhsc_mh_id` (`mhsc_mh_id`),
  CONSTRAINT `fk_mhsc_mh_id` FOREIGN KEY (`mhsc_mh_id`) REFERENCES `mh` (`mh_id`),
  CONSTRAINT `fk_mhsc_yh_id` FOREIGN KEY (`mhsc_yh_id`) REFERENCES `yh` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mhtp
-- ----------------------------
DROP TABLE IF EXISTS `mhtp`;
CREATE TABLE `mhtp` (
  `mhtp_id` varchar(5) NOT NULL,
  `mh_id` varchar(10) NOT NULL,
  `mhtp_mc` varchar(20) NOT NULL default 'mhtp.png',
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`mhtp_id`),
  KEY `mh_id` (`mh_id`),
  CONSTRAINT `mh_id` FOREIGN KEY (`mh_id`) REFERENCES `mh` (`mh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pfsp
-- ----------------------------
DROP TABLE IF EXISTS `pfsp`;
CREATE TABLE `pfsp` (
  `pfsp_id` varchar(5) NOT NULL,
  `pfsp_mc` varchar(20) NOT NULL default 'pfsp.mp4',
  `pfsp_zl_id` varchar(5) NOT NULL,
  `pfsp_rq` datetime NOT NULL,
  `pfsp_zz` varchar(20) NOT NULL,
  `pfsp_js` text,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`pfsp_id`),
  KEY `fk_pfsp_zl_id` (`pfsp_zl_id`),
  CONSTRAINT `fk_pfsp_zl_id` FOREIGN KEY (`pfsp_zl_id`) REFERENCES `hsmfdzl` (`hsmfdzl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `page_no` varchar(99) NOT NULL,
  `picture1` varchar(99) default NULL,
  `picture2` varchar(99) default NULL,
  `picture3` varchar(99) default NULL,
  PRIMARY KEY  (`page_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sfrz
-- ----------------------------
DROP TABLE IF EXISTS `sfrz`;
CREATE TABLE `sfrz` (
  `sf_id` varchar(99) NOT NULL default '',
  `sf_sfrz` varchar(99) default NULL,
  `sf_sfzh` varchar(99) default NULL,
  `is_delete` int(1) default '0',
  PRIMARY KEY  (`sf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for spsc
-- ----------------------------
DROP TABLE IF EXISTS `spsc`;
CREATE TABLE `spsc` (
  `spsc_id` varchar(5) NOT NULL,
  `spsc_yh_id` char(10) NOT NULL,
  `spsc_sp_id` varchar(5) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`spsc_id`),
  KEY `fk_spsc_yh_id` (`spsc_yh_id`),
  KEY `fk_spsc_sp_id` (`spsc_sp_id`),
  CONSTRAINT `fk_spsc_sp_id` FOREIGN KEY (`spsc_sp_id`) REFERENCES `pfsp` (`pfsp_id`),
  CONSTRAINT `fk_spsc_yh_id` FOREIGN KEY (`spsc_yh_id`) REFERENCES `yh` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tswz
-- ----------------------------
DROP TABLE IF EXISTS `tswz`;
CREATE TABLE `tswz` (
  `tswz_id` varchar(5) NOT NULL,
  `tswz_wztm` char(10) NOT NULL,
  `tswz_sj` datetime NOT NULL,
  `tswz_nr` varchar(5) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`tswz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yh
-- ----------------------------
DROP TABLE IF EXISTS `yh`;
CREATE TABLE `yh` (
  `yh_id` char(10) NOT NULL,
  `yh_mm` varchar(20) NOT NULL,
  `yh_nc` varchar(20) NOT NULL,
  `yh_nl` int(3) NOT NULL default '3',
  `yh_yx` varchar(25) NOT NULL,
  `yh_dh` char(11) NOT NULL,
  `yh_tp` varchar(20) default '0',
  `yh_pfdj` int(11) NOT NULL default '0',
  `yh_sf` int(11) NOT NULL default '1',
  `is_delete` int(1) NOT NULL default '0',
  `yh_sex` varchar(1) default '男',
  `yh_qianming` text,
  PRIMARY KEY  (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yhsc
-- ----------------------------
DROP TABLE IF EXISTS `yhsc`;
CREATE TABLE `yhsc` (
  `yhsc_id` varchar(5) NOT NULL,
  `yhsc_yh_id` char(10) NOT NULL,
  `yhsc_yhsclb_id` varchar(5) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`yhsc_id`),
  KEY `fk_yhsc_yh_id` (`yhsc_yh_id`),
  KEY `fk_yhsc_yhsclb_id` (`yhsc_yhsclb_id`),
  CONSTRAINT `fk_yhsc_yhsclb_id` FOREIGN KEY (`yhsc_yhsclb_id`) REFERENCES `yhsclb` (`yhsclb_id`),
  CONSTRAINT `fk_yhsc_yh_id` FOREIGN KEY (`yhsc_yh_id`) REFERENCES `yh` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yhsclb
-- ----------------------------
DROP TABLE IF EXISTS `yhsclb`;
CREATE TABLE `yhsclb` (
  `yhsclb_id` varchar(5) NOT NULL,
  `yhsclb_mc` varchar(20) NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`yhsclb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yhtp
-- ----------------------------
DROP TABLE IF EXISTS `yhtp`;
CREATE TABLE `yhtp` (
  `yhtp_id` varchar(20) NOT NULL,
  `yh_id` char(10) NOT NULL,
  `yhtp` varchar(20) NOT NULL default 'yhtp_default.png',
  PRIMARY KEY  (`yhtp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yjfk
-- ----------------------------
DROP TABLE IF EXISTS `yjfk`;
CREATE TABLE `yjfk` (
  `yjfk_id` varchar(5) NOT NULL,
  `yh_id` char(10) NOT NULL,
  `yjfk_fknr` text NOT NULL,
  `is_delete` int(1) NOT NULL default '0',
  `fk` text,
  PRIMARY KEY  (`yjfk_id`),
  KEY `fk_yh_id` (`yh_id`),
  CONSTRAINT `fk_yh_id` FOREIGN KEY (`yh_id`) REFERENCES `yh` (`yh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yzsc
-- ----------------------------
DROP TABLE IF EXISTS `yzsc`;
CREATE TABLE `yzsc` (
  `yzsc_id` varchar(99) character set utf8 NOT NULL,
  `yzsc_yh_id` varchar(99) NOT NULL,
  `yzsc_yz_id` varchar(99) NOT NULL,
  `is_delet` int(1) default '0',
  PRIMARY KEY  (`yzsc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for zjmfd
-- ----------------------------
DROP TABLE IF EXISTS `zjmfd`;
CREATE TABLE `zjmfd` (
  `ft_ID` varchar(99) NOT NULL,
  `bm` varchar(99) default NULL,
  `zm` varchar(99) default NULL,
  `ts` varchar(99) default NULL,
  `nr` text,
  `is_delete` int(1) default '0',
  PRIMARY KEY  (`ft_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zxtp
-- ----------------------------
DROP TABLE IF EXISTS `zxtp`;
CREATE TABLE `zxtp` (
  `xztp_id` varchar(99) NOT NULL default '',
  `flyzzx_id` varchar(99) default NULL,
  `tp` varchar(99) default NULL,
  `is_delete` int(1) default '0',
  PRIMARY KEY  (`xztp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `administratorpc` VALUES ('10001', '123456');
INSERT INTO `administratorpc` VALUES ('10002', '123456');
INSERT INTO `administratorpc` VALUES ('10003', '1234');
INSERT INTO `administratorpc` VALUES ('10004', '1234');
INSERT INTO `administratorpc` VALUES ('10005', '12345');
INSERT INTO `administratorpc` VALUES ('10006', '12345');
INSERT INTO `administratorpc` VALUES ('10007', '12345');
INSERT INTO `administratorpc` VALUES ('10008', '12345');
INSERT INTO `administratorpc` VALUES ('10009', '12345');
INSERT INTO `administratorpc` VALUES ('10010', '12345');
INSERT INTO `dtsc` VALUES ('10001', '10001', '10001', '0');
INSERT INTO `dtsc` VALUES ('10002', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10003', '10003', '10002', '0');
INSERT INTO `dtsc` VALUES ('10004', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10005', '10003', '10012', '0');
INSERT INTO `dtsc` VALUES ('10006', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10007', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10008', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10009', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10010', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10011', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10012', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10013', '10003', '10001', '0');
INSERT INTO `dtsc` VALUES ('10014', '10003', '10018', '0');
INSERT INTO `dtsc` VALUES ('10015', '10003', '10026', '0');
INSERT INTO `dtsc` VALUES ('10016', '10003', '10025', '0');
INSERT INTO `dtsc` VALUES ('10017', '10003', '10026', '0');
INSERT INTO `dy` VALUES ('10001', '10001', '肤质自测（夜猫版）', '1.你是否在不涂抹任何护肤品入睡后第二天早上感到面部油腻……', '2022-11-26 23:59:59', '0');
INSERT INTO `dy` VALUES ('10002', '10002', '肤质自测（18up版）', '1.你是否在洗完脸后15min内感到面部紧绷……', '2022-09-22 23:59:59', '0');
INSERT INTO `dy` VALUES ('10003', '10003', '肤质自测（未成年版）', '1.你是否在洗完脸后15min内感到面部紧绷……', '2023-01-19 23:59:59', '0');
INSERT INTO `dypl` VALUES ('10001', '10001', '10001', '1.你是否在洗完脸后15min内感到面部紧绷……', '2022-10-13 23:59:59', '0');
INSERT INTO `dypl` VALUES ('10002', '10002', '10002', '1.你是否在不涂抹任何护肤品入睡后第二天早上感到面部油腻……', '2022-11-23 23:59:59', '0');
INSERT INTO `first_page` VALUES ('1000000001', '1000000001', '前一阵子，北京冬奥还没开幕，大家就被吉祥物“冰墩墩”可爱住了。冬奥会开幕以后，“冰墩墩”迅速成为新晋“顶流”火爆全网，线上线下冬奥特许专卖店更是“一墩难求”。吉祥物“冰墩墩”并非近日才面世，早在2019年9月，2022年北京冬奥会吉祥物的面纱就在首钢冰球馆揭开，相关周边也在商店上架，但少有人问津。是什么让这只穿着冰晶套子的可爱熊猫“冰墩墩”在短短几天内翻红，由无名小卒摇身一变成为炙手可热的“热墩墩”？\r\n\r\n　　“冰墩墩”的出圈故事\r\n\r\n　　“冰墩墩”第一次在公众面前掀起热度源于和日本记者辻冈义堂的故事。2月2日，辻冈义堂在与演播室连线报道花滑现场时，突然掀开衣服大秀自己新收集的“冰墩墩”徽章，辻冈义堂和冰墩墩因此走红。因为太迷恋“冰墩墩”，辻冈义堂还被网友亲切地称为“义墩墩”\r\n此后，许多公众人物和知名运动员都表达了对这只可爱熊猫吉祥物的喜爱。2月5日，摩纳哥亲王阿尔贝二世在人民大会堂体验面塑制作时，请求工作人员为他的一对龙凤胎儿女做两个面人“冰墩墩”。2月7日，喜提单板滑雪坡面障碍技巧银牌的17岁小将苏翊鸣，开心地捧着金色限量款冰墩墩说，想通过努力赢得更多冰墩墩。接受赛后采访时，他做的第一件事也是从包里掏出冰墩墩“炫耀”。\r\n靠着日本记者、冬奥运动员以及知名公众人物的多路加持，“冰墩墩”的人气一路攀升。许多被成功“安利”的网友也纷纷开始在网络上反向输出“冰墩墩”的表情包、同人', '“冰墩墩”的出圈故事', '1', '0', '12');
INSERT INTO `first_page` VALUES ('1000000002', '1000000002', '今年寒假，与以往的假期相比，石家庄市五年级学生冯梓涵的生活格外不同。\r\n\r\n　　“作业变少了，还不用上课外班，网络游戏有时间限制，我也不用再惦记了。几乎每天都跟着表哥去附近的公共篮球场打球。”冯梓涵说。\r\n\r\n　　记者翻看冯梓涵制定的每日、每周作息时间表，看到周五、周六、周日晚上是他玩游戏的时间。在这三天内，平时晚上安排的读书、背诗、家务等任务他都会提前在白天完成。看起来，冯梓涵在有“游戏时间”的三天里反而比平时要忙碌。\r\n\r\n　　2021年8月，国家新闻出版署下发《关于进一步严格管理 切实防止未成年人沉迷网络游戏的通知》，对未成年人游戏时间做出严格缩减，要求所有网络游戏企业仅可在周五、周六、周日及法定节假日每日20时至21时向未成年人提供1小时服务，其他时间均不得以任何形式向未成年人提供网络游戏服务。\r\n\r\n　　记者在石家庄走访时，不少中小学生家长表示，新规定不仅缩短了孩子玩游戏的时间，更重要的是，让孩子在其他时间里彻底“断了念想”。', '网络游戏新规后的首个暑假', '1', '0', '5');
INSERT INTO `first_page` VALUES ('1000000003', '1000000003', '12月11日上午，区委副书记、区长杨传军察看重点区域大气污染防治工作，详细了解施工工地扬尘防治、道路精细化清扫等重点工作开展情况，对落实大气污染防治工作提出具体要求，副区长赵琳、王锐参加活动。\r\n\r\n杨传军一行先后察看国熙台二期、大华紫郡二期建筑工地等重点区域，每到一处，杨传军都详细了解项目施工进度、扬尘治理措施落实情况，叮嘱企业负责人认真履行大气污染防治责任，在全力抢工期、赶进度的同时坚持标准化作业，加强施工现场管理，严格落实各项扬尘治理措施。在步行查看重点道路交通情况时，杨传军指出，要加强科学管控，提前合理规划，提升城市通达能力，最大限度降低对大气环境质量的影响。\r\n\r\n杨传军强调，大气污染防治既是重大的民生工程，更是严肃的政治任务，各级各有关部门要坚决扛起政治责任，强化担当意识，全力打好打赢空气质量争先进位30天攻坚战。要高度重视重点区域大气污染防治工作，加强分析研判，坚持科学精准治理，对关键污染源、重要污染区域制定针对性管控措施，持续提升整治成效。要坚持问题导向，突出工作重点，全面开展扬尘治理、道路清扫抑尘、车辆管控等专项整治行动，确保大气污染防治措施落地见效。要进一步压实监管责任和属地责任，健全联防联控机制，持续加大检查执法力度，严厉打击违法违规行为，确保大气污染防治工作取得实效，不断提升人民群众的获得感、幸福感。\r\n\r\n区政府办公室、区住房和城市建设局、区城管局、区生态环境分局及建新街道、龙洞街道主要负责同志，区交警大队分管负责同志参加活动。（区政府办公室）\r\n', '我区举办中小企业发展', '1', '0', '2');
INSERT INTO `first_page` VALUES ('1000000004', '1000000004', '2021年，济南普法依法治理工作着眼省会发展大局，立足法治建设新要求,守正创新，奋力开拓，有力凝聚起全社会普法合力，广大干部群众法治意识和基层依法治理水平进一步提升，为新时代现代化强省会建设营造了良好法治环境。1月20日，记者盘点济南普法十大创新举措，展现泉城普法新面貌。\r\n\r\n　　一、推进习近平法治思想宣传贯彻\r\n把习近平法治思想列入普法规划、年度普法工作计划重要宣传内容，列入各级党委（党组）理论学习中心组学习内容，列入各级党校（行政学院）、社会主义学院重点课程。济南市委依法治市办组织习近平法治思想专题法治培训班，全市59万人参加培训。\r\n\r\n　　创新点：在全国首次创意制作《习近平法治思想之“十一个坚持”》系列普法动漫，《民主与法制时报》专门宣传报道。\r\n\r\n　　二、全面启动“八五”普法工作\r\n在全省率先审议通过“八五”普法决议，较早出台“八五”普法规划，就“八五”普法工作作出全面安排部署。同时，组织开展“七五”普法表彰，7个集体、3名个人荣获全国表彰，100个集体、200名个人受到市级表扬。\r\n\r\n　　创新点：创新出台《##_FORMAT_LT_##法治社会建设实施纲要##_FORMAT_GT_##》实施方案，细化任务措施、明确责任单位。', '我区举办中小企业发展', '1', '0', '0');
INSERT INTO `first_page` VALUES ('1000000005', '1000000005', '新华社北京1月23日电 题：健全法律法规、促进标准认证衔接……15条“硬核”措施促进内外贸一体化发展\r\n\r\n　　新华社记者王雨萧、刘红霞\r\n\r\n　　近日，国务院办公厅印发《关于促进内外贸一体化发展的意见》，就促进内外贸一体化，形成强大国内市场，畅通国内国际双循环作出一系列部署。\r\n\r\n　　这份涉及约20个部门和单位的重要文件，出台的背景是什么？有哪些考虑？将如何更好助力高质量发展？\r\n\r\n　　多年来，我国内外贸市场规模日益壮大，已经成为全球第二大消费市场和第一货物贸易大国。2021年，我国社会消费品零售总额超过44万亿元，货物进出口总额超过39万亿元。\r\n\r\n　　“内外贸市场对接活跃，近年来，外贸企业积极开拓国内市场，内贸企业积极拓展海外市场，内外贸融合正在加速。”商务部有关负责人说。\r\n\r\n　　内外贸市场规模壮大的同时，也要看到，我国经济发展面临需求收缩、供给冲击、预期转弱三重压力，内外贸面临的不确定因素有所增加。如一些外贸企业仍面临运费高位徘徊、原材料价格上涨、转内销“水土不服”等难题。\r\n\r\n　　“内外贸一体化是加快构建新发展格局的必然要求。”商务部研究院国际市场研究所副所长白明说，内外贸是对接国内外市场、畅通国内国际双循环的重要环节，此次意见的出台，将帮助企业开拓更广阔市场，同时也为国内消费者带来更多优质产品和服务。\r\n\r\n　　为进一步帮助企业用好两个市场、两种资源，意见从4个方面提出15条措施，包括健全法律法规、加强规则对接、促进标准认证衔接、完善内外联通物流网络等。\r\n\r\n　　“意见在标准认证衔接、国际规则对接等方面作出细致部署，这不仅将更好服务企业开拓国内国际市场，也是更高水平开放的表现。”对外经济贸易大学国家对外开放研究院教授庄芮说，此举有利于增强我国在全球经贸领域的竞争优势和话语权，以更高水平开放融入国际经济循环。\r\n\r\n　　白明认为，内外贸一体化不是零和博弈，政府要引导外贸企业找准市场定位，寻求差异化竞争，并以良性竞争促进国内相关产业提质升级，优化供给结构。\r\n\r\n　　值得注意的是，此次意见共涉及约20个部门和单位，如推动内外贸数字化发展涉及商务部等部门；推进内外贸产品同线同标同质涉及市场监管总局等部门；创新推广“外语+职业技能”等人才培养模式涉及教育部等部门；加强财政金融支持涉及财政部、人民银行、银保监会等部门……\r\n\r\n　　白明表示，内外贸一体化发展，不仅体现在市场一体化，更需要加强体制机制一体化。相关部门应在体制机制改革上下功夫，不能“各扫门前雪”，要加强跨部门协作，提升管理效率和服务水平。\r\n\r\n　　“此次意见涉及部门如此之多，也充分表明了内外贸一体化发展不是一时一事，而是着眼长远的考虑安排。”庄芮说。\r\n\r\n　　商务部、海关总署等部门相关负责人表示，下一步将落实落细意见要求，完善工作机制，持续优化管理服务，完善内外联通网络，提升市场主体内外贸一体化发展水平。\r\n', '我区举办中小企业发展', '1', '0', '0');
INSERT INTO `first_page` VALUES ('1000000011', '1000000011', '记者11日从江西南昌红谷滩警方获悉，不戴口罩硬闯商场并殴打防疫工作人员的邹某，被警方拘留8日并罚款300元。\r\n\r\n警方通报称，8月8日，邹某酒足饭饱之后，准备与家人一同逛南昌红谷滩万达广场。在万达广场入口处，邹某因未戴口罩被防疫工作人员拦下。面对防疫工作人员的劝阻，邹某不但没有听从劝阻，还欲强行闯卡，并与劝阻的防疫工作人员产生争执。最后，邹某脚踹工作人员，踢倒防疫围挡后才离开现场。现场工作人员随即报警。\r\n\r\n接到报警后，南昌市公安局红谷滩分局红谷滩派出所立即对邹某进行调查询问。经查，邹某在明知疫情防控规定要求佩戴口罩才能进入公共场所的情况下，不仅没有遵守相关规定佩戴口罩，还无视防疫人员劝阻强行闯卡并对他人实施殴打。其行为对红谷滩万达广场疫情防控工作造成严重影响，情节严重，社会影响十分恶劣。\r\n\r\n目前，南昌市公安局红谷滩分局依法给予邹某行政拘留八日，并处罚款300元。\r\n', '男子不戴口罩硬闯商场', '2', '0', '0');
INSERT INTO `first_page` VALUES ('1000000012', '1000000012', '12月17日下午，我区科研院所科技创新联盟成立大会在济南科技金融大厦举行，市科技局党组书记、局长陈西武，区委副书记、区长杨传军，区政府副区长张涛出席启动仪式。\r\n\r\n陈西武指出，济南市近年来大力实施创新驱动战略，积极打造“科创济南”，创新能力不断增强，希望“历下区科研院所科技创新联盟”能积极发挥桥梁纽带作用，整合集聚优质科技资源，打造协同创新服务平台，构建创新创业服务生态圈，为“科创济南”建设提供有力支撑。\r\n\r\n杨传军强调，历下区作为省会中心城区，将抢抓济南获批全国首个科创金融改革试验区的重大机遇，把创新作为引领发展的第一动力，充分发挥好联盟平台的支撑作用，调动一切有利于科技创新的资源，大力推进科技成果转移转化，合力打造开放共赢的科技创新共同体，为联盟各成员企业提供更广阔的平台和更优质的环境，真正让科技创新成为推动历下高质量发展的重要动力。\r\n\r\n历下区科研院所科技创新联盟汇聚驻区21家科研院所和21家拥有市级以上技术平台企业，旨在搭建行业间合作交流平台，在各类科技研发机构和科技企业之间架起技术沟通交流、资源开放共享的桥梁，不断探索构建以企业为主体、市场为导向，以科研机构、高等院校为技术支撑的科技创新体系，促进科技成果转移转化，打造产学研合作有机融合的“历下模式”，助推全区高质量发展。\r\n\r\n区科技局主要负责同志，首届历下区科研院所科技创新联盟成员单位主要负责同志参加活动。\r\n', '历下区成立科研院所科技创新联盟', '2', '0', '0');
INSERT INTO `flyzzx` VALUES ('10001', '兰蔻', '品牌故事1', '1999-09-09', '0');
INSERT INTO `flyzzx` VALUES ('10002', '雅诗兰黛', '品牌故事2', '1999-09-09', '0');
INSERT INTO `flyzzx` VALUES ('10003', '韩束', '品牌故事3', '1999-09-09', '0');
INSERT INTO `flyzzx` VALUES ('10004', '珀莱雅', '品牌故事4', '1999-09-09', '0');
INSERT INTO `flyzzx` VALUES ('10005', '优时颜', '品牌故事5', '1999-09-09', '0');
INSERT INTO `flyzzx` VALUES ('10006', '谷雨', '品牌故事6', '1999-09-09', '0');
INSERT INTO `flyzzx` VALUES ('10007', '菜鸟和配方师', '品牌故事7', '1999-09-09', '0');
INSERT INTO `flyzzx` VALUES ('10008', '薇诺娜', '品牌故事8', '1999-09-09', '0');
INSERT INTO `flyzzx` VALUES ('10009', 'Olay', '品牌故事9', '1999-09-09', '0');
INSERT INTO `flyzzxpl` VALUES ('10001', '10001', '10001', '产品种类1', '2023-01-11 18:07:20', '1');
INSERT INTO `flyzzxpl` VALUES ('10002', '10002', '10002', '产品种类2', '2023-01-21 00:00:00', '0');
INSERT INTO `flyzzxpl` VALUES ('10003', '10001', '10001', '产品种类2', null, '0');
INSERT INTO `hsmfdzl` VALUES ('10001', '妆教', '0');
INSERT INTO `hsmfdzl` VALUES ('10002', '护肤', '0');
INSERT INTO `jdal` VALUES ('10001', '上海中原物业顾问有限公司诉陶德华居间合同纠纷案 ', '10009', '【裁判要点】房屋买卖居间合同中关于禁止买方利用中介公司提供的房源信息却绕开该中介公司与卖方签订房屋买卖合同的约定合法有效。但是，当卖方将同一房屋通过多个中介公司挂牌出售时，买方通过其他公众可以获知的正当途径获得相同房源信息的，买方有权选择报价低、服务好的中介公司促成房屋买卖合同成立，其行为并没有利用先前与之签约中介公司的房源信息，故不构成违约。', '0', '（2009）沪二中民二（民）终字第1508号 ');
INSERT INTO `jdal` VALUES ('10002', '张莉诉北京合力华通汽车服务有限公司买卖合同纠纷案 ', '10009', '【裁判要点】1.为家庭生活消费需要购买汽车，发生欺诈纠纷的，可以按照《中华人民共和国消费者权益保护法》处理。2.汽车销售者承诺向消费者出售没有使用或维修过的新车，消费者购买后发现系使用或维修过的汽车，销售者不能证明已履行告知义务且得到消费者认可的，构成销售欺诈，消费者要求销售者按照消费者权益保护法赔偿损失的，人民法院应予支持。 ', '0', '（2008）京二中民终字第00453号 ');
INSERT INTO `jdal` VALUES ('10003', '孙银山诉南京欧尚超市有限公司江宁店买卖合同纠纷案 ', '10009', '【裁判要点】消费者购买到不符合食品安全标准的食品，要求销售者或者生产者依照食品安全法规定支付价款十倍赔偿金或者依照法律规定的其他赔偿标准赔偿的，不论其购买时是否明知食品不符合安全标准，人民法院都应予支持。 ', '0', '（2012）江宁开民初字第646号 ');
INSERT INTO `jdal` VALUES ('10004', '瑞士嘉吉国际公司诉福建金石制油有限公司等确认合同无效纠纷案 ', '10009', '【裁判要点】1.债务人将主要财产以明显不合理低价转让给其关联公司，关联公司在明知债务人欠债的情况下，未实际支付对价的，可以认定债务人与其关联公司恶意串通、损害债权人利益，与此相关的财产转让合同应当认定为无效。2.《中华人民共和国合同法》第五十九条规定适用于第三人为财产所有权人的情形，在债权人对债务人享有普通债权的情况下，应当根据《中华人民共和国合同法》第五十八条的规定，判令因无效合同取得的财产返还给原财产所有人，而不能根据第五十九条规定直接判令债务人的关联公司因“恶意串通，损害第三人利益”的合同而取得的债务人的财产返还给债权人。', '0', '（2012）最高法民四终字第1号 ');
INSERT INTO `jdal` VALUES ('10005', '阿卜杜勒·瓦希德诉中国东方航空股份有限公司航空旅客运输合同纠纷案 ', '10009', '【裁判要点】1.对航空旅客运输实际承运人提起的诉讼，可以选择对实际承运人或缔约承运人提起诉讼，也可以同时对实际承运人和缔约承运人提起诉讼。被诉承运人申请追加另一方承运人参加诉讼的，法院可以根据案件的实际情况决定是否准许。2.当不可抗力造成航班延误，致使航空公司不能将换乘其他航班的旅客按时运抵目的地时，航空公司有义务及时向换乘的旅客明确告知到达目的地后是否提供转签服务，以及在不能提供转签服务时旅客如何办理旅行手续。航空公司未履行该项义务，给换乘旅客造成损失的，应当承担赔偿责任。3.航空公司在打折机票上注明“不得退票，不得转签”，只是限制购买打折机票的旅客由于自身原因而不得退票和转签，不能据此剥夺旅客在支付票款后享有的乘坐航班按时抵达目的地的权利。', '0', '（2006）沪一中民一(民)终字第609号');
INSERT INTO `jdal` VALUES ('10006', '吴梅诉四川省眉山西城纸业有限公司买卖合同纠纷案', '10001', '【裁判要点】民事案件二审期间，双方当事人达成和解协议，人民法院准许撤回上诉的，该和解协议未经人民法院依法制作调解书，属于诉讼外达成的协议。一方当事人不履行和解协议，另一方当事人申请执行一审判决的，人民法院应予支持。', '0', '（2010）眉执督字第4号 ');
INSERT INTO `jdalfl` VALUES ('10001', '诉讼程序', '0');
INSERT INTO `jdalfl` VALUES ('10002', '劳动纠纷', '0');
INSERT INTO `jdalfl` VALUES ('10003', '环境民事公益诉讼', '0');
INSERT INTO `jdalfl` VALUES ('10004', '环境侵权责任纠纷', '1');
INSERT INTO `jdalfl` VALUES ('10005', '婚姻与继承纠纷', '0');
INSERT INTO `jdalfl` VALUES ('10006', '建筑工程纠纷', '0');
INSERT INTO `jdalfl` VALUES ('10007', '侵权责任纠纷', '1');
INSERT INTO `jdalfl` VALUES ('10008', '物权纠纷', '0');
INSERT INTO `jdalfl` VALUES ('10009', '一般合同纠纷', '0');
INSERT INTO `jdalfl` VALUES ('10010', '知识产权纠纷', '0');
INSERT INTO `jdaltp` VALUES ('10001', 'jdaltp.png', '10001', '0');
INSERT INTO `ls` VALUES ('10001', '李八', '男', '23', '民法律师', '北京市京师（上海）', '0', '10001');
INSERT INTO `ls` VALUES ('10002', 'wangwy', '男', '28', '民法律师', '职称：副教授。', '0', '10001');
INSERT INTO `ls` VALUES ('10003', '许乃义', '男', '59', '首席律师', '现为江苏离婚律师网首席律师', '0', '10002');
INSERT INTO `ls` VALUES ('10004', '王五', '男', '25', '首席律师', '首席律师', '0', '10003');
INSERT INTO `ls` VALUES ('10005', '吴勇波', '男', '56', '民法律师', '中华全国律师协会成员，广州律师协会会员，人民调解员', '0', '10005');
INSERT INTO `ls` VALUES ('10006', '李政', '男', '34', '民法律师', '广东正派律师事务所创办人,主任律师,从事法律工作十多年', '0', '10006');
INSERT INTO `ls` VALUES ('10007', '李延宏', '男', '22', '民法律师', '债务债权,损害赔偿,经济纠纷,婚姻家庭', '0', '10007');
INSERT INTO `ls` VALUES ('10008', '刘斌', '男', '56', '民法律师', '损害赔偿,婚姻家庭,公司法,债务债权', '0', '10008');
INSERT INTO `ls` VALUES ('10009', '熊云霞', '男', '34', '民法律师', '债务债权,损害赔偿,经济纠纷,刑事辩护', '0', '10009');
INSERT INTO `ls` VALUES ('10010', '张中强', '男', '45', '民法律师', '债务债权,损害赔偿,经济纠纷,婚姻家庭', '0', '10010');
INSERT INTO `ls` VALUES ('10011', '王勇霞', '男', '46', '民法律师', '债务债权,损害赔偿,经济纠纷', '0', '10011');
INSERT INTO `ls` VALUES ('10012', '石社轩', '男', '34', '民法律师', '损害赔偿,经济纠纷,婚姻家庭,债务债权', '0', '10012');
INSERT INTO `ls` VALUES ('10013', '马军丰', '男', '56', '民法律师', '债务债权', '0', '10013');
INSERT INTO `ls` VALUES ('10014', '陈锦卿', '男', '54', '民法律师', '刑事辩护,企业法律顾问,合同纠纷', '0', '10014');
INSERT INTO `lsdy` VALUES ('10001', '10001', '10001', '10001', '****你好', '2020-12-12 23:59:59', '0');
INSERT INTO `lssc` VALUES ('10001', '10003', '10001', '0');
INSERT INTO `lssc` VALUES ('10002', '10003', '10002', '0');
INSERT INTO `lssc` VALUES ('10003', '10003', '10002', '0');
INSERT INTO `lssc` VALUES ('10004', '10003', '10002', '0');
INSERT INTO `lssc` VALUES ('10005', '10003', '10003', '0');
INSERT INTO `lstp` VALUES ('10001', '10001', 'lstp_default.png');
INSERT INTO `lstp` VALUES ('10002', '10001', 'lstp_10002.png');
INSERT INTO `lstp` VALUES ('10003', '10001', 'lstp_10003.png');
INSERT INTO `lstp` VALUES ('10004', '10001', 'lstp_10004.png');
INSERT INTO `lstp` VALUES ('10005', '10002', 'lstp_10005.png');
INSERT INTO `lstp` VALUES ('10006', '10001', 'lstp_10006.png');
INSERT INTO `lstp` VALUES ('10007', '10001', 'lstp_10007.png');
INSERT INTO `lstp` VALUES ('10008', '10001', 'lstp_10008.png');
INSERT INTO `lstp` VALUES ('10009', '10001', 'lstp_10009.png');
INSERT INTO `lstp` VALUES ('10010', '10001', 'lstp_10010.png');
INSERT INTO `lstp` VALUES ('10011', '10001', 'lstp_10011.png');
INSERT INTO `lstp` VALUES ('10012', '10001', 'lstp_10012.png');
INSERT INTO `lstp` VALUES ('10013', '10001', 'lstp_10013.png');
INSERT INTO `lstp` VALUES ('10014', '10001', 'lstp_10014.png');
INSERT INTO `lstp` VALUES ('10015', '10001', 'lstp_10015.png');
INSERT INTO `mfdptsfjs` VALUES ('10001', '干皮护肤干货', '10001', '干皮护肤阿巴阿巴……', '0', '第一条');
INSERT INTO `mfdptsfjs` VALUES ('10002', '干皮护肤干货', '10001', '干皮护肤阿巴阿巴……', '0', '第二条');
INSERT INTO `mfdptsfjs` VALUES ('10003', '油皮护肤大赏', '10002', '油皮护肤阿巴阿巴……', '1', '第三条');
INSERT INTO `mfdptsfjs` VALUES ('10004', '油皮护肤大赏', '10002', '油皮护肤阿巴阿巴……', '0', '第四条');
INSERT INTO `mfdptsfjs` VALUES ('10005', '敏皮年度爱用', '10005', '敏感肌护肤阿巴阿巴……', '0', '第一条');
INSERT INTO `mfdptsfjs` VALUES ('10006', '敏皮年度爱用', '10005', '敏感肌护肤阿巴阿巴……', '0', '第二条');
INSERT INTO `mfdptsfjs` VALUES ('10007', '混油皮修护', '10004', '混油皮护肤阿巴阿巴……', '0', '第三条');
INSERT INTO `mfdptsfjs` VALUES ('10008', '混油皮修护', '10004', '混油皮护肤阿巴阿巴……', '0', '第四条');
INSERT INTO `mfdptsfjs` VALUES ('10009', '混干皮护肤', '10003', '混干皮护肤阿巴阿巴……', '0', '第五条');
INSERT INTO `mfdptsfjs` VALUES ('10010', '混干皮护肤', '10003', '混干皮护肤阿巴阿巴……', '0', '第六条');
INSERT INTO `mfdptsfjsfl` VALUES ('10001', '干皮', '0');
INSERT INTO `mfdptsfjsfl` VALUES ('10002', '油皮', '0');
INSERT INTO `mfdptsfjsfl` VALUES ('10003', '混干皮', '0');
INSERT INTO `mfdptsfjsfl` VALUES ('10004', '混油皮', '0');
INSERT INTO `mfdptsfjsfl` VALUES ('10005', '敏感皮', '0');
INSERT INTO `mfdsfjs` VALUES ('10001', '早睡是最好的护肤品', '干皮', '好的睡眠……', '0', '好的睡眠');
INSERT INTO `mfdsfjs` VALUES ('10002', '早睡是最好的护肤品', '油皮', '好的睡眠……', '0', '好的睡眠');
INSERT INTO `mfdsfjs` VALUES ('10003', '早C晚A', '干皮', '维C维A……', '0', '早C晚A');
INSERT INTO `mfdsfjs` VALUES ('10004', '早C晚A', '油皮', '维C维A……', '0', '早C晚A');
INSERT INTO `mfdsfjs` VALUES ('10005', '油敷法', '干皮', '洁面后，用含有舒缓成分的精油……', '0', '精油护肤');
INSERT INTO `mfdsfjs` VALUES ('10006', '油敷法', '混干皮', '洁面后，用含有舒缓成分的精油……', '0', '精油护肤');
INSERT INTO `mfdsfjs` VALUES ('10007', '涂抹面膜 ', '干皮', '洁面后，均匀的将面膜涂抹于面部 ……', '0', '涂抹面膜');
INSERT INTO `mfdsfjs` VALUES ('10008', '涂抹面膜  ', '混油皮', '洁面后，均匀的将面膜涂抹于面部 ……', '0', '涂抹面膜');
INSERT INTO `mfdsfjs` VALUES ('10009', '111', '10001', '阿巴阿巴', '0', '2323');
INSERT INTO `mfdt` VALUES ('10001', '爱民法从我开始', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10002', '爱民法的行动', '10001', '2022-01-10 00:00:00', '123', '0');
INSERT INTO `mfdt` VALUES ('10003', '学习民法1', '10002', '2022-01-10 00:00:00', '123', '0');
INSERT INTO `mfdt` VALUES ('10004', '学习民法2', '10002', '2022-01-12 00:00:00', '123', '0');
INSERT INTO `mfdt` VALUES ('10005', '民法典来了!《生态要爱护》', '10002', '2020-12-12 23:59:59', '爱美丽', '0');
INSERT INTO `mfdt` VALUES ('10006', '民法典来了!《公路要爱护》', '10003', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10007', '论民法的正当防卫', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10008', '爱护交易安全的规章', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10009', '远离校园欺凌', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10010', '民法通则好人原则', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10011', '要像爱护眼睛一样重视民法典', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10012', '民法典编纂中的人文主义传统', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10013', '以人为本', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10014', '人文关怀', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10015', ' 第七章 代理', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10016', '股份有限公司的股份发行和转让', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10017', '民法典 1-2-2 监护', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10018', '民法典 1-2-3 宣告失踪和宣告死亡', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10019', '民法典 1-2-4 个体工商户和农村承包经营户', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10020', '民法典 1-3-2 营利法人', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10021', '民法典 1-3-3 非营利法人', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10022', '民法典 1-3-4 特别法人', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10023', '民法典 1-5 民事权利', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10024', '民法典 1-6 民事法律行为', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10025', '民法典 1-4 非法人组织', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10026', '民法典1-3-1 法人 一般规定', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdt` VALUES ('10027', '涉外民事关系法律适用法', '10001', '2020-12-12 23:59:59', 'anihao', '0');
INSERT INTO `mfdtzl` VALUES ('10001', '妆教', '0');
INSERT INTO `mfdtzl` VALUES ('10002', '护肤', '0');
INSERT INTO `mfdtzl` VALUES ('10003', '科普', '0');
INSERT INTO `mh` VALUES ('10001', '卸妆膏的妙用', '10001', '2023-01-16 23:59:59', 'Baby', '0');
INSERT INTO `mh` VALUES ('10002', '卸妆油和卸妆膏的区别', '10001', '2023-01-11 00:00:00', 'Lady', '0');
INSERT INTO `mh` VALUES ('10003', '眼唇卸大赏', '10001', '2022-12-12 23:59:59', 'Rose', '0');
INSERT INTO `mh` VALUES ('10004', '局部修容怎么变高级', '10001', '2023-01-12 23:59:59', 'Anny', '0');
INSERT INTO `mh` VALUES ('10005', '底妆如何变干净', '10001', '2022-12-19 23:59:50', '阿阿家', '0');
INSERT INTO `mh` VALUES ('10006', '年度爱用底妆', '10001', '2022-12-19 23:59:59', '麻薯', '0');
INSERT INTO `mh` VALUES ('10007', '口红大赏', '10001', '2023-02-12 23:59:59', '小泡芙', '0');
INSERT INTO `mh` VALUES ('10008', '定妆喷雾手法', '10001', '2022-12-22 23:59:59', '奶泡', '0');
INSERT INTO `mh` VALUES ('10009', '护肤tips', '10001', '2022-10-12 23:59:59', '咕嘟', '0');
INSERT INTO `mh` VALUES ('10010', '遮瑕手法（超好用）', '10001', '2023-01-12 23:59:59', 'Kiki', '0');
INSERT INTO `mh` VALUES ('10011', '假睫毛大赏', '10001', '2022-12-29 23:59:59', 'Andy', '0');
INSERT INTO `mh` VALUES ('10012', '年度爱用唇釉', '10001', '2023-01-02 23:59:59', 'Lucy', '0');
INSERT INTO `mh` VALUES ('10013', '唇部护理', '10001', '2022-12-21 23:59:59', 'Lucky', '0');
INSERT INTO `mhsc` VALUES ('10001', '10001', '10001', '0');
INSERT INTO `mhtp` VALUES ('10001', '10001', 'mhtp.png', '0');
INSERT INTO `mhtp` VALUES ('10002', '10001', 'mhtp_10002.jpg', '0');
INSERT INTO `mhtp` VALUES ('10003', '10002', 'mhtp_10003.jpg', '0');
INSERT INTO `mhtp` VALUES ('10004', '10002', 'mhtp_10004.jpg', '0');
INSERT INTO `mhtp` VALUES ('10005', '10003', 'mhtp_10005.jpg', '0');
INSERT INTO `mhtp` VALUES ('10006', '10004', 'mhtp_10006.jpg', '0');
INSERT INTO `mhtp` VALUES ('10007', '10005', 'mhtp_10007.jpg', '0');
INSERT INTO `mhtp` VALUES ('10008', '10006', 'mhtp_10008.jpg', '0');
INSERT INTO `mhtp` VALUES ('10009', '10007', 'mhtp_10009.jpg', '0');
INSERT INTO `mhtp` VALUES ('10010', '10008', 'mhtp_10010.jpg', '0');
INSERT INTO `mhtp` VALUES ('10011', '10009', 'mhtp_10011.jpg', '0');
INSERT INTO `mhtp` VALUES ('10012', '10010', 'mhtp_10012.jpg', '0');
INSERT INTO `mhtp` VALUES ('10013', '10011', 'mhtp_10013.jpg', '0');
INSERT INTO `mhtp` VALUES ('10014', '10012', 'mhtp_10014.jpg', '0');
INSERT INTO `mhtp` VALUES ('10015', '10013', 'mhtp_10015.jpg', '0');
INSERT INTO `pfsp` VALUES ('10001', 'jc_10001.mp4', '10001', '2023-01-12 23:59:59', 'Candy', '点拽法遮瑕', '0');
INSERT INTO `pfsp` VALUES ('10002', 'jc_10002.mp4', '10002', '2022-01-20 00:00:00', 'Lubia', '倒钩眼线', '0');
INSERT INTO `picture` VALUES ('1000000001', 'wenzhang1.jpg', 'wenzhang2.jpg', 'wenzhang3.jpg');
INSERT INTO `picture` VALUES ('1000000002', 'wenzhang4.jpg', 'wenzhang5.jpg', 'wenzhang6.jpg');
INSERT INTO `picture` VALUES ('1000000003', 'wenzhang7.jpg', 'wenzhang8.jpg', 'wenzhang9.jpg');
INSERT INTO `picture` VALUES ('1000000004', 'wenzhang14.jpg', 'wenzhang15.jpg', 'wenzhang16.jpg');
INSERT INTO `picture` VALUES ('1000000005', 'wenzhang14.jpg', 'wenzhang14.jpg', 'wenzhang14.jpg');
INSERT INTO `picture` VALUES ('1000000011', 'wenzhang10.jpg', 'wenzhang12.jpg', 'wenzhang11.jpg');
INSERT INTO `picture` VALUES ('1000000012', 'wenzhang13.jpg', 'wenzhang13.jpg', 'wenzhang13.jpg');
INSERT INTO `sfrz` VALUES ('10001', '139320434', '13243546234', '0');
INSERT INTO `sfrz` VALUES ('10002', '1', '1', '0');
INSERT INTO `spsc` VALUES ('10001', '10001', '10001', '0');
INSERT INTO `tswz` VALUES ('10001', '⺠法典的前世', '2020-12-12 23:59:59', '⺠法典文章', '0');
INSERT INTO `yh` VALUES ('10001', '123', 'Anny', '21', '4291924062@qq.com', '13855898967', '10001', '1', '1', '1', '男', null);
INSERT INTO `yh` VALUES ('10002', '123', '小泡芙', '18', '3291924061@qq.com', '13855898967', '10002', '1', '0', '0', '男', null);
INSERT INTO `yh` VALUES ('10003', '123', '阿家', '14', '2223924062@qq.com', '13855898967', '10003', '1', '0', '0', '女', '啦啦啦啦');
INSERT INTO `yh` VALUES ('10004', '123', 'Candy', '23', '2194324062@qq.com', '13855898967', '10004', '1', '0', '0', '女', null);
INSERT INTO `yh` VALUES ('10005', '123', 'Lubia', '26', '12345428459@qq.com', '15434567898', '10001', '1', '1', '0', '男', null);
INSERT INTO `yh` VALUES ('10006', 'mmx', 'Rose', '21', '115869405@qq.com', '28374578946', '10001', '1', '1', '0', '女', null);
INSERT INTO `yh` VALUES ('123456', '123456', '果', '18', '1103624547@qq.com', '13849711787', '0', '0', '0', '0', '男', null);
INSERT INTO `yhsc` VALUES ('10001', '10001', '10001', '0');
INSERT INTO `yhsclb` VALUES ('10001', '电台', '0');
INSERT INTO `yhsclb` VALUES ('10002', '漫画', '0');
INSERT INTO `yhsclb` VALUES ('10003', '视频', '0');
INSERT INTO `yhsclb` VALUES ('10004', '律师', '0');
INSERT INTO `yhtp` VALUES ('10001', '10001', '1.jpg');
INSERT INTO `yhtp` VALUES ('10002', '10002', '1.jpg');
INSERT INTO `yhtp` VALUES ('10003', '10003', '10003__userPic__.png');
INSERT INTO `yhtp` VALUES ('10004', '10004', '1.jpg');
INSERT INTO `yhtp` VALUES ('10005', '10023', '2.png');
INSERT INTO `yhtp` VALUES ('10006', '10023', '2.png');
INSERT INTO `yhtp` VALUES ('10007', '', '2.png');
INSERT INTO `yhtp` VALUES ('10008', '10006', '2.png');
INSERT INTO `yhtp` VALUES ('10009', '10007', '2.png');
INSERT INTO `yhtp` VALUES ('10010', '', '2.png');
INSERT INTO `yhtp` VALUES ('10011', '', '2.png');
INSERT INTO `yhtp` VALUES ('10012', '', '2.png');
INSERT INTO `yhtp` VALUES ('10013', '100023', '1.jpg');
INSERT INTO `yhtp` VALUES ('10014', '100032', '10.jpg');
INSERT INTO `yhtp` VALUES ('10015', '10005', '1_2.jpg');
INSERT INTO `yhtp` VALUES ('10016', '10012', '1.jpg');
INSERT INTO `yhtp` VALUES ('10017', '10024', '4.jpg');
INSERT INTO `yhtp` VALUES ('10018', '10025', '5.jpg');
INSERT INTO `yhtp` VALUES ('10019', '10032', '1_1.jpg');
INSERT INTO `yhtp` VALUES ('10020', '', 'null');
INSERT INTO `yhtp` VALUES ('10021', '', '123.png');
INSERT INTO `yhtp` VALUES ('10022', '', '1.png');
INSERT INTO `yhtp` VALUES ('10023', '', '1_1.jpg');
INSERT INTO `yhtp` VALUES ('10024', '', '2.jpg');
INSERT INTO `yhtp` VALUES ('10025', '', '1.4.png');
INSERT INTO `yhtp` VALUES ('10026', '', '1.4.png');
INSERT INTO `yhtp` VALUES ('10027', '', '1.4.png');
INSERT INTO `yhtp` VALUES ('10028', '', '11.png');
INSERT INTO `yhtp` VALUES ('10029', '', '11.png');
INSERT INTO `yhtp` VALUES ('10030', '', '11.png');
INSERT INTO `yhtp` VALUES ('10031', '', '11.png');
INSERT INTO `yhtp` VALUES ('10032', '', '11.png');
INSERT INTO `yhtp` VALUES ('10033', '', '11.png');
INSERT INTO `yhtp` VALUES ('10034', '', '11.png');
INSERT INTO `yhtp` VALUES ('10035', '', '11.png');
INSERT INTO `yhtp` VALUES ('10036', '', '11.png');
INSERT INTO `yhtp` VALUES ('10037', '', '11.png');
INSERT INTO `yhtp` VALUES ('10038', '', '11.png');
INSERT INTO `yhtp` VALUES ('10039', '', '1_1.jpg');
INSERT INTO `yhtp` VALUES ('10040', '10008', '1.jpg');
INSERT INTO `yhtp` VALUES ('10041', '10009', 'touxiang1.png');
INSERT INTO `yhtp` VALUES ('10042', '10010', '10.png');
INSERT INTO `yhtp` VALUES ('10043', '10011', 'touxiang1.png');
INSERT INTO `yhtp` VALUES ('10044', '10012', 'null');
INSERT INTO `yhtp` VALUES ('10045', '10012', 'touxiang1.png');
INSERT INTO `yhtp` VALUES ('10046', '10013', 'touxiang1.png');
INSERT INTO `yhtp` VALUES ('10047', '10014', 'touxiang1.png');
INSERT INTO `yhtp` VALUES ('10048', '10015', 'touxiang1.png');
INSERT INTO `yhtp` VALUES ('10049', '10016', 'touxiang18.png');
INSERT INTO `yhtp` VALUES ('10051', '10017', 'touxiang18.png');
INSERT INTO `yhtp` VALUES ('10052', '10018', 'touxiang18.png');
INSERT INTO `yhtp` VALUES ('10053', '10019', 'touxiang18.png');
INSERT INTO `yhtp` VALUES ('10054', '10020', 'touxiang7.jpg');
INSERT INTO `yhtp` VALUES ('10055', '100023', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10056', '100045', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10057', '100058', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10058', '100059', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10059', '100054', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10060', '100058', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10061', '100054', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10062', '100032', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10063', '100023', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10064', '100047', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10065', '100025', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10066', '100028', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10067', '100029', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10068', '100035', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10069', '100039', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10070', '100034', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10071', '100481', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10072', '100487', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10073', '100047', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10074', '100475', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10075', '100487', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10076', '100047', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10077', '100254', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10078', '100250', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10079', '100251', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10080', '100253', 'yhtp_default.png');
INSERT INTO `yhtp` VALUES ('10081', '123456', 'yhtp_default.png');
INSERT INTO `yjfk` VALUES ('10001', '10001', '很棒', '0', '可以');
INSERT INTO `yjfk` VALUES ('10002', '10003', '很好', '0', null);
INSERT INTO `yjfk` VALUES ('10003', '10003', '多点内容', '0', null);
INSERT INTO `yjfk` VALUES ('10004', '10006', '更新太慢', '0', null);
INSERT INTO `yjfk` VALUES ('10005', '10001', '很棒', '0', '可以');
INSERT INTO `yjfk` VALUES ('10006', '10003', '内容再多一点', '0', null);
INSERT INTO `yjfk` VALUES ('10007', '10004', '更新太慢', '0', null);
INSERT INTO `yjfk` VALUES ('10008', '10003', '多点内容', '0', null);
INSERT INTO `yjfk` VALUES ('10009', '10002', '挺好的', '0', null);
INSERT INTO `yjfk` VALUES ('10010', '10002', '挺好的', '0', null);
INSERT INTO `yjfk` VALUES ('10011', '10003', '多点内容', '0', null);
INSERT INTO `yjfk` VALUES ('10012', '10001', '很棒', '0', '可以');
INSERT INTO `yjfk` VALUES ('10013', '10003', '更新太慢', '0', null);
INSERT INTO `yjfk` VALUES ('10014', '10005', '内容再多一点', '0', null);
INSERT INTO `yjfk` VALUES ('10015', '10005', '内容再多一点', '0', null);
INSERT INTO `yzsc` VALUES ('10001', '10003', '10001', '0');
INSERT INTO `zjmfd` VALUES ('1000001', '底妆', '肤质', '圣罗兰', '内容1', '1');
INSERT INTO `zjmfd` VALUES ('1000002', '底妆', '干皮', '兰蔻', '内容2', '0');
INSERT INTO `zjmfd` VALUES ('1000003', '底妆', '混干皮', '阿玛尼红气垫', '内容3', '0');
INSERT INTO `zjmfd` VALUES ('1000004', '底妆', '油皮', '珀莱雅', '内容4', '1');
INSERT INTO `zjmfd` VALUES ('1000005', '底妆', '10004', '完美日记', '内容5', '0');
INSERT INTO `zjmfd` VALUES ('1100001', '眼部', '肤质', '植村秀', '内容5', '0');
INSERT INTO `zjmfd` VALUES ('1100002', '眼部', '干皮', '完美日记', '内容6', '0');
INSERT INTO `zjmfd` VALUES ('1100003', '眼部', '混干皮', '小奥汀', '内容7', '0');
INSERT INTO `zjmfd` VALUES ('1100004', '眼部', '油皮', '3CE', '内容8', '0');
INSERT INTO `zjmfd` VALUES ('1200001', '唇部', '肤质', '圣罗兰', '内容9', '0');
INSERT INTO `zjmfd` VALUES ('1200002', '唇部', '干皮', '酵色', '内容10', '0');
INSERT INTO `zjmfd` VALUES ('1200003', '唇部', '混干皮', '兰蔻', '内容11', '0');
INSERT INTO `zjmfd` VALUES ('1200004', '唇部', '油皮', '阿玛尼', '内容12', '0');
INSERT INTO `zjmfd` VALUES ('1300001', '局部修容', '肤质', 'Dior', '内容13', '0');
INSERT INTO `zjmfd` VALUES ('1300002', '局部修容', '干皮', '3CE', '内容14', '0');
INSERT INTO `zjmfd` VALUES ('1300003', '局部修容', '混干皮', '兰蔻', '内容15', '1');
INSERT INTO `zjmfd` VALUES ('1300004', '局部修容', '干净', '酵色', '内容16', '0');
INSERT INTO `zxtp` VALUES ('10001', '10001', 'sus1.png', '0');
INSERT INTO `zxtp` VALUES ('10002', '10002', 'sus2.png', '0');
INSERT INTO `zxtp` VALUES ('10003', '10003', 'sus3.png', '0');
INSERT INTO `zxtp` VALUES ('10004', '10004', 'sus4.png', '0');
INSERT INTO `zxtp` VALUES ('10005', '10005', 'sus6.png', '0');
INSERT INTO `zxtp` VALUES ('10006', '10006', 'sws5.png', '0');
INSERT INTO `zxtp` VALUES ('10007', '10007', 'yzzx1.png', '0');
INSERT INTO `zxtp` VALUES ('10008', '10008', 'yzzx2.png', '0');
INSERT INTO `zxtp` VALUES ('10009', '10009', 'yzzx3.png', '0');
INSERT INTO `zxtp` VALUES ('10010', '10010', 'yzzx4.png', '0');
INSERT INTO `zxtp` VALUES ('10011', '10011', 'yzzx5.png', '0');
INSERT INTO `zxtp` VALUES ('10012', '10012', 'yzzx6.png', '0');
INSERT INTO `zxtp` VALUES ('10013', '10013', 'yzzx7.png', '0');
INSERT INTO `zxtp` VALUES ('10014', '10014', 'yzzx8.png', '0');
INSERT INTO `zxtp` VALUES ('10015', '10015', 'yzzx9.png', '0');
INSERT INTO `zxtp` VALUES ('10016', '10016', 'yzzx10.png', '0');
INSERT INTO `zxtp` VALUES ('10017', '10017', 'yzzx11.png', '0');
INSERT INTO `zxtp` VALUES ('10018', '10018', 'yzzx12.png', '0');
INSERT INTO `zxtp` VALUES ('10019', '10019', 'yzzx13.png', '0');
INSERT INTO `zxtp` VALUES ('10020', '10020', 'yzzx14.png', '0');
INSERT INTO `zxtp` VALUES ('10021', '10021', 'yzzx15.png', '0');
INSERT INTO `zxtp` VALUES ('10022', '10022', 'yzzx16.png', '0');
INSERT INTO `zxtp` VALUES ('10023', '10023', 'yzzx17.png', '0');
INSERT INTO `zxtp` VALUES ('10024', '10024', 'yzzx18.png', '0');
INSERT INTO `zxtp` VALUES ('10025', '10025', 'yzzx19.png', '0');
