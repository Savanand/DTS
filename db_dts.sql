/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.0.45-community-nt : Database - dts
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dts` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dts`;

/*Table structure for table `dts_activity` */

DROP TABLE IF EXISTS `dts_activity`;

CREATE TABLE `dts_activity` (
  `activity_id` varchar(700) NOT NULL default '',
  `activity_details` varchar(700) default NULL,
  `activity_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `function_name` varchar(700) default NULL,
  `activity_from` varchar(700) default NULL,
  PRIMARY KEY  (`activity_id`),
  KEY `dts_activity_ibfk_1` (`function_name`),
  KEY `dts_activity_ibfk_2` (`activity_from`),
  CONSTRAINT `dts_activity_ibfk_1` FOREIGN KEY (`function_name`) REFERENCES `dts_function` (`function_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dts_activity_ibfk_2` FOREIGN KEY (`activity_from`) REFERENCES `dts_login` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_activity` */

insert  into `dts_activity`(`activity_id`,`activity_details`,`activity_time`,`function_name`,`activity_from`) values ('1',NULL,'2013-02-22 17:12:31','PROJECT','PMEMP00001'),('2',NULL,'2013-02-22 17:12:59','FILE','PMADM00001'),('3',NULL,'2013-02-11 17:13:28','USER','PMEMP00004');

/*Table structure for table `dts_bug` */

DROP TABLE IF EXISTS `dts_bug`;

CREATE TABLE `dts_bug` (
  `bug_id` bigint(20) NOT NULL,
  `bug_title` varchar(700) default NULL,
  `bug_desc` varchar(700) default NULL,
  `start_date` timestamp NULL default NULL,
  `end_date` timestamp NULL default NULL,
  `bug_to` varchar(700) NOT NULL default '',
  `bug_from` varchar(700) default NULL,
  `project_id` varchar(700) default NULL,
  `status` bigint(11) default '0',
  `priority` varchar(700) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`bug_id`,`bug_to`),
  KEY `dts_task_ibfk_3` (`project_id`),
  KEY `dts_task_ibfk_4` (`bug_to`),
  KEY `dts_task_ibfk_5` (`bug_from`),
  CONSTRAINT `dts_bug_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `dts_project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dts_bug_ibfk_4` FOREIGN KEY (`bug_to`) REFERENCES `dts_emp_details` (`user_name`),
  CONSTRAINT `dts_bug_ibfk_5` FOREIGN KEY (`bug_from`) REFERENCES `dts_emp_details` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_bug` */

insert  into `dts_bug`(`bug_id`,`bug_title`,`bug_desc`,`start_date`,`end_date`,`bug_to`,`bug_from`,`project_id`,`status`,`priority`,`updated_on`,`updated_by`) values (1,'reverse engg','these are defect 1 details related to defect project 11 bt EMP01','2013-03-20 00:00:00','2013-03-29 00:00:00','PMEMP00004','PMEMP00001','PMPRJ00011',0,'low','2013-03-18 13:32:21',NULL),(1,'reverse engg','these are defect 1 details related to defect project 11 bt EMP01','2013-03-20 00:00:00','2013-03-29 00:00:00','PMEMP00005','PMEMP00001','PMPRJ00011',0,'low','2013-03-18 13:33:25',NULL),(2,'defect  2','defect 2','2013-04-04 00:00:00','2013-04-10 00:00:00','PMEMP00014','PMEMP00015','PMPRJ00013',1,'high','2013-03-25 22:28:21',NULL),(2,'defect  2','defect 2','2013-04-04 00:00:00','2013-04-10 00:00:00','PMEMP00015','PMEMP00015','PMPRJ00013',1,'high','2013-03-25 22:28:21',NULL);

/*Table structure for table `dts_client` */

DROP TABLE IF EXISTS `dts_client`;

CREATE TABLE `dts_client` (
  `client_id` varchar(700) NOT NULL default '',
  `client_name` varchar(700) default NULL,
  `client_details` varchar(700) default NULL,
  `location` varchar(700) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_client` */

insert  into `dts_client`(`client_id`,`client_name`,`client_details`,`location`,`updated_on`,`updated_by`) values ('PMCMP00001','Influx Ltd',NULL,NULL,'2013-02-22 17:05:32',NULL),('PMCMP00002','Oracle Corp',NULL,NULL,'2013-02-22 17:05:36',NULL),('PMCMP00003','McLaren',NULL,NULL,'2013-02-22 17:05:40',NULL),('PMCMP00004','Kirloskar',NULL,NULL,'2013-02-22 17:05:42',NULL),('PMCMP00005','Maikchand',NULL,NULL,'2013-02-22 17:05:45',NULL),('PMCMP00006','BCCI',NULL,NULL,'2013-02-22 17:05:55',NULL);

/*Table structure for table `dts_common_server` */

DROP TABLE IF EXISTS `dts_common_server`;

CREATE TABLE `dts_common_server` (
  `file_id` bigint(20) NOT NULL,
  `file_name` varchar(700) default 'NA',
  `file_size` bigint(20) default '0',
  `file_desc` varchar(700) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_common_server` */

insert  into `dts_common_server`(`file_id`,`file_name`,`file_size`,`file_desc`,`updated_on`,`updated_by`) values (1,'birthday-wishes3.jpg',65165,'Birthday wishes','2013-03-07 19:39:18','PMEMP00001'),(2,'ARRAY.txt',8434,'arr','2013-03-18 17:02:03','PMEMP00001'),(3,'File Handling in C++.docx',19962,'sdkflkdsf','2013-03-25 22:31:02','PMEMP00014'),(4,'st.txt',87,'st details','2013-03-25 22:32:46','PMEMP00014');

/*Table structure for table `dts_emp_details` */

DROP TABLE IF EXISTS `dts_emp_details`;

CREATE TABLE `dts_emp_details` (
  `id` bigint(11) NOT NULL,
  `user_name` varchar(700) default NULL,
  `first_name` varchar(700) default NULL,
  `middle_name` varchar(700) default NULL,
  `last_name` varchar(700) default NULL,
  `email` varchar(700) default NULL,
  `phone_no` bigint(11) default NULL,
  `alternate_no` bigint(11) default NULL,
  `emergency_no` bigint(11) default NULL,
  `perm_resd_add` varchar(700) default NULL,
  `curr_resd_add` varchar(700) default NULL,
  `perm_wrk_add` varchar(700) default NULL,
  `curr_wrk_add` varchar(700) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `dts_emp_details_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `dts_login` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_emp_details` */

insert  into `dts_emp_details`(`id`,`user_name`,`first_name`,`middle_name`,`last_name`,`email`,`phone_no`,`alternate_no`,`emergency_no`,`perm_resd_add`,`curr_resd_add`,`perm_wrk_add`,`curr_wrk_add`,`updated_on`,`updated_by`) values (1,'PMADM00001','alex','no','roy','alexroy@gmail.com',45435434,234343424,12332323,'NY, US','NJ, USA','CA, US','MH, IN','2013-02-27 17:20:05',NULL),(2,'PMEMP00011','f11','m11','l11','f11@gmail.com',12345,54321,98765,'NY, US','NJ, US','OT, US','CA, US','2013-02-27 17:41:28',NULL),(3,'PMCLT00001','client1','dice','goody','clieny@gmail.com',345435,544,3434,'JY','JY4','JY6','JY7','2013-03-07 16:08:19',NULL),(4,'PMEMP00001','emp1firstname','fdf','dfgfg','esf@gf.com',34545,13434,433,'GT','GT5','GT7','GT8','2013-03-07 16:10:05',NULL),(5,'PMEMP00002','sandy','goal','mak','sandy@root.com',5555,324433,65656,'ST','ST6','ST8','ST2','2013-03-07 16:11:46',NULL),(6,'PMEMP00004','zxc','zxc2','vbn','zxc@ghg.com',32443,65545,23435,'SW','SW2','SW1','SW5','2013-03-07 16:13:42',NULL),(7,'PMEMP00005','dfg','dfg5','dfg3','dfg@cvb.com',5345,324324,4554,'DR3','DR','DR6','DR2','2013-03-07 16:15:24',NULL),(8,'PMEMP00006','qwe','wert','uioio','sdf@dfg.com',34,3442,12,'DQ','DQ1','DQ5','DQ67','2013-03-07 16:16:14',NULL),(9,'PMEMP00012','taj','kom','aop','aop@gmail.com',1234567890,1234567890,9999999999,'wr','we','ew','weq','2013-03-18 13:16:15',NULL),(10,'PMEMP00013','gh','tr','yu','tr@gmail.com',1234567890,1234567890,9876543321,'YU','NM','MU','OP','2013-03-18 13:22:29',NULL),(11,'PMCLT00002','gt','op','mi','gtr@gmail.com',1234567890,9876543210,1234567790,'NU','OL','PO','LB','2013-03-18 13:24:33',NULL),(12,'PMEMP00014','dfd','dsf','sdfds','dfds@fdf.com',1234567890,1234567890,1234567890,'GP1','PI1','BO1','IO1','2013-03-25 22:24:04',NULL),(13,'PMEMP00015','fdsjfk','dskjf','sjkf','sdf@c.com',1234567890,1234567890,1234567890,'FK','LS','DK','DFK','2013-03-25 22:26:03',NULL);

/*Table structure for table `dts_file` */

DROP TABLE IF EXISTS `dts_file`;

CREATE TABLE `dts_file` (
  `file_id` bigint(20) NOT NULL,
  `file_name` varchar(700) default 'NA',
  `file_size` bigint(20) default '0',
  `file_desc` varchar(700) default NULL,
  `bug_id` bigint(20) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`file_id`),
  KEY `dts_file_ibfk_1` (`bug_id`),
  CONSTRAINT `dts_file_ibfk_1` FOREIGN KEY (`bug_id`) REFERENCES `dts_bug` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_file` */

insert  into `dts_file`(`file_id`,`file_name`,`file_size`,`file_desc`,`bug_id`,`updated_on`,`updated_by`) values (1,'ARRAY.txt',8434,'file for sol 1 for bug 1',1,'2013-03-18 13:47:16',NULL),(2,'IBIS read me 2.docx',11488,'details file 2',2,'2013-03-25 22:30:31',NULL);

/*Table structure for table `dts_function` */

DROP TABLE IF EXISTS `dts_function`;

CREATE TABLE `dts_function` (
  `function_name` varchar(700) NOT NULL default '',
  `funtion_details` varchar(700) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`function_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_function` */

insert  into `dts_function`(`function_name`,`funtion_details`,`updated_on`,`updated_by`) values ('FILE','File upload/download, manages files.','2013-02-22 16:45:20',NULL),('MESSAGE','Send messages to other','2013-02-22 16:43:45',NULL),('MILESTONE','Milestones of project manipulation','2013-02-22 16:43:14',NULL),('PROJECT','add/close/history of a project','2013-02-22 16:43:05',NULL),('TASK','Task manipulation for a project','2013-02-22 16:43:09',NULL),('TIMETRACKER','Apply time tracker to tasks','2013-02-22 16:44:11',NULL),('USER','User Manipulation','2013-02-22 16:43:35',NULL);

/*Table structure for table `dts_login` */

DROP TABLE IF EXISTS `dts_login`;

CREATE TABLE `dts_login` (
  `user_name` varchar(700) NOT NULL default '',
  `password` varchar(700) default NULL,
  `role_name` varchar(700) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`user_name`),
  KEY `role_name` (`role_name`),
  CONSTRAINT `dts_login_ibfk_1` FOREIGN KEY (`role_name`) REFERENCES `dts_role` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_login` */

insert  into `dts_login`(`user_name`,`password`,`role_name`,`updated_on`,`updated_by`) values ('PMADM00001','admin1','ADMIN','2013-02-22 16:28:13',NULL),('PMCLT00001','client','CL','2013-02-22 16:28:42',NULL),('PMCLT00002','client123','CL','2013-03-18 13:24:33',NULL),('PMEMP00001','tl','TL','2013-02-22 16:29:19',NULL),('PMEMP00002','se','SE','2013-02-22 16:29:24',NULL),('PMEMP00004','sse4','SSE','2013-02-22 16:29:32',NULL),('PMEMP00005','da5','DA','2013-02-22 16:29:38',NULL),('PMEMP00006','se6','SE','2013-02-22 16:39:18',NULL),('PMEMP00011','sse11','SSE','2013-02-27 17:41:28',NULL),('PMEMP00012','se123','SE','2013-03-18 13:16:14',NULL),('PMEMP00013','tl123','TL','2013-03-18 13:22:29',NULL),('PMEMP00014','sse14','SSE','2013-03-25 22:24:04',NULL),('PMEMP00015','tl000','TL','2013-03-25 22:26:03',NULL);

/*Table structure for table `dts_msg` */

DROP TABLE IF EXISTS `dts_msg`;

CREATE TABLE `dts_msg` (
  `msg_id` bigint(20) NOT NULL,
  `msg_title` varchar(700) default NULL,
  `msg_desc` varchar(700) default NULL,
  `attch_file_name` varchar(700) default 'NA',
  `attch_file_size` bigint(20) default '0',
  `from_user` varchar(700) default NULL,
  `to_user` varchar(700) default NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`msg_id`),
  KEY `from_user` (`from_user`),
  KEY `to_user` (`to_user`),
  CONSTRAINT `dts_msg_ibfk_1` FOREIGN KEY (`from_user`) REFERENCES `dts_login` (`user_name`),
  CONSTRAINT `dts_msg_ibfk_2` FOREIGN KEY (`to_user`) REFERENCES `dts_login` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_msg` */

insert  into `dts_msg`(`msg_id`,`msg_title`,`msg_desc`,`attch_file_name`,`attch_file_size`,`from_user`,`to_user`,`time`) values (1,'hello','g','NA',0,'PMEMP00001','PMEMP00002','2013-02-24 18:59:51'),(2,'hi','h','NA',0,'PMEMP00001','PMEMP00002','2013-02-24 18:59:52'),(3,'bye','b','NA',0,'PMEMP00001','PMEMP00002','2013-02-24 19:00:01'),(4,'rt','f','NA',0,'PMEMP00001','PMEMP00002','2013-02-25 18:31:31'),(5,'mn','op','NA',0,'PMEMP00001','PMEMP00002','2013-02-25 18:33:52'),(6,'sdaf',' Write Description here\r\n sadfdsaf','SQL.txt',1034,'PMEMP00002','PMEMP00001','2013-02-26 17:43:41'),(7,'Title of msg 2','Desc of Msg 2\r\n ','Validation file reference.txt',6339,'PMEMP00002','PMEMP00001','2013-02-26 17:44:38'),(8,'Title of msg 3','Msg desc 3 Write Description here\r\n ','demo.php.txt',201,'PMEMP00002','PMEMP00001','2013-02-26 17:54:39'),(9,'Title6','Desc5','NA',0,'PMEMP00002 ','PMEMP00001','2013-02-26 19:02:49'),(10,'Title7','DESC7','log out code.txt',204,'PMEMP00002 ','PMEMP00001','2013-02-26 19:17:33'),(11,'Newest Mesg','NEwest desc','1.html',389,'PMEMP00002 ','PMEMP00001','2013-03-07 15:17:11'),(12,'My new msg to emmmp2','so desc is','2.html',395,'PMEMP00001 ','PMEMP00002','2013-03-07 15:18:59'),(13,'Hi','Messgae to 4 from 1','IFELSE.txt',1940,'PMEMP00001 ','PMEMP00004','2013-03-18 17:43:18'),(14,'My new msg wed','this is mesg','HS.xlsx',9056,'PMEMP00001 ','PMEMP00002','2013-03-17 16:12:29'),(15,'hi','sfesfsf geloo','Read me IBIS.docx',11464,'PMEMP00014 ','PMEMP00015','2013-03-25 22:30:49');

/*Table structure for table `dts_project` */

DROP TABLE IF EXISTS `dts_project`;

CREATE TABLE `dts_project` (
  `project_id` varchar(700) NOT NULL default '',
  `project_name` varchar(700) default NULL,
  `project_details` varchar(700) default NULL,
  `client_id` varchar(700) NOT NULL default '',
  `status` int(11) default '0',
  `user_name` varchar(700) NOT NULL,
  `start_date` timestamp NULL default NULL,
  `end_date` timestamp NULL default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`project_id`,`client_id`,`user_name`),
  KEY `dts_project_ibfk_1` (`client_id`),
  KEY `dts_project_ibfk_2` (`user_name`),
  CONSTRAINT `dts_project_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `dts_client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dts_project_ibfk_2` FOREIGN KEY (`user_name`) REFERENCES `dts_login` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_project` */

insert  into `dts_project`(`project_id`,`project_name`,`project_details`,`client_id`,`status`,`user_name`,`start_date`,`end_date`,`updated_on`,`updated_by`) values ('PMPRJ00006','Chess game','Chess game','PMCMP00002',30,'PMEMP00002','2013-01-01 19:41:21','2013-08-04 19:42:20','2013-02-22 16:58:11',NULL),('PMPRJ00008','Talk Title 3','Talk Descri 3','PMCMP00001',100,'PMEMP00006','2013-01-03 00:00:00','2015-12-01 00:00:00','2013-02-22 16:58:26',NULL),('PMPRJ00008','Talk Title 3','Talk Descri 3','PMCMP00001',100,'PMEMP00011','2013-01-03 00:00:00','2015-12-01 00:00:00','2013-02-25 18:29:14',NULL),('PMPRJ00011','proj 11','proj 12 details','PMCMP00005',44,'PMEMP00001','2013-04-05 00:00:00','2014-07-08 00:00:00','2006-05-17 01:40:02',NULL),('PMPRJ00011','proj 11','proj 12 details','PMCMP00005',44,'PMEMP00004','2013-04-05 00:00:00','2014-07-08 00:00:00','2006-05-17 01:41:45',NULL),('PMPRJ00011','proj 11','proj 12 details','PMCMP00005',44,'PMEMP00005','2013-04-05 00:00:00','2014-07-08 00:00:00','2006-05-17 01:41:45',NULL),('PMPRJ00012','new project 12','details of project 12','PMCMP00006',10,'PMEMP00012','2013-05-06 00:00:00','2014-07-07 00:00:00','2013-03-18 13:23:16',NULL),('PMPRJ00012','new project 12','details of project 12','PMCMP00006',10,'PMEMP00013','2013-05-06 00:00:00','2014-07-07 00:00:00','2013-03-18 13:23:16',NULL),('PMPRJ00013','new project 13','details of project 13','PMCMP00004',20,'PMEMP00014','2013-03-25 00:00:00','2013-09-01 00:00:00','2013-03-25 22:25:12',NULL),('PMPRJ00013','new project 13','details of project 13','PMCMP00004',20,'PMEMP00015','2013-03-25 00:00:00','2013-09-01 00:00:00','2013-03-25 22:26:13',NULL);

/*Table structure for table `dts_rights` */

DROP TABLE IF EXISTS `dts_rights`;

CREATE TABLE `dts_rights` (
  `function_name` varchar(700) NOT NULL,
  `role_name` varchar(700) NOT NULL,
  `insert` int(11) default NULL,
  `select` int(11) default NULL,
  `delete` int(11) default NULL,
  `update` int(11) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`function_name`,`role_name`),
  KEY `dts_rights_ibfk_2` (`role_name`),
  CONSTRAINT `dts_rights_ibfk_1` FOREIGN KEY (`function_name`) REFERENCES `dts_function` (`function_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dts_rights_ibfk_2` FOREIGN KEY (`role_name`) REFERENCES `dts_role` (`role_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_rights` */

insert  into `dts_rights`(`function_name`,`role_name`,`insert`,`select`,`delete`,`update`,`updated_on`,`updated_by`) values ('FILE','ADMIN',1,1,1,1,'2013-02-22 16:48:10',NULL),('FILE','CL',1,1,1,0,'2013-02-24 11:44:28',NULL),('FILE','DA',1,1,1,1,'2013-02-23 15:04:39',NULL),('FILE','HRM',1,1,1,1,'2013-02-22 16:47:32',NULL),('FILE','PM',1,1,1,1,'2013-02-24 11:43:00',NULL),('FILE','PPM',1,1,1,1,'2013-02-24 11:43:35',NULL),('FILE','SDA',1,1,1,1,'2013-02-24 11:42:42',NULL),('FILE','SE',1,1,1,1,'2013-02-22 16:47:44',NULL),('FILE','SSE',1,1,1,1,'2013-02-22 16:47:56',NULL),('FILE','TL',1,1,1,1,'2013-02-22 16:47:32',NULL),('MESSAGE','ADMIN',1,1,1,1,'2013-02-24 11:44:57',NULL),('MESSAGE','CL',1,1,1,1,'2013-02-22 16:48:07',NULL),('MESSAGE','DA',1,1,1,1,'2013-02-22 16:48:11',NULL),('MESSAGE','HRM',1,1,1,1,'2013-02-24 11:46:18',NULL),('MESSAGE','PM',1,1,1,1,'2013-02-22 16:48:42',NULL),('MESSAGE','PPM',1,1,1,1,'2013-02-22 16:48:43',NULL),('MESSAGE','SDA',1,1,1,1,'2013-02-22 16:48:12',NULL),('MESSAGE','SE',1,1,1,1,'2013-02-22 16:48:13',NULL),('MESSAGE','SSE',1,1,1,1,'2013-02-22 16:55:50',NULL),('MESSAGE','TL',1,1,1,1,'2013-02-24 11:46:18',NULL),('MILESTONE','ADMIN',0,0,0,0,'2013-02-22 16:52:36',NULL),('MILESTONE','CL',0,1,0,0,'2013-02-22 16:52:36',NULL),('MILESTONE','DA',0,1,0,0,'2013-02-22 16:52:36',NULL),('MILESTONE','HRM',0,0,0,0,'2013-02-22 16:52:36',NULL),('MILESTONE','PM',1,1,1,1,'2013-02-22 16:52:36',NULL),('MILESTONE','PPM',1,1,1,1,'2013-02-22 16:52:36',NULL),('MILESTONE','SDA',0,1,0,0,'2013-02-22 16:52:36',NULL),('MILESTONE','SE',0,1,0,0,'2013-02-22 16:52:36',NULL),('MILESTONE','SSE',0,1,0,0,'2013-02-22 16:52:36',NULL),('MILESTONE','TL',1,1,1,1,'2013-02-22 16:52:36',NULL),('PROJECT','ADMIN',1,1,1,1,'2013-02-22 16:52:14',NULL),('PROJECT','CL',0,1,0,0,'2013-02-22 16:52:22',NULL),('PROJECT','DA',0,1,0,0,'2013-02-22 16:52:22',NULL),('PROJECT','HRM',0,0,0,0,'2013-02-22 16:52:22',NULL),('PROJECT','PM',1,1,1,1,'2013-02-22 16:52:22',NULL),('PROJECT','PPM',1,1,1,1,'2013-02-22 16:52:22',NULL),('PROJECT','SDA',0,1,0,0,'2013-02-22 16:52:22',NULL),('PROJECT','SE',0,1,0,0,'2013-02-22 16:52:22',NULL),('PROJECT','SSE',0,1,0,0,'2013-02-22 16:52:22',NULL),('PROJECT','TL',0,1,0,0,'2013-02-22 16:52:22',NULL),('TASK','ADMIN',0,0,0,0,'2013-02-22 16:52:45',NULL),('TASK','CL',0,1,0,0,'2013-02-22 16:52:45',NULL),('TASK','DA',0,1,0,0,'2013-02-22 16:52:45',NULL),('TASK','HRM',0,0,0,0,'2013-02-22 16:52:45',NULL),('TASK','PM',1,1,1,1,'2013-02-22 16:52:45',NULL),('TASK','PPM',1,1,1,1,'2013-02-22 16:52:45',NULL),('TASK','SDA',0,1,0,0,'2013-02-22 16:52:45',NULL),('TASK','SE',0,1,0,0,'2013-02-22 16:52:45',NULL),('TASK','SSE',0,1,0,0,'2013-02-22 16:56:27',NULL),('TASK','TL',1,1,1,1,'2013-02-22 16:52:45',NULL),('USER','ADMIN',1,1,1,1,'2013-02-22 16:53:46',NULL),('USER','DA',0,1,0,0,'2013-02-22 16:53:38',NULL),('USER','HRM',0,1,0,0,'2013-02-22 16:53:38',NULL),('USER','PM',1,1,1,1,'2013-02-22 16:54:00',NULL),('USER','PPM',0,1,0,0,'2013-02-24 11:57:26',NULL),('USER','SDA',0,1,0,0,'2013-02-22 16:53:46',NULL),('USER','SE',0,1,0,0,'2013-02-22 16:53:46',NULL),('USER','SSE',0,1,0,0,'2013-02-24 11:57:46',NULL),('USER','TL',0,1,0,0,'2013-02-22 16:53:38',NULL);

/*Table structure for table `dts_role` */

DROP TABLE IF EXISTS `dts_role`;

CREATE TABLE `dts_role` (
  `role_name` varchar(700) NOT NULL default '',
  `role_function` varchar(700) default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_role` */

insert  into `dts_role`(`role_name`,`role_function`,`updated_on`,`updated_by`) values ('ADMIN','administrative','2013-02-22 16:30:43',NULL),('CL','client','2013-02-22 16:31:28',NULL),('DA','database architecture','2013-02-22 16:31:23',NULL),('DM','delivery manager','2013-02-22 16:31:08',NULL),('HRM','human resource manager','2013-02-22 16:31:14',NULL),('PM','project manager','2013-02-22 16:30:48',NULL),('PPM','post project manager','2013-02-22 16:30:54',NULL),('SDA','senior database architecter','2013-02-22 16:32:41',NULL),('SE','software engineer','2013-02-22 16:31:04',NULL),('SSE','senior software engineer','2013-02-22 16:31:18',NULL),('TL','team leader','2013-02-22 16:30:59',NULL);

/*Table structure for table `dts_sol` */

DROP TABLE IF EXISTS `dts_sol`;

CREATE TABLE `dts_sol` (
  `sol_id` bigint(20) NOT NULL,
  `sol_title` varchar(700) default NULL,
  `sol_desc` varchar(700) default NULL,
  `status` int(11) default NULL,
  `bug_id` bigint(20) NOT NULL,
  `sol_date` timestamp NULL default NULL,
  `updated_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated_by` varchar(700) default NULL,
  PRIMARY KEY  (`sol_id`,`bug_id`),
  KEY `dts_milestone_ibfk_1` (`bug_id`),
  CONSTRAINT `dts_sol_ibfk_1` FOREIGN KEY (`bug_id`) REFERENCES `dts_bug` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dts_sol` */

insert  into `dts_sol`(`sol_id`,`sol_title`,`sol_desc`,`status`,`bug_id`,`sol_date`,`updated_on`,`updated_by`) values (1,'solution to defect 1','these are solu 1 details',30,1,'2013-04-05 00:00:00','2013-03-18 13:44:50',NULL),(2,'solutoin for 2','details sol 2',20,2,'2013-04-04 00:00:00','2013-03-25 22:29:57',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
