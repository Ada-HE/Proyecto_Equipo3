/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - mixsandwich
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mixsandwich` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `mixsandwich`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`),
  KEY `Verduras` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`IdCategoria`,`descripcion`) values 
(1,'Carnes'),
(4,'Panes'),
(2,'Quesos'),
(3,'Verduras');

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `APaterno` varchar(30) DEFAULT NULL,
  `AMaterno` varchar(30) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Usuario` varchar(20) DEFAULT NULL,
  `pssword` varchar(200) DEFAULT NULL,
  `IdTipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`),
  UNIQUE KEY `Usuarios` (`Usuario`),
  KEY `IdTipo` (`IdTipo`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`IdTipo`) REFERENCES `tipos` (`IdTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`IdCliente`,`Nombre`,`APaterno`,`AMaterno`,`Telefono`,`Direccion`,`Usuario`,`pssword`,`IdTipo`) values 
(17,'Brayan','Hernandez','Gonzales','1234567890','Chalahuiyapa','Brayan','cd9bdb927265e2a4e1e25c618179061f',1),
(20,'Adair','Hernandez','Escobar','7713565486','Motoltepec','Adair','bdd6c8b2bdb1fb427af9ddc26df4ccc7',1),
(21,'cdc','dffdfd','fdffdfd','443344','ddfvdcc','bra','3c6ab8c37ec264689cd0131c7014b99d',1);

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `IdC` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`IdC`),
  KEY `IdCliente` (`IdCliente`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `compra` */

insert  into `compra`(`IdC`,`IdCliente`,`Total`,`fecha`) values 
(1,17,NULL,'0000-00-00 00:00:00'),
(2,17,NULL,'0000-00-00 00:00:00'),
(3,17,NULL,'0000-00-00 00:00:00'),
(4,17,NULL,'0000-00-00 00:00:00'),
(5,17,NULL,'0000-00-00 00:00:00'),
(6,17,0,'2023-07-24 22:11:13'),
(7,17,0,'2023-07-24 22:11:19'),
(8,17,0,'2023-07-24 22:26:24'),
(9,17,0,'2023-07-24 23:22:16'),
(10,17,0,'2023-07-24 23:37:50'),
(11,17,0,'2023-07-24 23:45:13'),
(12,17,0,'2023-07-24 23:46:38'),
(13,17,0,'2023-07-25 00:16:53'),
(14,17,0,'2023-07-25 01:26:02'),
(15,17,0,'2023-07-25 05:36:41'),
(16,17,0,'2023-07-25 05:36:58'),
(17,17,0,'2023-07-25 05:37:14'),
(18,17,0,'2023-07-25 07:18:55'),
(19,17,0,'2023-07-25 07:38:21'),
(20,17,0,'2023-07-25 07:50:36'),
(21,17,0,'2023-07-25 07:51:42');

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `APaterno` varchar(100) DEFAULT NULL,
  `AMaterno` varchar(100) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Usuario` varchar(20) DEFAULT NULL,
  `Pssword` varchar(200) DEFAULT NULL,
  `IdTipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `Usuario` (`Usuario`),
  KEY `IdTipo` (`IdTipo`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`IdTipo`) REFERENCES `tipos` (`IdTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `empleados` */

insert  into `empleados`(`idEmpleado`,`Nombre`,`APaterno`,`AMaterno`,`Telefono`,`Direccion`,`Usuario`,`Pssword`,`IdTipo`) values 
(2,'Fabian','Gomez','Boles','778865409','Huejutla','Fabian','1960161b53ff409fac80f6f80985b6de',2),
(5,'Dennis','Escala','NuÃ±ez','3456789012','Huejutla','Denn','2084c04f7a380a68b653e5fc82d352f0',2),
(13,'Andres','Hernandez','Gutierrez','7712544525','Huejutla','Andy','202cb962ac59075b964b07152d234b70',2);

/*Table structure for table `municipios` */

DROP TABLE IF EXISTS `municipios`;

CREATE TABLE `municipios` (
  `IdMunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdMunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `municipios` */

insert  into `municipios`(`IdMunicipio`,`Nombre`) values 
(1,'Chiconamel');

/*Table structure for table `productofinal` */

DROP TABLE IF EXISTS `productofinal`;

CREATE TABLE `productofinal` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idCliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productofinal` */

insert  into `productofinal`(`idProducto`,`Descripcion`,`precio`,`idCliente`,`Cantidad`) values 
(5,'Lechuga',2,17,4),
(7,'Cebolla',10,21,3);

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `Idp` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Categoria` int(11) DEFAULT NULL,
  `Imagen` longblob DEFAULT NULL,
  PRIMARY KEY (`Idp`),
  KEY `Ingredientes` (`Categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Categoria`) REFERENCES `categorias` (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productos` */

insert  into `productos`(`Idp`,`Nombre`,`Precio`,`Categoria`,`Imagen`) values 
(47,'JamÃ³n',3,1,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z\Z( \Z%!1\"%)+...383-7(-.+\n\n\n\r\Z-% %------/-----------/-------------------------------ÿÀ\0\0·\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0>\0	\0\0\0\0\0!1AQaq‘\"2R¡±ÁÑğáBCbñ3r’#4Sc‚ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\'\0\0\0\0\0\0\0\0!1AQ\"¡Ñ2aqÿÚ\0\0\0?\0ûˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01Dµiw²ã©¯âCi˜Ûê,Œ¶­>wî\'¡‹„ô~HÜZôò“v\'\0 \0\0\0\0\0\0\0\0\0\0\0\0*ã)ÇY/ŸÈÂ;B›ş$FÖñËéh~²Ÿ¾?Y{æNÏô°\nU65Å¾ä`¶¼Š^Dn\'ñåôØ]-­uËm¯wÍÄÎ–wá·Š[uòH£SmTo&í}rH(¾=¾uÕ‘Ê´V²KÅÒÚ2z·æ{o+«>íQKÿ\0m~k~ñôıï™\rM­Ms~9U4)ÖO\'¨òi;l[Jı¦ŠÒ\r÷»¾ĞÉÃz1Š¶M;¾ãE´)­Û­nQÂâôÉ&¤º?ŞÅ|«yÛtõ¹ÚÛ~«Œò\\¬‘J{Z«µç.¹ı\rz¯ªæ¸ó+Ò«ˆİoC	ğİC&­tZ§\røÚùœüjÌškª#hÏ¸Ô×ë|l{Kl¨³,j¼™­Æán®’]ÜÈiã,åÚl®Ğ©YONgB™ò­ŸQŞÜüó³øÖÖä¼>ÅñËâ¼şë¶˜ş¬[ «€\0\0\0\0\0\0\0‹]B.OD&ø1ˆÁ]œ¶ØÛ’yFéâöÓmİ]r)¹o»”·oC£Ûøs”C9jÙs„æÅ¤g<TSÜ‹R¨ôŠù»hŠîGMİô°ÚK\\‘^X‹iwôÎÙ“×¤÷lŞ|{ÿ\0¹Z«QÎÄr®2&•K¼òò³<RWË\"´±©«q+NºK,˜Ù1mç4¸•QóĞ«u®G©F¤lØÚqÂ6õ«-ÛÛ.¶¿Á•g‰I(¨JÎÍ¿U¤ôÏ;¯\"¤ñWÈö–ûi¨I«YZ-÷ğ!y5\n2µî{SMÙùjlìLı˜î®M/†¥¨ìº™:•\"¥Î)¿‡*ÙÚÌ*ï;ŞäU#ŸæE¼.	[zïÊä’¢ŸğüÉ‘O.TÛºYwıÍez;³é-mÉëñ7ué[KX§élïk¡WÂı5VygÁÙdù;ÒÂÏ{(K¦O™»œäš”_ªüÓårXVºÊù\r/ù,øj©lÊXy´‘¾Ù¸;E¬¯ÑÜ§9¾l––)«YñÍt#QLîYM3©³’wNÿ\0ªP\\®û“ù›ˆOy4¸øq”¬ÓK&‚˜åmÕjIÃÙ´|ù0[V¥ı¥ç÷$©Gy]çÁgš*Oºß‡/i$¼W]³¶®öSóFÜâ0-£§ÙX›­×ÃBøåñ\\ÇBcÎ-€\0ÑÆ\0\0\0\0¿kq(/§lávµ]ê™ñyøêW\'WióßÓ^¡rä^êòKÄŠ¥£îˆ%±êWtç98FrP×yæ£\'Zİ#<®œ²óRbqÍª‘¦Öò´S—²œ³môŠÏ®„Xl]*)Æ.òyÎm-ê’âÛúhjövOJ¶Y¿bù·{·Ã²Éæëİô²ø3=ÛZOÇ¯ig·Q†R³´š¼Ò]ïé©>ËÂöô’~Y/££†…\ZvŠJ1Y.½_Í—åyáø´ŸğıÌçWÂ+?6ş„Ñ£\r5ÓŸ™œ(¹7)^÷È·J•¾äÄ[¯hiá ¿‡>öIúx{‘Ï¥Ì£gÇŒı$R%KiNJ:E.ä‘›Ä>%YÖLÊX…dùdãş–•C+‘SÄ\"WW@i¦b¦Ñ7¤<©4ÂP8²)àø­>±ém™ãÄ2S-•ğI&éËÙ–Yğ|\n©¹,ß5/\\E$ìù”å8Î÷Êk.’µõë—À…ç7kp¬•î®ŸB<<ılôehİ%ùùÄoçÜBúm¨×P¸p-âò\\\riå×?ÏÍM¦³qA–XkU‹ó2œ]¬ûËŠ2{¿‰~‘;ZZkÔhóÍŸ‡V»ÑÑ®ã;Û%ò0pİVLÊSºK¡²¾[t`ò(ôİæ\0\0\0\00«ì¾çò8Lw´Îùœ?i’„›ŠÕhW)·_iœ™YU©IYÍ¬£§+şÅ,VÖ¨RkäeBr•û;Ò–]—ĞÑbã­Ø¥œ½<\\?hç¼Ô·d“³oÕkRFÒ®Õ£$¯(è½®¼ø3‚e¸åk$æõ³ÎRR}sŞÇ`eŒÄº’ÿ\0· Ó³Ò¥EœSæ—´×râVëKŞœç/Z}2”÷c«»ÓyİÇ¥újG_ä’O$c^·›Ó¢×ã©QAİg—çÄHÂIî¯ï<®c*Œò¬“O5oŸ‹*¹ÙY;ò.òÒ+ífS#©U[Ä©Z³æW©Y²S¥¥ˆW·ÈSš5°-SÒÕr5I}+5î¦ú–#P!=LcFK½käÊ5¿?¹å9j/ºH¡_6ˆó1•D®\r,N¯3QŠ«ë>¬ÏŠâj1ØŒ“¾d´éãËa†Å;Ù¾&SÆ%7ùª9ú8Æ™bòŸæD6¸sËuO¾¬³9*TÜu/CıVH…2ÂW_O½ê¯PÆí}Öã\Z·ôF;Wu=ß3YS”²Ï›#l±èMóéÕ­°ûÙ½ìæÔµIhWãÈá½4)ÛyŞ\\\"¾¼ç`vŠ›„a(ú;e~±3[åq…˜~ˆéAädšºw]MH\0\0\0\0j¶–.ïuR*ôî‚ØİWŠ¤·,²³’úıNs‡Ìëv…4›Œ²RÑò|\rDö$›Î¤Tz]ü²â½nß9qæ¸šıŸ©Yª0oÖ”ù\'+¶ú+³¾Ù»>\ZŒhÓö ³oYÉæÛêŞo¥‘&é+G/zOÙq8¥\'héóêS[m–w.>\n•/#5Uq(KN/9Åx¢\'oa œe^œ[àä®¹»_^…ı#Çm´qŠ~òNİè‰ÕåÀæ1}¶ÂÇÙ”ä’²Q„¯—ú¬¾&¾§øƒNş¥\n­õİÉ°·ã¿NÉÉ¼¿?>ÆQÁÔíıFÿ\0éá¿İ\'$‰cÚl|ÓÜÃÆ=ûÏìÓËéİU¡—Ğ†2\\Îâöœ½Øø}Û!©Kiä·tcö-øïÍwg¦tñ	-OJ†ÒÌ~\n+åÊ›\'h¼İYÿ\0¾ß+øWĞ¥ŠYİä’ñ||4+KjE;oEw³„ÿ\0•±S^½Y>9ÎMO°•®ŸªÓâ¾¡>?ñÜËoĞR¯MwÉ}ÊxÖaWó®ÿ\0¥J_¬ip=†KüÆïÓ%ætø~Êa’V„mÆë_¹KSq‘¡ÆvÆŠVŒg.^­¾m\ZŒOhgSüºÇìş¦Â¡Â”Uº#*;:†Dí3)=>kéñÙ§kôoê\'_hi½(ôQŠúO)pÈª¨¦ïl…«Lü½ÇÎkà1ÎÎs¨ïıvù­‡ˆ“ÖWÿ\0S>“ˆ¤™…\n	4ÊÚ¾:×1Íl~ÄÊjõ*»ò»ù³§ÙıPö\'%Ñ¶Ñj0’wOÈÜlùÉêŠíw-{áWÙ¨§vì^[-ÇCuB¢¶vL×òzü	qyåµ}Ÿ‹\'“ËŠz3§Âb•Eu“âŸ•H9^ÿ\0bÜ6‹ƒ¿ù¢Øå¦]~—Ÿ2ré)©$Ö\\ÈÙç\0\0\0\05›_fª‘vÔá¶¤1T®¡\'nIÛÌúa\r|4gí$Ã^ŸVàø­OO)zó“~KÁ,‘5m˜«Gv¬eoz7ºïKSê²ØtøEyÃe¥¢C-Y§Tîì»‡âÿ\0ÃÇíB¥ãÁîİy¢”{om¾ô²ó>ïWb­cê>š>ôk±{5¯n^ôU×Œu0¸ÙéİÒş£åÆO”a;+MdÛk”¾œµÍP_ËG_=—wšéõF¾¦Çš#É¿Ÿ—ª§KeE$·U¸·{Û†š¾òXPIÛuY?4[Y<eFì–{ûG\Zqà¹™Ë¬I:Né÷õäûÿ\08I.$Åmkı\Z\\Õ³W.JŠæbèøô	âµ±mß%–œ-÷,P¦ÖmêÒV^ª¿R|. ZÙ­ £BïÖÓ¡œé%¢û—eˆgŸ\0ËËj3“yîsTèØò­‚n_MF=å—(Rõ/¢\\x·~³Wß%\ZoÑIRd6õŒQk‡ÌÊ\"HQ³O‘iÑİO[<Ó*µÊDTR7[6K4—‘££O®…ì=F˜gÔSKûïfSu¬õÏ®†Ö¬”¡ÖÆ†¶õòe™a74Áã¾FËˆßî54ötÛ¹¼Á`ÜWwÏÆGS±[ôväİ¾eò¦Í¥»~òÙ¶>Rï+ \0Y@\0\0\0\0\0\0\0,VÌ„ó^¬¹Ç/>f£”o¿åïGê¸JÛ§×ËS7ëA©%ËUŞ™J¬ÚzÙõLïq[&{ËÔ—½¿¹ªÆà&—¯R>ôr’ï\\Lî=.Ÿy†^ÜÌ*>6}Äğ«ÒÅŠ›:8;ôÑ¯J\r?Ë‰]\Z™zXl’V\\ÊÔk[\'ñ/Ó»Ğ•2š)a—|ï›ú– ­ÀŠ™b:yZqq\nfu)Û3\Zl#|0¨¬Ï«¬ÈÔ‚g¢50T²Í/9VQWã¡Ru›É¼Í+ÑOC\Ztgk7—!éWÅ	d,[ÊÈ‚ñ-Ò ‘ê–dğ‚¾ºkr–vûGè]¬ClµúØŞË?Øİ»ğâEV\\£Ü>#i‚Áo5)+%¢ú³ÜömYp\\ú³h‘l1ù®.·[â	€lä\0\0\0\0\0\0\0\0\0\0\0\0\0\0QÆìºu5V|ÖLÒâ¶]hr«¾Òñ:€Vã+nŸ_<Dğôæí}Ér^LÎiC]«³éÔö¢Ÿ^&ª®Ç©Oü©İ{²Í~y¸XíÃ»™M_ßùk¢ÿ\0,rf¯j‘tß5œbEAÚé©.k2­-•‚’!fr‡LÑ˜ÚdzE5È–„uòDˆ§íÄ¯*e˜Ów¶G˜„–¾D\\éI,ÉéWHñ$c\Z7yZk~×iÕ¹\"[Ùr0£JÅÚTŠZÎğÃ…·Dmp8Ùµ—Ï«%Áá/›Yp\\ú³b‹a‡Íquºöñ$z³\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Z1’´’f²¶ÅIŞ”œÁøpE’¯S,}W7_~9U§ê‡Õª0Ÿ±$ú<Ÿ‘Ó´TÄlÊSÖ*üÖE.Œ;Ÿ¶‰ášZ>ò­l=ò7’Ù^ÅVºK2)á+-c	|\nÜk|zøı´Ö’gƒÕæoeAÿ\0).ìÌOÿ\0®~Dn´ü±¤¥E\\¹J\"ü02zRı4‹T¶d¸îÇ»7æÆ­F]|gË_\Z6Ï´Á`ïœ•—Åõeª(Ç=_7›ı‹%±éü×S¸òâ\0jæ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÙ'),
(51,'Tomate',3,3,'ÿØÿà\0JFIF\0,,\0\0ÿá\0QExif\0\0II*\0\0\0\0\0\0/\0\0\0\Z\0\0\0\0\0\0\0Tomato with slice isolated. With clipping path.ÿáKhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\">\n	<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n		<rdf:Description rdf:about=\"\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:Iptc4xmpCore=\"http://iptc.org/std/Iptc4xmpCore/1.0/xmlns/\"   xmlns:GettyImagesGIFT=\"http://xmp.gettyimages.com/gift/1.0/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:plus=\"http://ns.useplus.org/ldf/xmp/1.0/\"  xmlns:iptcExt=\"http://iptc.org/std/Iptc4xmpExt/2008-02-29/\" xmlns:xmpRights=\"http://ns.adobe.com/xap/1.0/rights/\" photoshop:Credit=\"Getty Images/iStockphoto\" GettyImagesGIFT:AssetID=\"941825878\" xmpRights:WebStatement=\"https://www.istockphoto.com/legal/license-agreement?utm_medium=organic&amp;utm_source=google&amp;utm_campaign=iptcurl\" >\n<dc:creator><rdf:Seq><rdf:li>Tim UR</rdf:li></rdf:Seq></dc:creator><dc:description><rdf:Alt><rdf:li xml:lang=\"x-default\">Tomato with slice isolated. With clipping path.</rdf:li></rdf:Alt></dc:description>\n<plus:Licensor><rdf:Seq><rdf:li rdf:parseType=\'Resource\'><plus:LicensorURL>https://www.istockphoto.com/photo/license-gm941825878-?utm_medium=organic&amp;utm_source=google&amp;utm_campaign=iptcurl</plus:LicensorURL></rdf:li></rdf:Seq></plus:Licensor>\n		</rdf:Description>\n	</rdf:RDF>\n</x:xmpmeta>\n<?xpacket end=\"w\"?>\nÿí\0xPhotoshop 3.0\08BIM\0\0\0\0\0\\P\0Tim URx\0/Tomato with slice isolated. With clipping path.n\0Getty Images/iStockphotoÿÛ\0C\0\n\n\n\n\r\r#%$\"\"!&+7/&)4)!\"0A149;>>>%.DIC<H7=>;ÿÛ\0C\n\r;(\"(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ÿÂ\0Üd\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ö`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*±`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0›•zZØ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0krÖ\0\0\0^|»]\Z€0€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0q±Êíïrö\0\0±—C×ÑoNk¼1¦$ÒiÎ{ebrÙo0\0\0\0\0\0\0\0\ZÃ•:Zß2\0\0\0\0\0\0\0\0\0\0ZµóÜŞ“£¦åì\08µcŸ”K§§V½WHãMSˆ’7µwšË9ÍlºåèiË,Ğ\0\0\0\0\0\0>\\2õı}´°\0\0\0\0\0\0\0\0\0\0æù¹©Ò£¦î—\néÊË¿ŸŸ]šø‘Çd3ß¤Î‚šÕ¦ñ,™™›á¼ÆÓY&–¯ÏÖÓ†öœÙ\0\0\0\0\0K:ø¾^n•ôõİ{ä\0\0\0\0\0\0\0\0\0\0\0+Ò¾[—“Xz¾¾¹m~V=ü¼»µZHÎËæªWè+[§xnC\ZsóêÒÖÅzzñm1^šé–ÙÜÓŸ«·ON=€\0\0\0\0\ZÃÆòrÓ¬{~Î«6\0\0\0\0\0\0\0\0\0\0\0Vp±æ²¼¶ú\nñÓ“el8!#Œú‰²Öİ©µ¢½u¡N¨ía4gÙèó­Û¥:9¸öU®ÒZ=¼î–¾RüÙ&» \0\0\0\\1ñØáéõßÒtl\0Öi\0\0\0\0\0\0\0\0\0\01=ÉHç–:cŸe¥šNñ¸Ö­\\~‡¨‰ôÏE¹ùuÒ&Dªv¶óºÚùø‰çgÙÆÃÑ­:Úa×èàîoåÙœ«b\"Öó\0\0Dxn>Jé÷ı}SÚD4ˆké2Lä\0\0\0\0\0\0\0\0\0iZt¤uGœfpÂvèÇ·$eZo^®¶>µi-©uäåİ^tÄÀŞ#³¯ŸÚÛÎ•œ1§G—¡¬ºåíôù­¼ı‘_\'?–¹±¥€\0>>S<{×ÛÖtì)c]+ú/\0\0\0\0\0\0\0\0\0áx°ç+´$Se&VÁ+zôí¯ZÅ·£ÕuXµIçç×Ï¯N²I××‡­¯ó«]¸<ş­6×cşœ½8ìßšáŠ×‘Ã¾¨èo®@zÇ‡åå­/o¿OKKs°¦*èôß \0\0\0\0\0\0\0\0\0\0P¤ùŞF:ÛHÆ¼qU,Íu™’z¹öŞÍ}~ÌZİ«^›s3ëŠm€‚gŠõµâèiÉ\"™˜Ò¶ça×­m¢Ø#_CT_×“­¯ŸRm^·FÛLˆ©w<½sèµ÷½{ĞÆ•2§k«lÈ\0\0\0\0\0\0\0\0\0\01f=<ìºt­tgbyÜËcïz»Ñ{6rô¬Ö/_\n‘½6¸–3:½m8îß›i¬yŞ®[•Ñm\"ÉF˜ÖŒciãíÇ>ónıÒ2æåÏç#}¯ì/¿^öãóaİêŞ{ÛuŠÙÅh™­6îšÀ\0\0\0\0\0\0°çåNVYó³hÚ6Lë9Å4èS-íZ«ç/w¥=2Ş¼üúªµÄ£´á\0	¡×ÓŠåùãÎğç¤³Ñ\ZÄé6Õ8’D@¼1h%-|Î¦&ÖÒHr§.$ÚDû}6çe”µÚiõ5?–Xzı1ÓèX´€\0\0\0\0\0\0?\ZpğÎÕôæåìX¶Ù[]ù³)Ï¢òz4ó9—Ú,ı‹qÛ×ßU©Ó¢…7©:k, d\'«n[Œ4¥§œµ‹jœK	Õ9D³MLÚV+#¡ŸÏÍÑÅ„ñnºô²Ç°™¢dÏ£•XÕÓĞ·£¼íµ«Ôß‡¥¯Ò\0\0\0\0\0\0‘Ï‡[}8\\ş¥\\ú%µ+×Nu6Şryw\Z3Û£±–İ=¹¤šÖ®ÔéÑJºÕµğ‚œ§¤Ã¥<’©_&%\ZÃ(I¦È’)R5®Ö½\"Å|í´óslt+# Ö×’è»^ëÎÄµ‹E[ÄµÍy½7_fù\0\0\0\0\0\0RÎ»ÊÕíVšù>O^KòUgR¹E5‘ÑˆïS|YyŸwNMæ°×Zuè¥M©5Šc\0,;nYb›Í13\ZÉV®°Å·šÎÎkREr•’µ­\ZíEŒq†+¼ğM¡g|N¥·‰–#y®¢jWx—ÚùúŞÏ¥¯(\0\0\0\0¬!ˆ±iw›Ô‚›Ø¶PÖğWDªÆ°Eµ$š[Sµ·UÒz)Óz1­i¾³R0„Ê{k\næ+´Æ“8M\Ztó&ZKu¯¹ú–åÊ6Fñ\\VeÊ–2ÊE*k½;k^+_Y´¨Ö/ºÄfb‹¢\Zë­ëì{<¼€\0\0\0\0\0Çğû·/”³HcM\"ĞWJ±¬Q+GJü¸­úzqÕ¯E\ZtS®µ\ZEhÂ©aQ”ô\"V(o4}Ë¯uv™šë¬Óeİ6VX¢³c<¥Ï4ªë¾³1ÅğikdÒ-”alKX¶±;+BÛV®ùµ=ÇoÎÜ¾ \0\0\0\0\0Ò\'Äùÿ\0EÔÛ’yÏi¬5Öz*SX¿¯/nü‰†5çÓªv©\ZÁ3¬Ób`¢Ş‚1Ú©&‰jq«è@´Ó”•¦Ó­Vômj±ÖLÄn­Šçc,vˆKÅ7†ÚF¾eªqƒuF†©‚ºå^}·­ÚÓ—İö|öÓ\0\0\0\0\0jéã<ÿ\0¢ékËvüÖí…*ôĞ§MJí¬ºÚñu-Ç¤[ŸNÎn}4£ZÓ}f¸šá\\K\nå7ë8‹Q[’í¨ÓMoF=¹á«]9Ó2½\r2…¯AÍ4g{>mëH×¯}b¶‘ÍôY,\':Äí1”bÍdŠÖ®Õ«¶óNUº!méz<oKÑå€\0\0\0\0©¯‰óşõğêïÃnyùôë£^šµ×ù:„Ö…:hWz“x¥‰®Ä×Onµ¹ÍlÑô·½a¥îeÃ¥¯¼Ïf¼vµÃÎeèÅ[ckŞ×YçĞK\\øl¬7Ö¥·ÖÖÖm\ZøN¦¬[Ä[*É5İR jÓ|Úœ{uH¯Ğ{~f{P\0\0\0\0U¿…óş’X¿G«aJ½4éÑV4ÄÅ›cjs·§]ªÆ•­mf¤j®&¸˜Ì$‹wë[sÏ‰*áO¡o\\(Ó{Ysté…‹gĞ¿&‹pc¿‹=šÍ§OyÁÓ+8c¤M~a`t_(Òm¬ÌqjUİnrèéÇ^š¡$Ó3©´Ö—¨ßÔôxŞ0\0\0\0\0Áô4òéêmÉrüõkµJí^/¤¤µ%Sjñ¥eô˜Ä×Ä×ÄÀèUÓ¬Ü·0¶ã[µx«M1Xë×—³<6£JWè£]ù.ÜÄú+ù·éÉ&T[Ö¾Ü\\ûé¶ëéËV»TkÚ°o^¥¹\'œc­Æêo5«Nˆ¦yé¹8{Şß\0\0\0\0\08<Ş—™åö._·Â(½ZëYxæs5İQZœLak5 ×¢Ü-Û\ræœjwIµ5‰»$QkS-„Ì÷Š×¶Î”³è’\"öœÖkŠ#M-N½Ìºàµîo2p4Ú\Z§D$:,2·~x©yf™F‘jÕŞ¶¥]ş‹ÛóZ€\0\0\0\0*Ó_-ÉíQÏªõğÕ5¢õši,Lm5B4àÄÆF&£ÚE…lÛ¢¾uét5æ¯]7Ï,ÕÑŒlNrZ’)v\"c^U$­1bÑ_=åµ!iBz8İkik2×:—±bmÅ/NEeŒ÷šK4ŠºV®ØÖœ‡_·êùş–œÀ\0\0\0\016>‡çõt¥äµa‹W›ë,MS1L ‚11„ékYç<CXqg¹¤kV(·L®ÆV­ŒÖÎI¦êæckDqd2­]æ6Dq}æ©Ÿ/_S™^®Y^§-kCN¼&H›ìlÎ6X¢$šëY­Gi­¤ú]ü®¶¼`\0\0\0\0JmÃÃÒâsú#YE6ÖXšâcT\0F0„Æ¼G¡¬K9ˆbô#¢Û³=ŒGY±5©¼ÒKWi®LÌi„íjÉ5–h«5,’ô¤èò¹úİ\Zá<S‰=•“•¶‹É“ìòïÌÂª‘Ñöúy:šruõâ\0\0\0\0\05‡\'.î&•úcN’ÒX5˜ÄÔ ŒL0¬¨ô‰§<&(·.½uìíkÃÒåãàÏu¸›ÎY¤öÏ{QËDàÚk,ÖEQá\Zímô¤M8õí¯]e¬qã¦)¾Ó}+;(Ã\\İmxpmX¡^ª³·g¯Ë½n~¦¼€\0\0\0\0\0¯]<şŸ7.ÚõÖ$ë-Mf5š‘€‰‚0ŒLXŠ÷k3ÎB4òëÕÛ±§3è±4°Îõùåµ6µFQ\ZÉI4–k˜imâºŞwµq3_ZMHÛÍG¡×ÓÖ9Aœğµôg¬Ú®}=8ˆ•J4êç:½gvØttå\0\0\0\0\00f]\\=JTè‚/¢q-f5F³R15šÏåfÄå”js«Ñ¦³:kâóĞ¦7çDËjY¶R3ÖÖÑ:§ul[-+mklÚ%µ5[(–)Ï¯W\";9ÑeOMŸ›\rcO_\r;sÅ5s#yŠµŞ“~ÿ\0_‘~ü×¯€\0\0\0\0`\0`âcßÅÇÑ§Mâ‹êk1¬Æ&¸FA˜’†©™í5Ñ4ë·\"zÈqõõñ¹4ë«=SE/ÛšİñÙ]m:ÌëN»u¯Ço¬Îó\\ÌÈ¢\n¨:b‹Ğ§E%à¾ú¯¥ghw­Áµ+¢dšÒ¯N—ßO—ÓÓ’Õ²\0\0\0\0`\0`\ZÃ‡¡ÇË¾•:!_³šá\\L0„&=kÏuuO6½Ût\"::rö2áä»¥Šç’Å³êiÅ‹4Z{Ì­ëóÃÍ¢X¬v¾ñYã:Í³ç#ÑäODÑE£Q6+N¤òmZ`ŞcŸ^¹µÇ±¿Ø×ŠI¨\0\0\0\0\ZÄò3íãcßFFšK\nâk‰‚0€F$Gr‹	rDD¶Î¸ÜÏdíÖ¿5LwRñMûSÃ~ü²Ş•c^N]Iæµ|TÌŠæª–Ûdi[qxÎf¶UóY›î™«KuÆXÊ{eiÎ¾–ü=M¸{:ñd\0\0\0\0`\0ÁƒR8Q§O.ş}:kWX“‰Œ#\\ 1.†v¼·BÜ‘-Mfœûm©Ö·c/;>)éêÏ=\Ztwïçß·/.½\\Úuu­Ëbq»8G6ªÖäe¤Ï;.W?>ì©m}8ı$y^b=>ı9fzQÌ¤M9J¥*ôÒû½_Wn.•ù€\0\0\0\0\rMakEùÙösóë«]«Fš˜Â ŒH‰«n–{[¾³Ä´‡Õ\Z{Åg>_7¯£#YS-è\'ƒ©~.-{yqÓu”±Ní¸¸îˆâÖ¦–\"¾z{ :8sröëÌéÛ¯>7©;ôí„ôÎ:ÚI¦Ñ]:Yßéò»ZpØ¶`\0\0\0€¦°Œ‰5Ê±5cJÔê¯NšµÚ¾†¨La\\Hví[¶æÕÄÖ›òã|LæcXm3)š;öóí[TupİY‰½\\úËÃ·]œò‹KoVÑ•M:­V½Úpğ-ßôm\r¡ÛÓ‚¯¤Nó]\"ôµåîïævuâÈ\0\0\0\0\0À0`ĞÒ¦Á\nÉ¯imi[Tfk™ÎKe6]sóúvm”“”KC®µm,×X¶Èš\"İréÛ’KgÌ,u<Bs­:f#Y¥ñR¾òÚ}~7ºñvõïM$¬YŒa­·šìŠq½iÓ½Ñå÷¶ó­Û \0\0\0\0\0\rM\r!\Zc###LdpÑ80Ëdno»Ší,ç™®LC6çFó«4VÄRË)§=íJÑÉtË1^-‰‰Ô‚/zøÍæW«TOi³ÅkQÑè´àÒ—‚— kªÍ°ô=>Og^<€\0\0\0\0\0©ƒSXhjjL\Z˜0“&H«¯™ãú-Õ±9bk\ZwF‘;L!º²DI4Ä¨GEı	ÆvÅ³ô5ó|ÅıN­¹»tâñÓë!Ğµ.N|lú¥‰ôzyÔsßSd!]­f¾3ÑïæK5È\0\0\0\0\0\00`À0\0\0\0sríó<¾äŠï9ì®ÓYTÑ6è´ˆ–s©]¨Ó¦µ´½8sãkÓÍİ§›åõõ§šúÜ¼§²‹ú\r9!¦¼êôX­zvå«]q)ã8Zs-9=?Ovø€2\0\0\0\0\0\0\0\0\0\0€>=ş_›ÚÚcedSy¦êÏ9ä±ÌÖ¼i6Š4ÒUfğÙiM‘Úh¥¤ÛGZyke¶“$eYµ6Ö-—ªéñzzrŒ€€\0\0\0\0\0\0\0\0\0\0`\0`9¹õy^ojÔ‰Şk:“)frÊ±¬‹âğEã™}â!\\ŒJ9´õ‹Ìb[t$DKÑäœıOOÖ×&A\0\0\0\0\0\0\0\0\0\0\00GÄËĞâåßF;£t\\c´ÆUÚk\"7V(¶ÆJİ¢v˜İ\Z-$Ff7VUc‹Sm¤ÚyÏÓôøİ-y62ƒ \0\0\0\0\0\0\0\0\0\0\0€`554†…:íÉÏ·™—luÜm$ç¬ÌŠå©²+Æ€b\'82+2µZÀ¼k]·7¥êñï_Ÿsc&Lƒ \0\0\0\0\0\0\0\0\0\0\0€555„dIˆ…4)ÑËÇÑ«Ÿv¨MrH‹Œ·ŠÆ´ª%¢ÛCH´Kë3Û#S­¯›Øèó­MeFæÆL™@@\0\0\0\0\0\0\0\0\0\0\0`0`ÔÒ\Z&\"\"˜R»s²ôjç×„æch™b7@4N«ÎvtâèmÁ~ÙYDò‘›2d\0\0\0\0\0\0\0\0\0\0\0\0€`\ZšššCB4ÄFD˜¡\n`‹Ó§UztG]ô1É¨FÓ]§-í‹òÚÓšäÖÚ,\"iJÍŒ™2€d\0\0\0\0\0\0\0\0\0\0\0\0À554††©ĞĞĞĞÑ1B4ÆhjS€‘±,§DÄÈ”’R#ccc&Lƒ  \0\0\0\0\0\0\0\0\0\0\0\0À0`ÔÄ50`ÔÂpjj`À0dÉ±±±¼ÆÆÆMŒ™2ƒ  \0\0\0\0\0\0\0\0\0\0\0\0\0€`\00\0\0Lƒ&A€\0\0\0\0\0\0\0\0\0\0\0\0\0\0À\0\0\0\0\0\0È\0\0€\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0/\0\0\0\0\0\0!1 \"02@A#3PB`€$%ÿÚ\0\0ÿ\0©U1ÿ\0†ïÿ\0èÀk»6ü[¿÷à:å éï\'ÀNÕ£ß©j,mT:†3½;Ğ^`Ô˜50^¦í‰À\ZÔ6yûûÓ¹J1FÓêõõU—Ü+ö3\\axLİ7Mó|ß7@ñm‰©1lVûMv¦#û´…©¯µj–FÓêŞ‡µRY«c“ésï™˜LÌÅn¹¢Y+¿ìµ7v«gËh´İÛ º®ímks[ÕhµêábÓ/#†&Éf8ãªyU…!È›àx–J­Ä#æ\'YrÊÔ»QP¦¯èuz}Ó”\\kklw8ê‚;ì©ïŞU	àõO5Í‘ê¸èÆ”µá³h‚ÕÏÉ®¿jòÇôÚ}%€€‚>öàªÅsæ§õÛ^š¿hèÒÃUóD–[\\±z#Ê¬”¾A\0‚Œ‘oü6?m56ît]ÍJvêèö*EîY(ûË5Õ¸Oò‹\rë?kºçl0?´Ìá+¤î6“~±DQÑÌvçªù¦)èË™uq„¶•<\"YP²zZ»EŸ¾şO½¿O§},¿ª³÷Ú‡\"îá‚ÃÌ\'xÁqƒPÂ6¥Yu-ì®Ïf•`0Be¯	ô/š¢™™™bä\\˜¢VÂ%%zÚÔ\rm+«GAb²\ZŞ»ıWYÛ¯QnMBhjíÑ.¾QWßß¥¢Øúj÷\\:T¦`\0ŒÓ¹.³}+f§eˆíçÒ’¨&fc8È\'9ô`ÍÄ\ZµÖ¤]U:”+*¸¡ÑVku™Î[K_qÇûe(]€ÀûÜâ]x0’g‘\r´Ç¶«ãw™¨UĞfÜJßlîdXŞ¤•ôÌ/2L©œtÄÄ0j¬¬†-wŸä;ù[lÂÜûçôÊ†o»¶¸Ô›¡±6²•Ÿù\Zbê·@ùûR@–kkHúë^5®Ç÷!îCc,ï®ARÕÖ^R›1QúÚ´H1êÄäB}Hy¯¡3ÏLLuÛ6ó·—,^4–ì1o3QlvÌN&ÖÙ¸§µEÖÚ½‘õ–<T²Ã^‚£+¢ª¾ÚıZÕ\r—jh°»A`¸†Zø‡&vÉšm.	Ì·SZEReI’!1ãÃêTĞäL`1ÔôñĞAwBÆS”¼49%µ»t_=ÂÁW!ÙY©&%eâ…I¾-ÅMZ°`9g¨Ô’Õè²U¶ıÎ‹ÑæÍÌT [*ë%¶½‚šıá36ƒÆ1Á¦dq<·LÁæy™Ÿ85ğj÷+’qNHE)²¥·[Ágs] zÜe:Ç¨Óz\\¿c{¶i¡iQof•Ca4[\rZ¡\nŞ³} š¬x)UŒ06ñ¥H¨FŒc˜ÇÖ‹½°&gˆŞ#Z ¹Z\rĞu1–\"ÎØÁÓ;±”Ì(„ƒ	€âg¦Lö´d ˆ–µM¥Õ® |çRc¯êO–©p!˜†1èFa^4¾cÆ9ŒaõÒ‚ºÔOÄ\'\'1îf: ×¨çĞbAÑ£	²2`ÌíÌbmÄÇLÌ+ÇBÀì£ÕB}•íÜÕ¯C1\Zx•Œ·oŠ×kg‡1š3B}zJ÷9l‘ÕÛb½¬ıÇ¢¥ŞÉâ:#ù7 ›fÓÄÆf:dbÚŠGjlÓjQWØ1Â©Ë¯M±„ha”$	Á¬FcÇÖ9ˆ½ºÄÄñe›ÚWËYî+O˜†UfÃS¿pÂc£Gô¿‘\Zg\"êfiuMrËóßÅùS+æ\Z4h¢ÍÃ´sÃëÒ×¹ü‘r+[,k:çNC0A›)©2š„m¡5ôQLt>OLúDÏœÁ,-C[ÏÒõ?a¨şà©”xhñ¡‚VfèïÆ1¾\neh°Å{[k¬EÜæ‘—ŠôÄJÃW²ÿ\0i\0«w%ƒ-g*‚9†ë&fg=?;§“’1wjˆæ·ªÁm_5ƒ5·n”7cÆ˜­ÆhÆ1ø+]Ï¡Û<-÷l›¶°¿tG\rc+ñ¨LÆB½kò?˜p#^¢w	›ãfcX¢5Ğ>ed4Ú6ôó`ŠÛQ^ÇŸ¤Û•ùõi²üÊ[‚cİ3›¡hL\'àÒ/¼pésöéCˆÇ­é<a,¯1ë ¥lJ/¸x„Æ8—ØL¯Ï„/Âçª¶\"4ªÈÃĞpe‹n©†ŠÎÖ«ç×Õ˜ÂRÓ0Æ„ôÌİ	„ü:cŠ”óùãª~å½¼E@ÌÕ‹@h•mŠ8Ÿ‚!YjDˆ1[½Ğ×²oı†=OU8#İÂ\'>z9ƒÚlOh856ú¾k×r[O(pwBcO\\üh¸©MÛk«›]æí¥õY‰{E³ 4İ35y›`ô2n!BÃNF¢­ªz/1«ôVÓê\0í`èÂ9ç¸ÃkhNt¿1äZœŞ›Zf~`9œÌû…Éİ64“¼E‚Ôz‡LteÈÕÖQæ™íæYXê§\Zy‚¿iëhÿ\0mJ~çéÿ\0ÃóÜ²ôÊ•ÄÏCò§×1¦¢VáİZ&kä&\'‰™™ŸXô	ª¯zÙ^É¥À:’Z¬¾…lD1löùPa–ñ3/\\ç#\"Ô–/$cç§ùqÈXaæj?‘>°›MøíFÂŒLÌ	Hôg«àË©ŞjÓ×RÑÕÉÚfÃÑ|Œcébr«\Z]÷¸Êi<ı…©¹nXÂšçÈ€æùÕİ¥;–ŞÊ®Ìïh°8‹ÉŸHŠ!éœÁ3º¬¾ïcXÙPµŠôœjtğ¥Z\0Z\0æ4»è¯ù×MçìuGXß5?ÌFñ?\Z¿Q¶ºÎZË0j©îfÓöa¹ºÄ=1É8•ø>bñÓñ01j-©qƒ^¡•éÕ+MMªCœ²ù§ÚŸ€a—{E`w¿\Zoe¨£lu„t?\ZqaæÏucöúQQºÕ¥iMKr\\’¼”âè<E%ÛéX<øéæb1ãyË^0ı§N\'‰€AÅfañq”ŞüP=ŸdFF£O¶2F*Ÿ`éùÖ?»¦•ÍÚÄ!ìî¿lîo2—ÜLüK˜– c§˜#\")Áò3‚v°Õ­ÖHlÏUânÌÏÌ2öšaÌA„û3Ì¿O¸ËòRß°Á½VèÊQ•pª­ïjR·›7ghÜI¡{j[tÿ\0RØ‚Íæ¿qL@DÚ#pk²j	µL§¾–“ Aj®1ĞMÙ* æO-ËiÇ\n2ßmm!¥•FHGÅC{¿Fy—&äWÛÉš\n·“Šæ®íÖ³3%	ßs4ïº¼ûuŠª8”¶X¶XxÌî{·{­pR—-©xÛdÑjFæÆİXF`\n ™À°œyjG¿Ú˜c€c×\Z¸Éø*m®„0õqµçé÷-m«Ô\r¾Jù#¦›ŠÏ«úâW~Ù]ßº†ÔáÍ¼½»Gx=z¬9=ú±¿Ôe×Ò×¸¯Èx´âT75~)\\\'Ú˜a\Z!HÉõf+nJüu±Â\nŸAñZåª™©ú:QÍ¶]²3e¬l¡¸µzwÃÜ:iì5¾«F…l©ªéˆi¸O\0	^1ÌÓ¬©2~ÜÂ!¬)\rp¡†¸j“;-;v\'b\nöÄ0L&f\\™BrBÁ^ek‚œLËÌ>eoµî}Ï3Òš‚Ók‡X%Vtú‘»¢.FÜvôt±¸^Z•”.Übbm›fÉÛ¹Û©Ú©Ú©Ú–!¥ÃLÏ0ŒÕñùÙ1H&q,æ?Ô‹šÿ\00Tİ©£¯~£SQ¥ú,[^™f¤¼tê··g§û3d?¹éLµçî±116Í³lÙ6M“dÙ6M“l¶‘bÈÊÓ0õííÇB°y›†hÇ%İ;q*¯»f¤v©šm¿¨ÕÜÓôÓW½®§ÚbW%à†^ÑFeÊÓjıÖ&&&&&&&&&&&&&&¯KŞ_\\ñO,„x.}†h]RıABä©ØÖ•·KÓMÚnhËî­q7\0¬yÉ3€®p„ïj+Ì¢­£ú­f‹»AÎ l@Ó33tDnŒ™¸DeŸåb<¯UeiÑ ª¡Ç£ÁgÄf/(«|ÓÑëu:4ÔK¨²ƒ› h\Z	»\0´ÏB!XkœÌm9†.!¬Â¤D<OÆÓ‘´O%Y*.Úm8Qıs\0ÂïÓ‘¥š[êè&îCMüï› |ÂÜnÌàó`÷í¨gã¨¬ÂïÄ.Hª¢ò8Qı•”Ud³@±ôöW7MĞs	+óÜÉÈÌÉÓqˆ3É!AsfbS§.i¥kÙ˜a–P†OFf`°Lñ6íà/86	Ï!ùßË>à¨I«O@ƒûC0ˆDzƒG¡„ñ×Ä‚0Za²o3tİ‘ä-y3+@\"ˆ şÔÂ!ˆV^cP!¤ˆQ¦L¸›LÙ³¨µÅXû\\LLM³lÛ6M×\rSµ;3³;±;±;SPW@³Ûbbbbm›fÙ²l›\'nvçnvçnvçnl›&Ù¶bbcûŒLLLLLLLLM³lÛ1111111ÿ\0eÿÄ\0/\0\0\0\0\0\0!1A @Q\"02PaB`#q€ÿÚ\0?ÿ\0ì¿Ÿúó_şïúN9#+üQæZG™›äX\"}èN‡Ó\ZkÛî_À’´\'De~µû`à¹:l{™(P6›M†Ãa´p%ˆPqö“–‘íü	ªbde~ˆc”ûúT»Š	lï%>ËÕ2%Q(ëC‰<dğü{):Eğd­L‹±&ûº_2R,”éY)n˜cKJ(‡¢]‰HS&ÁÀ3&3·°œ­‘î/áN>t„©>Í·õë2m…|˜ÕÈ„KC˜™Dû¼†B½%.91¾ÿ\0Ÿ$¼	×ñ2ãqçLåğcœrGttlêe¾GK¼\\!éÑ#0Å#ÈKIDÉ$)ë‰º%Ë\"…«g/Ş¹$oFO4ä¹-Œ9eWcÊ²«FYWUhè¡ä±½ ˆ¯C2’ZEÑ‹ ˜ÉÄËñ«ã°¥ƒ$¼‚Õ±/|âm6,¢LyågÕßÉVtëluHÇK2’EBTb•Q]ÉM>Ä äO¤›ä}.Uàqk¾’”F>¦è|ˆKFÈ¯~•² ×#éq’è×ƒ/M8\rQ‹µ	rbÇÁ%ZE^™QD`ÙÁU¥écŠ}Ì$c\'O8’3ôÎB\"´“#Ïğ1(®ìúØ£ä}f4¾óş‘ïw¢F.NŸ§¯ºBD¡fÂ+Õ#&”(†ıústñ’àÉD\'Dc«DÖÑËXtw­lÜ‹÷hsbŒä.›+ğ.)şQô³CÃ$5E‘‹—KÒìW\"r¢9Ş•êfMø;ieë¸³pˆëº{ûÖÈâ9XØ–‰ÔFìÁ\ró¢qÇäòÅş¨î,2~\nïíÜ¨æD1[¢&8®NaCQÕeKì‰D06tı:‰7HnÄˆ‘ü©–¢¨nılbtnÑ¤ÕGK(rµJ´²ÄC/Ó\\wé»‘‹¦”ˆtñ‰´–Ì3_¨Õ{G/PÓ¤ÃK{%-ºò/&n¡U@K’d:8Ç¹Ir]ˆHH_ƒ3ø!«;/Cô±6)\nD©£/Iv\'Åó§%\n\"Å9é_Á‹¦K—èFÔeéc3&)c|û\'ğ%Za†ù¤dûeòlËò<9·é¥.æ<€´Èèrˆ¡ÖİØù(î-#³éM¡¦½I’fâM>ãÁG¥‰ŸÀ±Å\n&Ò´¤r…4\'¤ñÆj™ÔtÏÿ\0^ÅkĞÃ¼ŒˆKTù3vÒ(Šà›r|v$ü-(J‘D0ß2Ñˆá“ÃñéD‡¤P‹.åÙºËÓÿ\0“˜òˆNô”STÎ§§xŸ½íÄ‰h‹³t…>I»EBB_ƒ$©\n4‡ñ¬c¹ğC—èœ¶ÆÉ|üèÇ£¤F…¢,Ü&]¦×İò_}\'8Ó3bx¥OØÅ[*¢KMÄYi–C¦DŠàs±—¢ïH„TQdß7D²›´kr¢qÚ\Zk‡£†ô‰ÁçK×Á%éÔàYb5NŸ°Åû¡ö$Œœ	‘\"!³.‘DQ%ø$éÅòFæê&8(\\¼+E²9/¸¤‰ËàßÜJ§¤™&^‹°´¯K(eƒÒQqû‘	ÚÓ®Á_û°Ãû£ÀÑ˜‰hÉ£i‘Bü,œ´“6¨G‚2\'*V<¬o’Y~“BÉÉ“g&Â)¦MS&ÆP„´^”Š+O‘˜Ÿ¤¿Ó2EJ4Ìp“‹üğu$C˜”fDQ-$m\"„…ønÙ9s§vŒ¯í U¢X\nÉ2(Å*\"(Ÿbz¤\"8›îlHØ$ÑBƒ3i;Fçz½1²Qß­iÿ\0ÇMOØtÓİ\r2¡\"(Z´P¿\\LQİ2\\‰kŸq¢$Y	ÑXä‘)p=\"¯ƒ(‘ÿ\0!!DÛèhÉÊô+F9|‹‰_ÉuPß‰û%p&dEZÑ_i%Æ„a†ØY¾Ç:GÕlúÌ–K$õLL„‰2NÇ®ÈåB••÷‹ÔÇÁ(\'Øå=;i>U\n_pùFHí“_Ÿ©˜òp5h­çL›Ñ«’Dø‰•gøãÂà8›JÒÈÎÃôFT‡&Å”Å=ÌZ3yzÉ˜Õ•CÒ,‚à—ëd]«:¥Y_°Ç3÷!¢…ùüZ\Z(®SGï¨Ü‘½V1êÊõŞ‘•3÷-2Hr1É—¬¢vù¡k‰±ö‘‚_iÖ~şÃŒ3¦\'~ÉˆF/$Õ®ŞGù>±¾ô¢ŠülÁ=¬ŒìÏÛƒ\rß$Z}½3D±óg’„bä’á˜¥Lê½‚1È„„ı…ğ6-1ş¤»Vˆ§dp_,qKF6_¥ú+XÚ1ä¢Yx1äˆšµäî„©ŒFKíd_\'Qìa*f)	şvPÕL/ì2Kl[1E´(ÅM,c\Z+ÒÆõªÅ¢‹}ÌXù)\r¹]v\'Ô|ú‚2±¡ºÈÕÅÜÉúLşËO$/Î£ıkƒÊ•²\\.’SPVÈæŞ&äPÆË©Y1hıì„¨„Óñ©*2`k±‹»-2ó-§‘ˆÅÉ‘ıŒòföxrÙ	şeÄNüëıÏ\\³Ù%•ÍÛ:qF•‚C^…ÈÖÔwz={ErmDqüÜ¨G’µ|äzW‘‘™ı‡“/íìÓ£k#1?ËÜzàµÏ¨¨]4ŒpØ­›ÕXÓ}Í†XĞµÆ’[™“;OFÇZf\'kGÈÆµfÚ¶Q!QÔ>4“·íqgğÈÌRü‰\riÜÆÜí“9“$œøF-¾å$f–÷HÛG‘+(˜ôhÜ\"p1W‘bLØãØ]E>Hõ0n„õ¢L|h¸FwÈİ/o3]Èd#2ÿ\0IpKö+Ln™(ÙTuSÚnÜtê‘bRÈùì(DÍ\Z‘äÃ‘3\"à®Q·ƒoXàâÈ>4ê0ºà‹äéÛ±\rĞÜ¯‘K’}Œ¯“+ãÜFN=ˆg^HÌS/ğEòK”5èNÖ^7$š1bv%¢Ó?ìy0w\Z%ÉCÇ‘bàÚ(ßÊf2†¶Èm%ÑÅ»‰ÁçµPôdH\"lÈíû¨ÍÄQòG\"b™~›,ƒMY?B•	úQ\'HÈÄbï¬ÿ\0R1±\"¹RvMpEˆœ-º™\'L†hÏ[3òÖŒ²\"Tg—‚r®}í‹,º™«ÿ\0Gùq?ÊˆúŸô>¢CÉ&ty¶ËkòHkÑ¥X‘fê%\"ZcZµhŒijÉJåµÇO\\°q›1pÈ’•‡ÎH!º2ÈÉ/Æ³§ËõaÏq¢´OE-,oI¢oš×zİ·LÒÛ”Ö¬”#“¹1ˆŒÒ}Ñh­<TÈğŒ²¤eŸò0åx¥¹”gÈh¯FòË†1DQ%Ìôœ¶«!+í:btÓÛ:eé–{Q\':>Ä®Ú#ÛF#I34ÉJßòzN§é:}ãCZÖ’~‘dHéÍéÔE¸pA;.Õ¢)Ç\'\"Ó.÷>\r¨O‚L¦Ø–ÙlªFl•Á’wü¾—«úl»	§Ê\ZFŠÒ´bÄËÓdPù\"Odì¡G-ú”D’2äÚfËÍÁÕKY¡•\\u¡¢†4V©ŠFãêôC7~‹9ep%HEgÏoùéµÊ1uÒ\\O’N)özĞâm6”8”VŒbËeúoHÂÙ´ÛäÉ‘DÍ›woéÃ6H~¬‡_/ù\"N9özPÑV8›\nÕ^¶1‰X¢%ZeÎ eÌçı|}FL}™¬„¸—¯K‰Z]égqq¦Ò„¨”ÒîfêüD”œ»ÿ\0kiãıL}deûp&ŸoEQµW¢Ycäú´¿Rye>ÿ\0ŞŒÜ{ë2.äzØùBê1?\"œ_ŸKÉİ©Ä¼’ëW„O©œ‡+ÿ\0¢Ù¹›™ş\Zÿ\0ÿÄ\0+\0\0\0\0\0\0\0 1!0@APQ\"2`#Bq€ÿÚ\0?ÿ\0Ô¥ş›ßı	>õã¿ù?Ğµ?de~è‡ybĞæuYÔugW±üªÿ\0%h]ˆË«}š“íH‹şÃ‘y³¨ê,²Ë‹õ5%ó\Zj£ø	ªg\'Õ±É!ê„ûì{ì±1KÒœ©bê”mcäeÔ‹%©³‚8ê,{R(gP¤&\'èÉÛÄcÒ¿©¸O¥W¶\\Ø¢Pö¢††±bb¿Ùı¥÷Ë©/˜Ó]ïmûò¤ë)ì«dİ±als$q„È±3‘ÆQÿ\0:Éö~&é¾\"©fRH]R){IÈ9·Çb±)R4ßö.£bBÃİ’Y‹\"ó©¤¦)ËIÔˆÍKÁ©/˜‚·™êWdBİûß^ûyR\'Ş‘Y{£±’YşD…¯kA‰¦N\nj™OMÓ#?Şé:G8ÓT±9üFœ/»÷ÜW#YºÂ(®ã‡rBxozØä‘)m£ÿ\0ud¨j*gxVBT\'yrHœ¬E[¬N_Ûü¦‹/Ä°dOUp‹.¡ïYrñµÔ¨„¾16¸ õ?[4×{\'*Ä#K.IZşxŠwğ¿Yê¤=Y2ï4–;ÇQİü!Àªğ¬7¶„VéşÈJö$1>˜ã­Y’œØ ÙŠ)qëOR¸.R?‹ëÅeC“k\n-’y~6sæï1Ñ\ZÍáœáv,S¢:¬ç}¢GKö$‘«/‚XyQeœ¾\"Uì¼¶_èR±ğu>ÔZE¶REî£Dd¥éIüDb£‰:BïÇb©Måw+/ÂÎ7Yl½Õ†7B›ÙEç¹ee:à†§W¢–uŸÂ+s!—è^/ÀÆ4$%à¬ÙXD\'ÕéÍÜ¼\Zò·±ºßµQ^¬¦F]KÑ|E±åb°ı+¶2ğmc^W²§èËYxBËôÕ\"C±?ÑÆ[Âó<\'ó:RùèOŒ\";P‹ük(¡âÉLéìQÒìañŸ¥‹Å{hbw„\'jüï‚\\â>“8Ã#ÈÆŠ+±‰âÏ¤¸—$Yy¼¢–Ù	ÖtŸÏCQSÄ}\'²DpñGÍ”XÙô™VEQÁv2»x×˜:~†¬p½+ï³–Pò·HXbB&Ä„|ğñµˆ\\aw^y!ÇÓ{#ÈñCÚ°ÑY¬5lHéÛ{y8İšãè4IW¬a—¹ye…»§c!ğ™§Ç¡$Iz/ÉâBó]	Ø‡Š+}ìdy$»\Z~‹C^ƒãr(˜¸İ^û‘ÚË[^Ö.O„=‰!ùŞß¢]É1³©¿+([:QJ$™tóCË#éI\ryŞÖY!D¡¡ªğ¡îcËî5Ü¡a~ö2<â>œ¢5æ|v<¤Iˆx[–Å›X¤^Ïúåââ>¤¢4W—Ô.ÃGI%˜½’ı½Õ›ÃElxYÓÂõe¡¯Ea‰H¡l±lbÚÓÅìcÍ>=‡¢¼rÜ/°äÄ»	¢8—¯cÅTG/tEì48”W†\\(¬!áa•”X/?âòÕœalx\\ˆ^ÓC‰Ex8t-õ„<,<È\\as‰!a£=‘İ/z“ è:ƒ¤£V6¬[–Æğ°òĞ¶Wb»æHYeîŠáç—¹x–Ø—ßcÊ%ºKñR8íçù›Â7”5Ÿ›¹\"…øHux«,CÂ\'•Áy½Ğˆ—âç§}×‘¬¬ŞçÇ+#ÆÊ\nC‹>J+Ğ]ÈÇòI|\Zö’²0¯É¸¦=/Ğà×Š³^ÅÈŒkòî	M¯N:_²«óN)æúßÏÓE¿<ÕMÆÎ–VÚgD…¦Å¦¿Ñëÿ\0†ÿ\0ÿÄ\08\0	\0\0\0\0\0\0! 1@AQ\"0a2Pq‘B`R¡±b#3r€‚ÁáÿÚ\0\0?ÿ\0IF±‡ğÖĞÁø\\üCã¦ÿ\0ÔßAÆ†„-¢‰;(Ow–*c<V3¡Ë9VZ›ùPë¢·\r\nÚ-Eú”a‡T«ù_§	—6µò• ›î*W-%ê[›%Üª«GÃ·Â0‘T¢pœ¦†ç¢~¿lƒ•SD\0Bïä_P{§•n>ÈÇºhzô!W‰•xa‹Ğ¦<§¿VÀ>²¶t»RÉÆxÙ•’˜ÍµPAº´r,˜‡_İŸbš*‘‰UP!ëÊ¼£²Ã9S]•Ñ`\n…“ÑkF-U¢›97–ÇtÇÿ\0\nØô,h$¶k;0â­Eßã*,SF1@\'öQFu9\nB«ETÄD¼mê¹b4JÌ^Å47‰ø›ëefhçíñ vT‚‹BWêU•P#BÈ¦ëà/QÂÆ×ª±)VbñİY8\';	CêL¬Ãîª›>ÂU˜ñ>kENå3Š&„9*İŠsÖ=\ZH‹€„pªJ‚]tcĞ`˜cv±âTNáx\"W*•\\´ô^5÷\'°}Ê¯/\nz&Tø•Hj„DW­^ƒªOº<3®Şãÿ\0Ò„ëeixŠñ:ÅVƒºx£1®H\0ËR¥`­ñbeGkßR/a.^h»/©Äñ`Z‰ú©ÂØ¢±D‰µ%Ì}“\nñ`¨%²çùN2ŸK…SÙZâŸdĞ†_J7(è¹a\'öLh6w8,z4&úªŠ+K\nª†‹d;§vMÀ§ˆ¹½Ù<?!Âáø¢ı•1ÔÈÅğÑŠŸÚÂÿ\0ÖÙ72sE¼Ÿ¬È5â%Š¡èÒŠ„*Åğª¥…Í–âo	ªcHöÈ:1XÎËÔs\'7Z”MÎDÊ‰i8,wL|cœG-háVNWkÌ¬=a¾İV‰8ÂB(MB´1ÔdID÷Ëu¸æãªÍÕ­êS»Î’c‡ñ7ûN(ÈGé–}¦ÊÔ\n¿,Ä¨¨$ñ&á†|Så~œ^Çiı¿Û‹,ÛÜ\"÷\':ß_ê†B8q\nÆ½x‡dr€!8½í\'\n£ »R¹gŞ÷{¸.Ê˜\Z‰EÂ:TdPÅµÎå>ùél˜Ş¢oÓ(¶Aò˜³Ü³¤€X,:­\'és^}Ş\n†-Æ@¦É@;N8» òu‚m2:¬u	”>FÑhŒˆ:¢°ÉáI9WxfM|õMp*‡BVŒK±È3*¦1Q8¡hãy´OrI²0úª\\m@š,W*s”­V\ZôI­ße+Äå3Ñ:¦Fª“„EÍ«‰º×RĞÈCë\'œ%4!ë™r¦&×¦×©1,¹˜ï;Wa‘É¸Ã¯¬špÌ@	9¾òn†	¢áÉ¤7Ë1N0ëƒ½nÓ¶ËĞÕÓ*^±K¼èV!®\0Œ†UáëK÷LgEj,vAÃZ•¨±¸{¦M•2³åŠªÓè«px»©¯¨›¦#\rPí0Ö&U(HÈ_¢Æ¨ÈÌ\'Ë¦çc7ÛÊˆ”PÅKIO\'a¹z*»TNÌu]¤çu§ëålz$\\)Ğ!‰·›hSÃâ\\×Şm7@y71ºúİ­÷FáâEŠw¬Buêw¯\'í¥âué3RPºo¶,.r¬\Z@E­ê\'ò›?Ã\"óÜawÕQWÓûZv†\"å\'	Úëye¨|c÷Mµ÷¾¹µUEM§Ìjˆ›=Ú§OåS‡ãşS\Z‡Šf›,+uäòså¯átÑ~»]¬šåU0•|½ˆpŸ†l•`q¸ëTÊ’­ÚI¥_3æ€ÉzªŠn.ÖLÁª*©[Ì±¼ÂàTNU<ê¡R½XİÛğ\'„Ûş!?ÿÄ\0,\0\0\0\0\0\0!1AQaq 0@‘¡P±ÁÑ`áğ€ñÿÚ\0\0?!ÿ\0ä¦&KâyZğÙ.ıçşŸ–5·ıñOócQ\"ù [$’ÊGäñü;îgŸì7å’äOÂŸ¸frŒXş™d$[@M$§)ı|i¤ûíˆ¤Qñ˜\r­é$”¸e/¡Í˜Ç¿o\Z‰Do#Å)¸vb]ñôˆ¼ö6OÓ¤ ¸_ÀNòSZ‰¬¶/~Î\nÚ:Ûd¡È¢†ùğr*†1·\"eáDˆÂC³U»MJú6T=ÊNÏ|¿àTÍò“9,Œ˜¡›k‚`Â3WØê[‘É¡D÷fƒÂ`Ô1øĞL¼G\"´FÏh\"e§àCOBv%¸2¥–åÿ\0„i½Ö}É:ûöXUáFWò†ğ‡éÈ¾8G1xàkÄòéĞÙ¶1KûFpzÿ\0ôn!è³Á_šº m—’I_Oöd¨•ÏÖ¸jğ+g£•HJì$b&5†¯ìÈv0\"Ë†„´Q‚a‘%e·ìB’pËfÁG/pœ©_%\r5®G½³–ì{îosÒWïÊÛNˆd·^L¶K<¼ıcˆõ™$Õ÷ct¦‚²M°)ÎÓÃ§ÜCè?q›dÈà#P¼8(&\rùÀfŠ¼)ä£’+ÁtúPÁ MúÈE/ÙÌb\ZŠp~<ÍËË¯ŸŞş¹=ä±\r¿ÉI8íìu[ö.nİ\nò‚RNUû…õÎ†¢4@IğÎUäAX„>¹ŠqûŠ&cô€?ÅˆÏ drÿ\0¡\'æ™³…[œ	U¹,MÄM§LBb¿¥¯~ÖIµ}{»M¦$Uªö%Vëî9i{&Ê<N=c+b´µï±\\ö<MĞÕÓ²p´\"ba!­ğ­ø<x ª¾ì û KQ‘¥2Æ¡Õ±ó{·±MhM™ùÓ/¨|ááÁ\"%?-!»èÂUHÁJ¹+§kb$&æØámˆB(Këš$··f8âOÚ1œ†Áİ¾…‹ğM?‘Ñèp\"|lšõÉ˜mğ.i„ƒ\nÙˆx&›C°öJ±rBT8û–ĞğX†<ûèlñ¯èrr¿öL³TèÂCU<¡äYI4<Ñ2Y§n‰å4M˜,‘”¿èœû[ÏœFû™¹zCÜ†½åÈ~^ÊúT2$¹fÛú¡´UÓü“\'Û’Ya½(!mõ¤ÂOLv¨×(¾™·½Ü\r%“lâ\"ˆz\'¶…X5IWÅÄBßE®E:”A&1Ğ”É“ìpm	ËbäUÄA=ƒš\\[Üm·TBštì™ôFİâˆ‰¤“GB/m±›^šÁıÁ#÷´r5¦¥6ÂÏ±)x¿¦FĞóİád{T®m’–i,RRKÑDc&#vÅ¨B.`.pı”®€¿#ah7R¡„_\Z-¡‘°üBìM™:D²Xct¢ŞÈÑdh³ ÓÀ°ì\\Ö: “±Y WÒÏÍàË¹Nf,U$;9ÆÑ!ÎØÓgàÙ\r¤ÂÌøN—%-&%}$oË\rãøGö\Z\ZÚäM\"—–\"#¼b\\\0¦©é	€öçã—ˆC+N†ÍF\r¢R¾ìVM§AÆ^NÔ$¦d|\"¸#ÀC ÈB‡ş$Œ•İÆ\n%-´RÆd¶4½8³E{¿}#–s‹t‰‘Ï\"´×huú\"MÏD^ø}]„ø©şï„lñì5;O¾/LjŸpâı¬-Á÷áöÜ˜[rü#r•±e!ÒåHô —’a•®Xö\Z—‰wƒ¹±ÉÌ¶\0Åt~„ÄMx%™¬†MÉú?Ò4óYse‰el‘n±R‡a”iû4[´HXÔu¢o”Œd³Ëè\ZFÑEîé×–³vüñ³+~$¬™uQ•Î5üJÇ¬œ´›XšZÜÿ\0²PÛ¨æ|ŒÚYl™42Tü(¡B^ğ% r¹.=tMOHS˜ØíIäÀùÀã–8-z$®£E§Øuiöe`AŒ9HW•‰ÏGÂ	Á,¤çˆÿ\0™Iq\nf+öIÛ%t9by™×†eğ_Ê3J–IaèvÅ…áìA¢èDÔ@†é¤$pLò1¢2)ãbÎg:OEìZè„¼Š Š³2!W‡ú®Gw££ŸÀvp^(d\rÎØ7ñ#d–YTabMš%pz™ŒtÓZğ»#¾A3p‚K\'l£~±ƒ\" ÎL8œ›?°™,†äÀ¡“¤ğpœÅ1,Ä§ïXk‘ZºŠ59D§ô 5¼k2%çÈ°DŒ…¯ÆÓñİğ{d‚\\$Y$¬O˜ºZ—~4¢LÇ’[,Ïl]èIµLhr¶¼’£øì`reD\rµãô;‰Ù‘5BäC/#PêÉû_˜0&¡¬¡¹DÒü_ú}é*ì¤pô7•ìŒU(òíòˆ.lgâŠ6ø“üxã&ÃC$Âı ‡‘Y;%Y Û„ğ]2LÈx»Ã¼‘ÕxnEMˆi$5Pä¸–ß²\\…lÉ4h(¶ÿ\0½\nœ²(ÆšÏÏîÁ_Ùù†Œì3”‰øàõ2Ë©¹(4:&X’nÃ\"`-’$©aš%çAÊ66.‚Bw¢fd@Š«>E¨Šé!,§FA¡2á‘Ç#ZC–&1‰ÄÅÊÀºjÙ\'_øG‰UóÃ´7Ø¨Sàq³/\Zóù¾C’¢¨UàS$b½ƒØÓrI†„“œIDú±)(‚J„F¬¢¬JXíÜªH‘~FXÛyòeÅ‹VBŞdBpØå¯èT©É3å±lİzÙé‹V›—ĞKŠ û7‚`A|²;PÂô1LL\r‡ƒ¢œ¤%mÑÙPHÌßK‚qƒkÁ¹3DD×cš”$¦ü-Ë¡càˆ¢¸zcü…a$=ìi4¯$ZˆY\'ƒ\\¢“aÔŒëcçıŠ$6v…$Iä¤Ÿ	ÉûÉü’è…îÅÈÖ¹*Ú)$~\0á…â‘Š[ Ÿ	ŒJÈš˜f˜X2¹9ğ Q›\Z‡%\0äI‰†Ğ£îÄODŞ‡è1íàÈÇ=$\\›H|«¤Ÿ’­À„˜ÀlìB\Z’\"^˜Üûğfš\nçÀ„¼”;v&It5Á)‘kjİøj\\\rgx¼\rİ|\0«Œ\\H«O“HjZM—\'íš!GÈß@J¼9ÎXoà?”²¾ƒ”äB7gàeSìP©ĞâÅ–^ô‰¡ê%ØP‚QA2FÄ!\"J,Ád#9E¬°iÆÍ$Çr%´ìak$´MDdª&ö+/~Y_@†&E,BÉ“‡‘Œcùm7\ZVY_Ü·¿b6áìĞı²TY¨š³¯\nXIğ¯\'‘cÅBh† ”İ	ÆÉ7²ñ	.e¤Ò„LäÂçcÆğŠ¨ ^Ö›FR‹Í†@	\rëèlQ³Àƒ†«åÒĞæÿ\0$œ¤ğˆÿ\0ÆEìƒRmß£D	ÂZ2Òá%Éş|c´•BL<Gˆ¡axY’3¢cxÉ”¡P‹±MN¼\n¶¾Z¥8P:\nY(5B¨´)´…m’V[Ú5!mëè«h§’6Ä¡ø)áâaÚD(#˜B½é¡¨»2›3(!Èùc¤™¸ ²…ãÍˆ*¼¥°š‰f$†ç!”:£S,a•4“Èhe¤6MKY5f,.IøÂÇ‰S_8C…u$Ìl˜ä>ßŠYôM&¡à™°Z9?Êy ÑUDSÅQı?¿mœkèœ’#”òq\r”Æˆ+g‚“Í	@ü—€ÿ\0cQB	àv(i‚5\0å#-Zärñcv¢H4Z–ÌrŸàPÆĞò‹d?°ËÌ/§Ëú49˜ÆÉáCóiYk§&Æ2T+¾ü¦,¹\\¢~¡<è»Â	µ’ªı˜|\"…\"¸p6~eYKî769w¢eâ2eáÑ‘ä±[jlnÆÜœQÃ­?\nØ²I$P\\ÚÏfMp‰›‹àÒ\"}}\"$†¥ÍËú2\rLkåÎ¦Dhf?\'&¨8;BA¶J\0ø¼…â’Ê6Fö5ioBä!´\"GÜË«	DŒB2Øtm˜Ó‘:İcn7Ğ‰	n†İ•1b™Ù”\n¥‘b5¡³Â5ìC&¥ø¾5Èz±û§æØş•ŒĞ,bpÔÉÔ|Ÿ¼D6E’ä+ÚÉ‹Sú2,[ŞÚÇ]ŠØ<9û©ØÉ)É­\r‰	“Èòôww^!YŒßBÿ\0J}Ñk®Q²ÓÃ(ãØ¨Ô‡jV:ğ—MK;C$Æ²Ÿàa[Ÿ¹“œHÇäCh^¯WÈˆáÑ`Ÿğc7‘?F\\­›åığÆ(PÆ,=1ËcD‰%Ù³¸\r\nWÙ\0Šùä Ny-ú$Óc”ôÉc$9pl‘>OHzL£hfÒ„ôXcÄd!-©ÈI:Ú&UîFıÌ€‘ŸÚ‰-îßHÇğeA>,é\Z¾(1M<˜¥“TcÏ¡å™\\éy—ˆlˆM®ˆU³ˆØ‡…½“‘z\ZŞŞ:–Ö#wP•Ë¡Z=\0±am20ÏÀ¼dd8aMPX‡âQ9ğQØìœ˜úV4\'Æ¦=\rc>õá.m‰8”ˆ+atJVEŸƒ\"ª~Ä Ù18W‰(Ì„ˆ=	’Ç„ÑFXÅc‰)z\nŠ4„äªÇ33\\qH53¦»	PR©AJ-Yxúf440Ë°Ãê>§¡èz‚è.‚,Xª&¼1‚bš‰p˜	\\¤71¨M(£±rô™KøB˜+™ØØ~à™•<¡\\@$Œ:iBM	R*kXr‡÷\n4HHJ/§hha†_Ë\"-mOnS‚Hõ6EaÏLw±VD“§c|5Ø“Rèüã OE¥‘Ø4B+!¶X—l‡„Qá’İîTO‡»„)C\'A*SlLJi\'6˜—l‚—RØÕ	\\•–ßôaIËê`?õkÃşnM)Ñÿ\0‘®èV‰‡‘.²{– pG2c]Oô\'À×)¢e¡mv<f˜j\\xƒ¥¥Ğ¤Ê´6J\r¢9/²00ÄÚ[{‡‘à{ÉdBÙ_ÕÁAAA\"h„Ê2\nhv˜ !±/bJ%Ch,¹$¨j„dŠ`çğ©T0Ù‘X°1„ù4@‰“AfÃ\Zğ¥²G/”DªNyfĞ›%-Ü%„1§B#øŞ\naÉEëI†!/(_‘¢M\ZL\\nL‘à[5j¡\0ÃË“P0ê0ƒe2Ë/e´}ÒI„wà¦Ô}:€%´¡Ú³2š\';òĞá·{\'v0¨°ö92ìIö\"K[±­àŠxlR2âÔ(Ò-ıôpÜ@¸ò&0ºCÅT!5±Æ33œìÊK!”½û›¦Qı¨|„7Ÿd6Pê:CS²,V As/p4¹#ÿ\06A	Ô/°å•pYJ$Vñ±åÛòãìIığ\'Jp B±øæ1àpòCi¯ö^H²XœŠ7¿dxh„©bX\Z¹½ôL×ŒÙŠÚÈâ`Jm\"PÜ2è’ihNh,PÂG‚ñìcA<Ÿ6rp0Ó£Qá79.ØÙ?³|]© ÁXƒ›·‘&rûEÙpÆò1/ò1æºÒø!Æ1¡>!E)r\ZÄ¯FÈÄ9L¼1,±3)éšr|$/äZ\Za–e†zõAô!ÁAtC¤é ×E„ˆşB#å™>‡¡èz§ º ŠøşJ ¤A1AAAAü“ÿÚ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&7l\n.\0\0\0\0\0\0\0T\0\0\0\0\0\0\0\0\0\0\0B\0\0+äu\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\0\0\0\0€ÖÖL\n$¬€\0\0\0\0\0) \0\0\0\0\0\0\0\0\0\0\0»ã¨»àŞ}Õ \0\0\0\0à\0\0\0\0\0\0\0\0\0\0\0\0\Z²Ì5\0á1ÂÖ€\0\0\0¨\0$\0\0\0\0\0\0\0\0\0\0ád·XH«Ôu„\0\0\0°\0\0\0\0\0\0\0\0\0g`™ºÍoa±\nğN€\0\0±X\0\0\0\0\0\0\0\0\0\0\rîx»\'œ 6@SŞØ\0\Z€\0\0\0\0\0\0\0\0\0\0aÇ¼nSHMO{ËcsÖ4\0\0\0\0\0\0\0\0\0\0§ÇwZêD‘)]óP›\"E6\0\0\0\0\0\0\0­3ñÍ„®aí—GñÁqˆŒ,€\0\0\0\0\0\0\0TÂ&ELX†›.FµS-€ü&+o	Œà\0\0\0\0\0\0ae:N\\šœÜ%u’ZÔõ|\0\0\0\0\0\0yè€qÔ@Od–”ÙNFû–Oì~Ìí^\0\0\0\0\0\0€%›Ç•‘yïSëgœ“øé¡ùÉQ\0\0\0\0\0\0‚©g8èäâêSà›=­jÀ\0\0\0\0\0ÕPâ_‘[Ç	Ï\n1|ãcàJ\0FãP\0\0\0\0\0)İH´w™s—!X€µÈÄ†GÂpú’z0\0\0\0\0\0(ÃvN¶ÆN*\nú¸¨ª>,28¡x|\0\0\0\0\0Qÿ\0t?ì?Ç“¹B@òâNà	0ïwÙH\0\0\0\0#Kÿ\0Ï\"Š’‚»Z¨ğÚ\0É;Px?L0\0\0\0\0\0fsÒ[‘lŸèÀZ,6{kCí76ëTÈ\0\0\0\0\0õau\"#}BáÔš90±L\Zd›¯ö2(\0\0\0\0\0ÁçeÄTJÏğ?ƒYæ”ë,ÁìÒÏ]@z\0\0\0\0\0ÿ\0›a‹”İÏ_FİÑ>€xNv?W7€\0\0\0\0\0ğ§jĞ	àøwLj0Ò¬V H 8‘ÎÀ\0\0\0\0\0%‚)AåÅ…Ysø†OçowÕ¡u\0\0\0\0\0N`¨ÓıQæŞ(S5q²şsœ¹@á-\0\0\0\0$“A|{\"lT :Ø.ò F•¸¼Ö´8\0\0\0\0î•„u¯¸jÄ¸ º&Æîi™w1`\0\0\0\0$H‚.îR>ü2(¡á4ºóŞKà\0\0\0\0@ \0ôŠå“3ÁGX\\š NÔ•n	N\0\0\0\0\0€@#ù.·Ÿ9c,0¨€¬uY{ª%ãï8±\"\0\0\0\0 €FÕô6ŞEçq‚2	¡•pÌ£»]\Zh\0\0\0\0A¡Ş[Öó3U¿Ÿß±êD±d\0\0\0\0\0\0€@ûRÉ!fØ(a3î„ò»Ş6®ğn\0\0\0\0\0 @_û-ÿ\0ûn8”{ûÎ¡4¼Í—ØÑœæ\0\0\0\0\0\0I\0\r4’M´tuˆ»5¯£¸º~™|À\0\0\0\0\0@$I\0\0 <å\rºr‰gş¸ã\0@$\0\0\0\0\0\0H\0\0\0@/O‹¨€bw–à¹Kd	\0\0\0\0\0\0\0\0	$’I\0’Û\raé]Éˆ5Ù$\0\0\0\0\0\0\0\0\0\0\0\0A\0“µ<k’Û-éwÓë-’\0\0\0\0\0\0\0\0\0\0\0\0A#pÇk»¡&ô$	\0\0\0\0\0\0\0\0\0\0\0\0 ô)IõŞÕz>ø$\0 \0\0\0\0\0\0\0\0\0\0\0\0A“µxJ“+Âh@ \0\0\0\0\0\0\0\0\0\0\0\0\0\0ı!Hë$~Ô6€@\0\0\0\0\0\0\0\0\0\0\0\0 @+íü–ıÿ\0ÖÄš\0@$\0\0\0\0\0\0\0\0\0\0\0\0\0	A\ZI&™‚\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H\0’@\0I\0I\0H\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0I$’I$’I$’H\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0+\0\0\0\0\0!1AQ@aq P0¡±`€‘áğÑñÿÚ\0?ÿ\0´­ÿ\0£w×ş‚:¦xÿ\0V|ÖıÃ|ŸBHûFùñ!‘òüñEõ{Côı³ûÉ:€ÿ\0_¯_½VÂÄùá‡ræ4X}œ½—éá°Ïì/qä<ış…8ºİÁğ¹œ€ßëäê	CÉ³uµ²ìDqıar}×û:	ÉÇHNÎàğàLÛ_\'gí¿† ·q,aäx~ÖO×©¾Ú[ÿ\02+Ğr(†ı‹scá>&Ës~ÿ\0á1– 6ÃÁ¬{y2c„fo¸óÕ©GŸÇ˜Ïõp:ğâoöLT{ƒ¶ÓéjOıK#¿Z‡ñh½­ òŒ»0İí‰ìmÚ<7ÿ\0ÒÁ²i7!†y#Ö{	ü`:Y…¥ùÿ\0ÑÑDöL!]µ?^?wK3ÎÏ—eÚ9*ñlCKbÓH+!îú‚˜¾ùÇ…õ\\ËnTs}†FpÆÿ\0;|›o\0e¾}aæq2±{ÔöuwÂ{	~eüMàÏ)ğş¦M–£­‘ã>ÕızäC>¤z•ï¹§íâ:‹Gp\\{,v\0¶Ûm—\'ğg@˜öì,Â;aãnÀÉÍ/šËŒ#ÓÊ„+-¼cÂ\Zïö€æ=ëÎyåµ±íc“}õ²/È€9´6~7É>x\'|Œİ«ØØçÛò÷ŸÄ!î^c!êtŒmXí£¾­cmÍ²6İv!öÅn¬P{|\0P	¤8oŒ+ä‡ËÛ°/Ìì¬Å¹¨İ&û¬ÄøÛb:Bg?täÕÑ°DŞÊz^¹uîßİï—Å“^îŒ“­™p²÷9-ºÀƒn	Œÿ\04l7HúcàºJC«F°»²[ŞÏ­¥ä‡K%NÃN®ĞÉ[?Ñ·²X\"oca/Ÿ[ÏpuÛwåò+Ò¸tçÉ‹=Ï½§».™À½Rc’–ãn®aÃ[18›wb,HËí³/Í¯«´3,ğ¾„Oiÿ\0‰\rLŒŞ›º‚vg\róGÆøÛm‹=¬Kå¹Ül}Iï!Ë_EëÔÙëØıˆöİ“n òÙááã–¿®…ë¾\n€fB{¡ØlÁı}#ğ´ˆ`ó+Ó—õşë´Œ;tù»¯æÜÜ²NËbø‚Ûm±àF¶—}]ßÄ|C‹;²î°#1õ/j^û>4|Yú—°8vôf_L&zàˆùuöæÄù³üï÷9ï›çlÛËLwòıûç!maã¸CÄúmà/m<±™m¶Ûb©ŒNJcŒnI¥±ÙÀZöÉ}ŸmWÀQ\rf¸c{Ş\\lNúlÎ;*\r-_³×èğß›ÚÙäkÄƒX 4uı²Í¶ÄØÙ4°qwåûá:e°úÍ½ñ…©L†C°a=ehìpŠ;på¡ÙvYd€6rÙõÉì£õ„dıÉ±ñú¾~‡¸OÚ=¿{ñş€8x—ey\ró“-¾ÀÈü)\'\'ÙoqXfÏ~l°c`™\r—cÙbÿ\0‰#\nX²<+·¥µvõêöl¹ëÀIah`Dgäfåÿ\0˜ÿ\0rã!>¦oaú¥ûÇ\ZÍ³æô¹Idì«ãÀğz–[m–/Yaè’·\n£ÿ\0Â.1ïóà­°aHÖod©}Mö÷=Hù|°•ohñqŒw`¹{	k9~Wîñ\n”ÿ\0Î~bôÙ¥³çô)é·aØx‘å´õwğ–Y–_—¿ˆ!Ûc?0ørÚà¥»·|‚éòG›e1Ùhí‹+Yà.VK=[à2{ ëää°\'˜áFá­“°ÿ\0èo”«Ôß?×Ù~óÅ™«uñ!ı)ƒ,¾|ŸnãåÒ0ï,êüØ?ŞÔñ6½e‘v-‹ÚG§‚q‹—r^ÙòÈ´ğ.µi×ÙŒ}^Ó/Í ˆîC÷êÁ4˜\'$Ó	sŞÁîÇ_gæ,SïõÎD6rÕºøsÀø¢9,øYğJf]ŒQìrOÛ#éi,†ñ~9e„Š!îÛLõÛï.›l-Ş­|\0ƒÂmùî_”’ivIÏVOÿ\0üµ,ÇÓ¿ ö‡„î‚M˜À‚_øÏ(qÍd#Ó³6‹g·°”ÌÊ½À¹à6Ëzm#¾Vº_7†eÓ²:†2úŒ>x!¥¯áµàmäŠÒ[æ^§lƒñ…ûş‚÷v&†B	&HğÌÍ[³ck~[·&÷,äw«§¸³‰18%V“Á‹o­ïÂ¸ÃÒâ¬‚úğZÊìDô˜IÙ2Ó¯’Ü>-ú¶9-Ş<‡ıÂÊşmÀØùÙÂF/ÖÙ£ğ³<,#ÏRY,°ØÉ–{ØcIO¨Ä7³Äñ}‰}‡\r,V¸üCÛô9âI–G†§mğÌ{„M-oñ/·­Ş\'Éc^á‚ÿ\0‡	—1êK ™™ƒ%w—»C6›­§C°dõsob$^H«ƒ	Ç/»¦İ[@–»ú–øÛ›jKıM¾4ößÕÄ!g³ìzµƒ³=,óÈ,–x¾SïÁ¾ÈÚ\r±É±X{4ûÃ–İ€¶ù=lëD0½q†]-?Cï¬¹â†¥òŞ’¾Û7%õ·–ßåo7«áÉ=ÎÜú!…Û/–øŞË_O¬µ‹»\"ıÖóCle,¸õ$H2Ø+©nuù0Ûp¿‹jáú.Ú·\'¾9åŸègÊi–I*ªäóåéì¡¶t‹{6Ä[2Ğ~xˆ7nß-2^¯l–ÎÌHßLuìa5ŒW»Ó“ßÊ?;!<Xc¦ÿ\01¬\ZXÈï³x>‡è…/Y÷oYş‡Ëà«ßŞv}“í°xØÙø¸;âÚòüĞ]!‚€‹	÷AzlvöJõi\"öŒµeİR­lƒ°Gl´% ùpgP÷m7ñåÌ[ú2-!á÷âŞÙ™Ÿê|fû</sÂíü¬ğ{b¹Ú$u`!;\'\\;gŒ™œŒ‹loVÄkï¨7‰f}AÂ/n_Ÿåï«Kò3Ô³\n\\Ä½¶_Ò\n:[~_°ìÌ“ızºÛ­ëgÚ9ëñÄ²§“íø[·,Ô²ü8[ÛÂø &ü½¶ÙYö’{”p²œ“\"¶²M‰·¥´8Àš16BBgùK¾áÏWËz–Ãú~¬	£k·fdş¯xkŸ`±âÁõq~0\\zJCî_¶fÀ¶ÏKö†À8f\"ï#‰§S\'%µG¨Q\Zdfy³åƒYMõøKc²8‹rX-Õ†?¨[TÎpù@³3çm°áĞ†xc>¬ÆÈ)Ü›´ğ‡\'œwI³urí<]^øšjÆeİõ×.d”Æl>Gueê4c÷†\\Ç¶Şé8à]äw­¯lßáR^™‹ö^±ğ¶Ymğæ5=ù\'{=÷‰®†³Ç½Ò´vá¹)>â95ÀÃ(`u6òôƒ÷‹ä˜E¤âÒ¿WeË¡c¹‘\rğ2?«m±W«b{ û? ÏÀoÃë—¹nÏùG{“æ°0~l„ç†02A\'ÒØ»²Ë·¿åî¬ƒ½†²/íAÌ¿h[äĞÉrÑtG]ğ—Ô:ä¯_Qu¶qúÍ¶Ûm¶Ûm¶éã=ÿ\0÷ï}g“-É“h[–şÆÉ/‘íÓ|!êÈLŸv#]ŸvÂ{Œ\'²zD9°Ÿ²W}ø#~N³³=$=÷2Â]ïëöÛm¶Û|	ÿ\0!ù\"FÎ[îÊ¡†6Û€9¬íŸG>GNÀªıù!ÀŸó\r7´Ë\"ü#`æQrG»O Ílzü½¯öªO¯ÿ\0oŞæÓiÉ2M•±ËæM¦[pºUòEr¥áÏHíê¸S_S¡–X±†ã\"!‰ŞÚÓÿ\0œÿ\0Ô\0š06Œ¤©ß²rYcvXØÎ¼ä½àó¿~.a]äoƒ-Ç·³\'xúÂ1’,?¶·õøùjş>É ñŸû…«±C;\nX’‘x-ÆÁ$Øú™™f;n[Û!?½Ü‰½‘³û{ºcqÌ~~ß$/sg$ŞNIğád²êËHÚùiü¯·îMÉƒ¼º\r†\0ÃeYıÍì\'6ş.Váå…Ña	rÔåÁÈI¬ñı \'óÃv÷XHÕrÁ™öËHg²ÿ\0·÷~f‡á¾èÿ\0hCI|&Ù²½µ¾¦—¼œ¯DQ¬š+,å½È>¼\"\Z¿½9×?.7oö…Õ¥“ÉLdÁ.ÚÁû\0|\0;znÊ½3Y½sıïm’×—#Ÿqş÷­Ïóz`ÿ\0›GÊ‡¶ôşoÎ¿ˆõ³ø‘jËo÷Í¶Ûm¶ØG«÷í>øm¶Ûm¿ôÛm¶Ûm¶Ûm¿÷ÉÿÄ\0)\0\0\0\0\0\0!1 A@Q0aPq`ğ€±ÑñÿÚ\0?ÿ\0ÒS|}?á½sıÀ»Kßãí¯øL1ïøp+u¿L·ïŸPâóñ—;o&uš~~%éşşh=ı‰’LY~\0¤!Vøšô¾æìÿ\0ş‰ZCÓïáèLù-Û°Û¼2¶Ë!Hmàpwáu_ww¹áşªŸÓ\n±’[è%[&:C«¢DjóÁÇİÑ3¤~uÃYödW°ÿ\0õï{ŸB_‡¶Ÿsƒe7ìºpÈàöó<6\"Îıßù‹GĞÙ9Ñş^¬@[éõñAì#çæ½ûtiÄz´ã!<ú@G àã“Ş–¤š½²xt$7|ºıõ?àÿ\0qiíõ–yÏ«>Ç¢Ãó:ÆR,ş­ñ’DıCôŞW·`g_Ùâ9íƒã8Kï¤øè_§÷ùÚÿ\0yü\Z8¯úŞ´Hÿ\09ï²Ë.îø˜P•ÕxDf™Áğx\r¼,ØÁö .‘¾ÂñÏ×ïŒápïÇ´½MÚşøvt}ŞÅİÕ’?V½p ä±%l2ğzü~øœmÔH²ìYİ€ğ4{^¿såĞ\'ş,½~ \Zr¦6®¡a×™}@œ k+¡5_%½¾’ ıù×á\"ÂZF‰l¾%¹{…«WõÆë—WÜ–\rŸd$8ŸwWíw°al¦,=ïö\\úÍö—è|8O§â¨vŞWwÔ¿O}ÂxÇÓv[úmæm½;0!º6T2Ï—ß·÷ËVè•md\"gİ™&p¹xÌÃ N§ô_ºş‘köÚ=Ë—÷@èoU›î÷.Ş{ñ‡¯fS5Éê&O²¥ Îçÿ\0DÓÿ\0Ìª\'‚GÍÌãõ\"´ƒ/l³ŒÉ\",²mıİšB›/ÚZîL–Öw,îÆgê¨_aÏÄU]»@ÀµsÁ’ËÖÏÔ¯«\'­Ù–1Ã/ó«]Èrõ³®>Zd2w1Ñ¦Orú]Gyd¾GõÃ;\nyÆ‰§á2ıÌg^ñ¾İšØOícº´—öİt=Û—dL|ÿ\0¤€şã®3$ë,ºùÁı¡‹\'„Cdo¨İ¾·×°bénÈ0ƒ¦5ìş–$3­„sïğ\r²íõç¼˜³‡€ÖñÉe/ó3;ƒí“¨—[~ç^D¢ú²9x>òØáÈ¶Ü‡¨îËË3¹õy\'ê>ŒıÈf–l}ü=á,™–…“l²ÍŸ0Ö5î?¾0J¾Ä™ğÑ“å7’*å’b0—Ùƒz³‚|»ÄH´ü‰‡[.2x6ll±2—ƒäİ‡÷{du.\Zİ½¶Y	(aŞ«¥ïgÂ¶1‚Ì²É8Ë:ÛÎï»ı]­Îäúg©v„M?«—r†É<‡%”¼7·%Ö\'Ì·,^Û9	­‡Ë!Õ°‰êxîÉ8vAñÈ·«î{³õ\"õåŸLßoğ=opfy.\n\\Á¿pçºL8Fşáù&u²ÓŞ[V‘í°ûàã>·k[{¶r`²cé=›$tˆ‡óPÅº–Yà†Yeà>k¬ÁtuÇAÎfû`êíûZrX²t3mİú‚Àä6.³’\"ÈOO0´íã×œ{şV%Õ²ËÀÛo!ü\ZÒŞáŞYû†Ëf`@OcvÍ˜cØ|\'¹ã.îã=6u…ú,²ÎRK7rìãìQæ~¤°_ÀÛ¸éÉå²Ï&µÜ\"ßw±ét8}ÎŞ#É¾¢HC½ƒ!­»°€1àÛìLã~\rƒj»ŒN§ÛÙò[vŸ×ùö.ûÈm˜àşAÄ¸,:JIïxöN¡‘nX&ÎâØ\'‘ñÌá%Î#¿Æ]Í‰™qŸxÃ–çM»­÷oGòz÷~íãe»+	Ô1ìl­“‚Í$ÉŸê$Á×	÷xÙŸ#õw{ø7ÙnI‘Áü¾×†pÏ³í—³‹„Á†›C„¬‘Ücx$¯vl‚Eç/m—¾®½O¡i:uø	·ÕÆ™ÉÈ#½A“ÇÛz.‘Æ	Ø‚Ï€m±Â%’dœC¾IÃ.­Æ]‹îîŞ\\=~Ç\0äşOÇsdú¶CİàcŒä‚xwwÎ¶{8€J¸Bƒ³d´ùtê’ó{/«ßá}çq¼ÅâLoï«ÔêÛmÛ¥İKa‹~tàwÁd­´x´¥†uÃ’÷ÇÊ<üN\\	ÁügT»ºçélßD»Ù«±t‹áê[İá=ÁxãKû‡|˜\'’@g8YèL~¸1‡ëğÓzlxå2Í¼–{l2tÆ½1úX1kiÁÂWÉàÓÏ®0ÙÀ±o\'VïÄl{?™”†É³eŒï8@í´šs¸í²\\¾üIûãeîHİ–áfßˆ6Lµ¶5ÏÇ\'Îçñ{ì¼!áàX›tkè‰õ1ul Duo\r™[påß®y@u$LîY#ßäïYŸÀv2ãïƒ„è†·A—¨yæMÉê]Z»&`ì›;Œ;lpeçÄØc‡å~™dÌ³Œã,‘O€œŸ«R7«Ìş¡‡#à~¢ˆdºtŸq(º…á&]3Âw“»î‡×æe’Y7û[·ûí	t©CoÅ²ì!Á÷ò6!‡{ÁöZ Í“ov,†F\"ÿ\0seŸV~ÿ\0?>9Æ_èáão8Y.ËkÈÄñâX·¡>ğ0ÒÀãw»xûï;µu¶ÿ\0X2+\\±e–q“Û„Ûmåö\\!ïvK$tOx{ºC:¶pşçÜ³YbCñ8´÷‘ù‹8m²ë8,¼^-09ÉÚşòÛ¬€Ë~í³®>Ë>ÿ\0Åÿ\0tøiñcdáád3`9Ùí‚Ïëñ½çÜÆ$Ş\Z›m•†ÙoyËc€¬,Ïñè&3;ézG+l[ò%ïØã#l2Éò~‘Úö‹8ØO“2Ï“zçÉ¼„ÿ\0—ö‹ÈîË>;Çœ·¼ç\0½İĞÿ\05ìÂ6ğœg²Ë,à	Ÿ¥äÿ\0R<òOêQéñÓÂêûL3ÏøYe–X°²Ë,ÿ\0ØËÿÄ\0-\0\0\0\0!1AQaq‘¡±Ñ @Áğ0Páñ`p€ÿÚ\0\0?ÿ\0ù%,G˜•s.Ş}ÂÇÈÿ\0ñ¢ÄÀoEÿ\0à±±µĞùÉtú\nM\'Úï³úl6Ê<ŸïòW»³ùùËp0ºÏøX\ZBô	`l7Êÿ\0Š­CZÔã(„ó”¸¤u„k–õ`lkïÏŞ#øÕ4WÈÌüEçöÁ\0V¯«BÔ_~k¨|À±?¿ròOÇ¼ìdÏbs4ÀòıÎÏÖMøÌ´±\n¼mú^üØ}.ß¨cj¨ûYÎcM±;$W0˜ıÁéEÌ½FT£oœ4ÇÙ¿Ú\"Ğ6İzKÕ)Íÿ\0Y©”İ•_Ÿôb•8ÒïäÄ*,¢V‹O“ô&©7~ôùËó»V\0FpgÎÿ\0‰X–«ı¸TlÑ\\.* …Ç­¨µ‹i`ÈÆ£eqQ~†Z\rN9é?bC[Š9à´.I*EÄ_C\0\n0 M˜äé”‚T¨„S€Gé*è8¿hØ%ÜwEó1Š³”¶e‘]Ÿh\\ß/9˜eˆs•PN%Áó¨ÕD«ñE#…B¸5Ô±AÇqÙR€\\G©vl‡×ù×j;_W …î	e\0çó+õéoôX¸LüÁ­¤(ÔîqcgpµÒJp·íB\rA,<µÃë	’èF[‚Á\rq3/qEÎc¹gå(ê\0Üqk¾ÇÊ\'!ÌVáG¬Wù”…÷Eò)W£¬wÑeèéöÊø*¯øŸÌ.áuKL}Y”NŸÁúK°¼$7ĞÓûÒŠ3}AuuAÜ‡™XšjözGFGcÂx†ów˜ªƒ0«¶|ÙQe¨¬ÿ\03„ô¡\Z&<’¢”Ûæ,!º%ô-ÁDÈ‰ZL\"ÛP½†ŒÊ¦R¥rCd…“7‡mg²Ës&ü@Ò;ÿ\0	ÏuÇgIË\n¶Ü:)áÿ\0%®5¿ÔCo¶h=cö}ùŸŞ$:|ŸñŠ:äùF¿ŒØlgËDds2è§\rİJ¢\'nUpx=0Ap	bÿ\0äd¶›º\rzËÙ-ß?ù(Ë¹QuÅ™sÉ8/áp«â1\"‰‰rÅ	jj¼JZ\\Kâ0–D4Ÿ6¬í{öAW«À·ä:‡\nyÿ\0‹¿ğY%©\\=cÈˆ9lçTBc3pÏ‡¯ÛâX^~é×/ø€ïqÆgßu,Ô½ÚZâÎ`\r¿˜­¨0qm•o&1Û*ú˜¬i]r<WSe04Šk €‡}e¬%¨4E[jr’‚b%î_Å ©RLHyÄ$q-<—0ì1+1‡(‚n…}â„?Ìv²ô03ĞÅ÷\"mvF‚ízÏûš\Z\\zÁ\0¡\'éµ¹àóé±7æë©OÔê ‹!é¿Á÷x|ú-–/ïêZ%àÓ™z™Œ×iÅì=dA‹¡İKö2ó©ß Áw©rÁgÿ\0Ú¦ÏWÙÌÍQAovG¾ \0—D´Î¦Q\\¹sMÁA×r¡¶eQq”r7q*İ¦¦Jp\"\Z”‰$¹®ŠüÀ\r^ZUËQ*ì®ÄğÅ\\:x‡d¯ÁÆ“ÓB2ùĞ4ã•.™AÉvÎ^_â;¹+$Éƒ„tmÇh(Ğ\0t“×@ãÄ¥Ÿ¢ P~ù©ƒjËË€1mK™‡‹ $rø#\r#Š§÷˜åŠ«êœb®4™Ã}g<KšñÇ¹x(¯Xdée‘2éâá5¨Šæ_Âá	Ê¼E„Ä˜mª„¥@Á¥­¨ê¬Ék@WRµK9YuÑ¥\\W·GŞ,Bô»„³Tî8—@Qç´ÁBÃnônÿ\0˜’m–Hæ¼AP®]Á,<=¥3V»Ô6\\ànÈ¹\0rûÅ¡´WWY‚@¾U˜JJåÛò>²¡©ïI¤¶h9†ê3zş? 4ËYÃ°m ĞûÌùšÂFA§Î}ö®F¶”B(/ÈçéåìÇ4\\o6åí)æ‹aÕ@>¨âã«ıå+…>ÛŠÍĞÉŞl›*¯c¹9\0µ˜¬OÅu0¼FL%z™—Ú‰•X©-›ó1ø\\¸A1Œ£Ä·lö^GV¿H^r…¶gDŞÜ±V\n°–ãŞ:Z£­Ë©º]§?Ô–|—7\Z,AIïƒE^=ãfÁx3\0Zam†TŞ‡_rY(Œ©Z˜^¢Jã]CAˆ¡{yüJD¦×6Zç\"±İäí¾}*¡Yeµr®3—Ğ³ÜD\nˆ\r;`1 ²ğXç—`ôÜ?ÙGÿ\0H&c¥—»ŸÛ1`u}¶ø%WHPz%œ—üÏ¬®P¸D§á9L»¢2˜Ãø„!’ãol-ˆ¼¥ ˆÚEP²âÕãš:IÃ–!*¡ £˜Å˜5Ñq„â.““=3(Œ+Qr•úü¥UÀf8ËçÊJ]¯Ì(tÍ™W;IW0M+5ßöØ”)_­Ê.´W–Zpr¦aëK7”.+(sìjRšä¿xB)c¦ıš	îÖ#Sa´Tç¹K	Z$Jƒx?º”\"–á@:†ï?˜=×]ú€àĞ`!f3±¿B\r‚Ø¢êügpRCƒ+ªğ~ À¦‘ı¢œ\"âÏ¼4‡\n|ù·Cç›ğ7ëÜsËr>G´¥RQj5º†RàíÔP=Ø§±©BÑW½²zÚWl­ˆú@éÏÊ0„Ù™UÌKq²ş.\\&Ë\\2‘Wù„Ô¦&‚¹pî(¿H°Àl§DEYÂ£è È} »q…,´kbÚûL@eÂ°ÌŞ”»ó1¡¬3@Wql3ÜÎ‡ÏÚ%)§Pâ–†ßg^\"ìU?·†cÔB‰ªsŸ$.€€\n§9j8§=æ$¶øTÉ<¤¸İÂÕJ¢_\nYµo\Z‡b¡)Ó¹I7À+O)äÙnPv9ı‚°¾.ö+¾_…ÇÄ÷\Z™\0%ÑàÔ	úË >°óóÄ{»-ü–H´,§s=U\Z±o‘ÿ\0’€î*£p˜í€¸H\0]Êì¹BÔeK‹.\\¿‰öç-E\n ~ñÜwnÇ0‘½®Î#JAĞoÖ\0,-{/\0zâQg‰HĞä0áp\nRïë(9ÈD*ò/Ö¶^%J­ÄõáPßq«WhØUe+üIJ@Òa|Î~…·šÜdM·#åRÍ_ñ4…İj_fİwi¤ÔÇ6¶m5%Y{+Ú:WÍ…¯. Ò€”â`ò}GìX\nÔQ–nxqè6_–På*i³X Ë¬ÊÉ\0Iâ ƒ%+pfv™O2Ï)b‹ğ¹ràU®ˆ=^Ua<ÊK3Ÿü‰‰¢ï<Keêù?ˆè(±qpà+2ÇTdPŠ»XpÅ@\r\r#+5[]^±ë‹¥«5Úã, ¥S–¾¦iš©_®Ä©µŠ¨6GB0Øy…–œw-¤g–#M{J…}\'M”õÏæ\\¸&ymÂáms¹—.¢C\r=J‚?¶cÛ>hƒ†Q±%ŠğŸ³M¥7´8ÆĞøå:bùAqÊÌÁ¸¼É¬bãA:YRçrûÌUbÅŒ¹p˜+\n»çâ7(½¡×…;şÜÒÃl^¢Õ…ï5Xmns€şó\Zª,z”E.˜¯Ü²÷BÄ†¨`Ş(Köb¼¯b¡4€\'â \ré…H@˜İÆ¡Ô94¹‚2d†”ÇN`t\\Ü2ÅB€²º\\[0Bïˆñå‚AÚp` ]–m–&\n[lˆT*ñbßùñ.e³¿â]¥ÖŒÄ	|\rTg€ò¿ìnNwéW,ËÅÃ8slzBê\n˜BÔ„…%\0†•Äm†óéÜË˜²ş9€]¥Ëİ§[:êRdÚ0¥‹`^,Z+j2÷4¥¶í¼F‰\'\\:Ÿa~¯ïp5œÑ-á±z™rı¢Ã\\ÚöÔSß‰Óv+\n××ˆÂ=n8PE~L@0Æb*’G2âUÓkó5½³ÄË°Â‚–ë‰¬n£.Ú”AJœEn’ïë@\"à›?pò»?˜¼•x>ÄüJ6o²fIß©)\0ä`âw%y±r€™~%®!™,Ê\r;Ä¤j\"A38ŒuÌsãÒZ¸±~+ôWïış%¬•ø_—¤6ğ.*~9>²üÁDÓâ„¯\0>åÀG²$”AXˆÇ\"•ÀË\0Áòz­zÇ{\r¯â\"Ì¹;Ä[)cˆÌ»`ÕE³j\\Ünù±»5­‘­+7¹	çÃ¯_ù,®×é\nºª|ÿ\0¼J–únx¯1¢öø	Ukæû†í³6,mŸ0°ìcŠ‰´ßâ–Ì4Zõ<Bº(È…—ì\r‰ıÜ¹±H”¥ƒ—0q‡šŒ‹1Ç¸fÓ78–ââSm·-æØ±Œ\\Åø*€(^\\ïÀƒ›Q…‚ÀhoˆJ…ß‹ˆÈ¤àˆ-b¡è}0\ZGMF`ŞeL9‚FƒÅ°®«j¸…wheÜã¨@»$Ì…áõK’\ZS]¬w*ğˆGPÌëÌ¹¯ÊZß\\Ã¢VğõE¦œµwÔQ†ÛŠÂPß¿÷à›å&gà¨]FÇ™b¶¾S4ÙÑÔ«2âôí»XøS\\çÉ»ww¬¾óÚZÖ™CCÄo°éÓÉóÿ\0?~%BëéÂ„¶Wü}ÂÎaÚÄ	‰™‡ÊaË>±üÍÊŒ¹‹ğXüœÈÉ@Æà§ºÜ®¢Î;¾`ÍØdÏ3E°Áæ¢°P•íÿ\0fmT¢Ø3H˜ÈÑ‚,3Ì¬LC!óí,Dn4]]Ë\rÊR¨Ê@F<Ó¤ []±¥ƒÂ]…ê<\0»‰âæN!¹cå>úç¡j ³°UÚµá”F¥Ñ˜öàZk˜üZÄRàHğñÍL\'/Ş]€=eè¥ç¿1Êæ8…IFÓVƒdŞÃİÃ¿óIQ†¨m5çLC5Åw›¥7/ó:YD©«â\\wqè/NbÇà¿°c¦ÿ\0É`²8®=½ ’\ZĞ&jU#“G¬NĞúDòéÜni•t7\rn±\r™.¥a¢Ë¶®ğüN$uŒ± ä3,ƒlZñ:€1œË7‰DxæX”¡¦ÓlñcÌsó‰¿X†L^¢[|DvrpËÁ©Lîë]x‰°ó^“\0İêR\nUZîP\\‘í(4ªjeó\'ÚÓÚjöÉ\n{eÇì,3â\\¬Æ9q\Z3ç•^q®÷0İÏ5@¤¿y‹-Åø1ı)‚Ä¨et9‡À@r­>°Ä+¦1EèA\ZP	ªñ¡”»€JBƒKÔ\r@(â&3­JQqEQ2™‚‡Z†Ug¬c,­—Çsµ,à†›,]¬FÃÔšf[¸ù¶ãAšÅ§©Â {ÓGiH¹ß˜ƒ6ó˜f™¸Çc‘ûGLÓL•1„Û°¥Ş.>AìÈ€lF·iõ¬ÿ\0œ,«şµD²3Áo„Tj|Ä¹y`‡\rÇœqŒc+âÌ45®×õŒÂÚ\Z\rqBÁ÷B+xzÅ¹ç1-™•‰d¢®YIP¸\"Q+¨Ë©¶D} ¥¿I”±¸@>W\0VæiõŠû\")xTóP\"6W2€Í1ŠØr\'c³•¬c;t#Ü)~ÑJ\0\\‘›İaCg0U,«<7õ—³ÄQ*úq3|4õ¸£a°×4WñåA˜ssüâ…@¢Æ(:†º˜ñÜŞ-Ë‹7ÿ\0K€Hmhö(\' ´Ñª´Ñ\rÊniÕ•p°PÇ‡²*¶`µUÉDT¡0;‰{¢ÛRÂŞ\"§:ƒ£Sc,Qé2Ø¬Cön\\p¸p]Ç#5p•[®{Š¬*´ÊşæĞöªñpb\ZX*t1¹Nñü ÊGˆxn\"èå\'+\rB	ˆ:³¸[ùÊ\nà¦™PKÉİşeJTÔºSûtŞXn¦HŸ¨!^18—2¨×Ású¯àü<÷!XdË`¯™fyopì(QÌyœtA¾çcéÜ‹1o5Úšñ1Äò1\r¬xfÃˆ€š˜Xº–æ¨™@1*2_;™±é-ÙóŠÚs[Š–İîà qqYËWÛ\Z8Æ5pcQmh°Ö˜ì%=G—óï)Àj“›ˆ7}RóEˆ\0næRsôczAù©DMÔ|\r\'~\r£g÷ó6œÇ‰ûúH¬›”ãÒ*Ô4!q0¢ş³/àÌ½#èu´Ö¯¹š2™òz!Š¥ÛôL\0éMõù–Å@õ˜f¬sÔcĞ!t¿Ò‰Ô>®¡{7©q1+Ş Bñ6]ÁÇ;›‰•Ì3~hŠî‚Ş\"QO6ËÅ|¥Ê©Ûâ\\XNaÄKm„33MVÄ»ôó‰€)Ï¥s“ÃĞ\nµâ_F¤x-šØÊU¥ÅHÉTÄX¡¢€ ã^@µ\0¡1\Z’Ô§^°|\Z”oï_±º_8÷†I™î?WP†jÇd5ïš¸ı/Å£33—ya•dg©Ø¶_tVÓä”M@46èmùFLì¿K€İ](2ÚiÑ–¦ /åÜYƒláx‡N/Ö!›~³gœã˜–­Ü½ŞK€^wÄ×Âór•”ŠÔ:Ô»_ÊØÄA¤2†Åy™e\\d{0xe{ÑıêT1hñé+*Z.´ÇPXèv fh<†eà[òÄZ“\0Fë˜‘É	(~¿Ÿì½†Xª*pÜOğ7Ç<ñ1ôŒCÆZelA”ü@\Z(á	lšŞnú%¬ÉC~=_X/)²(.)÷E™/p‡Ô	rè˜bå2ÑMğfTaÉ(#Ìrê€Ûâ4\rÅ³@ÂW$¾¦JÚŸ([9ùL@İA%àØD¶÷æY„¯Xî:|áoME@i€Ü6\\X†ÜæQ…6ê t‚³1ÛYL‚ì½Å‰ë[û•t[vó5ePÔ®yqD„ã™CsHyÔu”ú3öLÀQHÄb]O^#\nÈÊµ—‰È2ÚMDè~,¼t‡çûhŞo|ûÿ\0I’[½¸¨\0]8ŠlS\ZN1q}¾H^ç¢z2|±²/–#eùÇ\nÌ£V[a&P¨V4^eM:‹DRç’ÒÌ¼¾a‡–7–#iŠY|…=¹† ]ñ\nĞÇ0šã˜åÂ^n	ÑíWëÔñ‰};t5B±¬eâ,Ş\"Ê5ø`õ¨˜×‚iµc¨6qrˆnËwYêXíü·3‡§ìÌ\\(\0¤b¢_O^ÅÅnYwˆŞ¢F?©‚ˆ›%F­@:³ÿ\0bŞM˜h:šæ‹wyßP´£\'U¨Dy$C‰S	+ìšşõ*LUæ2*ÊPÀFÚÈÉÑİ7Âo35.‚¶kÒZà”sqQÎ`Í•k®àp/oâP¾:jÁ¡ŒË=Ñ3—w™uõ®f ‰—qê\\©ˆ­8Üus(Gï9F5J½æ*ÜtâlÜ\r´-: ıy`ÌPR–m”¨ÉÊ™lb‹‰` •ëG´Ş—ÏöLXÄÈR3vœÃÖUBGbF?©•ï0ºº_®` C7g¬D\'–æáv«F•å†h\'äŠË+|\'pHbˆ²D\\ˆ<Ëˆoµû¡°aÄ\0Ü>*¶L5yÄÁ	E¬¯Hñ¸/5ÔXÜÃõ–*oY•4|2…­J	bŠ:æ#Øy/‰[ÓÆ„h‹¨‰Ã¢;†*F†sÖVgˆØÏv=‰t/B¢„6‘«¢€\"ğZ{^WjÄ4B…ÕsÅ…{,ç6û¨î(TÊV(|\0(Ñû1Š9l9Ã-^±FY#ş«“vyÿ\0Ï¬½Fz_ëŠqíBQ‚×Fâ/¹ñÜ¹`r\'1¬‰e®®U6¾´(‡$»vùŒÀ…õ-Äj­âaà¿xİ.n¥&0q,TÖÜ4åıa\Zh2ÒeU§P+½™k@@Û‹ßÖÍ¿âV\ZÆ²)cÜ	Ämaº\Z#¦oĞ*¬Â”{eci½˜é]·µ¯ƒ£\Ze+t…Ú;e¶X\'®%ªc«û&?G+Å.şåŒ-jw±8Œ~7.d@Š‡ÌET-”×õ¨èylœf:¨´+ÊEsµš€rq\"W§¦\Z`î\\}b@½¼,Ú®Qt•oWĞPhfı`€óé\Z‹€ûÊ Ü\\ŠE&ƒ)[ô#âré»¸5SEº¨Mg‡Ş)²ò\\ÆğÂO#yÅNL”‰aTó\r<ÌC˜èÛ#ÑÅ\0¡ï‡Ì§×˜f¼;7±İ@¡A×^bX»LåjY…d²cú…ŠÜàN™ubù…³Ñ˜…ü\n•\\¿ƒ%Hà\0duÉÚwıÔº„Å}çÑhé\r^9âî<¸V&M$2T¯YB-RT8F™µ®Ã,¥3U‚:<E€\"Xy-æXKbÇç³X©t·hxà”Ï`àê]U]0‘Ú:aÀE ¼?ÙÚHİšæ6\0*æL·Q¨a|\n¥<ÌÖÔ¹s­İ¨pEÕe“7kÔÒæª¥8¶ˆµø\0AƒöLbAñ›¥¼K8—qì*§™¸XW´â¤ö ûÄNGÒ_<K£~UÀ2«>²ÙÀ¡yÜlºÑ£ˆ´¥[‹ŠR‹W/˜jö¸@­G-¸™8aèbû‡¤E‡¤DW+ÄÊ©\\Îh—0ÑÌªÜ2¯7îğˆĞ·è÷ÆÀ)V;\0*é¹A\r\0qP…\Z™LSrîb12‡¤UÙPØa5M„ Øo<FÍÈß{¥gX%°pø´bAñ;¥ÜK¸—ñ\râÄ(~XSƒ‚³ôwòf	ºÆ³oŞ/1–|\\µ&€m½Gä¸	a\\óœjE©óŞ¬À¨Xñq#ûC2.÷/ftí·¨…ÌQ£²şÒ”¢4\rª\n£1Ü)·\0C¸\\‹Üy¨ïKŒş*;jfç˜²§y‘”ó]£l`\r¬¶\0yzŠ**RÈ¼AiÀE`ÈµEÓö€ª3DÄğSù…°Àôj°íè€A@P~Õ\"~‘ğGÆ#¨¢:•êS©^ z€ê©Ú©O¹\r«…ıúÅCNFÛÏæı¡òDğÜp+\nûÔ.*•ÁßIZ€8ƒ€Wm ÍÇ1^¨ğE¢°°õ(­£l*&ÖSBË¸!qŸYšÀÑ7İ¹â-J}g¢RölÇçá„¥€sáœcŸ¤Ê1Ù1åcj]uG‰g\r9—…ÉO6TÍ‹]D.„oÏS-¨Â«j˜fBRÆ¹†\\D\"+-øñûj•0Ë„|g¢z\'¦W©^¥z•êW©N¥:øqØ/\nvóÔÌs¢éê¢gıVŸß0³e^úûÔEÀ8¬bó[wŞÁ,\"Ü±	kpC¤ÑXÉm}§á\0R\'Y„‘JÌ\\§ªÉğ+	…®P<²>A3F^úrğGÊy0ÌÍ+å“ÓQ\n¶PnU™Ü°X%X:Á™ÉVî·™˜7M8äîâÕÙÃõyoÊºêl‡‡Gğ‚~â¥Jı€ÿ\0ö\0ØpÔ4	À¤®*<²ÎØªw*—çÖZ«§#0B6æPuû…Ú-zÜdËôõŒÒWP9ğŒã„rÑ¸¤G@2©¹Hî&­›ƒióu­Û2àj•2ú¸|Á(yè¬è–²pÊà\ní2Áù!s7¶Ê{üEèj_ÆÒ¢£¸`£÷5*T©R¥J•*T©R¥J•$:Øğ9Ò¯+Ñˆ£w9€9–a²–ï¸ÉÈ¹ğÿ\0jT[o6r?ìÂ÷Êà¨Ş‘ ›‹.ôÿ\0ÍÀ[Eqà‰å–32º)µ–+f%æ)Ì‹­²”Âp²ŞF$»Fü%	07¶®\0¶²P^óˆY r‰å€V›rœ„W°!Ç¼EêR`qÜ \0PCıSÁG•l>ÑTÛ;äúÃF5ó¬d÷	Gƒ‰M=8<÷)¢åuƒÌÈ/NˆQZxÌMøÃ\r˜ñ\ZšÍ¸¨2.Ÿ/íÊgYîáªíd“Ày‚vC\\/33V¯1\Z¶rışu+D[—‡€jfJZ-aª—…\rå®æ´\"ês(uugiÉ«‚]\r<Âk=\\¸&ÔÊ…aõ,cú\r¢“‰_1˜á]Çß7÷”ö›p¿3dâİƒyÁæ.,çÓ€Ëh4—”Q(n+Î-£´ù|å ÆMá/p¹×B%Wi/^/0-(Ş¯\"İ@YÊÍc˜~.Ø¾æ–\rSıÖ#ƒes—Ò<„˜hx…Dvs{ùJ“bP<ãl/§Œx;î#º[å{ej¹f9ëã‡è?Ò±ıb™tñ¿ö$@ú({~\"‘j+S{UüÍKÍ%\\\"Œ1£Æÿ\0ˆFİ¸ÇË(Lá¢¾eÈQ•ÖñÇ¹yº0Ñ¯å„â‘¬ÜZÑKxö–¶Ù?0`\"d½ßÚa\'–¹úÂ>,‚¼ŞáKƒY¥ìRÙÔª8+Â43;`\\…·P™GÑˆCıKÁ?¤:ÈsGƒMWƒI\Z´¥µR’¨Ü°µ`HXê¿¯ïDAÂíş±µ¶?¼Yò²Ä‘Ñmt{@sTRJ-m†DX®Ì+U¾&C(g<³\r,0ºÔ$²WRŠƒã‡ú–1‚L‡†[Ä¿‰V!ä¹¦¯”KòTVÔò7aÑÔ¡¶w\\Å4ˆğÎ\rVªº¿1m?&!0ÇX÷P<¢ó0±(¬J8”|!!õ,HŸ¬D<3Ã/â_Ä¶,‹¾\0/üE8ü§‹ò€‚‚ È8Ä§‰_èP€+ıZDŒ2Ë°øÇÂ\'¨¢:‰ê#¨ˆLV)\0€À u\0âI¥Jÿ\0WR¥ˆÇN¥:•êW©N¥:”êW©^¥:€ê¨Š•*WúÚ•*T©R¿d\0\0©R¥J•*Wû:•*T©R¥J•*T©R¥J•+ÿ\0ß?ÿÙ'),
(53,'Pan Integral',3,4,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0		\n\n	\r\r,  ,\'/&$&/\'F7117FQD@DQbXXb|v|¢¢Ù		\n\n	\r\r,  ,\'/&$&/\'F7117FQD@DQbXXb|v|¢¢ÙÿÂ\0ÿ\"\0ÿÄ\04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0\0/ˆ“p[óPÆZ Èîªu#¡²t÷§Ñú¸Ï¸üùà ÇŸ‚ÔÃ8í\n}º’‰U‰]ÔÉBde‘œW+¦K³±ù‘¯Ü0·Q\r]W>¿Jçezœí±”&Ïsü=_Â}$n`y}H7A‹“NŸQKÖÌ2 †Ìãô)Z°­’¶ÆWdrHŒJëÃ ıËfÀê@_IËaúÀæfçVàV*µehÍJÕ€Gù~™±™DËÀu†˜Å™–Ê>k´ÆoÄšˆJLy¹jˆÔºrvr·X³RşfÚ{åz<Gİ|£Ö{XoIFŞMªLİ9ä©<It7\\Ğ»ÎŠÁ&>jÉ½-\\AïTåcó²…šwvÙ?\rÕ#f|Ç^’Æc4\Z\\ú3Ù?Hò0[%àfZ¦ˆ\"4Î0İ\'¬{v%é^ocĞêiÊéùÊeê¶W›Mdv]Õ\nœçæ×Pò{HÕ¨óm“ñëß„ªw_7Ê¥ô	>`_-¹]Íí±9yQ¤4ÖÕ¢ò6¸æH¬–ƒÑŸé1¾9½Ï2“dfË-èÜíÎ\r®I§gê0’ÇÜ‡¹›±×j=/\0íğ„È	Hé˜¾[RêÎ¦¦¯/p[,s66Å‹{²cgt„¥Š×22¥±÷\ZX¤¥r\ZaññI`;–©ZbÃÜY$É¯â+cì\"ç.¯c<\'j)3Xvhæ4š³A˜Ğá@Êç]6]ñ,˜lnÔZÒeõ/Ó¬ÕÓãŠ¢uÉhŒc`4¢•Ú1øòÌ9]J{ÆÙ1>ñNóOHËn6ó³:ğ£s4FïnÏf½AÙ|âş®t0™úİ\"¼›…PîêèÅĞc‹šË‘z6OKIkÔ\0µ›åª”´Í]dD§™Ô`èbĞeÉt¹Ç®Ö;“AJì 5%ñó½ìS#ÜæC+¡hOÃ{#Ä”‚Ò6Mx|ê‹Ï«q’Ç+)– ™«Ÿ«¾W=Î0HÖ±ˆ\r=WR;{0Õ·Ò¡‹#™¡1}<\\W›Ñx£+\0nnMÃŠè¢˜íí¥£FËş\\p’›»¦Pg_‰sÆvŒÈŠÕÉF<VçÉP”fİOB\nyJ“	ˆºæ‘öw^sË4>N†m÷>4Fïd?\'êÀz‰™LQv3õy8=?PøW°:¹Ë™Ú\0ò¼ÎDD\'¼ñÏCTº\"ŞtBÔÈŠ°Q,	›?œëse»FÍÍkM•Å.Ay¨ä°¬U›5mö¹Ñ&8{Œáô«_…û,ƒ]H–B³+¥¶ØúšUrz²Jëu¬°#’HÈ#tQËg¨—[Uçj“˜\n0}NwB`—ls7ù¾Áš“¼Úó«C¢z-˜±r^óÅiô03CÑùÒtúàrf6d\\ú¾h©æËeïŠ:Şãúµ–ÇË}ô-§+·ó®S¶Xü¡²°½£å6:7óqgrCõZg-ô©¼·@–ú5€‚›!%\Z5™M~-f~Zq¥‚½	zÏË™Z³@d-2¦aR^Ÿ™íy[Ç¥YNVkİne5¾šSBÌÍ0HgkÖ>a|~„ğ¬¹ö•\ZDnŒğ:;ù5>µ¨öeI»¤tÕä`Y¦B¨WY¹ry†Zç¶õºöºš,qNƒ…ÚŸ?(Ó?²\05{>|ÌÔüûO¨ÊüPx€zY-‰×†ĞhRØ!ÈL—Z\'d{FmgŸîm<ß‚lÅó·³d}­\Zü¨‘Í/‹öÜ£˜NwCÎï®ÃZ´Ö2ØûÍ®™ëv°Ç¡\0n|!¡Ø±~Ø&Ör˜/JÃI!ìRÌÅ½l@œë‚h¸€†ª‚Vm³#/fïàº<ßS/ĞôùÇ¢±gNxIP‰,702ˆ4’½</9J8%8=§hßß”	pÚ^ObŠFê\ZÅÄ¹Uğq„Ó¾C=ªÓkÊŒ‘£iXl<ÇoÅcV^»V¾´¼5êx¶&oF.Æ¡{¦)“7úÚ¦t9C©Ékùİ:f1G?“éD,„JHjõç5\Zîjá¿^‚L†+h	ÙæÒå$¦Pô,ÙP\"\\\r§Î¬Ñ3È Äsx«Ç‰Äö¬ş†$Yº§?å\'”[ôÚ\'‰\0Úˆ`I¥º`Ë‚µišå\0ÍîdÉ–ÏÖ5ƒkÖ¯\"g1f‚zŸ>[Ò¼†ãÓî×<Ãtä_}ix\'*É’Y¬¯Z\"ÄÔs\0ïŞ¯cĞòDªÎgQRzie¶\\¤åEÌ›;ä#^ÆÌ–W¬ëÉËT9B•¹ôhm)ÚåŒÃœó.wQŸVhµ0Éô§XcÌ¬ÀôkşEdÃÖmø·?1-†tÖ=wµCª~xê_u\Z™‘ü®¥º²xÖóìù7cKåÏË©ÏáæÙéÙI·<aw\ZYãÆzÎmÃŒBrk½>Ú·`Ãéó™ë©®4¸?K×ò¬FZ©È#Jl°œôL½Î‡‰Ñ¸“&LYacŠ˜²t’qxZü¾ƒËzXQŞƒˆªœc%ª½W§Ûù©¾ísÁ.à¸Kã†3³Ó{\\«EÃg3|!n®8ò4opèØ¦BÙD–F‚“FK¥Í‘²³Nj}nªÌkÉÂ¶HñĞ¨àÅè<ÓØ¡|vczöÕM°&#oHİMåëK¤Z™™Çf„q958g?è^Fi‹ŞÙËn/\Z×\rôõkÊå}ã&üŞ`ÚsØº;øÙÉòïSòã¼ş¦í¹¬Æ¼CŞ.î^ßÈıWµâótáÃF„şĞ0Åçóí·“l´Ã¹¨UydòÎ;-Š3ŸQÁmqÇR”³;mØäkÇæäo§óòIØ·MÈek–î9\ZêµäINÍ!ç1gšUš\'“Q¿©¢†^~Èï¸%pR±0šÅGŞxíÁÏ\\7!f€ 	xÏA­@:İH‰İùŞ¦a`/À®J½‹4@0–OEpV©„BÄdËyç İ??˜ÒÙ‡½%» ¥át«šîQLô(1™^‹D>Pk†šÖ]m\rö:Ë˜Ğ^­è<èˆ#ºSŒŸu[=R|¶Ñ¼Ün/uS&¯4‹Oİ[oMó“\n ‹Æ3ìÆî³…–nÔ¹œì×´«º¾w²ó.¿:«•zÜÅs_t®kŒHUc¢Z¾æ¾éí^¢ÜÛ#›\"¢,ŸKØDãt¦ë5u¡ZfvÈ]Ğš`šI¡t“ëD \0CêÂ8×™ìG¥°S·Éòç­yæn·œ\Z¶?j%±H$­W±(&UYÙË\Z\nBš¦—h9„Qb};Ê})Á›eQ´G\\•®‡j¬äÄà-\"²Ã·T˜¥%{õ«›t‚]~zÑ.¶ºO.‡FS(ö)n<™†ÑK¶òbFdè©©æäL…­k:†Ä)‹É³S=Üm¯9Óœ\r8ßè¸kİÒœˆ·Ns\\cÏb˜¹ªù\\öº‰ª­‘y®“£wX¯+dúº.WBkİo¥€yƒ¢W¶RcùƒwçÒÒ™Êp[ñé9ï+k€wùY¥òï`Í·Ê+nğø:OeºNŒ6j[›ş›4²Í‰L,át äô¸i5…Z–µÒMÎyº›ƒªŒŞT\\}ğ’\Zİa\n¨ò´\rJå…ŞáÊª`8¡=dÏÕX%[k•›.²µTäVgSù÷\"nO•¨F1v‚‹4xy,ºK:ªƒyIÀ^“Œ®åĞ„ç¬‘ó”‡—”«‘È@²Fû¥åëg “¹ã{ºÃ‘zO¨â±s+ä»ÓêÉRÏĞJèõ¥È´N¨„º;öZÚYGMPÛ³Iâ::ÓqzçL‡mªj|ûÓH[õ.wVkĞå‹C³ú¼´ÚvÃù\r±‚	X#PmUô•]À_@.eÒ•¶p\\Í]D¯gsÇØqc*Û…¬Á©Îæ¤»›;qhŠ’h%=EÊnªÙ:æŠFÅWCfÍÛei¹‘ÕçeŸ™ÀÂYÈ¼÷©Ï®Ô“·ÉçrÕª\"İ;¹e¢9¦ö¼‡œ‹\"=¬º“™$‹›\"\"­×#Û\'Ôfš]YèŞô#_Ämz¸4^ÏÙ‹6Œµˆ—ŸÑ C>o~\"\'ò~¦Z´ebô1\ZjQı ¢ü]şM¡†KpZëe«¿,€Âê0ÀV®†©Ù™ëD¾´™š¦šøDÇún9Mpky·£D3y˜ÑPÛù¸Íry1=†zØ«bNQL†¬:Z2K»«g:p JİšÍ>\\¿/eY3zfBõr‚áüG±µ$LãÓ›şô¼s9RNäâó]\"9¯*^r]r§]w5÷Mz$o:Fóãºîî©õíÈ_Œ™r­‡-Yİ¥P±±óõDàŒ\Z‚Ò»-ÖlR\r¥C²ÓÔíesàé%†Õ{šSğ`ÄÌ7hq¹:HW{LĞE@™öx©»Üç ®y¹Lä4Ğeôu›„r×–g3šŒâÌÖS­9.z¯Ñ|×nä/Y“Ñ°*Âo-p¨mş4ƒM³\n3¹]yÁ¢ Ìº‰Bó­`Ë£yÚö@óU6g;BÅìzyÑÛÈñ^tc/è¸|ö»n%r>Z5Y)Ïn/9.¹ÜÛ§#Úb‹Î‘Z©)$c®•;®#W¥+]ŸeWé05’ÄÓ«]RMùz¼ÒcxÚ“Ÿ¤/^§óëàú”Æ+LQc”†ÅYáGµÉQz>gW•³±Ñ}x»RR±p}±°#àÒÌÔ\"<J¡tògªXqº$efm˜³,NÃ? 	zŒ`w1€\r]›µ5y±:Âú€*æzù]{‰RMiésô’riCã›’œ4§Ÿt3æ\Z‹é8#$şcî•yh‘¯Bîë®{$¸Õî¸±ÊYÒ%Ó©t‹Éq’é\"•¶?d±Ğaj‹ºÅš_sj.¶)^˜›$Xß[Íùª¶A\Z£­±Ê’FõYÑ­Ée®àf·iãŞÍ„ü¦´.m¡mÕ]Y…-\ZÔªÀ`V\"VFëËJ¥%:Õ‹úW˜.êL;Náââì ò\Z|¸åœd÷¥\\‚’ãs\ZœšÊmx[l\nAiè®5LaÑ‹Ds~…«6\rS\"#1ZÀzW—÷ùˆö®ü*¨úw8«‘Í‘QP…ÊÕ‘$bIÍY$FôÜ–.äiSšş‘–R/,Ÿd±ôàKZ1émş©Ì6b™©p‚>.\n%ÕÑ±ïGQ:P	E3Ö\\|½bŠøİí>!ºÏ63é™¾/HHM >cU­Át\"§¡e¯Ğ’â››,\nËVc/lÍAúêó¨ñ/Õ»¬W9p†øË÷VCõ9—zµì¹W£=U-Ó¸\r‰•ªÖ¼7;¬ÌªuŒ©>^Óµ,.ÆRsqrú/uZ¹—Êbîî¸æ9yÜ²*+îB®m‹ÛÎ‘U:é¼‹uİİ\"9RZ++ìpÖñ­p<%~cc\"ésïÙ¡Œ.:»K¹xíâ[œœ·½ˆéMçGqÑ=’»yƒQ­hÌèl\ZµE¼£}DJ!òı \0‚ÂWêÙŒe\\åBO6uÚ|¿e}¡ZeS:S\raé~lR’’ĞĞ¢pF4KNğÀ£·Ú°Î|„: ²T1%£ÉX­ÆÛxe€NLzOG±(×uÆóºNk’éİÎºåo«]Ò–Fô$EâTéj‹Ò“•dcœ’\'?¥µ«×_Bàı_‘ïÓ·E«-¶knÆ;ÈLäuš+ÔÉ9Dùy·]²NV!ÍFU½\"t§>¬”]VÔuaª¦£^¬Åæm‹ù\\Ùµ3ædî·ña¬ÕÙuËíÜÂiK—6:®ÍZ7XŞPAU‹DKM.WKU”3VñS†Çn®c íŒ£fv…ÒGÀè§k¼·±Ëç\"öùŠäë¦ò­ÓW’Eî[¥îë®äRäuÒ;–Dîâ®^l©{™EÏ®‰Ò;‘õmGÇ\'Ö“\\g9’(¤›ÏÍù;™9¢}Ç*Ø†É.%™–5ã³œ}\"\Zál¬±j¹$jòÈIà™¢uÛ3ÔÚÕí­JQŠPˆˆ6PÈW:fÃ!Á{2µøtdµ;:ª;Pšº˜VæWö¤9á7ÍÒ©İyA¥c†®;.?“ØäÓj`y;1\0£€j°z;§§:ãU:Rª­ÓyZBåæÉÎj¯#¤îåºjIÒ#U.œ×ô´éVäæI$Nm××Ns*!æBàa&§¶\"ÊÛ¤³„Õbë©³Kl2B$­kM}È„b$^e\\èÔéXæ¬pŸ]n¬FÂAaäŞú=ş¯õE0Æiˆ‚^´Û¡>líçós²‰¼]‘!°™lËà½¯<åàÅ“Ëév„ÈÊ,J‘Ü:ûÍv\'å›‘z8yÒ9dsš²r÷*¢ÊåE¹È¨B¬rX«™Ò;¹.¤j¤‹Ü²5í’s™VîoJæËŸdµá‰Ÿ7°;?F—˜s›QŠ×‰¹½ÕnXßEJÓjq­Òr±ª—Iã‘œèç:şëü½Ç)/É¶Ş`\'˜êUÍnŸœ‘h5~oé2ÜHÆ q	¹N¸ êÕ¶³J“PmiÊ@#0oL9rÄXjV¤–#±WtxõøAÏVÊh8Öf3¬¬®éóW¥7—®w*Hª‘¯¸¨äºîG]\"¢İr/]5í[¹‹£™$cÓ®’XäHİ×MTë§5R¯ëÿ\03‡ÁJßkØd’GÎn´R-ö1R5¼$ˆ±]+Xâ[‘©\'C¤7ØS^y,óâ[>I–xÆî\\3”ú¶æ’¸C‘,éåô†…4PPbo­Bl\nôHå’Ü&À%¡Õ»P-çÒ¯O§6oŒÁ´‹rÆÉ\'Æ^ô\Z\' D2üI¯}áİ‡é­\nÉHú^±‰×Mçtˆ«Òww\\äs¬c^[œŠ·L^[;’‰íå“šö],uURR\"ôdÌ“Ğ¢/Uv¾1&£$ t‰#H{’%ıpÂO5¦iÓ~A¿ôEùIŸE rá¶3´9Ñ¤îëÉVó\0DÄª¨Ÿv0Væ+¢Ä.PĞ²M£+Wz­‘£\'®ld8½¨\0Ó\\ÎgÒ5f Ğ,Äu´l•Xó}˜Ú7Ë©¦…PCëjó\Zóª“¤\0|ëÚ2ğ¼6Tó®®!Šôz_Ìé[Õh½ÄVõÎîé[×NîY»®š[¥åZ%åhÚ§O$o{hákø–œî«è¤eÍó,1Z ¯j½Ò,°Èª©sQé‰6¦û±“UrPµM©9UªàôÆ5:JK0[ vnïæà™-;VkN/éÖê„`4W/èéEPÖ‘GÅY\0êŸz™”Aö+œÑO$&„h„©å¤u£9¶\Z0\Zx+ß*2ß0§fHdÏV¡—MJX­1ù}Ó#¸¿V&Ìş!ŞÎ%ÊòÕÚ‚Ô€ÜéX5ÖN!b=.šŠ¶)#_DÎ^”wKæ»ªÓœÙ,o’GÀñ6/6ÅU©%º²GW·º‹ú)¡‘a%DT|\0~ü7ŸÉ(D!Óu¨,´ÙZ®+F.ù!µ)P%Ùô%èé=$º8ìhÓ.\\r×}Kğ!W$Ô¬¡ÒÎúïHƒ,\Z\r}ò\\¥qŠ‘XëU}d>Îgpî–•–M1Ë\0Ê«‚°`ñu6¹ê½m]§]ˆ±¯;Sˆı¨”æh˜ÏGç…{ô£Yû	&ÏıìPt1ù\"ú-ê¢ÙZÁo9²3¥[¦¹­Ì™•h×ôw,¶r¥Ó{ºSº{]\0Ÿ W·Uz¬ˆÔÈäE³ t\"~è^gë¹T«óYµšJ2ˆ>¬i–Ëk0Ë¡&ñº…h,$”¤€w;!ŸN±ë+‘^ğBÇRIMAŒA\\VúdTËğ~ ¶²Ñû0RT’(îLûúÖjİZ³…É#füšõ¿HcÊ¶lË™+Y™p\ZØÛYİ©Ígé’IJóGIKEQİ\'”ÔÂ\'¶$ûZBÀ³ji…~÷¿2Ó›	Éİl}ÜúµjtŠ‹Ò/\"U¯wHîrÑÂ’0–Şî‘­‘ZæUúWNÎ†dbal]Ey¢ºÚ{/€û>ïd6¡ÀìW¿ŒáoRSJÕq3UL‚Şm\n<ˆö®Ü’”+¬f}\'i……èÑ­I˜®HlİÍªÊTE:Ah¡€ÔIã+¹EâÄNŸJ%ä×\ZŸçÍâê©r!2ZrD`†\'Ó±Ç\"€ŠĞ2„”ÑZB“_Éls‹=-Œæ¹g”ÓYĞËëa øÆPÅË;íŒ£‹İ\0Å£‚Üb;|÷r.ÌÈ½Ò\"ªH­WQr«¨»•£NF)œ¯‚ÅrQôné[fZ š¼±Ë†”ÑX5ÏIí^5ô&[Í›Ï!¶šl„&Í¡¤W­SzÂÈeğKx\Z’­æ“Ÿšµ›UMcJÒ˜®äT¬õ\"\"Â5î½é®7-Fó@Ø(6S Á?lHızÕq‘ªFèY™\ZÛ,bÔf¯\néc:[^ZLò\"u;CˆÜ-Syß–0VÙŒƒ‰¹dî¿—4i×âÃ”W›ÙkÄ¼f¬Ğú¾İÄ×—¥¬oII\"$·*6­èÄ’N‹¤rsäFËÔQ²ÇJÚ²x©­\Z@|k–ÆæØû	|C‰9Õ-Êeà…Î«¹˜×Xf¾á†jsPQS™&•h]‹fc3ÍER\\ez}.×Œ…îàğ\'›¡zyÔ¿Oæz<Âõ2ø=CømL‘3`_«0s\Zìò\r}}9®×7Ãt\rÉ2™NÜ­¨a\0ê;„fÊ/!¡•óõô²VØÒŒj¥\"—@íQed(³¦ÂÊùÖ«$Õy’É¢å,‘>[Ñ«\"º7U»›Òäæ:G1Ë#X¯©œê$’±x]‘½­iXÉZ­˜„««T•.µ:ß9ôÎ.í3“g-ÙÂ\ZP™.-z˜û.F®3ÔoÍ1!­CeO2Ì^¿wäIé º1ŒÔİK»‰V#L*=‰ôJxËÈK+•ØpÕ#^(ÀiÄ…}¹®‹–óÑT»©láJiÜÍ\"ır©Lo¤‹n- Í@R¢”nj³²ˆÃäƒĞGÏj8ãô¯UjH\n“ËÈöƒsù$¿Ğ¢sZÜ^İªÇÒßÏ£7÷ rqÏGkÏÎcèÈ´Måë1f«TU¶»%aï–¸Ú”ÕÙq·¢!æJë8N¿¢ùæ›•µv^o³Ã­3S;x»‡ãa8q×²år¢¸ã:¨*Ky&8æ“&M0<7jë—7>RB‘«²\"~^œq¡0ö³Ø’› Pc˜›‘ÙÉt¶å!Ş‘ÃoŒÕÈ†3?bRQ•‡—cÈœºÃoÊ–ˆılİ\n•S‘ËØ*!0n:€b¢óºJİ¤ÍÅÜõ\0EQ‹*à›³½ä*\rºÕúàp Íø\Zå2³9÷ï,ès³cº9—VõÓ§«(“XÙ¤½RØä³bÛ¶ë×³Æ¸Ö9ŒUÌ@\'/F\'ªÓù¯ªñvù‘‰cèdvy\r^Œâğ~—å/F´|ıuá4–$Ú.\"få—îìt£4æÒSQŒŞ˜CPË¤jØ‚5Dõ›FWNãÕ¦ç7#Äñ¨J(}&÷™ènk³šĞW?lßÛ/š\n9TfhXS`ÕĞB®¼4Á·±·F±Q\ZA„Jú%ì­›ºsÏÄXó›¦Ó	h1š1…\\R6\rĞ+Ç”Ø+gnÔd„|—;ô/ˆoÀ;£]êt<„|S	¶õ;áuãâ¹œi°Ï±p¶ÄJÅéJ²ADJ„°¸\0¶V0Dùº‹nüt¶s©’4;Mo.=«\0CëY^ÉÒ2œĞ´¾wêÄ•Ô”4†	Wâƒ„µ£:³ÉiJĞ¢d.ÄLËádf=„¬)5q\"â <Kò/J¯ mÕBg´öåº\nCp™íĞ«“Ëİn³Uó©jPAm2ngÌCë»2³F\"ªŒašM*ÓÅÂó7G’Ø•¢ómM×”6Ğª™Û\r¾’·ççö9k;ĞsW•—RM¥¶\"å•BƒLã}å•:™`ézGÅ#h“¦£«ß®\'M¶jJey\"¨ÚoJpÉTefİCUíFakÓü›ÕùÛ¡© «Êê­®‡~<Yµ`&\'Ln¬Öø†öd­•œä`ªf©ÂaûT¨kã¿%DĞS ªF²¬ßHÈZ˜óÖÓ%€¼`¦]	`¥Áøz+Ğ|@í0Ê&82ab^–\r×L‚\ZJäçB¯\\6J²“P4ø!+¯¬LWjI\r¾u–+A…í»‘òyß£y±§©Ş’®cªç|‚è´6b7ŸÏÕ<¯ÛÁ,2º‰Ì‘ |Õë®NI+@B¨è,×•]¨Ñ*üè ±\Zë\Z±XŠÆ->r:Ãt£ÍvÊW¸ó^Ş°~å·\rñ/9Û—\"ôe\' ×g´™’ÜDµ›êoÄtÛî’. ©³¶jh°ñˆªæŠ°Ø„pÃ9ÅòÑÓëùšâ3¸Uy\'è®‰Ç&Jû5d‚Õä §«¤‘î\ZK;³8ëÔç	İY—¯f¢ÎBdì…‚±s”Wc·Ä‡E¶Õ¨Ãç*ù™.tOìsåè_W1†ët¥2†Ì<õì­éaêgz¹@Ø¨ò¨ºÃ*1ñÌ\"‰‚¤n¼¨Ï±,ì†$±ÕEê–0¤Œ )ë W½úà¢şs­xµn’C]½kBV°ºJi!òñÍ\\èŞvßIF€gˆÔ\'±úùÆ¼¼¿¡Ş:IG,Ç•7‡ÕB@3ş£äú–lX÷èb„3èÃ:»S\"!.§G0¶™y1ÊiF¶ç×ï—h†ĞWã®­¢ŒÙIlñŠƒíætÑœ›;nï1Éé|ëÜÇ¯5ÒŞ{?¦Kéëñúp²EÆiÌ1œ¼Og9$îå«èìF&öòCÍIl¤ô±£ÖÚAU²%AqÙ‚\rHç¯.š;:Xî}«åßâo2C§S¢¦JrÂ})Â\"&ƒ?\"=U85	(†\Z¶ÔÒ¸²@£b–[®ó{!ï]yèÔlİ—Oœ¡şn?×Ï®¬2…®)XSJ¥¯¦É,¥±QÅQĞcRíÈÈŠ¡¬ÉúN1èÌ=zítXÍ–w!\\Ö0^øÜhÙPŠ±\\F]G3pÛb²Œ‹ÒyõDW-ïî(©Ë*é*ìÏ¦ùj·š“º\0:0,K»¯DŒçK‰ñÏVÖ¹âL†Åq.¨úµiÑ0×j>²%^´Õ*Ù^fXQIzÂ¼s6ê²9,+z\rW=wm›æ=¢aÇJÅo…İ¯hĞ°E]	%w%õWy½ç\'sçnÀ¸ıB¦ÎfÆ>NÒ¥&6–çğ™ŒGäzÂK€˜K²6]\0A2º—f»=]4½®µñ›’U#Æ\nó%³UÔçZìZ•†bÑ§P¦v¡Ì®`Gc”åk·fçµdr«îÍ³DdkåË¤åªd4å7¤Ë\Z)ÿÄ\01\0\0!1A\"#Q2 $a3Bq%4ÿÚ\0\0	\0êÛ+ç¤j•‹òù€™Äg‹™3™Â/Xğ#\nbc8œ‚œxX8s81õƒõ›2şÜFQTğ<ÀGŸ¼Ö(bgœ.;qØ38<#&Høˆ‚_bû9W\'¶*¡—Š,?U~S.Ş¥Ù®ö‰ô®é@¡±{q*(ËSxrŸO•6qüs#¤«\\S0¨Ş=(¨ašÍúEXMymÛU‰Ö\n”Gl]ExC<Ã§EqüŠÉğÊã²:‚ÛF³ªúv<»íJ&\0µ{_Àl\n‚Ş×…w7;X“J6ÊÓÙ$¸¸ÚXİÅªµY°¸P›A]·f›C]OEKxúöÛ6h­Jì:µn,$U¡İ9×ßÖh®ÌŞé±xÃ`+w¬‘‰ŞÚ—Z2ƒ}«?)’è€S”æÙ–E(dIçRìÑfÊÓX4voéœAi[Y6™\ZìM/\ZÊöeP¶xëîökZÔ%ó·u¬‹­†—dğ{SÔa¤x	µ1\r )ê”´<yMôë¦ò¥Ë¦D2µ\"!âØ·À‚Z}ì3œJ‰§«S€™Š£jæ1¡+>cÇêalÁZËô´ñõ\"1ï!QWzZóÖ‚)‰Ì{ÆÇ¾ÑÃûã8qÅÆÄÌdg°g\'ÜçÆO81SÚ3ŒmŒ®¨Œœúqíî#’y`°y…âi‘œb’#Õ÷ŒÇPìéÑDËK´µ³o*‹÷•¯¨maî÷,½pçº¦êÕ@\nà\Z¹z¸ZÙÛ³evJ\nr/lüÛ^™-y	ÍSiĞÔ&e›8µ³îjä:Ğ£r¯xö:æ×¨YO¬eu¿òQ»ë•İ9\0GOY±·½5Ba\Zå|~vÛÅ‹«k¥bÆ¯KfİéÙoÕaæMe÷\r‰Ntı{Û§,ì¨ĞºõÄ+/©Ä~0:S¯êQ‰\nœş]¶*1V.–§Uë5–¯É\"ğNÒå¸!ÍdÖFµæ¹EÓ%„»ã/¹‹ÍôWØÕ-Ûäê4~`nÍõ\"°V¡Òûv[6®ÙW« MTƒyU ¤BìE˜ÛöKPÊ¼ëÛDPÊw©0sjZ¾‹Œ-V[æµäÆ×\\¨Dån½¦3ï´ØfWÙ8*Bæn=³t7Œ€_p‡_ò..Lß¯Mò%°*æs¨l$W,˜ˆŠä\"&D@§ô¡!Ÿ¤ÄFxıcê÷EEñï>(DúÀ	¢TÎ¸ÈÉ†l·+Pæ¼\"µ`SœA”FL@ÆArY%Äc9)À.ÜTó“9Û8\\ñ‘<ãçµs9Z{İ8ÄaN4¸TAÎqÆ}Îx	‡‹­ÄG9–›+T”@lRqÏ;í5ÅÔ˜¯Uªz{bzÏ_ò\0WªtRØbÂemN»\\¢Ã´ÊÂ·eÊâŸ *R´ÒC€úÚÕC¬šë±\ZÛ.×!&¤/a^˜Õ1×ÿ\0ò9! İîÎÂ½†×ÚPÙº£B½mgLÒïŠÖ_ÓúıyR5Ús\"óÿ\0]j“„¨Åm_Smµ`ˆc?éŞÏ÷kKĞ(C<»®¤ˆYCº›X\r$ñµê5JZ\n¥¯•«)^¶…tê«Ì±´ÎÇd.ïìÙ°µiv‘Fô¶+/ò*z*µ«aa¦{$ŞbY@S,-±…ˆG%©ÙkÓá¦ªk+5d~Óö—m/µ|p\'ê‹ïu´Ä zÓnŠÀ™\rw\\V²p«@’¬eHŞ²\rÍb¨Ï§öQ´¤…Œî4Èd÷„øØ¶öL]q!$}Õ­¶Ê ¦6”ùÔKLTw5ı•¦Ó¯TTœöÌÇ¶o’Ï\'[J\'‚,J\"=.¸äUÁ¯Æ\nğ“¬Qî0VÉœ…2>ñC1÷ƒçBÑóXu£Ë\"1‰€Êó=Óg®1cÎ¬ûæqŠ#+Ï<äOöÉ(ˆÎü‚ÉÀã/1¯í%‘>¿KúÌb\'ûdÿ\0Ç©™÷€9ë¢1ö\0R…1ö²bÄcgˆ#ªí\\±mTE\ZD|J‘ç¿¬‘)—†×Mh<Ô”TÃª¨FÙµØ´Z_ÿ\0¯ZìßyĞÜ£dÂ]eHDÿ\0WGb¤ñmò®Oj£ÜÊ²/ K¨µ’b¾â¿BåªİuSHÈš±*^Qt§ª‡˜#½SZWÀ•óm[‡Q×›,ƒuQ7\nÄæàhÄCÓMómVî˜c‡:sÃ4É¯Nkö))\0Ûé/k›\"üÿ\0§DK‹ãb»ìa²Ö²Ãİ;ıd!(šËÕGñj‡{wï•ÆÜm6jäe‹½ry™nŠ±NÚ«í«­¨%\r‰Õ´9çSÔ[]AHó¡êÛ›F•Nª—İŸ/ƒş:bÅµN;’´Í½b%#BòğHô¬ÖlG’w&ejIM3A*€¢RÂg/ÙW2‰QyFY]Âb/G8»¸âPSÌà<&xÈ˜çbpÓEZê	l™úUBŸ¼]XĞ¦#:2˜#R‰ÆÌ›øÀ<8ÃäøÀS3×ÿ\0ÙŠı`ÎIdàN=úÁ)íÍÌ”e(ˆÈÉœ°\\Î%xµz÷13Æ2È®\'™‹ëiH¨¢“}›OWqFf”áF2\Z~¢ntµk6bÑÚ¿eƒXªuıjëö”\nÌÅm^kµš­IÄ[³®!ë\\:6,*‡~•TWª Hûæs©¶Ç\Zú¥5:‚†°%GkMtÀ-Ü=ïNÓ)•-}T3>jš]^ŸwÔ¶Êõö3£ô\nL§µˆğ‰Ö[jÄwİ T¸±òµÚŠ¼-T—²¯rœ€5±^½·Ã‹uiQZ}mVv(Q\rêïOÑìÙQT¶u¦è¥ğÎ©³^5“å×øÃ6ƒ#i^ê×*=ÒŞš­1%{×BNû,tÍØj¦•Şú•Ÿ\'uûë	~ÀÎ¬UİkkÓ®,Sz©Ä-zêUwô­Ù¶®›¡e	šcOdàíèÆ.>™Å˜\\Y°tôWÔPâã¾üNu 2’Âè>[”kÙ¨îÑÍc;B7EëGlËÒ‚¿í›ëá#‰(2´ñŠ\'‘šÆ@Qİİ¾1kgtMwIqŠlvÄä,ÔFDgxçO8Ó¯Jæ2G%œàÏôÂöÌçÉœƒÆbã˜ŒQø)ÃlÄñˆîg G,2	ÜeOQŸ¬(Æ,ã¸ŒŒ÷¾³e]–Ş–t¨ĞÖ	Â£qº±~\n¦°z_LZê“ä3!s/²±1¯]Q@JëNÒÜlìÎÖän&İ½šué¥ôi’º¡ÈØÛìQIE\Z\"¯D+Wµ_S^…¶X«esQ9¹Û\'[PÚE¦ÕÄ\\±O¸F£VÆœtÎ˜¶·Y±u–í5IoñámQÖ­k&ÿ\0ò*üL)·öv­	¬¬húRà&mî.Úê…#”R\rßP›kxšŞ‡PÎ¢ÇR£Ì¢®\r’_–w×)E>:;¥èœÙ¼ÔØê$ëÒá­×\Zk\\LFÖæ£`*Ç¾İ“˜s@#˜ŒĞéw¶-¢Íx±©cœ\r+\nÕ6½‡2Aéä¸n²¥öƒ\0¬iõéˆE„oŠ{UcW©µµh…4Ñ¬×Y­UŒòØ ğQi­×—XS­Å}©\\­i{*kpæÕá_cEå2TĞ›n6IÊèdKÿ\0±¡ÛŠ§)ìXLÎæÌFmye²˜À‰Œ®ÂŒ©c\"p£TúÈñÄ¦@±ĞD<e4ğ1¹Æ1±Ÿ6>°ß9^¬)q\\ó<—<@ä/’ç<FArSë2_X¨íˆÂ/¼‰ÖO39â‰g`xŒs8ÅÌ›æqœúÏÖ\n´”àÄFs±`¬y)C$Ùİc]IŒ6ºÅz\nZø®1bÄ	xÙf­ÛX“·6\'Sª…TšÒ,¤JÚf±x%H;¶B¼\nkìúz¥äƒŞÍXkÑ}3*Ù9ÈS,-‰VÁ¶ØÈÉ©\r¨¥˜Ù¥ Õ•6’ê„8úÛjÍµà¨é>B)K,NÓK°»ºšuE ¥Ğ\ZåcWÑQ2ælŸQ´(ï,Éú›e¼2×TCzS©\"=+ÿ\0†õÄ0\Z}«ÚêÌÕìQ¼³N™É;W—bA@méöî×±zª¥Z¨Öú©yC¿§-iéYšvË¥l&Mpí^ê)¨tê\']±‰¸\nÚ¢ `³Ï=ğÃ1î†ò®q˜Ú¦m:B:“©æÍT¦¦Q©_ezºîXÖÓÓÑ¢µU7i²\'\\PVgÇvs§µn£¯CÚdÆFÿ\0Å±i%)M]\0.ë\Z¡eµ¬÷¸?¨ÌäBÀÔÌmˆ™ŒdL §$üjc\'ÀÈŠpasŠZò½p.2²ˆ\"8•ş€# 2CÜexàõŒàŠbq•b}Äö5s–\nD0\'‘ÄıÌáœı`®qÓ38±à}äÌG¼î˜Îq‡úŒ_=¸2<ä”gï,LvVòâÖO<à.xÎÉÀ20ÌF&f[	²qÉÙªN‚•…K¤Ú‚ĞM˜­«5ˆ«+QP½@FPv·föªUwĞEuÖW÷ŸDÌ»gÔ(¬ùEl ;k–f6RºÚ­j­†ÊÍ%¥5úr¢i•\"6½½³Ä/.bE³Ôù×÷-ôÇW­gÊóOXjEAEMm§ìW´Am.%ÉñÚl&EÏ§LD‚¯¦_G]´±ä§P¥O8	oYöjöÛ-˜›«§¬ç`â¶¾€é9¶Â¿c,šê×3tõ;€Ô›æâ\rÏ31v´ë«²£µjÖÌĞÈdíôN¥W ïÜÍ¶µ6ĞÔ65\ZÄ!D)¹mÔÖ\0\0ÍáîPCWEÒ[K›˜½®Šba¡ ¬w9\rGOÑsŸ+±¼MU§_·nµËı¼¯fÙ\ZClÖb¼›G*çšq±¯ª	åäÒQÁejëvÑ	lî¬(\\\0¬!…óScàc™&vd0¯dV9úÁ¬Øı-MŒ«-uf#œW¼ÈŒã\\~&=cÇ‰É#×”g|®™ŒWüxÀÎy™É˜Œ\"‚™œîÂ.ïX ãñÄÉgÿ\02\"br#ÖLÏ3–ÛNPé’À\"#¿Üÿ\0Ù%–­*fWİ.°¢\"ê­İªôH*‡KĞÚŞsÏ*ëöÚö¾Û4{k†¶YØEmN’“šaÓêˆÕÄ®·Pê¶·¤\n´èzmª›?Ì˜íuº+£ZÕë5Q±1ÔÕKKå†uVòhÖ`Ê´;“d(%½I°lk’AoOÕ–ÿ\0‹o:»k¬ªkš•˜Qe©¨LŠà¬!ğ«ÈÂß=(l?§êÁŒ€%ô’‚ ¦çRk]råjUÚ}/Gø¥VÍïN•y.3¡l×¯¬u#k–›( hÖİÑĞ&*°z“¬ªí Xî\\µd 4Ì´º/BËoÚÕ.›ÒœÖ­k¤õ6d—)é…××¨u}K±mvBÒ4÷«CÉyêCÍwwÊEo\"§Q¾+¢¨*›-´kÜ>yêµÛv ßÑ»Ğ¢£¨q²¼_-vdYñá°A§Q[çÎ:\rf]a¶nãÄÌ˜¦\',Î_aÑ•Ys„qÙ%F}sÅ†xã,®Z\\àÄ‡®Ù)Ÿÿ\0#ÏúL1ê·¨qSõId ³Á9\n!œüsŒ˜gdâ<ÎIpQ‘Ï%²3õ/çœï.b2}‡8÷ÎILdıds‹‰œ Â8Áhó—ÆZb1”QØ±Á=ä¾#ñÎNln@4U\r\ZÄ˜×ĞalJ\Zò+£¤´÷€ÙìuÅ¦ R ­»\ZfóêK7uïT85vªÿ\0L‚líP¿êSg¨«ÃEekìÛmŠª_­]æjWS4ôözıÇ‚ñí5:ı¥+w­¶³ame—À›Õk§6	’8¯C§êYáG#¨lX”Š+*¼RX©7ôñ°ÕÅWXµÒÛÌÖF*¶÷§üì\Z#ÕÛËàQ_6ô¶×·¸Cr­•.Tw«W`œ6/¦º,$+–Ó]ÔT+™Ô}Ë;W!N°5ÒHEDìnÀ[ª¢g«¬£©6F¼BÖ>R|Æ¹ÛõmÍ~ÌÓj^ {-*Õª}M¶ò,­Ô¼C­ÒnÅV«m¯d½Úú[±•é÷F‹¼ÃkÔU6*L’ïõ_Õ1~\rNªÁU;µÙ¯İë	–/g[Î\rf’è±¨µ4É©s²iÖ¬è™‰Q¤F\'.=d=Ùd,[( Mp‡Ÿ!\\DçAœÆ%}ÙğÂCétx™’‡-c>¡*3/CJÔÌ!1#‘“1êsˆÉÉÆ„LNgºq¼ÄzÄŒ“b\'\"f0¸,®0ÃÆ³ˆ\'{¦\'\n\"0\'!±ÆsÎ8Jr{£=Í‰Á˜XF ÇÖ*9œã rÁv¬ø¯bÜ±î±µ³¡KÅ^InâìQ@iµVQå°¨©M|Iíz·_Táñİ=rëæÎÎĞÔ¡N›dÊâ6û+ğzÕ£§W]PÍ¥›T´ŠE†Â::õ‘ÄÓÔ¶ÖßÌ†ÿ\0Ô{ aV˜GOk\ZŞORÉ°Òóù¥©©/éªï6-ÀõgTØÖ9U+§¦ú™—˜º kYqknm6tõˆ7Y>¥ë{»kªó]–ĞZİyúÁ§keCG~xÁş\rÍëcY³Ğõ®® îmîïµnf³Ë©§tQ\r¼ê¨£Ñ±ßÀ¶b¾N¨-@9ÇÓÛU¶ı•°_cFzššnê‰ñ*ëYšâ›K¥ìßPÙEZİQz®û/İèik’b¨êÚõêª½ ³´ÑíWn ~	My&£]Uub±šŸ/]³ñÖ-i‹d‚uZ³Û2î›~ÈAé=f»Í±èù!k~ÔHí¶Èî%ŒÙº`\rsl›\nLëyXØ™•#ËjNe½‹QW¶¶<¢f°„Ç¬TFB„£>sÌÂ«,~¡cØˆÂdÀó7=ñ9æƒÈ>W19‰Œ†s9<NF9ßq”¦¤±Ì0g™™ÇÄå Èœtò\\a\0Ç¬˜™™Î8Å/™ær8ˆÆq<ä‰Ip0¥Âã™Æœ²{c+.Dq<Gà¦\"2d»‡7±ç„Òò¥p”u’]Q«–ŸKVØ\"˜ÄÒK|cíU7ÁfViÑÖGÈ©§e+ÖlWµæê[IØ855õú”¨\nëFÇ¨Àf{ˆ5û½ùñÍ\r=Í¦ê?‘éSÙ\'vouß7a^]v½TŠMcrÕÍÀUAß©İl\"äéi9´í&­·§«ÚºÛºa©i¦ø\r¨†›N›Æ{Ææ³Z2=q¯K_t-Zë°mĞS£7z\nešñ¥B‚¨HçEt›#aræÅ·rµ˜øÈòW¾KrŒ	ïÓPu˜BN†ó\\¯Ó°³·	\"ş¡Ú)İ§]›m•Ñøc’–©#2º6u”Ú1³jØÂFo­¢ÏO²§\Z²USªO›;©kØå/^ƒ\n%JÌêìiÔ‚B©¶‚Ò¯]mµ=µ İTìÇui„VKFn¨±÷ª=tfÅÇMM2&‰1Àå©\0Îü¬¢`bµx”LåQ’æv6 PyZÔƒä¹§z%q14\\l˜™ÅÎG¼3poà[˜™•<xÆ KØç¹ÅÙæ8œ±ÿ\0hÄ·‰âqÎ€c+Ø3œç-˜ÁÌFQWjÆrÄÏwØp+Œa÷F,;d%‡1‚Ï¼TÁFLD`váŒäÎE}ã_ê&ºùg8íŒ\\ó9ÄdÛ“y¬U\r¶ÅË¢—6ãÖ»WŞûÜ\r£P¶µmX—»uyÒ¸ë‰uDWÊ2³])u:—î×–ÚpôÌ‚<Ê\'Wo§¶vM,Öhhì[uéM%K13ˆBÁ(;õÕÖLµ¾©Dì„uÊÕ_´;EZk]ÔÍL[ˆµGgxvêµRı­Ç\r›ERıjå“ƒ©«t©àúŠö¥k,³Õ\0….ºUBXÅ¥¦ÊSfÅûWOù½ªæ¢õ~JÍ‰u<®h´f4¶WS^¢kzÃ­‘ ê4æŒXş¢S¡–ÍÅ“Ó¿«¨\0tªÒ/ëµTkºµeïu¦€&Øâ$¢º¶íI«Şcm\Z›ˆ¬ÚHqj\\P]3×¡A£xW¾ÓŞµ\rsfşêáƒv5ª¾:¦kìv\Z‹\0»äõkisµÕØM÷œÅ-—SU¡WOmzì¢À\\§z›-•|ékë·¬ZJz…Å_TåÉÒµö‰e©Úu\n¾/‚®2Ë0U«ñÄ	ÿ\0@Bb3vQ\n/q”®JŒyUêíö‚^³¸H¸™šª,ø“Sh}`X!ôQÜ\'jâyîõï$x(˜Æ”ÈÌe0ØœœËŸ81VË\nqßÔxÊŠ–º\']Æ*{‹Sƒ8…ÈÇ9Û31sœó8ÆÂ£œµzê&´™bŒãœ€sç­ñ\"œ’ÿ\0”÷W\n•ÚgzËí!Š¯6m=UÀ\"º«×S­‹åË¨Ö)E[k~š†åf†ŸÊºÏ8aÂ×¯õ3ìo\\”V«CsUdªîŞÙE5€jú=´T«Ï¹Ôz™´°#Út¯J’6)½o:®Æ®/¡‰†è)8¢+–J«M©KõWå¡#Z)É¡`YR¾¿{qu‚_®é\\K;Í0Ìvj¯u%CH˜×ÑmjÚ2{\0©€ìb²Şã©dÛ]{ªó\Z7ıK7Êšº6¹çQp/˜_Kìê–²j­[s©i3åE½jf›SA¶µÍ¨2!Œ»°®^9n¥µc\rÙón«cà•Ş™}JA\"û	_xU¤Š OOT×;`v˜Ô÷{ç[´±¦İØÕ%=Ì7I:z“åR Wb·Ö,PrR;e±ø•@ß2‹Z’NÚ»vW‘Ô\rU>tšªµ+]ù9vCç’ÒT+G—&DBâ^Ê\ZáægufŞ ³»+İur‰Õõ<Ù§µ«`cƒ>Â.D¡oˆæ&\rÃö0ÿ\0÷À,õSß?¼)ç>ã8÷•£ã&3]2l)Ëlí2·<LÎ\\/¼×ú	,¸ŞKŒQöó„]å3³æ2=gñ1ÎY8cKÔk×11ÎzˆÁÙÜ]dÿ\0b^ÚÔ0›];-½•ÜT“­[g\n°wM›ÚŞ¬re’ÁORìì8|”ªŒÏ±J©ÔjbÌË+uEVcÀ¨Ğb\"Jöà»[ãØkw÷f´Õ«Ô¸h>õ‹Q[ÏnåkèÙè—is³°~‰OÙ²[&¥yv¾š¾ÑnØ¥\rBîÛ×ë+\\©´*€ŠE³³Õè†‚fÖÅªeb’U-N¾c›/±Ü\\;6™[§t:°Â6;¨›B¢«D!ôN[N­tvâîÏaÌÂ¦§à9øÇIOªšì6²­Á\"¢È.‚\nµ›®q:¾3tÎø[–ú¢¾ÙÊJ±¸°\r®NŠ9ukHÖè‡¦{¥ô3b‚ŞO¯f¹\"/½Wæ¬LEAb£ «ûk5&FŠÕÉéØ6ÒY„¼¸µİÑ×~6ªŠ\"HSVñe¤üÙDm6Ç^‡Á‘Ó6Sd[u„ùh÷P®\r²Á,® µø°\n\n\'<lõCvş0))?s9ÎAd\"õ„Oôe.¥´“2©ÖUŒb¾¤ïÿ\0cv¹ıOÔÁNs‘ÄçX¿_jàU–Ï“ã=¢<åï9Yp+Œ°,ÎÉîÎÎ\'1#‘ßX#ÎX³Q&6yàªÈà3ÂYQ’q‘ê3¨k|”°æJÅªê„Œ)´¡íµràÓ1\n¨¬–—\\Q!{3\'ªîÖÂŞÂªøtÓjÆÚV\"Ğ—>ãXŸµ¤sä]m˜˜aÕìl3À&†îÅzÀ	G\r˜IçOZ·M#Uó¿ÚU»M¥U=KcF…‹Ï^êv»®]f·BTÕÃ„.ì\\\'&±UušÙaåwknv®³ÖëêR¦¶Ælz“_T\n%›Ş»kQª°ÛÛ@\':İNÅ¼½?­¿~·”Uc^?\rS)ê“{ôúòµnæXÕjÀ?µ{ÚEf¸“Ô*«Hê>µ…v€ˆÍ-4lïªµi}ı6¥!PY±ê•\"™›--¨;U:m·ĞsR:G¦X»¡zÚ7+©mÿ\0Å¨ú1&•×½5Aó*˜¢[T²¨é‹¬¬¤Õ±`vt–:Ó\n[!@Èíî8-]-‹aÀuÅ4öõ{Oª´óYckºİ8­J‹B[$`n	ÑV!Áˆvp‚dyfa×B¥fMËefÁœÈş8ÈŒˆÎ9ŸÄ`9Áÿ\0^Öâş˜¤¶¾9ÄuyGØ¯AËÔÔ‹ì½Õ{ÇcP¾˜›H™ôÅ¸\n=âFIÙÆzX!$q‚pÆ#ËÇ¬’˜ÅzˆÁóõ‹\\\0áûõ’ç$„cŒsŠK´aTÿ\0³1A\n#,İMq9nÂ¬M£Üÿ\0jÜrĞAğK²tP€²§énXd8d6€2EÚÕëÚlYj£cu¤›óµLÓ²IÓT!v\"ÒÍ‹¹²l”B\n•¤9ê¯¾Ï‰lÃÙ$fè’¨ª£Q~Û\"µø\ZaWfÄÒ7éhØyµwïQ»\\+¢…|¸ÚõÅ†ÜLJu ËQ±°¢İ]ñ“½½@F­I½éù»‰Ütr£rj®é™ª\0Åäê¬Ä»(ië)¨A¼6¤1º¸²ÚSšëõŸ¯JÖpç*9æÆÎEÃÜ=Y±Ö»rÃ ZÚu/*µwâ¾·I®³f‚ƒWºİŸpß\\®][YBÍÖJÀØıÖµ¡Q:-êZ¯.Á6„r¾¿Zæy.\'­hPÖÚªt‹¤é´˜’š#k³†ËAİjÍ¥N½Âò²¨,»ÉU©RQ£QŒlea\\Qº¥óõˆâw›V¢¤kUœ§=³2GÄ6c²xı³&B ¢0îc8õœzÏ¯ûg\'˜œ‰Îéÿ\0caÃôÁ½h~š½İåı5[°V>{UŠIKd±Ÿñ,BıLğÈşÓ’0]Óœ¼cıàÇ¯Y]pÌáÏà¦8ÂW|úÅÕZıÎYµX ¿¶^R-ŠæKem«…(»ò,ñªbF.³\rTiVÚQ-Jk¢¾½+{J;wSN…¥&™Ó“L%ö¸¯-ºØ˜«ª¥2Äİj+Í0C\n¾]©.&Ø\\T±@QjÅ\'‘ûe`Ù-\'$jéİS\nÖà/,Ôh]Kæ4æ±‘n¦Öœe}ı\rğÜ\r«é	yªé*ÿ\0:ø±7¬¦#-0üİ¡éı›v…mÏf¤åk­,«Sç[í° Ô·ÈáºµAÔf]µC_¹l•~ŸÚRø{¶Ú­B“Ë¶½IÔÕ]Y´è–º•÷“â®¹ª&L•}.t%Ûë;Y¾\';‹+»\'¡¯JDÔ¼Ø¬…As¦õµ^ÒU¡CujŞı•hˆï\\õ%ÖØÙ83şŸlûèY¦eVE{ÆqAŒášhõNÀ;k²½[ÚÂå0µ,”¾ÖÊªj¦õ§ÑÓXÊu;ì‹¸´£‰üy>ì¬Ó9·¿Aq.q¸äÊcğ9İï\"sï;sÇvsŸs…ÿ\0u‚÷ƒ#…3‰ˆ€÷!rbxã!\\6K„„zÊë¹Æ”DzÀ’#Â(Â3)õ‹æröÀ•28{	\"÷•Ø¶©Ÿœ\'›ôa–Ğî:®­&Y&¾Œªğ¦j¬ùX ·f¥eW”E‡Û¯Ms¡²¡æÎQ×—™\\3núiræ½­SÉÂôYYR½åQé• m›ÓtõË ê°ª=)‰íF²ı¸/ª¶‘\0u[ï@<åmljÒ°†\\]u@Zøêğ½ÎÛ`wÖáNŸcjâ-ÃKùtP¦²ÍªI¢UUW:†İa#C¨68òE¥wrÚ/l_bÓY\'®¸Êïó;=õÔÚbM–/>å¨i3KèØ7‡¦×³¬ã>œ­@HÙ`ªÛ\nºœ7| n^âªìÀ’¯X××k+ÔšÓzÍ›-NE»U]ä×¨iêê\naÍšŠ˜Tc_q8­şÔ+XE¨N½‡GùcÎ™iUÚØt7g±îêŠ3Y©gl–R4m¬ìäâÅuKV‰å‡Õ¸3Cé|–4óu|vö—ˆª=¥‹6sq‘8S¡õÔäÛã‰ã\"?‘œqœàÎsœä—â8ˆüÏÖGæqç$ÙˆÂÈ™\"Ã)ã&H¦yÈ.géB3•Ñëºqí#;»ƒxØ÷‹ËV…îv‡aÎ}åW\ZÎ8Á$Íh#ÍÒ¢’àJCrËNhÜ¥aOï¯pLYbT{™g ªÚKaRÁ½£{tûdÁ‰Õ¢×<ŠB»eX´OiSZ5¶æÂÀÀ5ßÈF5‚ë*–õ$c-\\éº­‹\ZêÕ|üX‹ûÃ<4³Púg¯±P\'n‚³(®œÓÙ®ºW	~Ê%-Ó¥\rY&ÚËe¯D©Öl²ËRê–ªO“5®uªíeËMuR•ü•÷1M\ZQ°|X…­Î¡¯Ø¶¿uµh5Âè\'>ãb•SUlÖõÊ½:ªŒß_u¨\ZÆ½§e”Åúò7:¸˜oPS·¨ğ¨Ÿ¥è»Ô²=I¢¦„*(U·^¿Æ#é\rÄ4Pò>Å¬àp/yâV\\ »ºÖÜ\Zİ9pUë84ôù†®ÖÛÙ9\rGÉ¼ŠŒ¬G¯×·ºÔ“0ÇFÆŠ¶B0ÙºÎÈ!‚ÔĞ\0€3Ã²È \\°ã€†vÆmî.ªŠ;¬¶\\É9Î?øÏ3œñœäÆ@ç?Ÿ¹ÉÉœŒâqq&ŞìyúˆŒª»§>ıdqïac9¯I·ûÌaCÆqÜ\\Î1ëf	dsÇ`æÌ„ÆFfº—ÛÛËµÓÏ!•hœœwDëaõÉs/Ö|¬–fÁ–+LÂIÛkc@˜šCàÄë»&%r)SPàR¦J½]{â¶Á±w²ŠĞ»ETjŸtU´²‘¢ÛÓ®\'^Ğ¬Z¶®‘2I çl¨M‡C\0:šüÊùÑÚ·~Òµ Tuúíy°^Ô]×j,µ½öŠ¦Íò5M\ZµV8rŸ\r\"JAôërÖP®êò\"hâãOâ¬Ë¶nUs…^ÕÙÚ ñìÙÓì\0|×o\r+5,y(Ú^îÁ=)x]&²`ÂcNäJ¢¯Í=mÂBƒiµ}£¢Ô†Ë¨ÓÇ@tÖ¹w¨WÛl×bÒÄd¤ú«j5ë¥X7llÛ,\Z½åß0 »›Ê\0\rUÍWPêmØ”5Lmu-‰<³a´È’‚Ò²••w¢¾ÕnÆ¨–;«Ršå˜UÆ)¬\\\"\\²DÁÁ¢~\" ——ù®‘˜š¶¢‡/X\ZêcH¯^e·™~\"?1ŸyYÖ{Î}g9ï\'\'Ş¬)ãˆÁ	aÆ4–°ãûÇ8Cï>)<àb+ˆ‘†O¼gldñƒ1–—BX‚Æ(¸æ•Şé,­\0QÄDDfÚ—–ÊÌs”,Aq]e[\\onS*ğÂW-šŒ2Ë„K/A®¨Û	—„S¼Ge:tÂšÜÜ,ö\r³¹ ım‚*3VõÅ^—­h2ØMæ\nUµÖFºİWMÛ¹y‚²Î¤Ò(%ş<J¬knW°9½µ´ˆÙQ®¨\"a&ˆ0Â4™eí\Z§*¦”8šÆšŠŒj«ŞÜ\\³sÄ4øI›§Zê‡bğÕNÖĞ\'´Ô™ê±[*ªv¶ÛW	Ğ¢±Ş›A°\nè\nfËÔ™àÜPD\"%e,-…U–¸›`{†Ûë×[RÊVzFšÔkê9@Aù(í®5û©=°‘Û¦¬Ò8é6…ï—Tbª­*öQdİØ oøí\'GjÑT]WoMÔ–ĞòÛWlÖ1ˆ»`,¡P1a¾)l,¦‚æh	™ˆh¹‹W— Ø2#Ô›Ic%\0Q‰œÄd~\"sÜÎ@ñùúüq9Ïœş\"sîrxà±GÁN\ZeÇö´@Œa,Œ¸×|”óÄ~&s#\nÄDñË‹œqöÎ\Záó2B›;ã‘ª®ÁŒa@ŒÌæ÷©~#F64Ug³q¢jäÜ*—®õ@\Z”8¡eYHrBFJ¬K±´ h.ÄÒ=‹©½7àì”xâu ‰ŒÑ8<NbªëPUVUkÅ­¯ˆ#IY)\\V\"êCU`	!½µ®ö”­hÜM0\\T7­„÷Ù{CRÂ†ÆµÄİÀDÍ¥€¾T¥»÷AFJì•M«]ââ¼ëZ7G¦w\ZÍ}›“c%•,¼lBlX¡² ¹îé=~Mg¸›5kÆ¦Ä+iX<{ÍJ¿™a`˜[¾:ÿ\0ÿ\0KTMFS±iVÜæFâÕı•šE]«R+ø­{uêhÀ…ùPFØU÷†²eu­Üe¹A9Lİºµİ\Z//~J\ncV5ş;$µÄŠÛéğ¶ê´’’Ù&å•U×c ÎØ†©SÙ&ÆhÉÌª¢€1f¶.\"qĞ¢äw›8©U8fm92˜üÄÙœ~\"sŸÀÏ¼õŸ¾r\'&#8ÉÈõø!Åepõï&?Q0¸ç$ˆËê#×ÔFLN@NX™œ{K»ıØŞf\'+Iå#ˆâ³¨vAJ¡”ÍË&æ‘”ôõÔÙÑ¨†.Ûù–¡\rÚ§ª¸A1¨6Û©a#	ªvü5\0î{Ib­Â½yc³¹å®ª¨šÖüp¡MÚÕBÑJ´+mÈÛnòYÅ ı}v›`«°Q—Y½cv_9dC*My)j†“«™¸Ø…juĞ¹›³Súæ¿_pyõ§×2ÍåV×üRK×øµÅïæİİŠÂ)é‡˜Î[µ\n ˜±~˜6£\07*¶¶5bªæ¸-¬—ÀÖµZS·yÔl1SumË†¬Lİ®èbgWuçn½’>¤Ü]•ÔRkÙØŞ\Z‰“BC^ØeCY\\Šae^•ê‡,A‘F¹•šÊñ]İ¬‚…X¯\r¥BÎÂ”VQÓ}Ğ¤¦VPk×a€Ã4ªY06n¶ëŠ‚bi¯ù=:›cUGñ«†¯†2bO¾Ğ/µ½¡01–9ãw×fÍ™˜üFqøã\"??¬ı`ä{üDs8^¿?öû‘™ÅÉÆ,xŒZ¿s‡Ûİõ¬ˆÎ\"g c-?ï\ZPS€2%œaQóLfº¬(b\'auÔFEÔ[sØZ>$Oµ‚\\i/P¸’e|ÛªjÙKã7×õV«Ë\"u—™TZA•-Â ÚBH§mâMjkL[Btêå¶MÕ¶R­ÊÁv­°î*ÚÕ+ª&ì4(ûScÇ	ÖLÄ)S°Úí\'ûÚ¨ÖkÆ´<õ­É(.´¶	å±){HE¬Ój*XD°lœw&±å…GEC¾m‰±u\nÁy+nèšSŞ³Ô]µü$¡³¬EJ{Èæï_Ú‚¶ õjş\r&\Zz†³J&Ãñ+ÕhÙÖÊ®)6XªSJ~Âí?¼×­åVlµ “B¬|¥ÍuçÏ~‹ks¡!ÚÕdZe­6­ÅótiêõamµZÊ¢¦ª,´„C__RäÀÆ®ÜßnÃãäöH@­‹h½šÆÅN¥#q^2%²ïî)5¨„Ö“˜)XÙ&©€Ğ‰˜ê=¨ÖOˆdÊL¤§#\"22r?ë\'ï\'\"yÈÉãëñîg9ˆÉs÷“‘ïóÆ}g®\'œBÇï®p„ xŒ„”Ï%9îsê1îqÍ¶Œ}Ï0^âDpGÖV_¼Xˆ”çVnä˜U”m9Ÿy•­¾›eˆ=T/s¥‡YÆŠkØ‘‚AJÎSF76·“6HjLÆcA|®(­µ‰xÔ˜ñ\'>’×İÁQ³Ù3]…ª‹ÑYNe‚ve®MZ·Ä_¿‰ƒ\nË´l³<©reâ“ş8Q¨‡µZt¾·¹6[\"¬Õ9*®s´Y•‘cÏ]ö+âÏÉuš)\n²İˆµFØ¨ÚéušÄÔ¿eEâí¦]CL õsk`—X³ˆ¨Ò¹ã(İ)•Ş‘»š»Ì«ZÃÙ\Zx‹q…Cu”&•ÉAİFÌÖˆ‹Úû8jâİ°¹Ø¶¸*@FŠƒRÂæ\ZI´‘s\'L—Ä‡åô½ít¡•Ô}Dö•[*€Ğ&5ÆV„få›»fÖD*ÒBã—Û±Raq‡,ÙY#0Ñ–®É•a¤ÛÌ¸ÖSL²íÆ\\y0ç#ë#ŒıääzÎyüNLdDFsd¼ÄóÎFG¨ÉúÏ¬ãñXÌûÊáÌDFDGâg&sp¿şÄú˜™Ù‰$v$ùšÁ 3<¡ sÆ\0bFbs¨wqQµ“šN22’g\n{qkcŒAaÒßÉU¾^¯H(~Qx ~KÚk+¤§´N¶¼m”*iÓ?\nL	–—ØX·ä´d5Úã¹l §R:úŒ”!¶\\•ŞsC»]ÄvÖÂ°ÔœN™Ôİ­{HÄ{lu5³˜>âpjªI± Km{ÒÃÇõ-;UØ\r®­­\\öåUÉ0ëZk,æ³VÍ~:ÔM}Ûk“.k)–½ÃZÕzJ„ó¤0º/±v¤İØ—˜vÊ¶¨Ši>ˆ´ê\r¹ÉZ¤İ…‡§¾åK5îÀ*\"şÔŸá°zêï¼vÊòµh‡LÔ»R•„¿w]Ã{À°¥Yá½BG\\­mƒ°-Ö./C|Ìmä)ÎZÆšİZŞÂù¨,¸ûL2‰aŸ|VO=ÍqBW-Z–-SRbÇ@V9™Û[†œ€g1œgï\'##>³œîÈÈrb1%ï##ï9÷“9Ç9ÄäÏäÌÄF& Şy#ŸÇ1Œ\"Ã&¹7ó2ÇD²õ^Ò’¦Øã°¤€”è!Ä´ˆbb.ìÆ²œÚ^;\"\"ƒç&=áDæ›pz¢l‚t]EzığD£säiÜ±¬ùñå‘]3ñÃRósN«fÅÕtsOn¼¢à.ÛÑ´\\Iìk„_ æ©µWâ*¹6jSPZyß(Ø@±RªƒÕ¸®&2b\"_fk®jÁ¨vÊ¬Ä¡¦}?^*+Ì`f*	J•òU#;Ÿ|“Xl_NuècY1dÌ4jFµµ«“:¡ÿ\0g¥ZûvzÊóáß+±ƒáV®ÿ\0òÖ*ÍwØr¥Q¸¥n‹À–»k­‹ÿ\0‹Zì³mÏQ­È½b\"5\Zû®dÕØº¦Ÿ\\âØ´®¯¸W£eŠzhc,l¬×§q¾6iƒ-²ßÔ¥ƒu¶…ğÄ>Õ]ÛÙ érÓ±¬°²çc|íX:Â6QíUÆQŞS0öy-@Æu\rø¬¸®¬™îfb3˜ˆüÏçë?^ò#œˆÈŒ™üŒLş\'ˆÏ¬ˆsœ‚ÿ\0xSø¬¸í8sëÖ¹ÈÉœ\"íŒ‚a£œjŠ#-rÌäÛƒ™Æ¨€»ÃÈjâ\'ÌW™ÍÖÌœÙ–LäñX<qï;9É‰Î—Ø&†Ò\Zã»\n¹H˜a.§±û¬_&¼¬æİR¥²’¬ïš[)²Tæ‘a9Uİk”NàAİ—µ¶SxK]XöB<ı?£°}©|ÿ\0äÚAf¥B™“k/Z›7ÛØ*Ú\"}4İª\0¨Ô‡n©ü>ĞXş)¯—jÀ\rªeÃZEÑnÄUmû*°Ê+­Z%Zùkn®vW+]£]é‹*\"·ålëlv_…µ»k´Lëjuäi¶‡ÆÎ‡Ì(zµWêëÍÈ¤ô²õs”Ú¶ÚùRº¦C¶‹bvw¬W›-»6í&«]²åì­&›%[bÁEb¶©]Ú !5j|?!n+®…e­t¯!Ë–_ØjuÀ{{1¡\nû:Í·mÛ\ZÙBf\\NtK8k[R•È¥Ğö–lîËFÂœŒsøœŸX>ò#>ç\'ñÎDÏãÜá{õ‘õŸ¼û,õøŒŸÄadŒç1ÛÄâç‚ÉŸÄûŒ&ÀO¨›S‡kÿ\0VX\r™‰ÇkŒ¿°`©ãı\nF¯í›;İ±1a’S3‘ó“Îw8İñí8<ñ9Ò0,Ò	Lïé½_äØ[mbí«Š°Ï12Ü|Úp²]Øè£«M(²}Û\rÑ9`‘&(DÖŸâ6Š$`Şmµ:\0Šëi°Øc\"-–W×SN¬¬ÂNËiƒÚ¶ÁÂ{(éo™5ivîÇÂÖ¢Ÿ—Q¬µä’êLÛ2	éÊî\nl…àµnÂàw\Z’«x»£Az¥]yE—T¨‹roğÜOcÚ\0uu¨ÛS&›/ìXI…-l¿iõÏºi±Íé©[Š®ºÒÆªÓ;­T…\"\0ÈcGâ’dW-FWŸàöŒ*u‘Q5Yção„NÆÁº—Q	$ÜNÉVÂg@¥Ş¢¼Ê:÷¶åšóšeuÄŠèÖÖ·^ÂÁêxeÇSP`\'Âb+XS°²NK6Ûy!euää~\"\'óÇ3œLg9Ç¬ış\"&s×ï8ä²bs2?ë#\nxÏ×â#\"p\"2&H¹Œ’ıà–Igv2~óã÷{‰jN>²j°½ÈÄ1^¸‘û¥°Bæ\"l>\\s3%ıäñİÄg¬eC\0S˜ÄóŠ	\"ìˆé+ÏEø×³.×/#D—¾¡¥ä\ZjØ\nf4ªŠÌ5ÓBjsšş ¾=Ñä^Ê·q‚Öõ·XD³š±Ó¿‘nÏZCİ`¦R•StR6Á¬\\OÚ\"¢,V*šº@(Ínİç²•Fo~k¬ó1cgbU<pü´®ÁkÑ¥¢ú0³sàÔö^óØ\r}süF\ZG¼Ò{®J&äüÉ^¾»Œ«sq–i¸¿º7®jk…uS\"aü»Ê†>†¢ÃµÂ¦ÇY·Š&5“T^QìXuÌ53¦MvµOnî‰P|ŒK2•F6m2ÎkÜ–´4ï}¶5°‰ˆ³oÉhA€¥«ğÓÃö²Êæ0l	ŞÀiRpÉLÌÌşñİÆGÖ~²&3ÇˆÉŒ3îrffr3¶rr3gñ9£\'\"fgıç´p°xä‡™Ï(¯Öy9úÁæpÓ\'û<LË$§$§¦Lÿ\0«–KsmrZEŒäÎqîs÷‹ûÉg;&JcQ‰R³b¦Áw{uwlÛf­İP²ä âÓmjl\0¶7^Â‰vŸ°`Gİ˜\\x6&XYÒ€ÚX&Ú»ÄXp-Ct\r½î-ãºuş3s¸ME@Öcµå#’‰™UUø–+\rù¶ûç&[2ì|h\nªeJ\"RW&·ºÑ:Í])µÜ÷îVn0lÛ]Êè­Nk•jº–W}ÇÚ.ÆE	+MíŒÙV$ a—.Ö­j·p*îª|{\'­TWô€rméë¬uh\\ú˜(ëº¸ÒÛ*Ğ#_-ê	es4ô9?Íu0[ƒjNåHÄÑøPÌSx5IR˜ÃmI‘·dÿ\0,ë®LbrRI\\·¹ì$W!ÉÉuU±u¡PLgä~#9È÷ø‰÷Ÿ¼ç9™Éœ‰àrr?²\"#9æê0s÷“øœÁˆç$»§È°}åMy‰ˆŒÈÃ\\JDc!c?·ø–3%;íŒI‰0¤çg&=dLÌÎòS‘ë £œÙ)œÿ\0Såî‰Î•Û\"Òîº­Ò&&i‡•ÏË*‹Ø~<¦[\nìñª,XzÖø\03D\Z@$«©¶(ÒP›G)AÍƒG}ºÑ¹_‡W*¯§jqÓL/LVõ¬§x\nóÕm/\n©\\6æ¶ËÔvzj¢Hv²c‹Ø²ªŠ€†Y\n¤¨°êU¥W-œªN¾‹ÌÈÂ«^­\"I¸oÙ¤MìŠûØ¢¤Šë’Ûa0²ØøÄ¢Ó-GsbåUØñ…p£N¶_/¶V[ò•Œ©z¼±9”Ltó«U6=3±µnj”\\–k¥À‹ö+\"Bä6ãŞ³3ÓõŞÙ’OˆK‘zTiŒ´“T6^ß\ZÚq–›-°ÓœŒŒçßãë\"3ê?1Ï?‰œ¼çê2r\'ŒçñÏ9õø/¿Ïê?1ŸÚ~°Ä¹ÉDÌó2UÇR3êV|FCyÈ,`÷FvHæ÷gã‚›/—Ìç1?y‰Œˆís˜p#r#ï÷‹ˆ‚™™‰ˆ™ŒZäØ!¢¡	ÕBäïj¦éyÎâì •Q5j9\\.®ä%ef´È©-:ÀióBªW¸\'ß²ÛİYŒ&+ÓkêI»³¸Æ¦úT¯yƒ`2åBHô¬¨bÖ2|!ãZ	^Ö­R©ê˜ßa+?ÿ\0«û*~V××¬çXªtv]àMuë)—¦ÿ\0ù×Ù6¦k®Mn³U–ˆ×Y¿ªí|]{O¿GoVj\'ØËãEw¥¯ùÃ+Ñ¬í<ÔCÔ›„ÅŠé¡µ›¶YŒÛV«KWPPOoÏZŞºÀnMK\\N«^zùEÓoPnY}ì!WNÜ¹tØv—áØÙ½ñ!kBT\ZÑ|Z±ä‡1~¸ËL	ˆÖµzV@§îfr#8ÈŒã?yï?YˆŸy9dGï=ó“9‘÷“îr=LäûœúüO˜œ‰Èg xŒ‘Œ)ãfs¶sõ‹ˆÈ‰Í¾À)×/{+Ä÷2S÷‹‰æs|ä@Ìäÿ\0lXIOÇläDH”ÆG ÁÄ—oÔôÕÅÛ×§ˆİ0T27¾UH–Æi!û=§äUÙ±‘Q*5‹‰Û´(!AÍqƒ¬è˜îŠÎ†VlIÂê\0½’ŒØ§®ŒSÕŞ†Ş^ßyró&ûdÆÄí\"ÕqI?VM’ò”)”lHÎ[—Ó²¡§q•¬Éeg6ËÆÅq«(€Tìl½r=ùì|0JëU|WHÆş¢ëMIQÔku[šÂíM[&Ô¬L@Ÿev•À5fÖ+Ù°Ö˜^Ó*­ºëÖQùV˜Wq¹U‘²Gƒ]oÑÚ©:À¬ë¯ªbZcj1°=Ä jXZT•NJ[I!¤×Z¾=f×d´!åî7°Œçó‰œŒŸÇë#ñÆ~½g²c;³ŸÀäÆN~òr&sŒŒûœúœ’Œm	âp­.bx™ºbÎ$[p\0{¦kØO©Q€PX÷u”ïö¥iÇÁ6{²bGp&<|äÏôŒ1áq<ÂùÅŒãxúÁàBcˆŸ\\qİ½¹%8\\çEİ´§2¿‹sy‰tƒ—³­Xj·ÊÚô\"³Ê `Él*ó_®hMm§	$iÅ§¾Ò7—cæ$tõ­½O>b+ZŸî	ìvVlD=ìlsp‚r>©¬Zˆf\Zª´éİ€+&N-Šœß ˆÄ l\Z¦ªä¡|üRgv´y…\\Y¢ÚºéYB7\ZÆÔ>ÔkÌUjS&nsîúQ)\nâTL±muäb®ø‘jlÑ‰…kkRmÚÉÖTtI¡¬³´b¬\n¥•.ƒŞâÚ{ÕyÂnßÁİ§VRıvˆÕRÈ\\%ÖNÈivØª«\ns^HU]e¹\nLÎ\\VÒØ‰¶€“¤´,5®\'\"3yÇ¯û9æ>çë\'×¬Œ8õ‘ë\'&3×9y9“şóÿ\0y9‰õxY\nãÜÎÎ#²f0ö2<Ê·@EPø\'«‘Ír˜Î »Æ³´T2YÔ;sy’mâd¢d¹‚Œ?~²?ÔdıDaóÄdNDdÇqs9ÎFLÇ³ÖDf·«+Ó¢´üPŞÊïmé¸Švï9U^1Tÿ\0äj¡vi½%/´öª+»­™%5–iU™5E®RÎÏ*XŠ5—–¥.Â]Ÿ»Õ¯]·ïR³ND3IUà,{	§cäò\">Ş7Wr™	‰Kr|ãèÙ@÷!åA!nW<:Šş;M±Ük¼Æ€r•ÌEk*·b8ƒí¾°©M26‚Í–ŞØv\0Ôc…k¡1×îª‘P\"év\\U¨‰½\r·­ˆM¸×Ø-©wß]¡ğ›^x{ÉéCuúÁ:º§P‰¯\'e…×kÒĞdö5--í¯±Zü¦Ó{Mí&qƒ9Æqœ~8ãñÇâBf9Éúã8™÷‘œçã&?¼ŸõœNGÖLd}ÆOŞHÌúÈŒ,½kÂ<ØŞA™.fêˆç¼2ºff3W> <ã˜Íæî‚PM«\ra”÷ÌaÏ9`ıO©‚9Ãâ`bäÏÌO®\'#8É&py÷9ã	¯Qœ¨¿Î.òÖÛQ¦µŒ³w¼E¨ñÕ\r4\\±Ü³†íè¦Ò#J­¦¹øùcÒª7wë×b÷Î´Í›br›N­7N\na\\ëÅ±:°…L×uu–>Ò«ÖY[bUİÅğ·ì(=öªküs[ÅC|úÔ¶ÒÙ©\0–)ÉOféXSñÃ,@Ò»ò[ñæ,DU¶1,„¸|¸\'G=•F­$\\C%€}5Ô0EXŒ!«¦İz\Zø(¹$Rpâ ÖF´År“†ÓØ)Èg‡Ô0€+Á¨\ZOZpµÇQÙe]D«˜‰ç8â3ŒıqûÉœç8ÿ\0º&sï\"3ŸYï;r>ÿ\09îr~óœˆü{Œã>½çw¼,ßì¹’““#îŒÕ—|@2¨	ğÄÒ•ñÈ„LG›KAQQ;kÌky8ŸLàDHFÿ\0hŒú0~òfrN9ú’È™É9Á2âs¾cŞy9ı÷s‘÷Æ	Äsèã˜™ÉHû_ÜÎJÆ\"}ãê3Y´}= ,CÈŠhî6TV¦é·Fn™LÒ^¹wÃ;Œ›$|võË¢ î±qšÖÑ¥fuôëS¬êİ2´.e{4ÕÒs\r”(Vª¡µR*O*Úll\\o$J¨Ãt©¹si‹¶œ&ğß¬şBÁ:+Â•5ìÙ‘Z‰s­…Ü	™E3´ùÆÈf½€š]ç_zL$JÙÄe\n²6•ıZ•CfLbˆµ¸ÛØK.†°êİªñQ­}ófÇh««ç8×bEìI1Ç¾#)‚b!…=M²+w‰\\ŞsƒÄÎNFzçñ?ˆyêsÇddäd}äO3œç9<FÖLÆ~óœœ¸È.g&$³ŒŸ¼¿¦‹DR88Ğ÷9WW\nû\ZÊ ˆÈ˜ıÅ†­+#™ßíXó(g2=Å$PaÛƒèb29îÉœ	yÏw99>³œsœÌdÎFvÏ2\\äOï$¹ÎyÆ19á~¡?s„J¹É¼(g©†Ù®rKdí6‚#Ë]Ufà,l\"Æò²‘UkÅ_©fÀâ†Ë[=’¤6ğ5=ÔõÖYrUÛjÖ…e¸®0LÙ…‰á\n•mY“\\­:›õlŠvzİ•c*½ú»=|ÁØ‹w$ª­Š­¸³‚ãd¦|¿íQ§J‹TÖšà@¨0Y1›{/Z…9­¯©ºÅ…V\nûm‚œ¾¯i”j¯]I„Ùlf,#¿Êi\0x\0P³#]w7Â•#!É’a”ÄDG91ŸQÆ~²9YÇÏæ2=dä~{g&3ŒˆÎÜã&=çë?s‘œçë#\"2KŒûÉÈ\'gıDìbCıŒDûê-¬{XÈ¦$°ù.#\"\">²gØŒDÏ…Ì–@LLgl9<ç¹ÈÏ©Éæg=ıFNs<dä8C“Ï¬‰ûÂéâ2ÄÏ¿¹™ÉÉL‘ó9}Hûœì™ÃVhãêQ13ÆR½f›€Ä¨u41†‰ß©m)ŒgP«b,ƒCuÅl†Òéı‰\Z!çW]^¹„(\'QUÄc1^˜©‚û9¼Ó/b¹‚nÿ\0¦Â½A:–êØñ­(c\Zd7\Zû5b²$üçüsøëa”ŞlU&:å†üE¤#N`ùnÒàËÛØ\Z3«[Ìw\']2tœ6£˜¹bdAöY0}E`ÙxÓ3Ädş¸üs“?×#ÔgŞqÆNDdñÌddg¾r\'\"_¬™ıddÄóÎw\\™ş¸1ë#8õ‘ÆqÌş$Ü¸ú‚1ÉlFnöA]20Wl2)/\'t{Â¹ÅDq“÷ÌçÎDÌ”DÁG¹ÃãÜF?_#÷3¼˜ÎÙÉõSë;¢s˜ãŒÿ\0Ôgî\"2K××õ™÷<ÎDó†°˜ç1õ±æfpâc™Â‰™ÎÈãˆÁªfC5¿éåöH‡éúP‡¶Xïâ©6TÉªœÁ”Í6,ÕA¯ûEâ±\r†+Ï)\"Íe;Å1gMU®#PÆ­U0¡~‘Ø‚¹®Ûõ‚¦¦¿€õÚ›°å›’kAÚípÙxy| n4\r^kÀ˜Ÿ†n áNÍ%W\ZûÖ•DššnË›\Zô«±ĞNq¹¦ÂÉ‰õøûÏ\\FLó9ó_ˆÎ0yÇ?\\D~yÎ8Œ_¯¬¿Ç¯Äûâ?9úÁŒú‰È™È÷“ıó÷Û?¨ğÌıå÷¦ªHˆ¶—i§0FÎ=g×¼’!ˆæSÎFl”Däqİ3“?äÈûœ™ˆâ0§ûsÌÌóÌşç&yüÄq“>óŞGÿ\0)?ì\\FDq3Æq8EdLLdÀäDdÌñÄdÌ„O8R²EÈ™P+Q°²<ª²?éíÖÔ\'èz&½ iÛij¨¹b¸P,Y -¨fGXÄç˜c(Ä<Ùß[7X†	‚ÓİÙ…táâ¸WÆØ0eVP“X™î%ÎR\Z4÷ë$ƒz@İp,ØvïYº*¤ÚÅ}\nŸ\ZÜÆ¿H{”Åƒs)®¦ÉÔ–ØJaKo|¨É“‹;ØÃŠei9‹{>ºI†WmÍ—IF.#÷Ÿ~ã9?ş³õƒ“?¬ŸÌ~8ÎŞ3ˆÏ¯Ç®s»ı~\"yÈÎ9œ#\"22?Ö¨Áÿ\0¼&0¸â\"0cï\'ï >øqağ\"S3»ÛCÚKk}á—%=¾çûq‘<d‘–q<àÏŞOüğ\n?×|IÎ3·¾{p§õS³˜ÉÏ¹ç>çğsë\'÷ùˆŒ0cÔÉgos1ÓÇ8\'Ç> ¦fp;sS§vÔË°õ½#PâYi•uµÖ‘ÓRSÏ† ¬¢¡†Å±]qgw\\¦UaŒ3­>RYIëÄø:Á9±ØZºú§Z²Rè€‚ËHí‚÷]¤‡~ +wW©-dÔ\'3no‹*´“µ¼RP™‰]±«UÖ²¡¾RÖ5{~Ÿu6İ;TÁu\Z¸©`İ.”÷Ï~Äå)IĞ•MhH\r\ZFõšyêÇÂkª°úÈ˜ìÈ™ˆÎy÷œúã=ş\"r=ûüGâ}~;¦3¿×Ôÿ\0İÇŸ¬úÉ÷õ‘ê?…õ“?¬çˆÁˆ™ŸÄû,ˆæ3²#œêM¤&	!$}ÄG8Â\"œˆì&0£·;x/xòXc<bœúr\nxÉıÌäıçÖq#%ÆJûc’ÏY<s“1ï\"8ÈçQÏ3õ’SÌÆ<æ·SwdßeÕè”Ây³iı\r\nÿ\0º¾›F¶‡ÇïR‘ÉÉxZ@tKåÛ8t2MĞ>¯U ,ıV½É“ŞÊ2Ù–8…¼$8(ï$–Ñ…S¬pµÙ}ï	AW»\'9œGhEa0+Ù9¦¸åzá(Qo¥h÷²ÅT´Ã\\.DeàpM¸ró®¬º4Ú“òTÛt£€\"Î¶_«°‡vÙ\r]:ÊDØ±œóqÊËYcâĞ{ríÆÜt±“ø™çÔÙ39#Äñ3\'ñùıgäÏê0rcëŞNq33øŸ®?êrf9Œây™Èrg\"}gò\'7;0£\\§›ÖÙjÉ™Ÿ¯XRs>°È/s<ˆÆÌç~ùâ&2O‰âc»Ôq$Q#dÇlD–IóÌÌO×tç>²qsÛïà³º\'&b~òf8É˜ãè¸ˆç³_¨½°ö¥×ĞÔex®ÄFêü±®‡ÔÉ¸EU\0…šÅq,›í	¤¡V¾LƒD\'–¥\'Î¡·µEÌé`ÙØÚ,ÛËÃ\"¥L§‚_ì†×6{ıFÊõ±…ø™¤¸Ûöœdëºñ”õÍ—Œck“X¶Öiqá1‹ahf\"ÚiU¨¥)%»‚m&	Ã 2½wD¾]Ù³]fp57€­áV†¦Ë3Zã4Ô¤‰—GwÓVSÔãÃT{ªŸÊ°Q#åíú˜˜Ï¹Î#œ˜ÈüÄdúûg#ëó1õ“÷ƒ1ê2p»½G×ŞG9Ï¨ÈÈõ3Éa{0¹#9ÏÖs–,u”ï¶½`¢	“=Å>² ¢2yìõ“<LLásÆO×¨>è˜æ8ærK‚â2=d”Ïëß×àŠ2&&?Ìá—oÖ\'?s3úŠ=;~İXµªècx‘Ü~»£5£% MC\\¬FZ³„	\"X«\"FL§æÖ‚(;;Ø’ïkLÈ%–|‚víŒ.lÂÕvÛ2(ÍV–½XS<ÄÃÄ°ÅÃ.6\n5 [\"j@O™ÛË/­vİ%Yé~²• `³e0ôBA‰¤•\\ìó¬|a+‰:k1\\”§g,\'¡\"»W¬_ñ¬[4Ä¤fÊ«¥¡‘¶d1Y{36Òj[:5m­xI510×¢c°<®İéİFÀIŸŠbrŒ‘ıgo“ş³õëóÆq‘Î~ÿ\0=gÄFOş³0b9æsÜäFLúÈ˜™ãˆéœŸù`ÏşŠcˆŒııG¹Ãúœˆâ8Ââ0ãŞuèÙ$#™(f9ŸSêg ÇÔNO°Æ;bg>ã\'b9æbg xp¾ıdI{û89Áûærf9ÆäÎh´Ñ±a±Ë·ÒÓ`Õ[Òt5iï²Â\Z Åa#ÚÁ”›|yÊRD­Vë<ÍRŒ\ZP“ƒ¬V@CµuQPy¨á…uxÉ‰³\\…Q__ğÌ%*Èî\"P‘#XXu¡LÀ*¢†²ÉfÄHÁI[î! ¿yU{ *Ízö/m-;éÀé\Zk’¨ügÙ²Ò©)}i0ÅÈBšOX×[ùD¨A–1ö…û\0³.¿dVáÅûH¹3=_míÖ55µõõÁY@%5Ô12(3…Iv‹Êe™²ÑTÚOmèÚkİ¯½b©aO’QŸyÛ’91‘>ç#şÈÈ‰ÈúÉ÷øã8Î222=dóø¬s81Ç9<ç<ÉNFûõ“÷ƒ3Æ5Æ×‘¼H‹;?´ÌË&\'ĞÀq\'38‰%…ÀqœÌÎs8%Æ2bgs÷NÂõ2‰r£au~E+UÓè©¬˜µV×IºÌ×£¨èUÓ4Ø¾éª\"j†šW\\=áíæÖ*\ZDüb J\ZØc,Ë @€–;Jî°5ÊIÍ®%Ö®JârÍ¨Lˆ‚u Ti»ã”Ş û&Æ¥ú¹µLÜ‡-æòLH9@±Y²,$×Ì`l+ËLyªÔ>Ô\"Skh5ÚIì:…i­À	y^v,K¨lÿ\0•6ÔU7I*­”_nÆ^1=Å6í×¬Ã‘1‰R¤`ÑnI§-›LSé1ĞîŠì%A4äk\nVÙÙ­¯PTcÎ´ñ÷²_k½B§Š¬i=3aÙnòIïQLÔŒeÂ€cO_`×Ó~âxŒœœœ™ÎyÉúÎ9Î#\"#&gúÈc&\"?1>²yÁûÉÈ÷?‰|~xÎ8õœzÈæc}Î~²rxˆÂúŒœæ g\"`g™.fp¦;¹çˆâ2?åîØÏÜä”O{É™œ©¬¿rb+ÖŞñÌ¯KÑöjlRû0¬­ÙtÓ]jêX¬\0}İ‘BÌå–˜IŞ–œ×bì²D–ÊÚˆ¯qöLÂ‚Àws‰®Îe¬>ágp/ÕM‚X°ÍI\\·/ïĞµ­BæºêƒŠ6›\0±`|cªp€£mhDDë²\"Úõ¤J::Ë>%•Æ´¤´f¶ºÃL‘\0X‘°Eë´İs”Zú\r¸ÎÇl:vÛ³EÛN¹®`Y¬ÚN›!ÜAnğ\n9F¢ÅâklŒW\\¹Kùõ¡áòCÎÕ2ìˆn²ó…ÇZk²Râ€ş½²FvÎÔVfQ³Z¶Òk’4#æmæ2‡ä–xK\\Ó¾‹r{Å\Z´NŸš:¨«ƒÆò×_eÓš—Îö¾Õ6È9r9úÏ?ìÄg¾?SÇãê?<óœ{ŒfxÈûÂÏŞõx!İ9!‡õ1ŸQ1Šë„8!ï\'õ\"B%“ı‡b=NOÔDaw}O˜²œæœŸ¹Œ×Qµy½•ÑªèÁï½4ô:ºèğø  ÂÊãáWoeˆ€˜Ï @	ˆ–Ä€Û¹Z¸òéhexpÍKãkg\"HîÉˆ±·dÛà¤!S½h—ú‰i²ØÓw+DŞMÇJfÀÛş=K«ª«PÎÇÅ«\n:ÉEN™Û×Ø×²p±8ï½©QÒ”©\Z\ZmEh‡ÆÂÇˆ€–i5¹ò×u×Ø×®rÓ©ÃÌÙ¦±zİ{oNT©y\r/%zéP‘ËÒÈl*°0s%²Ä²\\,‚vÑå²šñŠî±N%f¢ŞÂ*ÑÜJ»…IÃ€)0†*³Ü÷E ù»Ø!l|¾ÅÍjôš&g%ßÎR÷5#;?«×ïºœÔ¡ˆ-mËOU¯ŒÇl/[QœEu¡&½¿M±Ìk+w	È\Z¤p”QÇ¡\"r\'ŞLdûÉ22>ò~ò3Œã?ˆçœõ9ûÎïS‘S8ÿ\0;¦#f}ÌösÎ{Ï¡û™0K¶cD8ƒˆòağB181\"Øæ,”ˆ™gl÷¯Ç1E–\'g£2íX+£l”Ö†>¥j´ë‚«¯¹œ÷°¬Øö¬q?eU¶:åÕš¹s©\'Ïó\nİ\Z¶Şïšöà‚8‘°ªî\"‰IW„N®¶½^\r®µ°$+’ŠÖnZ[œª²äÈEy		Ì\nğ…2×)]Òb«4Rl>ïæ«Lám6rAë3­ÈÈ*#şdû0š%W‹Qüs¢—\nx“İT»4Ş52–»a¶¤ß\r›ĞÜ×ß±fów•ÂÂİ)*W5èOÅ¯‹ó—‘NP  ‘	q·½¶HmÙBDo¯µ¢ë\nJÖÇŒ@XGpI—²X¡TŞÚÇU¤ªT·â+ŸªÓ R¦¹oƒ¯\Zù	…ÂøB¾IÈ•\n ÆUê®\r`©ß3±JºkÛlGg°	PjM´ëZ°y[IL²)Ù².Â¥µP æ½ª¶œM6ŞcÂv1®sah‹½#v6¬­DvZkÔÔ½>â0—ê2\"#œíÎÜã8ŸÏëñëë\"2cº3ŸP8Q‘ÏœÇ>ã#;Ëë™ÏS“ê8ÈŒ	™œ‰äær±ùÄç1ä™œt÷®0g¼²$@¿¶2‡‘‰ĞÍ=NÒ›¬”=Ğ»{	@IÈNÊ¤ ­‰×Ø|°†+“¹/LÕÕ´á°åÄŠ¢\"åõAÂ€S-\\ËÌâúÅß	k]cÄu~¾¹Ö•¶WşŒØX†\"*<jÑ*è®„J	yI\r‡$Ø/wˆ[\rÛÙskHÄj(&ÒaíÂÕëÆÈÚY±ĞÚì{ ¿¬’lÏå_|®kœ¹A“XŠ{S6¨ªîğ©aÎåI¤‡!­ÙÜšè‰zŸEØâ¬°7.¡/16A›è>ÃÅŞ:Ó\'mƒße•\ZñSP‰ª!¤ñ±]€AeÚË(:æ¶nXlZÖ8‘ŸzTsØLŞ¸­}h61İEQŠŸ“ÔÎt1i¯vé>êj-¶TïP´ŞXJõîòfŸ]ÜòkŠÍR£Óc®‡a--àù«`¼y¬öUø†Á³h*ÜÖ%G2\rJİ„Ø“ˆ^×£µVÕÚv·a^;İS·&2G8‰Éã8ÉÏÖG¬‰ç8÷ŸYı¹Âúç#ş3ê2c×âxã\'î8Ï¨™È™™ÏÜdO9¦g0Éˆ’ÒŒŸ ö\'ÇtdÈÌF\0—3ïær9€ŒÒÚ\r†©-¦#…ªšmíeÕÙ]Ukö‹*÷,Û1bÉ½‰Œ®†ğL€¾QZf›WsÆÜ]dC bK°b{2¸/¶rË¾˜ò·F›aF¸ù?ƒ…ßşBÍšÿ\0	E«ò’¼ïhWS$TÛæ\nàªK‡“FÔ‰ËY3àë>D;-ŒU1Å§ŒXW*×jû ›âXA4ŠÍ•ÈA2ã+ˆRi…Ï!‹©%–¦Óåõé²oZNÒëÁIAI’\'ÆÁ+ªØH_eµ—Y1@ÖğcíÔ*^F Ho™¤ı[¯m\"Á1k]g~Ã\Z©îÀ&X\"€-­¿Œ	‡P²Ô°ÂtÈJ\0^7kPšµØâ5Y°˜rDW½¼7¬BÄôµ\"b\\ÉêGøôoã	®ğòqæ[À!¸–xGŠk°o_yU‰§|[ÈÓ~Å°ZºÅQCQöêØ¥­SFHìWEab«Ök¶4\\§ç¤iÜ¥.«š.‡¨Ê»@½#ÿ\0N·RÄûôFÛª´§ë>¾¢gñÏŞHşó8Ï©ç8Œ˜sõç®\'#ÜaDääıDş#ß9?|gşòf\'ë$½ñŒì)ä9ˆõ†qÄáÇõ€úG+wDq9d£¼b\'™Q	~a¶¨‘|Zë8ï;Lp0%T°	†Él%¦ÛClH¨`\0.¿_«3*µ¸|©ö¥Kl	I\Zä½ëŒDn®X±\n@²³üjóâÜd¬2Öåµ_Ç‚›-ß7¾ Ö…«´ºÔXó°X” ±¾Â_c—4’[s^ ¦&Ğ#’NŒíY›÷[bà@‰É®ùÌXZ“F‹t¬nšv Šh·Q˜\0P6Ñ´æÀO„ÙqBšÍ–Ğè¹\\jÕÒm·„\nÔf¿+¨dy\"ÀØïŒò¨O`ƒFlÖOø¥›.¬©X8X–ôBŒve>®²5Â¸ˆ[=¥w&]´µ F£V†“YuD\\ÃxÍ)˜5¹%CãÂ5t¡ëQ@Kaiì}°ï+ââ*1¡bj,;¡aR‘0²«½K{U’òIV´Z	†‘Dm.QñÕh\\¼âegk]chvaQB¢e5š„DMSÅÆôÿ\0õÍhÈ¦Îl«6ûUš|ş\'Ş@ş£\"#9çñÏ3Ÿqœg3œäqç\"?´ó‡ë8ÿ\0ÔaGõ3†qÇõÎØæ0ø/\\ps33ë#ï·ˆŒùãÇ=Ù\'÷(¥™8 ‰‰8‹šêÊ›dl,ìv$(®)°7H\',j±O˜gm`j1g$,§æt­ ¥0åc	REwoe9jÊÖÖ›BO­.Û‘ŸuêZÙ|VQ ÛLZj¦Å–2È}jï\\’Î´ÑåP¸™§n%ÈJ¹E8Ã…y¥Vód+<ö<ğ¶V>›«q&Ef¦¦¦¬f=IweY¾6N·abId®±\rj†%Ä´ìøO¾*8xX™mräH0ovĞÉÕU˜òIù$g–½Í\n.³iVÂy»¸{$‰’Ç³‘¦‘m«2Új»Ña‰9ĞZá²³.³ AeÖ4_ÿ\0¢˜Ú0¤pÌ×r™ä,(æÒˆ2wªÖÔìì~á¶Ñ<Yh¬Uåª\\Ñ.f½ö¤£iµöé$Éâbâ`Otjwñ‘r±¤­¬4F:¶‰AK7\'0ôDS·!ßk±ø#69=b,-¬J³¾Xõ®´åá°\\wNs‘ÄDzÏyÿ\0÷9ÿ\0yÏîgÜç²8Á÷œû,‰ûÉç8ç\n8/q—ŞvÇ1?yë¿1%‚1X#ãÌñ0CÌI?ıD‘O3%üÃ¸ˆtBûùm–Iœ‚®!»8³I5‹Š² ×jÕiP’Á9n˜]²¨°kMr‚djİ6EÑ2MtBÖNÓ\\‹\"Rırj´\"À.õÁ[= ­Ô6DªÛE_å™¶²A˜Í8ÜÛÃD›Ü\n“î`”:l2âd*	Ë’—ÀŒ÷7°À!İ°éiJOÇ›mœµñ.µ›Wì|UÓÒÑZ˜A\ZµŠÆ1UJÓ$ÄV±6ñî\0ûŠ&S	§ñë¦³Éù«ø¦O~•u(iAgdpÄ—À/û#Xm~¹ˆB•/¨Ùde«{@ÎÊ/%XYDìÌv:£ÊjÚ¦.™Æ¢äNVQÿ\0PL\\²¤Èn šå´IuÀJWâW`È„Œ)QJ;äÍ@f\ZB\".±\r;A¦ŠaÂpm•T¨ß¢¶T €µa‰2©N»–EX)C5j#Z?8•ämcífÍÈªŸg¨Ñ³}+!V¿Qj¢–¨ÉÈ#9üÎFLs9“Ÿÿ\03èg ¢cóûã>ğ¢?ıaızÈ/E9ÿ\0Ù3.B8É#Ö:bFrW1’q÷Ó–bæ£“t,Y*µŒ£“[í>\ruØG`˜Tğ‘œÜJí*œM¤ë¨„…~R>fa.²Á)Ï†1S´ªg+K›òdJ\"+ÍDŒ¢N!J\\’<ä˜K\0¨Ûù;m¼ØMq¡IÒdÉràª½‘3jï‹ûÌÃIá>T¡+H›Läã.H\0IÂâºÆ´ˆ¦²ÑB›‰+òØ…›L¶ÎÂ€Uf¥ëÀyvıv¶Msêºœ9ÃRÇXlƒÛcAÕ.~å“hîîHÉŒ}­½÷Ø²ÆBi¸µzå¸Uj§ÌØ[cv¶İvá÷Uùj]îêè¼j¹}cäÙj–ªÆ`hµ#0\'1|jéÖõm–»cXÓd7\Z…kÖ¨¯;­[ÔI1j­®lwLyĞVf|Í®–%,ùboÊíY†„P£>Èš5Ô÷ LUª«LÛ\nÊ2š¸Õ¦à·¾ÀÚç•x…»K¡z+÷kæ_#ãS-Pª°U·:ê¨½ŠdQÚ\n¥ÁÔû<-Û[–\'H^vÄz÷Ÿ¿ÄÇ¸üO9ûÏY“…d{Ÿ¶s³YÛ3“ÎvñÄaG¸ÏıäÏ¬9(™â×©É!c‚ÀÈd¬ç%³3ÌÌ°§Ô`syß0Q#:vn8.ÂÚi¥‘7*Ü cUí¹U@Ê¼‹Û`¥TQ“‘etÛÈEõD¢äÊæLÕ[ËhÚxô.ÌÄ2uš5Uºoh4ĞŠçÜ³meÁáì¦ÚË	hÙÆÛò(k®š+T…6Åjæ¾EA$™¨æ<§áõ1ŠB¤ŒüŒq€¶T\næğòÅ×RJ\0Ù}\rì_t)Dr{ÊuŠIÍM‡Qì®ªÀù]VíE|«¬e™éªºÍáv-iuu^pÏqS_\0`\r ;V“\\Ïf²«JºšòZöm9]Í—pH|6‹Ö¦¢µÜ]¨cØêUŸ­Bœ©¹ø4\0QÜËËDÁ)¡zÍ€ºĞ×Sª°`Î²Î`Æ…k]’¼ÓÃj½Ì´»wÒã‘òSØ°ëˆ1 :y¬pÄSÖZy°ÔúÚkë²l³›ÚönT§4fºİCX¶¶u†ò@Äc¶Ÿù¶¨ø5ú*”N³]u@“BtâÍƒ\'Ëá]à©gbM¬£TKÁ*¼È¹6n9äpGÌÏq‘“<s3‘>ıçŞ{ç#ÔdO¬ÿ\0”FûŒîíÉ)œŞGÖsÎLÌÆLzÈ¹œãØÆÄÏÉ™Œ‘Ù)ÀÉcæ\'ˆŒlI”DLªcï<P1ÌO™÷ŠCÕ©c©«b¾¶š,œ!}‘/¹NÃÍz<Ó4—¥©Vàß‡\'im³)µ‚»pØa[u \rÊëK^•ÊåYó+%R¬·óİb¨¡`0R¡ÀDÉØi6–0.WÑÒ¦`wlvWpv	ƒa\0*YLØâÙ{*êâ!¤\n]\Z¦¹\06ªÛÍA{a}Bc!|Š®ïªR`©¬§m6KÆ5+ˆ)ÎÉëÚÇ™I¿{ä*µmÕX¨ñ=–è¶\n(~²;«ø$á‘!jíkÖ’Nj-E}Å³„6Åg ö6÷C[=;³\Zm°ëô¶kvoi)UªµyWgf•¾ò=K…7Z¸íŸU2Ã{(ã©)ëƒl/Né±\0È}&ªÑ#5i28`jŸ²´m^kúæø³y6PH0¥^\\rÎj½%PÈ¹WPušÉ7¢>-¢Qßx¬+ÉfÂëš,C«®ÕÛK¥iv…kòRPêWÛÔ6\r\Z¹‰‰›L•´~f¶äˆiÒ¤¬©¡1Ô^øsôÚãİ±¦Ë¸{¼Y1î3™çŞ…1<FFIq÷‘Ï18>‡\'Ÿs9<úŒçˆˆÂ™È###ˆÉb3·#&?Ô%dÆÏÁ‰â0×İ9#ı;\"\\Ù‘â8î™8äxîıFIÄûœé:µ K¥v€¨T’û…`2!³”T\"juãy`k‰8“QäÂ(5-Õêw“µú¤Í™¼ÄØˆ[L!\r©jÓàÒIu^à¬g^ù´lTFÀ™MµM¿ù-&ÎÂ›C¹@Ä’õÛ74ë!ºıë~×²T+/Jn8ç±Œ]DË^\'bÈÛÛA«µİ+qì©•§Ë¼£¨´Q^ÎÒÍ-„‡|î&»ïW´F]¬d_•ÓqfÂÛdÚ5°º°L-2Ä¥İÃ¹ ínÈ-­g´­4œ‡¾¦–Ó¡M—\rwå\Z{®Ó´Udt.§ÆfÆÈV›[Y(\r‰i9Å%›V|]ÏƒZâ=“e¬LËâT@H:Õº‡]b\'U­¯2;ˆaø¢¥½}¡Y8¿ƒcÊN,\\¯B°Ğ©¡±Ÿ³§DµÍş6«+ìYN…(\ZéÔ=VöV×iá¥ª»Ğ/%¬ƒ’òŠ/İs×e(éë¢ußìµ’¥ˆ1“= ®ö’()J^Ä‹ÿ\0©S×¯ME‚%Ô÷Ôšvãù.9rÖúÏ_¼’æ9ê#î\'˜È,™õ9şç\n=ñ“ï=Æ}s999İ3”ÈUY§Ë8†Ld¾É%Ø˜aqÙÌÌàzæ3Œ’8>F=çJE»”ßU½¬úÔüÅ‘möušö,Y¬h5$ÃZÖ»\n)Ö|0=~İj¨\'1Õz‰6|É(¡¶;Kš©B†b¸$ñ…á‚Uâ‰ù¬F\"b+ú´¸çgó\n½’TkV¤ÔZQŒSš¶×+íõºÔë™´«Qc®¤î³Û›]İËÒ¹tÓßİÖ˜C)m»»,Òš;(µ\'›ôÈOÍíÚL4Ş¤ş£—&T”õÉÆ^îøğ]¡cÍN³3Xcä`æáâ’¾Hm½’`k\'\\ûë-¯±7®©Ë°qfT\"«5ĞÎÇ¶w!‹Su–Æ<†*1—¬\n^kÁÊšßŒÀ,ª5ÕRĞoøbkw´ŠpÑ¶îSÄ)ZîTáiíšÄªaÔ©Ùm€Ä¬Tª6í¾•xl¢„©qªëÊıŞÑytå5WEÈU†BNó‚)„ËéÜkìxÁ5ä[%2™¢ç´¬Ø·®Ú]šË©²BÓeŒ¶?Â\rcEÊ§¿¸ÕkNDê!,Ô62â¡,.2g9ˆÈÉŸ×ãr=dO<äúÈ‰ãœC£ÜFOü²y#¬˜æcœˆúÂû™â\nfrQhûakŒ`ğÖàp3{£ÃŸ\\FL~ò&g˜Œí)œx™Î‰Ø|-¼ÁÎÉNÚÇÅ±5ª¢¸(Vk|“áí¹e¼9á¬@ar­ØñF‹\\7“5lWJè¬ÙAKLÆ&cˆ(k—¤Î·Ê…šm-“ßcu£6\r±¾C”«\n°íí.¼5×úŠ’L†ÇWZmó`>Öòİ“iºÉK$û]`¼œSÕÖ˜ı¾©Ê¯ò;ë›ëL±M¦àI¡Ú»ómQøEk{±¬áy‘îÏ`Ï}¹š|kŒd{Îv7lî¶%)s§9UÔ^x˜™;lmˆˆ[®™&1Kh\'¸¥.\Zã$©SÈ¼L¹¥¸Ë\rzÕ4¯UZ’Ëé[Ï±oÏG%5.ßÙ‘T]*vRÔØ@k¤ƒ]¯\'X‰­(u›\"ôV\'\"mSd(õº\n· ›fEUªÔ#NÖóTã\0Ôtµ‡ÙU«ŒµæJ¦§ô†ÚWæè:~ò6ël1šësÉu®K\r3—DÒ¨MRm|·g]¬k_dõ»Ë[S÷;ËM¨!,½´\")Êá¢ºÒs´é@™VuÍeÊ|ËUÏ¼ç9ç\">²9ÈıçnLzÎr\'˜À.xõ00>óşSDÇ%‘<ÄL”LgÖ  ÛÕ‘ßÌäppq†C0CÁûŞYÄG³133}ÌÇGš®?’¡›Å•R]©¶êV2zÍ“·VÍJÎ¤R¼5ä»4Ğ¸ìebÔÈM‰¹;*€S%nŞL•C¯õj\nÀSÜn7v./Z¿xˆ6îbÏTièÏ¥aëJåY¬5uSlo„Á¹ˆC”L­VÛÉMk¶4¿rÊ×hÅA­jĞ¼c°J\\÷\nC¯e´r¤˜ó;#ükÓİk+ë*Õ0v³J¾\"ÓÎ62«ÇáÍ–á®¬Êğ™Sf°0¥®R„k[Bë¨w¨üFÓ”²\"±%Ö©Ù4¿½YscvÛ–/c”$QÄüf\0Î&h\'wX;‘!*ëxŒ1n˜¥#zÖ&ÍDŠÂÁX{æC©×İS\Zà;í¯u?¼DÚ¶šê›\nÆµ/½ÃÙR²ıÆıaß=§f9ø©X4jª¿\rØ:9·®‚­[kNº»l:‰B¤ó\\’j;\np7M5ßBÚ×¹Í²Š²”â)L[QMÃ«ÓALÙ=ÅÑº6sjã¶é€-…Éc%uİBÜÖªv0Jm[¬æW)şô:&œ×j—¿„˜R1@tÍ¦Ï4mtæ‰®å7vn°ÄÖ³\0}½ıœó‘Ç9İúär\"f3·ßÇ3\\LÀÎ&rf#îd†rG²#\"=LÎ,$PS„âãèYœÄ1³3ÉL²fgyŒˆ0#ºb0Óõ‘ä‚^\ZŸc^iı„^ğ´môój„Ûáın™^¾[-×<,ê%›­«RãÀÈÄ«„^²v‡6¶ÊuªW:7ití4×­_e¸»jdšç[‘MSe¦¶wÖT­½+ë¬¥ÃHf½‹5²„AÌ©a0‹¶WÜÀåDQ\Z©7äØw‰Øş±\n‹Ü¼°ËcüÄ­‹ÆŠëœæÄ·I=BØUFş|›m’mpÃ³mI±«‡²µu“,5$@üŞ1ìƒ†.nÙ	˜‹\Zç «È-V+ğÔÎ¸É†N“åL++c^ÀÄ´J$¯/³^ş¸Ò´7øQ`	Ò£ñS3\'CKNÉ<W¯×ÖeyEàZÁ\rMÎû¬šèÙ<×_¾®:ÆÊÕ0¡Hêª¹y´j{œ´U¨¨®+P-7²…xvï‹g¤š‹1Aè«×AY–•¿#\0’sÕ¬¨Å¢çMmßuW\Zs²Ø›XC.·°˜™R3¦©%ğñ¿ÒşSdÚ‚ûK]´‰æ%\rŒ©bl$\ZÑLBâ…›&Áí]jòç#çL@,Õ_rjt4Œ¨êöj±ÙfzJ°ØO6·=9kW0È/ŞsÀÎÎúÎs×2S÷Q=Ø¸îpÊ§#$>8á§?Ö2y)),>&fs˜‘˜™“æf2\"{r8ûTÏ2<6fJ#$¦C*6Óu´;Y¯I_;M”6Şòµ]¹UÑ…¥úÕŒ-kˆ:À13Íı*ˆµBµ°!›æ%¡$>ËgrWåe²UašuöÁÊ‹§Ly1Ü¨/V‹Ò2>9×:[qÇi×wR“•P-}H¾¦±–­Ñ±U†‚Æ\'ÇÏ$íªñÌ­´­f8‚şEu›Şmt“;qÌ|@&!ş©jä6ƒY„`«;[6`%æñå½Ü×Z­J•	µHë—wöcñaF¤JVá.ÉÖVoŒ]ÒƒdB¨ş£iß!-)Ò2ÊÍ\'`Ùb¯p²IÚhJ¤ÒíEKcb&Ì[·UVE®\0«LNkš»	¢¸VY­E¥n½›±µc¬HÖéºeÃ£MYW­Kí(ªÍxM¯&^:ö\nD˜íêá€Cµ³mõ‘Dëüß”¿òİ¼¡¾Ÿü@[F\\÷ÎërªUØË–,IAë¶w×a”ê¹œí.\nU=å7\nt¶UÄ\0İÔ.š—é\r‹FB&¶‹Ö!«(ü„lˆ(Šör.8&lµºêµ¾}k±³+ dµ¥]îg•–î.ªÕ5bÈºH5M{UÍl¨Ó¶­ÖÛUiíg\"Y>Ë\'÷œLÄñœÌNDûæs»…DdN%dX_ıe33Éçßo\"}£êe3\"q9&##“è£™é…Ä]Ş¢1 pÿ\0k”î¥æª…ÓšÈO6Zö¾û\0Ú)H”Üá°Ú›[ÔÒCkëºeoÙlSpV{¶€Í>–ešŒ¿bÓ´zé†ŒJ^ÄÖ\"OPÄI•‹òå\rk›H³AÂ«SMnĞw4†“u–A£­œRÇTF¡yÊXÛ>5DéØš³`šoZÃ¹m«·UzŒ\\Óe§÷e\0#\"’­şI9\'ÁÌN\04-úê°‘\"	5Vp‘´À¥…% @İ°È;\'UkPæ­»\"P’–%ü>¸Î¼\Z\"(®c\\+–ãPËsYµJ¥)Eiá¾!>.&­äÀvúİ”U†viãbµX}¹­Š¶É\rzCpówÇ¡mO§DZg¬ØÎÉ#Âw[\n´Çá§5·õûIîEÊeUéUq¡¥ØI³]®¯6‰B£*™‡šÅÖ/l¸§[s²±XKäˆÍÉ®vk­õ,¯§—MiYSdÎÈ‡ŒÑ»	£d€ÑZê,yW~åR‘ãä¶g\\-1|œ	­¥ÜèÊZÛÎr×´¥7k¡k§XWMâ¿\Z±ce/¤ÛŠF¾¡¶ÍZ¨´õèVÛ­k·´KyPé¡»n—Ùjª¦Ë¢?áÎGë×dq…1ÄdÌLDFs<œgo3‰\n²ÈÆ²H#++ÈŞ3ˆ#gc=ÉvÆŒÎ@ÄO3ƒÇis“2#%ÇĞñ>ä±Or¼¦iN­fœ¸½ë”¶L³R’íaDÔ!è<ù}…Õ[†¦²JÛ|;7ÁìîMZuXäùØL&ÄÌ RÑcä	@ºeá½\r9Ú\Z>\"ë,õ«½\"vJúkŞ·2ÍŒ,)øÍ—7%!Ü­î mMğ)âD\"bFTˆŠÌ“…¢X‰d–½âI÷l˜¡´R‰®å;š©•‹\"UR’=œæİ	î}rTÊ„utB¼Ã^\Z¸·­\nÏc±v¥¥¶­±DªÈ^¥«\Z¨ŠëĞÓjètlYu,sz”ĞŸ\n™ªØFèÚ‹YĞ¨•ĞE6Õµ¦Å»mÜ¨–’Y§¦\\Í¤Ê(Ğ¡]k1·bkZokö”Ñ¯Lü½€·m¶JÏMÕ]Z¬o(zfÇeC¢£UŠ)l‰¼ˆ—¸•SÖà‹slj	¡ÇU¶„Í®şA:Úò@˜±ò¬2ÚÓı™Øçš«Š bZœ.0!$°–FÎ²PŞS¶²f	87Aa±×Ä³\r™í\rmŸaJf7÷Z3+4^rZåÒ-=>Ò$\\ê\Z#\ZK ÇŸ*\ZÃU¨ñ‚&‰º›Aèİj›«µâ,ïÂ)ˆç;¸‰Èıdz)Ï|àŒÏõÎJÅ8q#Îké<×-“‰ŸQÏoäŒs%9ÛÏ$XÁX_ñûÅÁLwDvÄÌK ‹ú\0ñ3LDO¸Òî[ª{[Ks]ûadÖëÃ­µ(·Z‰¬nÛFŸ\\Q&dòeƒÆ­¶®OfQÕT¯LCÕìÜ¹!å6Vl¶R\ZÒÁ	”Ö*L|¶x§Â¶=ÆKàÙY¬ˆsê‚@#¬MH¨O$Ñ”PSk°Lğ†	”PLª˜£²¬Z£2\"5\ruˆ)ËTƒã€\"Úë¨…5ue #/L,šÀ‚ÔµÚrd\nÛj^s\n¶3`v\" Ø…¥õû6±<R©	½;òy+C¢ÑÔÙX´‡±èiÃÅYZ‹„ÿ\0×ŞáS©İ)Óè^«-ØÚ¦í½5\ZäKæØµÜó„i‹k´ó’étxÂ¼ìôhÌ–U©I Ù¨€œ´¨ˆ;šÃ|×Ö[çÒaÕWãµxvnÛ·RË©jÁÖÖ+‰©¦¢Ì¹qØ ç×¹-şÙ¯Xÿ\0ÂÄ#S°£–²½U)ÀßrQUM²‘î}B‘d)°;Ôµ&àfÅf»µÊ,Š™3/ærA[\ZbEƒ¦¶¡eu¢Œ[D‹J¾¤ï:À19váÖ0GxZ–ÌÇ_ù&İéqS29÷Ÿê##ïëıbüÁ3|¬†U{R0 pÂòöÏ\'!D—g2X?±Î@öòRrQ9äõ32%\\DvóïÔÏyaó<çoõ÷5÷û\Zàa${Ÿ\'Ô£q#óföÅ2°H\r[Õ+˜µ¢Î©¤1ıÎªg¸]&u&ÊfdbåûWYä°Í\rÈ±_ã‘>Ÿwwé¸TP\'¬¬ÆŒºĞ» Ê\"gúÚ¥$™÷I]fwš™,àJ²î°fT°¬†iS¶˜’êşR‹ˆª~#j˜$Úµ(0,)›ÙUWÄDP«Ì÷ºªÿ\0Ä¥M•×;-¶5Y^oOÏøjB#enÀÏiUE*¦†×c5ƒU[?­ô\\\n©Ú6È\rpMmx’(ÄYs«jåf\rFÕUÄTk)]•Ÿ»ÌâiD[m9¯.\0S¸®`àù-Â³M\\ªˆ­Ö)¡*1¶PEbÏË·ãwU\r¾ı”ÚÓ†+ª¨ß@ÆÖMö+²‹.;÷ FhŞ6[pÜmÍÌZ¯ª…SUf;v;ÆìZ²²‡GŒ¢­•Õ›%Ö+BÂ ò\Z¶ZÍ–ØX€ìyk¤¸gpöJíÃª3ál–kßQpås¬´ŞĞ#Ók\r¤o\Z:æ“¡&£}y‡y mµ5;Ç&¥w0¦±Ì%\"ÒcåOwYØ;u*O`ûÁÿ\0s‘ÎlùÄbÀb\nK”Ì0¿©DeT•‡ÀÄ#rJdL˜¬\"}s2³aó3\0‘ƒ\"œS0}¿S11Ú9	ë8Sş ½O\"^òxˆã;§ÙLóÿ\0ã´;¦xîaaœ‘ı2G™ŒŸsÁFq9«|Ö½]™íˆleHØ%5;v¹öøª¢½š«îÇWŠO°‚o÷[+µ°5\n°gÍ¢³,X	BïU5L¹u.U	(&QSn)å!oÎÛêŠp½#ªH	¬]—ªš;(é©…ùó_*)®K³Jõ–6šá#­ ?6“q¸¥Ö_rÍxsz}Vu¶)1;§ø‹TEHÚGÉ°‘-SÄÒRm²v\nbóå\r\\\nŸ_¨M$Şßa+ñ\r”lR°h(?‡V¤eâ^)`33‡Çµ ²jh$bÖÍ¶.ù» ‹&M²ƒÓlşS•Y`›aªmVÔUô#KibuÔ¹töàñ\\xË^ÕÏÇŠàÚÖCû[m›–¦­óxTí! gM¶¯äüÅ±vÕ¬W°6Tcb_Lë¢°VQÕ|*GaX_Xø\Zş	4Y±\\ºÛT”‚\'•Ã¯à‚—ëõcòA®Çƒ£dÄ*#cäæ4Æ®Icá&şXu´\0ºPSıç>³˜æ##Ôàñ)™œ	8£2gg)‰@ÉdDÿ\0¹\0 sÔúŒ(O çŞwDÏlDÿ\0öó1ÏÔÎH™úˆàd±‚ş¡“õÉ¸Ap1…Ú$N–DÁÌápİ…=ÓÜYã‰fÎÜ‘ã$yõœf²Ü^ÖÓlf¥–LÍ®±,µX~Eİu\Z¨\0}jö)©­¤)ppQL!ÁbÀÌ/a¬®êÖ˜€¢Y%ñCP¤“WUQ”<ç/Xº³üË²¸™],]‹•Õ†\'Lër,²ô)t,6¨6T\Zø²!‰­¼Ú,”Ë÷UA65ÕŠÎ¿R ¾û7c‘4MŠ–Hõ­LF·Z­r>mœU­|w’’—d›ò3©Vì.¨Z­Ó\ZÔ™;\nŠt…Uê®A¶	ë*&YKt¦YrAa°Jë5Òé:Â\0´İ¦•Xªd‹>$(!\n†\Z-.˜-—QÊê‰ìˆÎÄŸÚÒ&X«£0ÉàÄ­Yƒ€`±d[²$@Ó—åÆCT3øwi7ÊÂî’Y­§aº™³]·I…\\X9­++d‘‘7Ø8¯VŞÑ½õ±:[)ï#³FØÖVq	¡dHH´\ZIÔ;æÚšÅ§J6\02ğTÒZÑ¶“q\rêÊÖ-VUõg©ÏŞO38%ë™Á™3ˆcV1Œâ+ÆIHbu\'	TÃ>Ö\\1¥\\gºdû;xíÃL²fH¾<L÷)+‘`G?ß$Dg¸äHŒ‹‘cÜço®ylqÄLDLÉÉDwF5E#ÎBás0æÌ‘FBÈË	QÚ\\ÀÇÏ?\\çÒ—•RñƒÈë=°Èl\n\nãAr%NVdõ¦Š]@ˆ²Ş©0Gã%ËÎŒwå\Z0)\'5¨¨œ”ë£n°£°y1µëÁ\"ê.T¶ê+e›l!®êÕe±.³Y´)ÆÈ\ZD%^B\\”Õ´¨\'×­)~úãe.euÕ ºµYF¸Œ %îiÊÅ< Şávİbã97]µj´ÌUÕhè‚‰Ö,ìG`¶óT‹C‚³~–¡j\'É¡•«0Êµ{Bîå½;;úA­í´]¬M„«q´P©Jë×Kö\'vÑjkJj¯Êc‰Ej.¸¸°XV(k<†ô—\ZÑÒ2ä·‚xev^@@1<&úñüC–º,¨ñ¦ÒöÌ^Kp\'µr5îSaxY®¶a¬”¥=ôd•¶jWñ9d½š>+VÀ§_Æ4êW\'Ç\rÿ\0Ç­°\\T]iFí#ÙlÉ##ÓìÕ°»`+…z¡fÍ¸\\¿‘Ç—mm´â|g¿Ø.¯OÎ¸pgŒûœç™Î\'‰Îb#(DKà¸dNT®Û6¢ùª¨LJüŒ.r8Ìà#º\"&bf|¼çÖI@Ìz)Zÿ\0±àLI&~æ%q&Q<vÃÃÿ\0ÌÏaIpëvŒL‹c\\}ÃÚEÇ3SÇÉ‰ŸXQ÷“gÔ~:VüY×Øn´Š\Z¾\"Í™–X¦Ch \rq5Vˆ<!ª£M/TK‘u\'\nf5!q:å]úZ€ğ¹XköK|›FªÀ4OYç|‘^ùbìŞ¨İS™”Ò[%eÙĞb)©	°EÊ°ÛKšË…#\0UÁq\'-M–×m—»ø»¢É°,zÀBh©\"•×*ˆk\Z£Q+ÆñËvU*¾fJÖÿ\0\\J²n\r¼íkÖì£çX|Œ»b	£n-^°Dõ’¨ÒnÊÁŠe­š„Á©5õò²S$uõ\"hÌÚ)¸ù’d\'Ä\'¾Ù9™œù	³Á—S»XR‚èXkeém)j‚&/jnZd>¸ †|„ÉUpÖ\ZÀuŒŠõ½}G¹=‰­üƒN·™õdhXˆ&_XëF^¯ä›pZá¶R&Uè)&Óo‚ÄÃ¬,¡›¨ª|/•§©“¸ÁSK[Vû•¼reaÓÔ;òm†ª¬½ÍiI±ƒúçñÛ>ã»™ˆÏ¸ç(ŒüVŸÎd£\" ÇLÔòÿ\0 THÇjåDlƒdÂ¢&\'³²{¢¤y âyÁc¾$ŠNg´F>â2T%!ÎöîŒ’|K9îã‹\0bÉâbF\'¶ºä}Î„Äø‡¤F\"@¦!&1öQ1ï8˜˜œ(÷…1¢ÙN»b¦”Óµ^Ãšõ–A¶X±\n6\"ÀEQ›wu²iæšæ&l×¿póQ¤§I0Ø§i·Áì5³!ÕéJæÕÈ¼İ›íVyj£¥>#D>•ˆµ†v±iMxs ì‚¼Ëƒ¹k4û)§vÂ$“\"Vdfÿ\0Q9Ljuïõ.Àì@Ò©¢»ØfnÔè¦¨…£r3&.M[‚÷½b;+\neñkrr«v©ÕµröÉÑ››\r¸T¹õİâ>ù…l©ÍÇ6NvİfÅ‘=FËÁQU+Uƒ…¶¥KoO^?çZw%Ö\rt»g-ìÙv˜IÅNóC…hÖye¾El«°\\˜ùk¸˜óc„@F;–ÔğD§:nÈ¦|rZ¿Çùœ=¡\'%­°Ù°^øû\r»Ç…ÑÓß¥á7>v”Haa0T¦ÿ\0w•Ã	}=jİ”°Ömv“Fõí[äáEkaQ/YjWşu¾³ß0Šæ:.‹_BÍºQWam(8æg=Ïâgˆüw~£*ÄAÃã™ÊÊ„‚Ö0!Q•V~ \"f}DDIDç$S$rÒX_Øg$}G3ıÉv€ÄÉ”ö„ÈlÌ*&fx…ÉcGÉ<ğÃ!\"!á‘ã%¤séíÃO\'‚dÌó<ˆ”ö‡1ÇÑÇ¼˜ÿ\0ÔÆLf£mc\\ğ:V¤\rê€«k­¶GùKAòbÅ¢ì*uf¡Uy£+TU\Zph¡{d3	YE];ˆu£Í=\ZoMS-ÚyÕ®ª¯\ZV¾my•\n¥‡tÒI±&Íz—l«X*–tÚµ—rØiXUèRş¯šªedA-6jH1±ñôí à mo:ÄR–®”|ªvd]xUwOZ©ÕZ];/\Z×^×Më†ªÈçº¸Â\\±£ıLX32\0;4Ó¯ã¯4n\\Uï*fÕfRnÀ¦Cãut>òŒvH¦„Âô.ø³\r‘m@k¼µíëm$¨–DQâ@@–®Íe€e—?Å5˜½VÅMñDË-¶àmPX°ÔÖ[ĞÒrC`¥«Å*U‡*½~˜¥F›ìlmV»©Šâª‹Fª¢Õñ‘5ê«WBÀÛ]_Çšl5\ZÚ*‹F¹£ª¿chRI©§\ZÍµ\n½ÕE·š!¶‘®ÖÈ˜óÌÎ}`ş>çŞÇ$Ç\0ã¸àqQÜğÅ>K·İB‰˜õQ1>ø}OhÄDçØ<wóÑ3eÑ9Ç1\\”ú|z÷8M‰şÒSPj‚îÇL”Ì}äIAD„ÁœÁGù$¸dpxq=¼FHq?SÉDDÏ¹8˜Œ(ÉÎÚ’¨½ÔİòaC°±F¥ªæó”“ªÈˆ±$-ñ·j”D ‡¨èÔ¹«¬ì>›¶¯mQ§®Ö&k¡/F¹ˆ²µåt&µpšë-¬UT²Şş±¦@ñ7Ù²²…÷¦\\®İzÒí¡F¸â«nU:ölÙ™cÅÒÚíö…ª¥«Õ©±ˆB]hşK<™m±<Œç¡*¦6+W¥HDU’,Şß8¢e%ş±ˆm\n2¢U‹;¶Bkãi¶Í²Ÿã-¯Ç)¹z¹ì›Åv¸rºl¹0§Yiø?È´ºJØm4=²jìN¿”OCU;3zMnU€¨vVvó¶*£‰™QS€:¡­^Å‹áŞk­â°Iˆa0ömq¬µÄj‰±å‘~õU«`UFjLVmtÕ¯uWíøf»X§k¯…–ª-iêBUÓJĞ´önî\rmXo¶ªşa‡–­ºã‰­\"ŸS“‘vş>£œbr’äŒŠ1Å¹D9‚9„Ï¸õR9ãŒ“z•Ü¡_3İ<Dóïêc¸»¹æcb?cÌû,#îâc?á2R=Ò\\wLÇ®ó‰şçPqÀŸ8ÆwG¼0ƒ˜ÏíÏhh‰AñÏ<ÌÉ÷Š¦;d’#ˆƒ.d ç´§ŒâgœõÌglıdÆvLÄâ\\u¬)êšÖœTâP£däMªË±a¸ˆ³IÏµYO•}‰0 ­QU{;:»´›ğfivl´û¨es½¢İ¨äRÅô§S²X:]+Ø;”µôhÚ§SU­*Qe’dVËdĞ`ÊHÁN5ÄŒ1·ö«Dy~6×©¶­Q-%_võÀÃìÅ›ö\r°DrÊ©;[˜5TtùX)¦{IİY±ZÖÔ›3Û±ªª7V\neçÂß+ˆe>g_o˜à—ÙMÂO¼KŠ+…ƒS…Qf,r×­¨Ä’`l1dÊÕY5¡Ä)°K‚Í‘¹z¶X\\ßºû¢•–’*”\Z‹èª•®…–•©%¨ì¨à+ö©[ù\ZÔk¯BƒYáÓh“OÙ‹R	’š”ªw|Ã²5¡v»ë¾èÜí\rmBP”ŒHF¾³ƒä_²Ë-†Øs÷ƒúÈÿ\0&c¸xÊ ‰,iO|û®*Œ@~¦i¯Ş¥\nò@ÇôŸS\'ÁvÆ¡Œşå% U]Ç\"c1<@r1%ÁƒEgP=‚\"DFC%d/»¶DXÁ2	dÇqD`0g˜‰\"8Œdàq½£Û#İÏ¹dÊÌ§™xŒ%ÌäÀÇè¢bs·õÇú#ÔLNtVÙÒnÕ5º};#mtÈÂô‡Œl¿]p]ŒgQŠ­zéZİ4ÃÊ*±´e¥ƒ®yÂ,ö‰üçœù`jí	Öaa^Ó˜¡Ÿûp&„9e\"×ÍD‰,°ê§Õ²õ¢u=DÛÚ‚}’mæ^PÂ¥˜‰‡Ü^Ò¸ üƒANµp+oÒšÌ¦‘˜)îlˆÿ\0h:Svàñ6nİøİõµ¶&£»EäH{«A%N|”,ÎJ§Äw’253·25êÄÎ ’K3¾-[|0‰.è)¤ÚKxÂ3ø6Ö¤÷›5»QO`\nX–•¤Eb¯N¸T&ÃæÖKx­­Ú*ÿ\0jE®Ú,Òª‘­¡VN5õæ,AÀ6Õó²oM%İé×<™IËnMIµ]MSfœÌwÇn´Ôâm¿(ñš–6ab ;Z‚ÚÒ\\õ7UÅ :4fs÷1ë#=ûÏÔO>…q1…Á”jk$0=¶&pGú/ÑTÙ˜Œ¯<óÆ{ìŒâ\0bp;Êy™7ˆ¡}‘ä.g‰˜kÅ@\"E$E‡<HáÌDzÇ@DÃ8‰íÂî2æ#Çİ=£\n/]ş?\0sÄ‘Ç2Iş½½Ç0_×	r1ÆILÎ\Z¤}Nñ3>ÆxÈq8QûÂ1ug­é*¢õP°¡Õï­lEµ“¾ãíİ*\\WAFC±¬¢°•NÏkX¢Zƒb¢®ë]íÊ‘U6ä5İEe Öø¿ù-÷9~fÓê„.yn¦}ëÀ®ı§R;üµÑhüÆS\Z{ä–6¿`ZˆôC¶Ùø— Ô…¦I¸®!H!¸¡¥YÎÚÅûSU»ÛÁ9XÈù©ªËF+DØ†×ôšÅb¿˜áñ#eÜq,¡2Ë(ù-hc4ZÈ d•Š±%å†Y½ºqÉ[`yRˆR\Z½U‹›\'¾MP˜CÙ Š×”]¡£×]•:PŠŞ\"µ§S¬ùM]*ÀÖ©ª;dFs|Y(™’éš*»E 5‹Ë¿mÊğ2´I]«h•hYiéœö¶l•˜ªrJ©:¥¬£ù\nºË	İËäq3‘9>¹Jr\'3J#$x‰Œ’ş¹E~VÄNYd‘DNVWzŠr³;“X#3<ŒÔ/Aä`¨¥yÿÄ\03\0\0\0\0!1A\"Qa2q #B‘¡Á03±R’áÿÚ\0?\0nÔ|€L¤3VÚ¦M\Zú“©€{ìø™²sc\0³€——ŠÔÀ9²(IÜõtdû`‹:\0x‹…!‰Î‡gó=2a‘’;>&M£°æİøz—v°ŠÚü˜¾¨0eãL|Ìx³÷°û¹êå4¦Ø@§Š‘\"¦<cû±ìÌ¥1¸¶çü¢¨Ì¥Õ2(ÙŸmj‚?:A.ÌÆÄËŸ1$*Pf&Wk¤4E1aû%É?´Væ¤š‹í²’c8|€«Wvap@F3  Ç³>Ï»>&ebÉi”ÒÙ1Dõ†İWàLjç©Mò™€bSŒüÊ hÂH˜ıÜÉœ\0ˆ½–1\0.Ì3p˜ŸülaŠ>œ1¡f·“Ò·°{ˆóâç¤¼™y7ó9\nŒ%”|0AÚô!È~ğlš xóÕä®LbÆêãçw²8L\r”Ğ\"´DTÌÍd=ŸƒP¦|x¿P\r^`ûÌ@5ĞâcÉÜ·Íj#\r@lÜYØcfÆÄ¯Qò¥”h\r3Xbÿ\0–~T—S\Z°şcÛ\r˜ÌºŠkZıŒrx›«ÍcâæG!ˆYœ¯ÉŠ/S36\\„&}¬ĞŒ»ÔØ˜}HˆUlDSÄÀ…T_Ä{\n`OhŒ8¤?¦G\0\Z…k1”Äš‰˜Ã¬B—Ëê¸6cÃ©ƒbm,|øˆSxÓ P6íP%ãÍ \Zù3UÉa|uøŸmÙÙ$A1cPhì™‰÷»‹ÂÚ¤ùª…~æVbb‚ (ñÕ¼UV”OP[\'—±gãPäÊà\nSÄÌxÙ´Ë`‰U}µb?ÛÆô­>ñ×œ•›ŠØoƒ	£\n‡äÄB„Šüw“@÷DL8HpÄô*jx“İLh¡‹OTÿ\0Ú®¬ÅÇ‘¦\"£:3&$g¡Ñ™•UÈX1©ÿ\0 ‘ÜÊ:(²ÌzQ4áKp³x„[	–‚ENAW¸X±˜q Ø†=™‘H\n>é\r{ä4û…UŸ\ZzĞÜf}2÷Í¬“æÌÂ¥ØŞÀÙ½‚,Ù9\rW@~Æİ¶úüDl¬Ãv/©éğm›àlØƒß´®ŒNyPs2â)ˆñ\0¸{œ=E¡cÌÇŒ,Äu°#z¶í ¿AˆcÆ\n¯}ÜEB÷DWæflxÓ•>.\0Œ¼º˜ñ%^CKñæ;áB…Fú\"çÉÍkÌà¼G$æÉkfµ¹—p\nµbÚ®ÍÎV»œx¨¥¹½_QWá¡\r]Æ—2‚ÏOúâ³¿pˆ—8–h˜Ì\"Ûö…Os!ÔÀ‹ML­É¨GR;úaôÀqsç¨>ÚúŒc‡:\Zğõr®O¿¶V÷:ñ»âºSİ‰cvs)añzŠÁ•ÆøÄÂUG\0ºé¡Ç€uÔLTæØÄõ,Ğ1*¢*ãä¡qdâcûåKf{±íˆä’®l)VƒâÆã ÇÌbâËBù³†7â91î¶>|Å_µ\ZñİYÔcŒ€L\\|²ßÆİ0k©²\r-\05Ù;ñ($(PFà[k3;„VcàEÍÉÏ/&\'æL¨‹³2z»>Ñ>ûÇÉÏ±\"zwR;£®2jaå¶Áq–òbËÜe^Ì\rG¨–\\#bUP|ÌÇİ1©&ş&3Ë±×À¯qàCy¶>fT9o›\0ºúŠëm}ŠGdÙ$@ù8 YòÏøˆÊ{Í´\n>ÎS{n¼TCöp§}E@ùl0)ƒêO:r½(~LõXG•:: 3\n\n=Ó/ÜÂ«àŞ¥W\rñô\'¥ww,[DuÓ‡d»fpCQ ßB&5È°üˆŠ,ÖÅùr>F+ÑS	“\"x»ƒ2ªh·C‰×˜¸Vˆƒ-dÈü…¬¨À·B2rÈ¬|}={şœwßqı1\n\\EË‘zh¸sfßq½9N\'üÅÇ…Å¨£1à˜8î?¥¨y™1¶&¢fvãWÌJ³ÔPâ‚q÷2(=Ğ£Yµ³¨ímd6£C³1ãTKàjz{<‹(º£g¥åRëHŸhcÖ¾&,‰2œ¬®`	÷òƒÄ¥›û*>ê¦FóòfAÁPfr†‡sö‡ÜÍP³:Û/¸üÌ-ŠØ³¨7òËöÊ–åÄÑ²ÿ\0fu@Où1„®dcÑøÃ’L4 ôíöø8ã]îcÂV©igÜÈ2íX­ã¢=Ußf}µF4\rÌ}\0ƒF4ÍÕÍÔ¾”æ ,}Ç_c\0ãk¸ŒåAc/{ùÿ\0¸¨ÃÏıÀ´,öaêz·˜ş!ÈÅ8^§q!øÎY?\rŠ01=Àngbr´ÉıÌõàD£–å†ÎLöİÌ¬îb^\"ÛQ²sN ‰”ñ5=ñ¹h±ı@ÂëŒ \nŸ²,JÀZ¸ñapApú<=£8–UA¿üÈêzŸNåWÜ]”İ™É×Å5F:ŒXÎBÁˆ\0êæ<¬¢İP‚uí³sÖåA‰ß@A‹>Jl‡Š|~\"„Z.TÆêodø™]1Ì\r’f?]éš–™oVc/1°ìGgVà‹gñ¸øÉı×på\\*Ol<\\\\g9SËP ª±Æïj´k©‹PÀõÈ‘\n­À‹;4P]n]Ï[Ÿ‚ğmMı9±®[.\\~Pˆrâ?åşç%ğÂ3Ôã!¹TÀvìLFâ¬f0,˜ê&C@‘,ƒs›7ê0;şfœ}Ğxù\"bB¸µÕUêd%MÅ\'‡qWzìwgF %«CäÀÎ¯P0f&÷\rL.eÄ¹Tİß€`ÀÇ&4bUFÉÿ\0iX°º6&,á˜¶WíäF(H½¼Ãi°ÀŸÚz„°©¦°ETÿ\0„YÏ$ Úªæ4ãŒ%š„dPZÛ0 bãb’&N,Á	àµr›¡SÄ\'\"H1ò²d×‘Ø 5Ø‰hÌIÊüSU‚)câes“#9òaúTCô:0³b-*™˜{BˆŠUf\\–*6¬f}¸‹0EÓzdûb×s\"6¢¶\Zaò`@€3 GSâš\0—£6ÄŸƒQú…VÈˆœXİCàÃwÜ¯p¨B0º„a½\"Ì8ñ#}À´j¡+_ªÛ[\"cÄÜ‰&se\'›jéT™3ı ‡ˆ£Ù™sà}°×‹˜Ûš6.Åšˆ÷°~ao¶×vGğaWûÊkQ±sĞîi±@FÆYH&\"Pª+RÅÔõÙM`şÿ\0ÓdP¢lô#1w\'ÄFdêÄ‘¨^e\'Mæz4şâ±3\"æÅnbfõ™YÁ‹˜æÄ›<w6I=Š¹ÈXn&ñdêg¸-À× 7S\Zøv#â=«\0ƒà\n‚’a–lŠ[Vv Èk³|ÕüÎ8kq½%²‚oKø˜tfWÖê?¦Y©Æs\\€+u0£0¶îú•(ÖŒÏ”bBŞa%‰\'³ô2¾‡¸>¦x–81ŸpÜÃñ°;˜ÑrD^£ÔäU¥[X71e(ŞßÚ£)«4‘Wí%Pšo…áöIÒ€& ywâ1~å¯“mˆS¸…˜ƒ\ZX$x?‰Ä1b,@+³¨IäNVV—ùœº…\0j&§â`+wñ+G“_æèÿ\0³À4Ø•Só=V_¹”ü!”~‡éæèÍ“Šqù€ï¸r\r˜]›³\0,fUA¨Ù.eõ.Ã…êc@7äˆ¢ˆƒ ËîÈ\n0\Z©|²S\n•¢<˜¤«B)ä\rpØ7«ø1TkÙŒ€°=N$?êŒ´Êß>%QĞìBâŠQ=¢Ä\rB¢ïÈƒÑ®´e’›ˆÀP®å¿ßÊ+@P‚ÙˆĞP;C¡¦°f0=³Vnz¼á4½™Üê^åÆúõ\'ëœ–mJ#±ôLFÄÆ‹\'!Dybäy>@¡Ñ‹…®ØJ<eÑŞE§ÂîR²İY‚À±ÕÔt¯Îæ\n[ò&@J€5P7%á{Ïò\0¨Ä:~n1È+¨wÇrr\'T*1Rœ€ÜRHc8¯!qøn°.Ä?©j¯`üG\"âñM\"„A@\0ÌÙW2Í29Èåô_Ğÿ\0Iú\ZfıB ıL-rj+ ÚÜG)Gâná3±1·\r7Šš²n¦2Ãù32†QT©Š³…\Zˆ›¶3½	î°j3rn1¯ˆ* edTD‹XËÄSw8µ\rhB*¬^»M{+óhÖş +ÌÌeHĞªîL§³°+ñ0r}·ˆÕÔõ¹ÆBN„Cõ?J‡úĞ˜ëÉt7ôW*£‹Yø‰“0íDÛx£?È	vÒ÷P×P+Ğ¨	c^*\"ìY2‘CÄn\"ÿ\03Šñ\'³XQã£¹Ğ£“Äñ»­LbÅµrœ	än¢¨Öõ}ÂPèHïò\"8©†Ùˆÿ\0Qq„j»Æa÷@W¾ÇˆË—ç¸TP`P\0£=f`˜˜Î„¯¥ı0O0Â5ıe¨;1rã_3\'mL©°bä%_ºEıVLÊ÷\\\0_æÔ\"¹IVk¢#\0lø0j_ \'C~ ØªÔı\Z3³pmOÌ³f¦0XÑ½ÍJãøã›3\"Š×Ä¡£şàÉÎ€=İBHİLkøœ¯‘ø\Z€\\õ¹U™T»ş‚a—ô½Âeÿ\0@Š¬Æ€‹ƒ!½CøòâjQ;©ƒ&³Ğ›¿ÄPÿ\0*Èˆ*ß™ñóSZ¹Êí|0ñÀ¼È°aŠüÜkB&ÍÜÛ|§tB.¼Âµbª‡! Q_[ß‰ ˆ·äÄÿ\0wÌ”â‚Eâ*{*ªæÉ64g©µ‰˜wĞƒKúŸè?ÓâaÁ˜‘t\'ÛÅ•:œ¾ß,G«ÔlMËÛúob•©ò%Úš‰Ù7,]K¸Æ)‹êò*…;_‰‡(ÈZÀZù=Æ*Îª7qu`Q î3º‡ºğ\"ş©ÈUÎ@¬¾ØuA@÷6£	Ğ`lNvN¢Ø¡rÉm\rìË\0Ñ‰e—w/÷¾Ş6…:™3>Z¾„S/éçëZÜ¯¦SéÆ0¡¨üŸ%1lMQ²3šañ^1h5ş ˜¢„$Ô\rK—RâÔ@CSDO³Ä–RAù‹ŸÛîKŞÌÿ\0‘‡‘°Â.LvT8&p¾â÷µÔj­t<NNÇ@Ñìl\\<ETŞÄ+DË¶ °l–\n’ÊMİÂo_ÿ\0PËÖ5ï³<ìïëAù†}Àÿ\0àgğ`ùš1Ô™wpwüÌ€8Üê	b\"ußÓ…±±\'ÄÆ_”ëâ+ç>æ@\0ó72¢È‹“3K`T9X’M“[‰ı£Ä‡ Ÿˆ¯÷‚Ïz2Â±£wU¨S~Ñ²¨,ÇT729wgù?CıúkéR¾†}Ñ^Õ˜Ãs\Zejî#V¾Lc¸ƒ“ÿ\03!¿÷.¯è,À°/Sˆ¹ãñ8ƒlŠÙ‡Kû†¡)ÇÛ²Mn#d¾\"”ñ¶\'f»˜Õ¹’\r/W9İ!É×P8SJ(ô|‰[î+Ø=kS#fu^j½ëUp‘ËÎ£\n#W?‰Ù»1lœB\\¿ê?Ô¢¡NDñ‡ÄadCÕDõb!î¥‚a=Å\nWóFÌxÕ@C@YaûA—¯mÌe‹\n¬ùI/–èö|Ì¼›(ããı	Ìûÿ\0&r-@‹®¢á¤,ÍJ<Sbä½ƒ³8­\n>v!Î˜ı«³ò!rqµ’ÇTz¨8òUÓ…ê6$OÖü|ƒ‚µ7ª\\\\”-±ÛOr¿¤ÿ\0@ïèGÑaßÒâbáwÜQ{M˜‹laDS	ç+†/§Èq‚ªbT¥,	`uŠ_µĞ‡-ƒ|¸B£ÚÕvaeQl|˜‡‚m(D˜2ª\nEüùœ#_/=˜Ä#»£]ÌJ\\yÙ™-–‰:<Å¥Bªş:ü™É”AÜV±áÅof$jlØş.”ów2ä¶²6&&dÈZìnfÆÉ_Òzú\Z‡úÔıL0}<Â .–\r’b{C	Ñ€EFøŸlû­€ˆp­¤‘³şöPËPWC¨Ìì8;1B@Æ}ªº„q$“¯ˆ	)×èÜ\\m™Ãp$\\Æ¿t²ªÒDş`l™¿´ÃBM¸\01ªìÅ¸1c_˜Êdv,=¡z\'ÌL˜ñ©\n½›KHÔ³4U/ñWÌ¤®$í¼ÔFÉˆş®‹Ù$Ax·D×.#ª™ÊéÕâç!åd\Z=38Êr Z\ntß3&7NÁ¯¥Ë—ô¹_?C\0³¡\0²&ú+¨â‰¨@/‚ÿ\0$Â¬\Z3`Òö~&5|™Bƒ_˜\0l» ›ÜtØÕüÅÊ®šï2¯İÈ>Ø×‹ƒÚ8…f¨[‚ó;\'ÅDÌÔÕˆœs²ğÒ.Éñw©dFU bcæ¡Hn=|JVõ,Y…\\qƒÉÈón‚Æe8~òEëª™r¶f¢BşAœ¬ªf¦\"Ì¬Ç ›–¿\"dWÎÈk¡¸\n\"µ¹>(GÈ	\rÿ\0ê/ª”ÌÚRÆ…\0&È™HqIàîZî€¡ù\n1ı:3\r	ÿ\0È5V!ÆÃ°Dã+ê>€}<Áæ>¤İE%@¾î7bå]0\"×ñ0”<l_Íš‡íb%ËıÔUnNU€ ,ş TV$›ÏQşİ[o^ rÀJ€{‰/Û.¬‚FMjÆßPp!TO“Q³Ä1 #Íˆ¸–köèŸº©ö…<¿G\0-ò¢@¡-Z€=Â£·:öÑî¸×­1!wâwÉtN w¾‰tz©íáí$€SU\rÉ€âı›ÁŞÊ’	µ¯ˆ«É•l]ÄôxUU²ß>û¨¼·ÛZ??3)‚NÁ„…‡ˆ?x/ÉjGÌ@¥[Eûhş•+—\"ì™“@ÄTÀ„T#é_B:„nV¾¢T+î¸Ä“QSõñä,€L\\hÉhOï)-SÇp r¸¸nìşjYsúB‹£Câ /¥»\'ş¦d .5T”GÀÚFàC’É¥QTşeã²ØÕnÅL¼B?$yiËÅlÏûP±S\Z¦|”´½èš§Š.€}A»U\n˜2*0¶µÑĞ™Ps÷°º]ñîr¼uWq}l€}Æ\n£ \'ü\\ \r›‡&¥\0Ül¼È¿‰ˆè‹vÌÚQaz2“u	\0]D=ìw2œkˆşÆ¢ù6”ø«£š\Z—Ì¹_ZŸˆè™ù0UoÌöÌgLÆY10—kª\'â¦#A¸¨º¸¬}à¹äÌjCk$hÕù…²¡`ºÜ&.AxÑÌÂ§™.¾1×í]µƒÖ n(è †qcö‹éÊâäíÄŸ8›Jâ½İ|ÄPi	±ØED\n‰g•,ınµ)Ñì‰öƒ7KÏàˆ=Sz«³_ı\\oMœ·õä‘0ÿ\0ccV%‡dÇÎæÅ\\•Oâ£¯¸Ãİ¡\"ƒ¹›#ä5~ß*Ç½TıCb0¢–£äw\n€XØ}Ã^Æ<›GÇñ1ËöJ•$dÏYŒ&r ƒ@MıFÍÊ•©¾¥•¨v#\Z0uºŒhPèE‹˜ãû‹CŞ”fÊÄªù«…ñ{õî:Z™1eBå\0‰™}émv,\Z‹İ¶ÜH_mş!rî[#ÇQFRyób:«ƒ)&Â’Ã¯ÀœÙ‰±dY¸üJ\0Ÿr÷\n²-Y¿#ñ\\éÛæ÷^C­“Ø3¥Sö™Í¥Y¯Ìû«k\ZOÄlÄö`-ª{ƒÃ’€üõ-qĞagædÈ÷Zß3\ZP\"“~è»\"u@JÕ@AxêÎ¡ †jñşâ±\'¾_¨ÆBAbæÓAaÍöĞ¨®TKkşå“=Ã„½Ns—ŠÎ0®Àù0ñå³…ŠêU‰×™é°aa–@Kxø˜Bâ-Í¶lU÷QµÄ\"›#ÉŠ3f[$P#ÄÈÜ‚z¯2æ/A¬(ı5wlFèĞ5Ş%fÙ…xƒ’AO`Ü9	eP·â€¯ş§ü\\Äa<ÜÉèÏÙö²‡‹‹.724dû…[ˆ51ûTêŒ»r#l€M	TÔ§JyL™ƒ\"¨£Q²;q¡+ÈŠ¤•»QèU{‡BÉ\0.‰:2™êîÉ®£[SU­DEJl®Íjd•Eµ–½Ÿ™‡6,Å›Üú¹±b	{¨åÿ\0©dÃÔe@Ó•YüTí¥3ğeÏCÇ›xoŸˆøo\'Ü@ısíµ•šÍßñ@\n+døØ¡2ú\\ÖÅ¶ÆÉ0ŒKvûø™ÔP¬\rÇÅÕîOÉË\\ÿ\0§Â;$™ˆª±şÊ¯ædÌÎH1*A¶ô.âßú„ÊØ`y—*\"7¨j¥XÏ“!÷˜Šj}¥zÇ)b1`u¨ÿ\0L!•º³^kQ\0!¶7Uq•Ù”š+âüs#÷1ğräƒøÓã9”ı?ù™Prosõ¿üEËÃ\Z)ÛU˜ÃNĞw¸şİı¶×æ7¦Ì»ãcñ*¢õôİÎÏÀ‹T~a¨uâçBr†\n©è2ñËÂëŸÏSÔ!et[ÅL!×\Z+è¯qŸTš…•×ªŸowù\Z¶0sf³ÔİÀ{©Îî_Ù5.Ä¥î>UV¦a¨ş£^Å„ä;å¨ª<O¶vI”<¬E!zœHÙ¿Şf JPylê  äu*^ µy\",Ú,µæ6Şşo¨KóTPt¿›†òe-~Â68ÛÛÙ™rğUUamÉÅ¬ŞîIQw)‡¦ò-™ê=9KeÏ0êçFâ“,´=şğŠ‹¿ÇÒÄ²¥YM07ÔœÈö½ækî‹Ù3Õ…^.Ã®¡äKû	·¾@õ(CpòºPUÑŸ ]şĞú@2„€XÀº˜ÖÌ#ŠDV¹@ò\0÷9V»ùŒ9gQM\Zº«†Èb@˜É,À2üİÄÅıÍé~.e¦n?kIºäÌKÈYû¿oÄR1/¶¹@I`Nõ3=öL-Ê‰ñ\0ÌâcUq7moÀ€Š-øê8ÆênÆº3>Ş?ORÖ¡k1E÷L@ƒ”ÿ\0Ü`Ÿ´Ğ¡(“Êq±Õ2’\\Yª*¸²¾ ÇJ	şfL¸ØíÄğ ®Dÿ\0½~: #‹˜İr\"°™NA®„`I!‰0b·ÕEUQ‚`\\UE‰G¸8İr¡QòwËĞ	û˜ÊÊ¾Öı^*W%®Œµ/uÅ&rÜÂÆÁ\0ø’±·\Z¨®ï‘Â“@U×˜0»9cóİÌÕI¤{¸]QPÍïâ)¶\'ÄlÇ‰¡ºŠ†ì÷PŒ·DŸy(£Ñ‡ª–K+`w=B´Ä)jåŞ§ÄQqC-Ù˜k³?™]\\=}\r×p]AûY…MJ…L+=Qd>v!^ju¸Øü¨İqĞ,;ˆÌkP’TßÌâ=ùœZ‡,eVÀöù¹hcñäCÍÓ—ä\0Æ§*’49µÇÜEªã¸Y¯í‚v,ˆìdãl{\n#aÌ4U¼yùŸcŠÙ=› w>àR)|Tg?ïäÃ”†ÇP±mB*¯Säƒ¾£(Töc¹ÒÀÖeküÂNØô˜lÿ\0XÔõ›Ò»ìy×Ñeûhy0ëıTB sK4|OmWĞ0Ì¬B7º„}Š0aØ˜r‡@àv&DÈÂ›¾Uøš>ãª`cæi>TÎ\rWÆÛÄQJOÄ98ôön3İUñhBÀ±-ß‹‹Œ\0ÇŠ»„ğÄjÖÏK3\0ŠóBqÎ^ÈrL8VË«•(1¨G,I\'òfFH¸hn¬LÌH„]Ü]òñQEèÎ%XÌãÈîø€·º0š²ıå’ÅVøÑ±_²iwãó3òf#ˆ\0/›5=_ª‡\n\r\n³cı_¶áorŸˆ3(İn\0%\0Ó›&*İĞ†êy„Ñ¸7¸XOÏOê>É ş“2€QòX³À(¹Áµª€ zOš¨¨´S/FµÆ+­0/ÄŞ¬BmÂ°%z –Æ6*ªcpªy)\'TjÎ€Ö6\"ûœKg6ÕA‡\'ê*P|vb:%5ù0dV§Ì,HÙê>USÙ&[’|FR,Ş¢ƒA„±gRŒãcUuÜ[³pXİå‚H¨çB¼ÔÅÀ^ßZŒa@óşãgQò7éñ<“õÃ¾Mª‚;\"\Z@<¡\"ô!²jQê¹PÔ©é˜åÄq_¹I3&ªŠ¦Üw}hÁ‘Cuùò\"ä\'Jj‰Ù˜Â†¶Ë³ùƒóÈÆl8ñIññf+Ó5¿û&>GûİjüÅGÉ^ÀÅÌ¼¹ä™—!èyÂ¶gÜüâ>w·Tb¢qZŞ¾ä\",ÜÈ»¡p)OŞ?À\'ˆGú…–ÀKÔ*Á¬(,5¿™û~á}“ŒhÄ¸4;ë¨ùrdIĞ7PFôOjNâ~µö†üCvL[?¤N+u{ú3\\&Î»Š\0ììÿ\0Ğ„y3ñâ%TL‡EqàÜn9€bF\0ßÅˆ=><jŞLöTâ¾Dk«zk#ûwâÌÿ\0ŠNCH \0,]ÜËé½JáT–ÿ\0ù=¥pgØ=>Ò!n#Î§İ*ÜTÌûœXY™r üˆÌOZ,u«‚ùN$~¡[”~ £wüFµm¡\r7‚LUşíOf&à4ÌBZâ°,,Õ[«‰‹‹bÀ‘±ãGm„?©9t4¿NŒ«ƒd	a›ğ#\nc*È©ÿÄ\05\0\0\0\0!1A\"Qa 2q#‘±0BR¡3ÁbÑáñÿÚ\0?\0ÿ\0iû™‘0ªXÆj[˜Í¯Ò¬À73m	‡—Pv„‚ño™¹Õ\nîN€¡úÎâ8¹”\"¶KB]rœ˜Àä|‰Ô®rÁ›&¾&Uf¬Šî{Ş÷2f¦Æ¨T³\rı„&2C®M0ÅÇúiºíSŒq@ÂFWgvNûÂ§3X]Â\'OxÛ›\n\"¹ÅA¬ª“¹ê&Gâá­¼Wpa@\nB€\"¦!²Ü‰\ZŒ˜ƒ£eu.„TÉ‘ºTĞ4fAE@Qzˆ9ó¥\"¾f5 VJ¾Âq!¯½­YJ¢‘äŸ‰ÏL+Fd¶>\"|Ú€Œ«Œ’4\'Eÿ\0Œ¿üŒÌìÆ€5:<Ş&uhJ‚;Çõ”wr¶(ÊSÑQğ!{j„{@É$º\0A¹¨ãşuc\ZÅB,™•Â+{€>ÅëuJFĞ>yÔ©Æªˆ|ù‡dE\'¨â~Ä~•;6{ßÈ©‹\Z.1_ó&\'Œ­¦CGí1`Çˆ¨¦5±¹±¹QdÜwÆˆ( äE|y2ÖûéNÚãõ91ãĞ	CV.æ. 9®™»P™pn`(¨Øò#2e¥#İ^ç(©Ë¹ï1àâMƒ_$n\n©mWØL¥ËR6&.kJÄTô¯‘2c ºDY±ÜÌÚÕĞˆƒ€\'ÉÕÕ$ÌÎÙ2_š\0LX•O=n¼@pèö&{H©Ôôdµ©5?–È^•LÇĞæó©œ‹bs‹ˆr{ŒOsË÷Baj‰gpµå‹38^ó™i”dTä&B…mıÍágL0FeËÈ\"ÍkÌa˜\0JÙ?”D9_#.!^ïqÑ\0“ÿ\0é¢ª+€jznAÉ‘ªû	˜²Ÿ“^5S¶\rŒ<]ÄÊùQŠ¨E_b—¡À3.bk$ù˜øánG‰6mÏO;q™¨?+â×ğe\Z6MÁÉ€\'sæI·q2\'7Ø\Z$EÄŒosÕlyš½—`zçÇw¸2‡Síóµ¾íOiÔdöèN“õƒ‘Ø\\9«¸™\0cÉqò¾D\0é„ÃÔåLD›ä\'LÏ“g1Š $Ïçq™”ÁtXÇ4	8<K]ÎvÕ(E4¦%œ„Å1‘²=ÔTT¨Ë•™€\nPv¶8­<ù‹‹ÔÌ©‘ÊŠ°	Ñœ]ó\Z®\"»ö¡3e*÷{vcbæÀé8¯“›&~%€R@\0÷™F%Bj˜ó/P¥T‚H!ôr:Gš1Gr*®ÌÇ•7¸‡È:ƒ6.DUÑñ2ä9Bã¢¦ûüAÓªûÏvf6õ²vı*fVáAì“Ş·0ãÊX¡{ûÔ`UŠÙ¿ˆÍ“#VÌ<Ş¦1‘¹)<«máI™=CÁ0•ßˆ#3z€X> É‹Óm@Ë‰‰+|§I\"-ñÜwå’ŒéíS^ñÜùIiÊê¢Ñ0¨©Ó08–§W|.dÇ„›3åÜä|ƒU¸ãÄÇŞEq˜‚–ÌÆê×Pš?Ua“´\nçtYùiˆ#©R87ØøûLˆRÖEY«‡ÒLJ­’è	ê Œ|\n°k²½“W2¡tfåo²¿o‰ß‹ŒŒÄçâzÊ¸Â€[ÿ\0”À)X€\ZÅƒ0ã²NDÑ;™F áp  SŒ‡Ry©ê–k¥¦:½G9®çˆğ&,¨ÁUWÁìcEPó1³ãzÙ@{üˆ«“+±\0K¦¬wşñˆT ÆşÑIôªÊµ÷ûÌjû‰äOºd,UÅQåâ3À1«ƒ¯3#$,éq¹€¯1ú~(8x/?&¦,r·´L]fŸÊb˜ñ”ê(Î³ƒAlCO”	›–c^Y\0\0ŠÌ(	Äµnee\\`¨ÈÙÿ\0mN™i&V‡“:‹XøıãŒã$lŠâ½„Äãy±ã6f_÷5ş€<8Ùİ²(4¿ò¿37<¹pS	\r)½©Ü|Çq•ÙTù7		U”üİÅ*p‚ª±îOyÓõr=Ôù:û,âÖ+.sj665­û¼ìGETàÊ	Sw2çqÈ\n7WQÆ0V»ø¸ç&E\n_x«HªışÆd#RE†ªˆ–®èÇOTg¦Y»ÁŞû7‰IbÉ®Ñù6%¿ÿ\0c8Ø5Ûÿ\0©êpÆËóæ Ö|UOá˜h>JßˆPgàFã`Æûe\'QÓôú:‰Ö®bÀdâdê:¬-OîO‘3uŒq+ánİÄÁü@ºcÛ¼Ã•:„äÀ¡š1÷3N›³9œı¤ÌlY»E«:™2&=“2õG#•\"R1ä\\HCø™2³”äàlîu\0P¬MPòbãqŒ³¹ö‹â6f\\£â8ƒ#ü“4RÃ¹\0lÏM›?3ˆºñó|TQL\'Úå <,	Œ8{<kˆÛîfnD L,}º5z˜=^l¡l]\0{Aƒ¦bC­›:\Z*¾ÑÄy1óQ’8™ê»eä€]UFÈ”ApÍ{1†:öÑ=ûL|X“wØ\0fØ+7a½GãÜí¢Â®eeeCî«íW+d–¡]§Q“Ó€Ù˜rdÊ eZ32.6ï^Ø^øOÚrRì«ØÚ¦\\¼‡a—tˆS\nÁ‰ó­ÂÚ™IfpØùˆqà½C½W0ë\Zƒk«ñ8P v3¤P¸ŸÓÀOÌ{¿YEzp%µTÂ¥a4\'Rç#RI‰…±°vRÀœÔ5PVGÉÕº’T)öÔNŸ–Ø’l÷‹E3P·Êˆr!z‡:È¢3•rxØ­¨=çMG2À(aU1±b\r…İ‰‰ÀÆ€Äÿ\0i/*ÆM½š©Ò¦fv4¨½É»ƒ&%öašü|Ãˆ£’Î9\Z¸øÿ\0;°:\0óÔÌÊ1¸Øíâ£ô}J‚l3ØDæ2µ£mEŸñ8cP2¯€u0g}’”µÜÏHf°[ÛâÄn¤aÆô–Ej+\n…2…\0åä9w>4ºØ3fVEÕ2ˆ%E¿q1òÆûûNkŸÃúS\'¨GµbŸ¯¦›¡DÌ½Vü¹î èú•ğ?c=,¿îCWpgE˜âLÎ(\"yº31\0¤—‰Ü)XTô‘6ª!D\0¾R?IÔu5Ó…—–ªâ‘Ì!÷U¹…Ôm9öĞ“Û¿:\r ä#”\0Ÿ\n£ `#T[\Z€ÕÛ¼ÆÙ1äÇÈ®ó.SgTæìh´P¹=0¬¨øò)#\n‘ZÖ„l™q2ú•DÕ’&A\"×:„÷5ôà*‹^Ù¢ulª¡ZïÇr³&AÍfî~\"Up,{\0l¨•G([ÑÄÌËÇwcÿ\0w©OUMÔsx}B*Àÿ\0¸ŠY½‚íˆc_cóÈ<N^š†m4\'2ÌAïw[&@ y˜±ŒXÕÒş£è@=Ä\n ØQs#Û5Ó§Û3‘ƒ´Å­ Î:±: F\"Ä÷0²ª³¹¡:î¯¨CqÊJx˜s\'Y‚š•ñc,(İl‘1³¤¡\rîĞ_~ıã6@¶Ô!\0\0/¸h|ıâ³\0¿s¹—/ ªàbA° #…š8÷B¼Å_\"ÁğD\"±™NLªPEÄGW¼ p\nh(©“:0\\xÓ~<T|Yr?³JÏ(0ŒÖ5©‹¦É‰ò¿Òe*	°+ÌÏŒféÚšÑ”\\é‘_E\Zñ9!Ã”ç.<OØj1¶mö\"•>¶;ÌÙL„¾=¢jœÏáØEœ¤kÄ¸?Ñb@#ËD@˜ÀòfE\'@nQUNâã­ù8Rõ?ˆ½tîª/]¦,½/PUà|Òéñ)÷\"úY_\Z\rK÷ÔªW´ŸıJ,ånÇ Xx’h‰L	G™jÌV·æ¸İy^¦sTØÀã[‰Å”5µüÏ6MËgÒöà6µßSÚÇ‘5m÷ûj65,)@¡@ğH>	h¯3ù·$*à!G“3¸]U±‰Ì(+«;‰”ã#Š\0LÉEHşÿ\0peâØª¿û™+˜º™X\"ÒÖæ>$‚f>` {<À¡@°úĞCõÌâNdXÈ+ô™2jqwæq- É‘ğ@™ØåÆJ‘:oáı;lNa¤ªÀ¼×ce¦<¥¨6ü©†ù5˜¸{±6¦\0Kò >Ğ5@	„P,X’DË\\†¯{0.*Gô>`R@¡K2È\0ULœP+ÄlL\\8¿&\"ÇˆÈkü\\äê¨\Z´#òfRŸ¡•z:\"bì¶ş<N:7}û½yqº> puUöŒq:v~Ó™!õW-ÜlÏL¾}×2¹õ+†ÌÍ:<¯qïô_Aøú|våÏˆşuq0>F²¼V.$NË=¨7Bf*ÌFŒ\\ v‰ĞâV{¥\r‰™=E\"&1ŒŒ,)Ñ€Ùÿ\0¸G\\ÔØíP}ø®Ñ€e5Q´@c¨Ij @yV…‰“#~ÇÄJv¸2lWµd#±ï,=İˆ²g¦À®@÷ö˜ÏÑÙ…6NÌq^ÜÀ{$üˆÂËP+2¡ãÌ¹ö††,!ØÙki(ÚŸÔCxÜ©R§3VÈÂ–$÷HIäãK;}+è?\\ˆ/Ì­ØÃ©—¬	jPÜ|ØzŒ^™b­à™ƒ#ãÍéæüŞ\ZtİZ’Ë{‹•JûL»;‡±¡fuUÉl\\Y«ş¡kP+DË(À]vì<ÕÌnXXjfäÎ‡t&Z÷{œ8¿=ÑíXØ–6bZ9øªˆ¸X.)üŞÏŞ+‡~\nîcWÁš2œy,yœÛÓ L|Á˜ ,ÃÊ\rFê§½ññ+à‰ÿ\0(9	eí¸éù€>Ó-™¹·n=ş#ebY¯§ÄÙr\"¯˜ŠÄ?ú¬Á”ŠÖ§H)	ópİù:c¬¦ÚgÅÓ¸ş–Zo\0Â™XpÌ»•¦9Ôî`\0,\rÕã±Ê-²æÔGc2ñıÀ˜­ÿ\0ù3¹e%{7aÏ˜ùRÚÜ*Bûš¢‘Å÷æ\"ğN~Oˆ•È‡\'b*¾\'cv¦:«•st>\"1{> u¶³¸¥X{Z¼TÆıÖ*êQ%—°Œ§à;×ÌÈ(º;Ù»´´l5`›Üê™1âTS¶ŠŸ½ÑtçgaE»~ŸCøÔ~\r±û|ÌOÅöu™0£¹çŒù™z~;D ÜUË\0Ä^	;,ñL¼XzĞûÄ¼Z}6ãÅ´aF½ùï³\0jˆñ99 0\0ú”AâOhälj1‘&ï·ÚbP8†ªó2°°¢øaÈ  ãbekS£C•¶3¨6F®¦N;*ÌÒ e¨”å@ÀQ?Ë3>D\rxéyÔãP„ßå\ZŠêo[™²½÷Õ	Ğa/˜46~‡é_Aş q]Féó¿À˜}@¸…C\n\"6ÿ\0ˆq©‰>~!í	Ô$Ô=¡PgT¨Wjb5ó¨}¼Eø\'ât®ØÑœK1ânáÑ²wæ~q¨q\n6\"½¿‚Š±2š´1<šŒB–7½Æ]’¢b\'V<î1cì\0î^Ÿ´‚	\"\0JñŠªä(İûN vF+­˜íÌ3jÉDè1Wf€A+ëR¿dÇm˜ªÂ´yX?eÆX/!s’‚î;PÔÔ6LºıåÙ¯æYN0q‡­®ÿ\0iÓõ\0ærªhÑIæÿ\0€‰N	«\0CA™CU«ï)P\rÇ<ª€íŞ+]\Z¿>0CvªÜ\\j¯wÊ÷š\Zós	,”Ş.çøå{¢\'¹“}¾fË&èXÜÈÊ	eo;\"fÿ\0i\0ÿ\0¿˜ŠYjê÷:6ePoë_Qş–N«¥!ºvîDç›¤Ë|_oe¨\\}F2lw§Ì2\nÎŒ“¼ûÊÜnÂW™QDËr/\Zü?3“(Õã´Í‰ñ*€K’|Ñ9.6ÈÔµÜà°ó=ÿ\0X?(mYŒ-OŞ21Ğ8µÖŒÓ€¤îâbTÈæìŸÁ²EÊÕó€P\0:À&ÂÏh\ZŠĞ}¶&AÅˆ¡äÆ²Ş ï\\j`W|¨µİÀ‰‰1’Gsø¯Ã_‚ş™º>«»”çg¸5åOO¨ÅÈ˜údÅ¼m¯‰‡SÊ¨˜ÖE}áğ!6`åJúw•u2qu(âÁ‡ uâÊøÒG†J±¡O“‰R/tcbz©ç¨/À¡2R£&ÎÄKŸ2±(¢ËËÁ&#«\0-MöŠYíñ\n	îaì@í\0â–[¾€•JÜÎÀb}Š¨4Úíf	ÀI|íÚéĞ€Jú\' ø»çz´vÊf5æl_F4D\ZÑ\rËüèõpc©Æ§*+|Ì¸ñe²ÂUÌÑŠUÈY¼&N)şĞ|Ô80+QkbbáUà\0èŸ˜2æ^JØùæàË!ö°ctGÄĞĞ6Û(±±âåLLê6-Õ˜˜]¬(²Æ„Äƒ4O€ú·/è é›—õ\\Yœ1—à‹`w& ì<	{Œ·¸£\ZX’¾‡P˜Läg™ÈÌ¹W3¹¥É‡­õ.g\'Éì N}Ia~Õ<wıÉˆÌ‰f\0kÄ!9 h_híj¹Z…;·\nùµ$‹Àìa*ÈPŠĞ\\DÅ‰œá5­™‹)|lÔCvyPİ<VN(wSøv¸!îÖ?Pw›#qqª^L„Œ[¨Ã´¢ĞØo¡1„ê:ÜÛ1=—u:»ÿ\0Z™¨cíÉÀşLÎÇÁùäær\\dÇV%¢\'¹»øgíø¨W\"­WŞ$Ò‹c[06UËÅˆºœšÈ\"õßU5;\Zû@¼²ÀlWxÊJ3læ¢äËkÁ.ûƒ¡=fpû[V#ô§¨D÷PA€\0Cı/€Áô©Ïª1ñ<Fj°ÍêTúşz‘Ó–<êïÀ™ú—<×\rrDışĞŒïAÜİ@˜6568óòg#LPY?”EC ï±àCLôÈ\0·\'s­×a=U@GZ®„ÕP­¢FÅö™‹ÖµÚ!\n,²!%œ—ÇñFhÕ n2•eL™›Fõ¡e¬ŒH;‰é¿9ßƒ	R*ñÑætL˜ÕxHº§IŸÕÇMa×GèğÆ!?Pw	dÃªöVàî!1ób[·PcuŠB¡`Gq3«/%´(lD‡GÌ\\üñ0áÆNLxù7“÷˜yïâÖÆ_ ®şa`2VÈ1²®+Ì#B®d¼|9=äfº¿®<õ\"ÌùiI%EßhÍ—Ô\n¢şu2Œˆ¨¨ŞòÛ5âzlìHÕÓH(ædÌÙW7›®Ğ‡-êkŠ™Xò²1Ş»ˆéV´(ÎnrT Õó>,ÏvÌ{xıLpè2»:\"Ô{ˆñ:D?\rÈ°÷	‹6<ƒGZ€}kéãê!5.åèı^ŒS`\\ãW#¨M„ ´äïmè>~5cLwÂÉñóúx©E\nöÀÅÕMñı£6P^Š›º˜ßÒCÌïÍA—ÔôËÚ‹ƒú¬Ph/›‡\Z-^C¡æ„1Èf4À©ü¿\'V –\0lÇâK’œˆäyÉÏL¡E5‹•:ö/{ù˜Ğ¦W,ö¢ë{ÜÅ0¨*¤ß‚7\nQ-»\'BîdDVU+{š/m˜İ0‡U7½FWÈG´Üñ¨+ºÈ×{œ½·ÉWfÉ6\'VøÊ¢©¼„w\ZÔÛ\Z-“Ì÷³äÇÁ G¢\"uYq¥ç_±ƒ¯ÇjXæ.djâÀÎ_€ş-ı@«Œ.ê/cS¶æ˜GLŠî·_\0ˆ#‹¡^lª$,I4\'\'t\0$øîbBšxÈ€ ß»GÄ_™ÆÜv9va\0uyRYÜ€/J&<•²¹°7ó–%Ux‚Õú‘8;/¹ØqÙßy‰‰Ğ[K6{À1‚Ê©î–Èèòß¸•ÿ\0áÈÙƒªÛßÌ`	_j-¾óÒJæ9Xm÷0ŞêäÄÃŒ×>âÿ\0ÛPU!XØŞ÷ñ UFÉÔ·0U‡“_¼(l3›\0Râ23dÄ+UØÆå— ³ÜnĞ¤È»\ZıæPyaV½ß¬N·:‚8r>Ÿï0õXòB9À‘qr#’·Òÿ\0‚ªŠFìD^ÀL¸Ãf\r@°g7õ8¸ñŞZ£Ó1ï¸_‡,Ü´@Qö¨K6XÕ‹?1ÛÓ¾UÛZó0ŸiÈä³Ó©dc#`,!f=Øÿ\0‘g¡é€;ß·w0¡åÍ“â1¼„±\'zQ1qcılÖã—Ã‹ˆW!Ø€9`¤’ÕŞ!¹³lhOHº–½ŞøûÌG`ƒ‚kîæ‰ce;*9wí_¼şaŸIIrwz…³>ïÏÈ\"‘G‘\"2…Â¼aüªÕd4nÊ©eœÜ^™‡v£\n°MÅ,Ä‹™/jF¢\"Ñö˜¥»30´µÈjçE˜«ú9²,Jÿ\0G¸ôu7¸P©ÍéæAÿ\0% <İÆZ*K6{B€!A\'¹™jÉ	±ã^\'$‚|lÚ^,¬ŒKr|\'Pö!íÜL´ã=´@Ø¸§Ş™Z©â|Q‡¨ç˜„K½Äùœ–¨ÍpLû*ş#±ÛşSØšŠ¥ÙG:P[Q™‚–DäÃbè20ñù¹üÈ¾4w}?æ£gÀ€ÇÌ‘¥3:sÉëPÍT>\0˜Ğr\níw8…w^:kbe.L~ÎÃQIT¦:¸”5½™å[\ZÜg¹Œß+€†Ä9;˜Îê¶„c_o´Wå@\r˜ü7½EßıÇ¡‘:„`à2…YĞ;7Omÿ\06ü7/KÌ\Z1E‰[ï¨›òaWN¹N›´c@y±27$Uªv\0ÀÉIohÙbË‰Ã”Äx™…¤ÇÓFªîãeLh8§5&Ú¾L(WŒJ½}ÕÂs’--ø5‹\0‡şÉ…ñ!ˆ¨¶­y=/#µ•^7£L|©‰ã]«WtVV .ˆÖ Ììîˆ¤7Ë}ŒÙÎÏ/’{ÀªhÃe¯·hJº¡®İ‡l»€¹õØãbº®?¤ÅÈdÆOvŞ	˜±áîb~oÌdUPPˆXU¹ù­ª»9,dÒâ©äâg@m­VÆì@G§^’}üjcÀ¥!t\0<Ô@ ! ç™ÆWÓ”\ræã¡NîvüN£\'R3f8€Â{™yd*TR­]Ê“ä`@mP:œqa$ 7G±º0ÈœE¨k¹ø˜p*m15Êÿ\0õ\n&E vEÑùˆ£Ôp‚Ù±ŞTU°EN¤İy³ãûÅ`{‡3İ‚Ì}BX3/‹;¿ıL¹‘¯¦]Ÿ´ÆşÇ@Ä&%ucÉ‰¡S;2bJòÄ…Š;¶HØœ¯jâ×E|ÁÌ°ª\"cÃYß)±ÉbbÆªx\rËUCã´fÔ²tF¡®äTäìtlBI%k·™ŞÉ6,©È\n/F-®öfWÊÏLh6…ı¦0çÜÁµàÄÊëëàpl@#±Ê†T¡í.…n‡Şça,Ê>eOâc\'<D5-ÜLåÀOD†²JxıáÎyd«@Gà‰—«TÊ%óNŸ­ÆŞš…aØ*S©\"‚¯’LÆ˜6¨^U¾7Cöe#*¼A2ãVÙˆ\Z‡†R@$è™¸¶îÑÑr/\"ÄØÔl9FL|*¬)AUòLüÊÈâ¿ãûNŸ	\r“%}—â.[“û5qãÁÁ;‡)ÇîQ¬Ûó*…ªmÃM+¢İk”khı¡Ê\0p4ÓíYÑNÏc2d>ª.5$ùäÌËDóÛWıLHr¢ª‚‚ù¡ßpôÊù˜Õ*ÒˆW¨ÂoF\"¨y‹×:¥æÄI®ë­éš~\'á¥ÃôÕNÂ5è@a;Ì¯§™üSÈ˜²Uğoóñcd$ß’Hşğ„á¨üÍkqW¤Ä€GŸŞ&&XXˆS›’»ÚïŠĞ”Æ´¢ØÀ‹“ƒS.,“ˆø·Şq\"¬ìTÍ„å\0 !\\ÊôòÜÔ5=2Êx)ßo:{#›v*µ{¼›ÌWADŞ˜27õ;ÂÊËBØÂÄ(\'[’ØŠ×ÌÈ¨Jå_ºû|@Ğ{ìˆ™RøÑöïÓâîMY«h4‡\\T}¨˜œìä `\'M„5–6Ulƒ3‚ëvNÌP´8ê†á7äÜwö™0©Vä»Åşg\nÿ\0K!\nOc¹Ñu¥ÈÅ”ußæxƒsÄa¡;Oı@lÎßJ0€Á•…‚*7Hİ;]óJ;­ÂäcÇZP\'OÈ£ ®ıæ_#kU…Ê‘ÅØj0BÜƒ{¼Ä\n €<\\ä8r:7°tä.æ9€bFÏÌï!İÌ^˜äB˜ZÛS#P\"oÜÌŒ¥OıKk¨\\~Z77ÏüAÉT\Z—~AÖê*§ 90Õ€<Ì R,|1º¨\\`?0òD[Q¢,Ş)£E”•=«SÓÕW°jz…˜€ï¹œk¨r	­ÌIÂëeÌ\\~Ÿ0+Ü|Ã£\\`uğDùò3dáòXĞ”gd™ïFVÇFÎ­õ™±8§ıD£p\nŒj9™˜®3Ç¼\"-‘ôÙ¹c´5Ø‰›ør±OL€£eMî?MÔãÄüòÂÌ²cK~\0‡¤ê²1<+îLÁü?2µ—QcÆãòÆì¯1ª2rå{€Ğ@å%>÷ÜŠ&ªqcFãäw\"¦OonóŞEñ$Æı@±d±×ˆIÚÙ_¼ÈüÍûÕÆÆxĞ CÊø† ê‰f<TöÄ’ŞeÇŒ¸‰ØvœÇd 7>&RîH)G‘æzNøõt«±äÜãÆ\0Zk¸¸Ù˜m]Ô|¢€@ÔngwÚ6À¨1‚I\"#q°ÍÆàÌX\"\rv<˜á8\rÄ™Ñ°^©,‚ZÀ×nò¼ıí3ÙĞú\\ş‚®e‰f§ñ\0}™nÆ&Q¨Q¾%n.`v6g_däUOi‘QA³\0PÂ·©É÷­Ô-V8Îw«¢!äÔÍw•¡ûşæaÛ\0{Ñ;ÜàÜK»×ßï”R¡ƒ@‰‘Oª¯aUv˜¹‘ˆ*V¼ê¢—vU\nMi‡V4õ½BÏ’…vÀÜF=\Z-â*q6Ëfãäè]y€Zª‘«»Š£d@^ëÄ³Î®Q0² èhíÒŸû„ë1/!çÇĞÊÜï¬È’Õ©³;y›»ú|BE@u `2æDq²Ì\'Rˆ²^ĞêtÙA<I\0şğ7¶ªå#¸¾Ñ™\\.ÆŒ§Î„äYÂüÀ·¢l]\n-_mƒÜ@AÇ°!,ì€ä£ÈÕfÌ*š»–×øŠŠLœI u…ñCeœ«N¸İ“\n³5q*ª.Šï`T4l-æbEQul{Æ5Æ9\0 Ù³¸Ì\0µ¶QgU9q¢‹n5‹âc²=ìyxÔ 6Œ‹›s÷ßi‚Ğ@l’ON‹¡*Éõ»ô©“òÎ>Æ1ºfc\\µ,Ïu¥×aTÔğu\0±Q…@óëz1ÔK§ªıDÁ®CŠˆâ“^\"dWfÈİŠŠAa¹eX–6&07»ù¸ÁÕ”„ä¤x0\nFuaÈo¤Äá»i¼Ìª@y4}·@îMÊÓ\"VÈ¡äŠ‰KòhÜ%AcËÅøé…ƒúÿ\0ù0ñ!×‰‹‹\ZGr	nD¨üÀÄ{¾bÄ7}ÄvU.‡Ï™Äñ[2é–Çh›`ñ\Z¨}á>5R½·£gÌ/uædcC_¿Èó¼—\0Ö¼FéŞ±\"rd7ŞQ\n¢ì××)ì Cú3ÎáøSBX%ÍÀg]‰põ)›ı|‡Ü¹ÁvgĞò}Î ôÉßÛÁœ@Ñ\0Š‡Ìs‘¬*h_ˆÇ#\0RĞPÉ”+e_·ñöGb®´Æ¨plmÕ#ã¾àJ&Ÿ‘:&„8ĞUUWeq¯f•E‘^|O{5ìÎŸÇ€¾O&\'NŒUè›¸ÏB­f·<ø‡†PÓŞHs\\j¦ÿ\0qQÕïQßÀ06¬´Mj(ìÂãC‘âwƒ!\rqO¨Â“ì{¹‹<t@÷qáŠ~¶€jdÖ7<Šë¸ú÷3‘«úPIñú	géŸÏ…ñŸ#GàÌ£9fÈ‚:WSğ\"eÉ|òÕ\0j¼	¨Ç`ú…O\0²opuo±êVî€7=Vt*ÎÄüU0¶d.MĞs3eF¡…j¦RÅÍÁ‰[<„Ğí9ŒˆÌ£·i†‹VÇÌ\n ìÒ3hÔ qœƒ~v¡H$Ş¥‚#’•ÇcÌBI\"·ˆ\'`)ŒßÓ¸ŠY‚ÕNê ±7ºŒ¬¡|ˆ³WP¾G5¥¾õğ&qTyOŸ×Ìéº1¹¹¶ú\r‰u1­Tü˜¦ÔM)±?ÿÄ\0:\0\0\0\0\0!1A\"Qa2q #B0@PR‘Á¡±3b$4CDÑrÿÚ\0\0\n?\0èOë¿ó=ŸÎ€*ŸÒW‰¿\"QBıÀ©_ªdÌ~®§\nİE6{1JÄ\nêH1/”.¨¤qóŠåµjƒC‘Çrß-lî(vš&¯Úƒâzxøš¡(í -v!ÅŒß¨·”±÷1¡\0^Ä,q™“=¨èÆÇÌX˜3€!\\I˜Y\" ãÆîZ.£W-n`Ú.ºùˆıˆÌ¿‰+À“rñù€·:1Ñ‡™ÏÀ•‡âteª(ËÜùrÊg\rŞç‰Ùšÿ\0lüDÙÿ\0! ÃÔK8áH¨M¶¥“ÒmŒBKœ¡Dqq¸1€\0.#aËÊŞ*^PüÉÍº\"8Q\Zq,æ\0U™K“ú%æË~ ¡*ŒqøcÛüÄN#Z©R	¡\0S´±Ä½‘sÿ\0Ïî g¨Ùq&5÷‰¤ÓJ&gäCğà	ŒÙÏMW~ï1±Ó\0[#*®ù\rÊ/”QŠøÒ¹Ü`¤n£=…2qĞ\"{FA6È”A¢%06\'¸áâNåÏ0{†çãØV³*‡ù«3Ü²ÔºÕAÚF65P¾ZıL!Ç‰\0²w\n¯-·Ô¼ëhL¶S¸Íé_xÃÁsÆ`¬m®`­0ŸÄvê°#‘â8sç‘6|,>,¬QONwÀü”tÑéÀŒÌ#õæ;p¶ xC:Ä&+ƒæiƒ\\>jq\n*Œ8ÎÈ*{œjtƒÉŠûDâ´º©Ë8:`\'/)‰¤ş§˜reóz‹ëŒBTvg¦ß1H\"ÅAsc`ÍªÑŸÌ•ó:Î¥4!IÑ›”ëünÛüàü®İ™T©_b!ãoˆˆ¹Ïòèì\\`cNÜŠYvf”KS-b{‡¸åä>]0Š‰ú‡Q€?\"3!N´cp…›ÈŠ §&·w\0şse#N°¶>•ÇRÔ)„!9STÜ]ªÛÌ	Íl3¼n½¦d¿\0L¬—²Â\0h)®‰Zi{0ªcùv/Şl°Ì.\r4åÙÿ\0l Ï?æC¿<K*Û2Ì3Ãk½	Yª„Ñk)1¦\"k#¡=L¤{¦GjÔ74S£T(êu¯˜Ö¼™=3e‰pq1ó“¸ÎÛâÁ#~<x\r1È³D\'À˜[w®„¤-´dÊÊ	câ\0_V:¸\\•ÓxødrÇÄ_hÑQÕß\r‰•#—G«`?W¹Ÿhø0Ó¤Ãb@\Zú}zp®À²½\'pğzŠ»¡\'ƒ+	TæhâS¶à8ò‚¬n¶“H³aw,D5gp°Q£4¿àhÿ\0ƒ°¿æJ·aàE_,IÙ…šé²x–W6Í\0^ëq³d–|É™†>İ“ %Rö|ÃŒe~%Ï@C‰‘}Í@Üõ³¿ªQaB{ºQòLçøŒâO€|	dû@pbÊHFİÌ@–²åDWR¶8ÆHæô¤Ì¼XÇÊ{W@ÎLæmÉ÷CÈl¦r\0æşL_üHr ÈF+êZc¤B¤ø0ãÍØ`jU$	±8bWÏ DĞ ğ­\\FG6UO`…»ˆÀì5AÀ‚û±6@…ágSnedbiE(êBŒ4P‚eòŸ¨B›¯Ë¹©¡4?†Çø]âëüŸŠ¹“\'#¥-KWê ÌÇ>ê5ÆÎ÷bÇê.!ãWl•¶œ€\\_MIQüÅ¦B«}r¹5íœ@A[¢\'º»mÅ.«î¨YĞ¯-2ãü@Èm	öÏÃäµär\\î3å¿±)¤âj6oÂá$âódGvÉÒ¬Æ§íæ\'wíËˆP‚[‚\"bùc3ğæ¸‚Ÿ\"* ÇíBy\rkÄÇ“5LGèC‰ÇÉÔ\\¸¸Xû*\n†ÖŒöÁ9«bÌ·y0‡-ó3ùjÖ\ZöL^MİG±	ÇdhN,ƒ–3ûÁÁ¼JÆ7q_V×‘)RŒÕÏÄîv‚ÿ\0ÁßùOoÇÌôğ(İyŒ©È;”£¶=À@n\'¨ï¸ù1¦İW`9¹ÿ\0¸ùóÿ\0±#3ş2YTëS™]›<‰‡%è7PÙô	S…	p¥¯Áƒ1_\rÜsË¦ÂóÇEBÙp~`|œOÕÌƒ¹ö \'“ÌT%8ò„^0HM&7\Z?CÍ…\r\"ø-ãQ†\'¸0ô\rÌÃñr1úª­CJìL¯ÃL`ÆßqÙ\\Ò™1?¢\"ªêcô?³}ÿ\0šE\r cdÅ‘W•¦7ßíéœ>ş„ŞCW=µbfWpu¹¡şKCü~ÿ\0Àü	A?¦mS-tÆ„íúUccT6`l¹\\í¶ÑC»–3.*EÙej®21œ¸÷ù›\"úQkrÜÉÑ0`F{Ã‚¢]Ÿ°|‡áÌï›Tb+vu+QWlMâ\nMƒ8òbC€ÏÁ!üJµ;®‰CäÂJ÷”ş¦1‚)ìÎ.™9¯ìÑ2)v L`’¡cJw2zjlhÆåTÜgü1ÇXƒÌF°‹Ù#–NL¼ÅX›+¶„[Ñƒ!F+ lv&E\rÓö!8òéT\\_ +16Hø¢+¨>D<N?”f×!W*Z‡Ñ‚ÕfŒßåış[şø»ş¿Ãóüt`å“g!Ùìı››€±K#eUaÏø†6b\"!P ÎjçFx”‘öfç·É‹ƒ5Êô€ËÒ¸\nCºãÆÖ.dü6,(Ş’ßÍòg#Ğ–Å8bCÕJ²(ÀßˆaÈ±>#6\Z¦eJQP³óª­ê:6‰ ÆÉ‚ì“àåb¿¦cÁÀ\0KlÃ˜ä<]— \Z+)Pu|˜İÈVİX3-”\rz†ŸW”2!éb3\nB°·/ÅÏeu–6DP*ÑĞé„Í‹ğá	L•äÌoCôD\\ënÊOp1ÌäåDÑ?°2`ShtlFVÆÃ\"µŒ é¢°$©ÅıDFV‰!®D8¾/ÓrñåÓ~æS?PM(Ü¥½	î3fx~zƒügüêÀ¢Ú--\"‡É®F/ª„£eYÍ¼ˆlÇÌõÿ\0ä*\"y&”m0.Âşæé\0A\'³±ØéäıñIÅ…ä›/ÃZ)´w+ŠÍ˜Êå®j–¥hªĞ1[#´OÌP‹íciâ*¿L|Å ˜6/Âùi;°TUòI›+á<ÇVÆÄZ˜?™‘üLÊà~¡QQ\0F˜©ŠÈÚÄò|Âã‡B7 {™äPy	yÒ±ò%š¾¯áıÀÍ(Ä8ğå@üX€wñ\nfj?J¿_\"\n1„„Zæ‚Å	ÁÆÑˆ«…AÚ1ê{•Ø:×ƒ(É\\!Äí³p\"*•!ŠüÊLbÈ?0Æ\0{=¦Z°‡ˆšBt?Ğwü\\‰ÔâÙOJwpPÆM¨b8\\›.EM5‚Ã©•opj„Glg’°æ ‡‰|_¼õŸš¶Nô(ˆ¼V‚9äğ¢z8I˜¸d[¢¾b»R–ŒFÈ¦†5IÁq%ÂÛôÌÊì­ÉmíH…¹r\'±fe9È‘Ÿ¸Q£Ã@ÙLıƒ \'\\©§áÜ”Ñù&5è8—É#È1y•nš-îr>LÒ¡&ù\\ñŠÙ×EïB[»û‡&vÉT‚ìOÃ¶%®ïLL€/ôìFÆ(aâÿ\0«ìKğ\0	¡VYqËø\ZıÍNXŸ*SÕE²ã\0*è)>D\\™Õlj¼EXó[ªiüÄÉ¶1œ2ªl—ß&ŠÌ«ÿ\0¸=l¤ğ_$™yb~L°X(su<şZ-7şC³üŸò€?T×ËŠøŒ]PÓ¸S€¸ÈÜFeRk¹é~Çd@ˆ“1»ƒÄù&7«³sñugŠòƒ#dB\Zá|ùÊ‚Wˆœo®F\"¯ÑÜB\0³ÏqUTW%fŸ ß´öd:Yn‚F.0£Úƒ³p³eM¬¹nIë€œÕMÜ\rÉößfÆUƒW-Œß‡SXñ“_óøbâ+¸iÚŠøCÌÀªùKgö”¬FoÃ£C³=<Âı—sAÏ0Ûs³xØ§(u+]±×÷²àj7ŞÏˆåx˜OLXr×Pãf!Jü	¤éİFB2V;)fV*ãˆù€+flœÔé”Â\Zóû¡&üQ&Z²õ?š‹Å„\0¦U\"àôñÎÅr—SÄ‡¯àÕÿ\0‡øzşû”NLl±3“ıDÜç”‘zÔVÎÏ¤ğ> õ8*:¹é‚¾äÅ¨\0F²%È›†8À©\\ ñÙS»™S7•V°Ìº f<˜9Ù¿~ddZ›)¢Õúàç@ÂqÔÀìtEos!ô¾\\ÍşÑrdï%¿û?£şÀb\Zø]‰XÃ{±¿éˆ1æÈm´‹_>ã5êÀ0„b»âG{0úiír<Oæş›ûÌyAıKVe&Nñ7Èø1×*q.	Ä¨10-obáÆ‰Œ-g¬îÚ ²D+ø·,c6<eUCtZ9r:¡?¼&^IG«‚®Èñ‡©ËPøƒ®\"û\"V^ù×˜R§ÅÂ\rğR1]Âq^¦‡çBkó?Å_Ççòìÿ\0àô€LS†­”y2íÇ|c•hF9Ùˆ¬ÛÄl\"Ù$½‚#lÑù¹ÈØ+ûEk\0lvVôw1áÀ„à6c·¦-wÅÿ\0ÉA”÷ôa*´jbå8+8XˆêÀ3²ø¹‰Š©g\'Û?\r—ŠÙuj?ğc¾_Ä¨rXÔ¼Ù›»Aølôvõ)^ß\'¾&,,H\0j¾¸Q¾üÄw\0jîçòğµ·â76¢‘a¢Ş:,x€L%0â+_,|ÊÅÓ|YúŒßË¦ög¤@»‹cÈŠ—&g´Ã¡òg6UÇu1ô	f rÀ[`<8æÅ<– 	VÆËúXê\Z6M˜ØS&§½2lüß˜L^æ?îX\nŒd™l[òØc_´.]-Wà‰î$rú¯ÈU¹*´?.¦„Ü³ü$Cùˆ?Àïä…,)ŒqœÑ´˜§C±±=§Àûˆ¸ÕI¦5¹k˜”¡¸C°£âæBìàºøÔ`	£c¨W\"Š>?â2Şî÷œ\r‘Ÿ«Šre\0¹MQ˜›8>ã•îš.lO–ùcª@cÁ1_Ş‹¾páÁ‰ÒqåÙ¾g¶ê[¦\0üÄÇ‹Gål`¾SÙ¡\n>Uùm¤)»\r¦²7˜Ş¢öÕrù Á—:†Û)qìUĞ ùŠTyzŒIoM¥æõ\ZÙFÍüƒ\nâe\' u\Zú‹äo\ZGdÄEÄ ´ã‹#–\n\r.û¹c\Z×\"Ô. ÃnXÙ,5ãbIÇĞşĞavÈ†\0kªŞ]Gr£d’òû¨+|@®H.Àß!§\\X“¹kpÒ¾ÊøÆÄSûËl™˜°ıáÏºh-M˜.kÄ¦\"jÿ\0Á\"ÈÁ &§ñ,ş«©JM\"0ª²’Š£w ÚŸ0fË{—â|õı aõâ	Ğ¿0²ãèˆxß¸	Ë·P?Ù\Z2²\r”ê6&l¢Éÿ\0¸™q6‘°—W°#şšs·\"ˆ_î˜ÛcNAÈ~¢¨ÉÛuõ27à0jÉ0€\0M\0(Ù¨}<Ô²z£æc•Ğ©n—û	ÖrGÜIÛ•FpÆ±~ ~ÚÆS™ÔÅŞ><<ø³‘çâpDÂ+Ä#‘Û|‹…ûçF(Ë\n† uøé’ 4°7,J2x Ï\'VÀ i‹eÄF,‹¶72dİ’¦LjÍJj£¢z&ê‡7!Çì™Ï/áœ‚ß*|Ë8²²ÄÁµd‰Äºø®ê/<¬ç!ŒX²•Ù\0#¶^:RlU±a	Iœ}Í¶Ì<†MÑRebÂ¼WìşZsDÊCüƒß•ş^‡ÏøüÀt6\"zÀ{L-mDI½,´\'¨Q‡gî-¦\'ÌÑïèÆpç |Ï{nî*©r®ŞEy€®:4Ú,s‘*9ÊÆ»±\0Èo»±\0,=…Eµ@´<Ö®/gÚ\r²ÄLMõÙˆ\"’8ƒ»‡ÒlJÌüIbjs1ı\\vcÀXùñµ1ë±äÊNÊà>ÑÂa\\\'Jäna¬~àÂË1q!md;$ˆã@®³ J×PÂ¼‹¹¨\nÚöªœËöPöGÊf1”ª{Oƒòec,U&àvpP…Qõ+ÿ\0åÉÎ7u¶xÌ˜KT5äÇR—´o^DÍ›	`•	\"¼CˆT`Ëƒñyyc†>\nIîYÆ¡GöÜ™yôÒ¹şM~Ä‰ÜULËÿ\0²7‡0¿«•ˆ@Ÿ&ÙÄ§u¤_75Ùš­NåùlŸó=Î¿ÃĞ0Pm˜¨_U-I…acõÜ`Ü|¥±ß\"aô”[Ğœ³z´Ğ Ì³Ô.GMûÅ#&=()¹Kû~ÄãV*êáÇø¬Tü&ù˜È`yZôDÙq¿wÿ\0S–*UîÊù£1c(ŒjÅ0Š¹ëğ\nZ^JÜW²k2ªfmq?pæËÌrCÿ\0\Z™U±ƒ“Ó¨PdZ˜$è©Š¹JSã	@‚z™V;>@‡_?È}¨9PXÉŒW?§ìE5GMswÈĞ¸ïøgpNB§ˆ›Eó¸Üñcãª£8>G:¾‡Ä*\nşñ}/IYˆì³l´²­F£ˆã>C\rˆ®á=9\'22ıæHFÌP\0å~yĞŠÎ¹Ü¯ÚƒR‚\0ëpŒnë¡ğÂ¥Löc4 OÜJ	Ô²L­Mšëü=NÈ€²â!:öÚÃ°e:ëP/û›Éšq_´<CRˆ°ı&R~«;ƒ…~Ó—¨‚Ö5î‚[âGS}y Åà@?¸ƒÿ\0EXòf¸Añ}Ìl¸Á¾â#ólû\rÓ\'‘á\\¸o‰’Øù£‘\"¨µÿ\0Á0¨~€=Ál\n³ùSØa2¶^…öÿ\0Ì\0aÂ)\"›˜òµ,¯a<›fsÈù8W²~ Éø–]ú~å`O!ıN<Kr½*Ğ\0ÄíŠ]-ì´%®‰#’Æ@ŒÂ¯uôaü\'¬‡ÚÉl.EÍw}EÁøg¦\\¬TğO“	p‹v+‰©o„á’{x’³ÄŠ?>\'ÄâF4t[`Î„È\rŞ;\"¶€ğ.LB;\nkbòPT8ì‰e™W_p\r£(®Áœ¿–1©”e¡„¹î¯òŞ‹_á‘cF—©éZ_3î&ê¨\")c²Ç¡#ÛmL>ˆj«ñ9siò!Mû€ƒ&.$hÃbÇrüõ\0Ä¾ïp×ì`8•u¥ûUÜûˆèNm•H~g,å´åÁl‘í+q‹¶(eÕ	²;¨Tb˜õ¿˜F+²µb`x’I>`uõyMìıD$°%H±˜‘ò“*\0§qré‹*¶şìBŸ…Cı·¢Lf¢¨é±¨îfÆyæ{_•ÄeG°÷?™Œ_‹~¢æl‰Dàª±¢6fbØì êà#À¹²r«ªU‚Æ0¡ªÍÁÂ›`x‘qŸş¡“káò½røcôbğ8‰äOŸÙˆ¿ŒNÇ—”Å˜9è€<JğOfK\'y¹a˜j\n\r|AÅeRÔÜÙü‰¯òİáöùÿ\0^D/Œ½à¥MrãÇÀ0Åİ“	Rc‚Ç³gâÊïßÄ¤ÈÚc¤è9îÄQ Wˆ´As\"·òeâzC~*XÈ\\*ä_¶{”ÈQ”~#ƒÛ²š D¥FR`à2q\r^f6OSÜŞjü\0@ß¦·£ò\".ë¾Gì¦G\0“Ø#Lq\r×Æ3*–\Z4Xø£ÔAÄ½’hÊNvÁ»*@Ğ0XÈ\n©«aà\ZŠ¸İ¾¸‘ò>ê\0ß‡Ò¢‘mü?4Z*æÉûV%JSô5FzÅ€Ø-	q³­à	2‹Q²	…•±…ÆëœÚX#ìBê–ªçâ +ÆÃ|W0RÎ õPq Îmë×~Ót§ÇºsîVÍnlê{›±rŠ‰¯òıŸñ·üÈ|Ç<|“)ñ&çbA3š\rz\'#ƒE\nR±7µç\'=TæËú¥eÈÔøù1_1P\\ˆ}Ä–\\d,èÆâ†ÍÔ`¡@Â¿]õ8ÔŒB™VoˆGáù›iÉ9@ê*á©[V\"º;\n<@­èsPtË,ÆÌ,T§^Ô§Ğ,)ØZîáâãã©ìÇà$öa*îÑ£½@T09Q¶Æ¾	“%`÷ED\'.<ÁXû÷¾Fãæq)ÅGu«Ä©\0İ®à%_$lLkOÏû‹©;0q\0FÅŒ9‡µ£M2İõ`ÁÒ»×DÊs§UˆØ‹Ì‰¯¢@Á› £ñfB·¥«e\0×fV°ŸfìüÜ÷¡0EÎ„Ø”HÔ²OúG¸éD»2½1Å‡Ø„3À‰²³ôò$B®ÄÜfDn¼XO›èÅôø›\n|ˆ¹ÑEßô\ZÜSˆ ÕfV{ºÔÈAäÃîuGºŸÉ+¨H&µØ0pnï±k 6,yF\nw×W	T¾LŞaq‹ñ7­\\ˆ=”±`}&:7Ñ&$Û“&UæGdN8ó©9Â1*€Êz-)ı ¾jè<×`Ô(ö;;ÄV¼aVU;?p·âCÍlÛ10soØ(f&\\™*E}¤\\ÿ\0•ÀD? @1zdr \'ÀãF£É»ÈYË(äÅ{$æ¡ıšø¦Ô¼A‹6üÁ‹2Á›úÙ|3~ãĞµa£R•oÌ%ØƒdèÀY±$ÀS.N>ZfÃà@@Ü¯uÎÌ Òÿ\0˜ì\0=‹¥\Z îlV²bûa2—”ˆT>‰ˆÍDoîM–³CúUZç°y„ãQ£÷	Æ¢à`ÇK8ñõ8úGoõ,+^ú0+…ta*5V,}ü–Š¼Û‰çñLÚ{hÁ™Íßvg¶®eĞtec.ÖæîŒ\\¸ô\0Æ@ıÌc6ERJ\r*ÂT¨áûEäŸ†Æ1½ş»údûOÀ8\0^‰;1y¨+Ç°~âå–OÅ™~ãXÜQZfDb¤*6äÇJØŞÌà˜Ê§È$ÌU±‰\\Ğ C‡ğçe$‘m\0<M©ò,NLô\rPñ&E’Äp„±ÌV·æQ€º¾›è’ˆÎá½1ç‡BäÙ&l™°ºéïi³ş‘¡ú¿>,E=M¬<|NJ×ÇèÂT˜ÀAêá2ñ¾‰\"O™È“	V×\0Æöw]üÅsí–áÇ ;s\\‰g—ƒ	\n6!§Ú>`õ0 ,6ÀÊâH  Æá	Qà‘-qĞ\"pUğtf2pw±8~ğûà)Ah\0¢Á¾1ß)Nyl3	‘)BÂqãPˆGÌp5p\0SÚc7áŠPâTÈåVé\'Ùİ×05LâÖRhèx1•Ñô/)Opê¾„*Wş›1s§SvÉº*Lö(s|JãôG2í‡³“sbàÀÅÕˆ?ü\'âñ)>J<\n˜Ô›?ÔOPœ¼×˜½Šo6Lqâ\0ÿ\0iı@O;”\0ÔØ°?Ñl¼‰²6v=\0,Ì©ƒ :#Wùñ=øÌF:§š59`E±ós‡»ş¨uš{ø¼şP«¸\ní†àG¯y2ÔüA•3(,‘ÆW¨[ƒº\ZSkFqÄ]‰\ZŸe#}•YÅ~ÌoÃšÑ½¸	gÕ¶„şj’ÀWtnî1\\}\r›p°æqÖÅ|ÏnD®¬òƒyQø?ùˆ}¦3…÷ò#şç\'L—`@ÁĞk­ÇâÄ¾r<‘ÚÍD÷¨ãõ½ÆFw7GÉ©yGiõâÆà°K5ó¨}#‰ƒ—!n ô¤õæâi…/í(wsDX3¡¹¯ôM~Z?•5\n9qV|E:&ş%c#f¤Ñ?PÈ.á£µæPøœCj´o@¾çcœ×d“Í¹‘…ˆÊéo,x0²–¥®†ş`³ªê£¶›+\n!bÊ<€~`\'˜÷Üe2™#œ@=	ÙØ­Ô.Ù‰­yã©Y\r–c@P>#ğ$‰x²P?*~DPì‹·T<k™8ò$1Œ¹QvçúŸæçg 0ÛûB\\¸\0ıL™ƒW zbLäº&†Î…À«’Ø¥›„~ŸóÊşÓ™É²¡;>cÃ( /ÄñæÈHf ‘)Ê€1ö#ÅCË.BÄWû¼\0ü\"¢¶%™Y¶Î˜³gÄ¢\'³Æ\0Àgéšm»›?èº›üµü\\Q”©02öƒÒÈ¦¾ ´j¯£\r¦Á…\nvŞ‚¾ÏÔç[ÄµãSØZ´a,4¸Ì\0°ö\\—ÿ\0Š‹Ë$)ò ¦s= B*¶ğ‘‰ˆPN„wZ¾v6ñY—J>!8ËJ*ü}`âÚaõ±\0óÆrÆ:a³E|Brf‹lÜ¢éÏv	=Z>a±2Ub[¸x\0™Ï\0ÿ\0ñ°ÿ\0xò±e@mø…1d,ä!Ø7Ñ¨ÄŒ”¥®	‡]0cŞÍCÿ\0‹…âs5W	cÚ<@¬s\'àFW•õdî9Í…ÂS\Z¥D9= \r–iüìÙYIöÏäm°·Ë,²îZş§½…©î\"mgŸô}‚l3,%,˜\n˜®‡™jAªñ/	¢9 ©v Å›0bÆcËŒ\nhÕÓ,*ÌÇÜ!ò,KÈïjHñÔ€J×SÒÆúf^Ì>†‰û09*£/\0[Í}‚*ŒßP³g4Í4(šŠqB¡ù3‚+c`c±/2 5ô±1pP>M¬cµkQ‹2ÄFõ3pûôc©œ›Õ\'—‘=ù‡òHîà*&5üQÁÍË5ÂŠÙ+š›Ñ‰–Ñ˜¨+k¸W%w\n\0é£äÍ…+\ZyãàÏO	$¹Ÿ¨F,kÀ\nŒ¨X©?\0wâE‰|‘äÏ~ û—Å<Ê¶6Gú6¿ÀßäI=}<—KğĞ&‚‹mao“gÇœ2ƒ9ú„ó6jM=#DYé¢>28°0WÃ/´÷	ü;¥/Õ@ÎA\nË÷9be ‰¥:©L­Æ¡%ÿ\0Uˆ2.È?fqbn„pìA<¼ƒ=¹P2“ÕÅT ›è6Ö÷gÌâÀqÊ@ÑœÛ:Ê×Ì^¬Hr~ÌDÁòvD\nÙ·—B)Í•x­øùiÍUÂ’\r¯î%6e(CâŸ‘	ÿ\0¨9a{ºÙ9]Ô_çc¤Z»1‚?áÙqëÇĞœ9q8öÄ‹3†LŒvaµÌyÊíO¡{”A–ï6Ñèÿ\0ƒîãâR¨Oi\Zoƒcv°¨°uğ÷›ä;€Ò¹îFÂQÛ7Ì<Pî¡ljµÀÊSúdüKÌ«ú§& \rô\'µ´>9ÁosÑk$/Ó¦|2¡VÊ¼›äDB»àÚœÓøè‰éåZQ=~V@;0”D÷İÌƒ€w¥„º›Vó9eR.Ô‚c•e²£Wâ`I#f\0É±\0lH}\\¤Ù*gÛú_˜W5ö»ÔOqJ9¹ì|6ÃÎŒœÕƒ6Îá÷¸ ”ó9áJÎ4­¿¼Êìâœ)8²»hxZ¨«ó)X (–\ZZ ÿ\0S2/gæ@°VÇ`™a`âÇrÂù_™ÅˆÃW¼ÜØHxäïP•ÉU-â\"ãÉı#É„!_qù2Âé« c9j*Ş’Çµğ ~Fƒy¯ƒ-	äSàÀN1¯¡Ìİ*™Ç<=QÙŒPtO˜É¶6.­`ƒÑ˜)gçàüyUñª£>ZSõPã<B[×¹¼2dÆ#HJ¬G¦õûÊ:í3¼¼PùŒr2R7¡=¸Ñ}2AØL\\€bBHı53—´QBúÔµ77W(Š4e…7,Ğ±ÿ\0S«5-«s–#vÇõTjğ$0÷ˆÌjÿ\0c§La8È4\'Op3¸éAUL*\0½CN)ŸÉÉ²Ø€ª©f” kîRjÄâàEr/óXGÔEÀíıDx„d³q›#\rrñ$\nîşâ‡Ç×Ø‹ÎÀaó Fµ	ÅÃ’î\0Æ98Œø²¡¦Õ\rF×ÚÔ÷,ıe¡B%|=…•H\"êcÈªĞcÆ€…AñöcpôÎØšú0®Æ¼EP“rÏSb^F(ÿ\0G÷NÏø›îš\n\"h¹5=€jz˜É£\ngB<Ã­;F-vÙ	ìxÅTõ9÷]ˆC\0|@8ÖxÛúgÑ:ñı\"õ²2_ì`$´ıKgêç5¿rÆDÊ¬)g?ÄßG³8ğèE`î	?0cn˜|KWÓˆäÈ¬ô˜\\°Uv%É²³’“Ä5l\\yv%z‚Ó^\0¢-!4D8ß\Z~’ÌT Ó ¸ÛÆ)\\¨ˆrâOÿ\0g5\"†úâ(\\oQ=Îî@Ğo˜Kdråû®{¼BI7şƒ¯á\0=£¯ñœã}†ğä\"óÊ–«c9!j$õ-t*üVG>éÓ³¿‰x¥\"V%h2cÑ?¸A{ \r\\(\n­ô#~`%Åñ#ûŞšgÁ›m˜}P7ô%dähÿ\0¸N8ßD<f‹­ı@Êæˆ½¬R·`ƒÔ\nK†kø‰@IÃ\ZXñò\n|Áì0^ÍÎ>Ÿ$³»$EU4ÅOs!ÃŒĞ_ÿ\0Rvt2ªsm·+NÅjrÀÀkr¸/4aÖÄTÅ…	´4lupœ¬\Z¼Ô<ÃÉòI€30¨x!€Ğ›aş±6?Š”w,ÿ\0Œy¢Õˆ©„Îknîrât—8ÚÜ\rÃ@ÅT99q0?¯ê¹Ü>«ÙO¸Á‰·”€{ŠÙƒÁé²X¸v`µM€aå·ö#‡’¾ v€Ä.Êq´NfÜÔ$“J mØbã`\0`|‘Útß\"cÆ‡Pp(Ë}qq¸BÛ÷”¹Zì“8ÚX‚5òb:©Ñ1WğëJqòÙ\'P6\0áˆŒTbgp|ü(Œ¬¬Wˆ3ÛÀ0 xÃ¯èyJ»RaŠhÂXì¹³şï\"hŸàßø¥K\n5Y¡Ô	ÄlÂøş~\'µE7ï9+Ññ8äAîa2è0P{Aòuâ+É„d¾QÂvGP¹Î?àÎ9	©í:ú0&&eR@êç¨\0îFÒq¬Z&üGjf¸C¨Ä€}áb¯Õ†¿ın;‚µc¡Ö#F\'5T<<ñÿ\0ì_T9G˜q´BuP³ó\0xâ“\0|VÜ»\ZŠ–äĞÍÎ$Š\rßÌèJl¿èûÿ\0\'¿Ë# ›&áà{Š¬â˜4\r”C“¸\0²+qY…+_qs_B\ZF°%¯ uÆ Ë/¾æ1‘\rŸ“­h@+beÒSJÍ`©ƒvÄAÆèÎ&îÇUØrÕEråÂ.4L@ïÌçw¸8–Q‘9•ö¶ã3«ßöû‡Ò5í\Z4 Æì\0¶\"y16ŠU5Ÿ1—4<Kùˆ@¢µñq™î;ƒ†3Cırÿ\0‚€_æw†ÌÒ›‚Õh‘9• ´Œø\'£1«SsùˆæàÇ	d€nÉEît4.0ÆşÑz„‹¿78± \0D\060-GDNAÍDâäQ>/æ!.B5BùEØ¨rhc­÷†<ˆÌ¶t!¡C‰…M{ÏËE/ÿ\0˜XØ—…ÛŠŸäÀ¥;k»‡Ú¶@\ZÜò\ZQ6wş¿¿ã0²©º3Ó/ä¼èüÅš€Š¹yU9bQ²b¢”¶û\";¶RoDÀìŞÕŠ?!Ët È¨›ÿ\0è…¸%ö|ÂÖlÊü\"e—vcc!Ï·Ìşi:¸Ùoè@Ä¨<8äVñ²>Ùşã§«íP6LkG$£6€gêGÁ€®=£{Œ±åõç¯ËSCøÈ÷35-×f¦LÅv·  åJ\0®§µM4¢SÚ# ?¤¨„\"ãù?1EêSk‹cdÁ³±ôÒ{˜ËıA¡\'(äFr§ŞÄ\\AT„\'.?©›¨U‹X8¡â•Ù¿˜ÇÓ6µiúÌüNşj)bº&m‰?è»šü¬™¿óBw‡Â˜í£â*ej4F€‰Ÿ0cx¨Uè	ìŞa\nt5VĞiºÔËmäšè@œ‡w6†‰@Bp\ZffØ[òÖj’ëÊÈZ€äæyòeAíŠÈ–À(àÔ Æz7÷\02NÄ,„kp	WYÁq¯!~X#ÌÌ«‘¨*˜}5^şn¾ú-4?‹_Ã©¯ğµùÏr¿.8“nŞDg¢iA b(\0Ä\r›*éXõPzEê\\ş˜FVmˆ²‹_ºœ¨UT!H,o¿˜Ã¥.|±ø›\n\ZQvÄuQcà˜i[lMÙ–äÀŞŠYN wÖ•F8B-U½Ç[5P„u‹~áÊÊ•ò~É‹÷Àj=Ù7`ÑÄ¨R†êœ¹› bò\'—/	¾ÿ\0-ÿ\0¤vÌ>XéVsÈ|$d$ç$§aüÜƒ²g,öHŠ\0_ˆü”ØÌ	_qŞj+ÿ\0p¾OY­ìÁé¡°€÷_0‚İ	é‹ö°ìˆÖª\0N`‹_¹F·¨“¨£|ŒVÆ„dfò\0™I \0ËãäÌë–†@W±QëW	QAT\"l^Ã™ß¦\0B÷ørŞOû#¦d? èÃêYbqCØ\Zå4ˆOÜı‡ú/¸KÁ³:•ùkòÙ?–¿ÁßçX‡yKq­ÑÜ`Ô¾şP»“–„LkzTX¥ *¸ƒÕÏsš;3“Ğ4¶fTÃ™|Fp!r§£	rt%·uÄĞ;&h\rq2YäVÔıEYh\Z›Ap¥14XÎ”ş–¹ï²x†îàÂ™4à¯\'	}\"l¶ŠC¢œx^V3°È\n Pø1\n»ó÷ppÊ©ÅAÑv€4Ã•›ññEñœd‘¥v>\"ÁY~Ö‹6ZŠÀDl^¿=¡PRÈÿ\0——gø5üzSêû2’½¼\'«²CET•S@JË /àÎNçgÀY3h€°.t?ª¢ƒVø‰›Å¯KP»ÖÌ¢y\0®,/ï2eÉÄ)·Ğ2ªrÙƒ{Dï¸l¥13ÔZ[ÀêøsMŒÇ(çñ d_öœKQò*¨,â€¿\"„¥•ú5©&sËMóñ6ÅÇ´59äêÉxÙP;ÜgÊîÇÂÀ~w`\"‹Ç•F,«ú@ÆFÀ…ÃvGıN`Ğ -O“p4¡\0»Ó-”oÛÁÿ\0@óüZÅĞü¯òÜ¿Ï_Ã“ÑU5^Z&5ãï,ŞaÍí¯I\0Ä@®=AÁÆ÷Ql\nX ¨=|ÀÎ‹VĞ6T\"Æš«˜ÃsWîƒÍß˜¥4½8P*ÀÜ¯÷”OÄÛ¸K3ñëçÌW\n(¨LõW=@ÃaîÌm›ßâË†Ôl%Ø\râ>+ÉIì]š€»k¥ˆ÷WÜJAß@¨Ô‘c{	u`ÁÚ€Ô\\ybbÂùll‰ìG@ä\0¶	«û˜Rx‚f ^GT¿ûå&Àî‡Ìf²¯ŒqèÀü9d%Hå/ƒPovú/ÁEŒĞùõü@ŸÊ“ıí¡1fü[=1“5Ø%©`Èà_¤´4eá@\0Ï/‹›/¤o\Z€D\0ªr`¯¨QĞÙ)È¦¨šïŒĞ#‘º¡-r\r×åíXŞš\\—z0°GÌg{c¸8ô5ñûˆAà8e(K}×ƒ	\n»c¥fZJ³	LTv$ˆŸ„pŒÈÕ¡Qóf%›%ŠRÆP°£9\\l@UGÉ77ãí7ñ_mÏÂü~ ·§a´/ú…ÆÉ”wd0c|¢ˆó›ĞcE¡|‡ú`~Â\0rk\Z›–> È†îÉÑŒç\ZW¨Dwª Q»—Ñ_S\"lY:ä<AşW_ä{ü·Ğ›óüZßuBc_İ¢äP5].}ÅÅí\0Æ€\0 Pn»‰aFÁÉªZó9å t æW¸XÈj´ xš^Ì]]“-[¯±Zòı£6Wğ£ÜDuôÅ0qT~â‡é½Ú¯¸2g||•G€|@s0¬ƒÍ\0Å(‚ˆ\"w÷Zó¸90øÜ_H×[\Z…q\"!ue†èˆ¡/†L„Ï_„ä÷ò=Â cF Š…”q-†@{3-‘Õ}ÏÄ(QÖš¾MGbÄõı„ËúK©ú³?:ROm^PXh{…ı+7Ñø±¹c\0›˜±ş!r•¤ò/İQÊrä)I Ÿ4b Q´nÀ¯¯0¹~J•³Q†E²÷GÜĞqüVwP‡ôš4OĞÕÁÆ¹ µhWàø?±ÿ\0)©¡ş?s¡;3¡;šQùu9±ßÀr^?ÑğÆ# îÅ’g\0½B´;„–ñÜ|€&üˆ[—ôÂ(x,	Á®P\Z lÅô™©Ÿà@¨l·ÉhÖ…4õPÎ´Ó!é«ºåûÆ|Æ‰}ÎYı*$ıüEB\0·~„À6Kh´^Gú|nÉ‘Áw?Ò>bu;¸¦¯’Ÿ\"\"£\Z«òbgÚ¿ú à‡ ÷{}ã•˜}\"JÇdÁÏˆQûB¿¤›ÿ\0ˆ9q¯²s‰2éY#É&eLh]¯ë©À²~¯*\'0¾®rÇ”êèõ¥úK©ä ô<M+V5º¬u\\H ƒÓ±0,¡Ùv¼OƒºŠZÒ€\rõ6(5wzxù\ZĞ¿úgMÍ<Suw/›È°;éY‹P–‰“ˆQÿ\0ë¨NÖoßûËNô¬\ZŠnÿ\0Ë÷şŸÏCòèNçS¸K¹Ğ˜Š_yG”B¢€(\rÔãz6è˜AıCUÆËÄYœAãf&8ee`,´FJ¹ı\0øòXŸ{Xj7¦,-l\\İ7¦,ö·ôTˆøêiÚ®*»®[¯@yˆä55¡÷,ñ‡ÓT”Š²ŞT~A[ƒ1ãúÙ«Šù‡ùH¦éÚ¿OÕLY BoÌ-“%Z}u{r\'ÿ\0ÛvÆ¢İèŸ¨¬o³ĞŠÙG^?¸‹|+E\n|5÷9û`5_sDı	yv(³>ŞÔ]Wï?šÄpaó`Šš^B3åRÅB?—ËÄEäüG€kg³¸ö,äÜ|(7d@ã#›å|hãÊlU-SñPÃv{3›LÁÿ\0‘p†}ßÈ0‘]B¢³šº$jâß§MĞòLÅ´\\m‰ñ©@£àBŒr\n*Ü­|êz˜¹€ŒO@üÇöNñ`<ƒş[_ÇúDêvÓè~T¨UFU¸@q¡ÙBqno˜â¤Y˜Àãíãÿ\0s™@|<·½¯Ô7*eÄ]<NN¿Ş®\"—pJ\r1+€Pa8•ü|ÄV®×Ì«3\rúOÀû6A]Ôw»´PÔ,€_9=Úªü}À‹F¥…^<îşg<|½Şî˜\n6Ä‚!RÖÜÛ¨4§•yãÂ­İñP>~ç\'AÇªc\\YŸƒŒs`ØùØób¥WÛÆõ±ÜFl[ïb:\\ƒØfûˆQHÜM7µZÔø‡&˜2F˜ø\nR8ù ‘š×Z*šØ «VbÛP» ó;Õ¯Áƒ¥‹FçÃ|}î¢âNÏåBS°6Äë÷…œgÈV¦ŠèugÄ!IĞ­ïÉŠÿ\0ƒl.„Ã8­ˆ¤*Ğ0Ü¡Dê 8‹5±‘1rş#%†fĞQ_>`r;?\'®¢‡P	D/ˆ)ç«•œû†2G§3\"G\"‡ó½	¡6fü¿ª[ğ×òº1bã`]¶?d¥³õ£\n\rf÷j$ëİ«ìMÃÄ5‰cprÛûj1FjR×í¹`G‰“66  ±O¿Ú6<|‚»ºĞıêÄ‚ã°Ûˆ*é@³FcfC²6B˜xıˆ†²h³x­Åw_ØhˆøÉ¡×·S±9fÉk÷P3¹È<€€ä³¨p–NèP@fc»ú€»‚T)÷&d+Ä]­îSäZ\'Ç~¥RøY˜Q«Å8[9m½Á«U.G;cÒä˜ì(A#ÁêX;\0Õ˜Á@zi‘o_5]ıˆJ1\'kìAûü˜\r(\'Q= M×vÈü®ê‰~ˆëæ.5BOäµ|cŒËŒ…[¥ç°	¨2^KÈrÔUl™UØP°ñÂåxÖFå Ù2›1P‰ô¬\rÀRúƒˆ]~õ(+r[ŒGmkb%N‰° ùR3ƒ—)ßö¨¤•%Yß ÇæÇA«Ú§ÅDlLÀwC~uqUÓÚÉÿ\0£ı¦,_ˆC²4.\\¤ü6TcC]ÏÂ©ø,Ñân,TØÿ\01²-çCóñ4@tË]ÕÁÃË|IqÈ‹¨q¢-[$Ô p»ã£BÚL/˜(›Ù˜Â2ò®ˆ-âq¦ºòjZõû™Ê÷«\"mIÒüD8×nÏˆ·Á_¯æ>,€‚ÃL~£#‡¶vOíqÁãeƒta~ãí…¿ŞƒlAcÛÔşZöÃÁ1¸2’·ri…Hö¨Š—ˆ·ÃU‘EûgoŠóÓ}\0¾\"¶\'\Z‰\'ZãØ‹)~ñöa¶Aíè± {oÚ\nvãE³¯ø€q`à£¾£cGcÀ_Wºƒ‘\Z³½¡!M‚öèEElœ\r‚ÄıÄvÆè˜È£g_QÜ½²À^ÊÇ.Awvv;n”_ˆ1ãK\Zûk³q‘¸Ş7REAê32¸&¶uzø€‘_Úk\0?c?J’\0“/â7vvqÙ#è@¢€;&È;Ä€ß´1Ä@©¾duı§«£WÔíM/ŞeÆ›f¦FäÛSº…/¸+~÷ßŸlûãİÙr&5,UC½3Ã°(Kc49ï”Æ¹\0@ıLß-³ÕÆ…Õ‹•›@hÅò/™Ëu£9>,¬¬ß?åû3@Màëòş`Ãìı¯sŞz1Ş÷@Á‹7é¼T>¬Eºv&ÍÂy#À€mLìì¦Àä7Øœ%šó¸\"©ãH<–™…ñ[,Ofãş½‰t~¹	³Zê#İDcãqÀU 4OT¡(ò»øó\0vRÁ¼Q€5m¦L¸ÕNƒ„Ù8ñ&”’`%\0åCÏâDëÉc2Zõt\0ø.Ç´ƒĞ06n4Ùrl“Ä@ßa£3¨P1Fz²Ÿ_p\Z=Å	ãÙ%I MGÆäqàİ†ŠÙ1İ|‹ø\'©é\"W6pWëÚ<“9B—føó©ê:W«É;!J ²Ûf«¨Í C^ˆ-¯Ü˜ª©\\Ù=×6\rYÿ\0Ô³¹íÈ=Õşå—ÄwûjjƒEWö•+®^*£ª«[î[ä˜ØÜ\n¢!,Tš=JPßÜGDßuæ„‘|VYf_ø\Z\0Šñf7ÑÎ^Ie¸™—:ƒ0\0óò`Êq¯°åfü@?kÿ\0p‘‘€sşß ÈsrÁ‘‰`CoÇ‰¼oé…•€\0òĞ¢&o¦éOù±?y¯Éş™¥›œˆĞÀ8U¡ıìÎ8Úî .ß¬³Ñˆ¨è|xÔÄ\rÎC\Z\n\rÎ*Wõ\n–¬õ1ânozì#­ëÔvPÇ—´ñÔàC\0.Drä¬RÖyß‹ƒÿ\0—NDÃÊÂ4-¸š­&ç^?T~UÑ]UüJ|Xó1wËZ0€†•n¬Ê\0×afGæ|êzüó9\r%ÁøtG%¼–\"cÙĞ²>L&ªë¡Õ‹€šåÄ°ĞŒ@ıTcCqÉÎ÷ÄØ; \0\Z§•ş™ï,Eê–c{åé†Ñ\"\Z#È¯âGöÔ-—ã[…2Ñb<£8¼[ìƒÜ¨PT¯š=N¹€»4I+ô\rı˜¼¸sşã(\'KÙ¨î\0>„ÈÉÛkr÷«54yyúŒ4TP\"¦~a×úalŠ´ßßÉ·áTÓ°Zİh˜rd5a¼‚zdÂÄ\0®CÄÇ‰ËQe^şÁ‰Èc¤³æz¬ävEOK(ı~›z!Ì9°ä|x´(-s\ZeÄØ¨ Ñ,7ş[fu©¡;fü™±*R3Ùõ8€9O\Z½	Å9šÈõF¥–ZÇî.IpÈI\ZĞ®ÅÇWo6OüAL»¿?¼öqŒ¢ºîş\"(cÊÁÿ\0ìõ2tQ6D\0r¦¾êsZôEŸƒ-\0ˆL´=ƒÉ€âqÈ©¿ck*+lDÉÍ¨0)Bç%l—òFºº¾ƒñåSj*Èä|0°F²Zµp ô½\\ıë‰ßE[·¥½ı·ÜeGK{”zQ]“¨\\±cUs#8Ø=ƒ*ÕûÑÔqÍ€÷^‹ˆ·@‰í5Ã‚ÙıãfÉc˜¤)‰²«zmÙ`>&EÂ	dQI@ß‡ÄÆÕK—ÿ\0Ù†ò*‚ØöI­M°m’%ªšåÑ²ÄªŸµ*`¼‚˜xhùéC‘Ø{±dG ¹ ^‚˜YÊ‘È³PiíÆAhÔ Ò“_Ó+\'\r.AÄõâXz ws‚½¢‘´<@ø›Z™k}•/\0ØF*ğây£\r.ç²¸¹FFSŒØı†Ì\nßK&SCl9õäÂ>(_êpÅOG_° Å^8Ãªƒîå#d(ío•øÿ\0Ïø}\nşÿ\0–¿-øşÅ³~s?\'è$ˆ¹É\r¦Ôw¡ã8¬±Bâü1RÅ$±/_ÕÃŒs«~šSµR¿\\R‹_G¨BÖ¸èÿ\0Ìs‘rL@ÜÉÑ=€b!Qku²\"ŒD¥>â{±9dL`ßïñ\ræºùeÄ›b	ıå0PJõ\0vÊù6˜¬ê¢«Àš\'Á¨X±¾>+lEÆ¬ŒÆ€×ş“»`7¿ÜÜöÜ…¯ŞêÑ\rıœÜ¯´‘í?6dñ ¢`!û²\ZYsí¾ã†\"éjıæbÁØ\"#uÄ×)œg ?¦iï{€8j`¿^,J9	9A6HB*3Ø@-Q€@nÅd1÷¡ğeÚšSÚñœóæRÊã¿&¹õ\',®Ø®ö0r¼…x&Z³\r\ZQª;®Œ¦\0¯z¸Á¶TV˜CŒdB²yï³9{Ù À«éñ a¾e…º\'ã­GTéulÄô±“\Z¨ÆÈ§è±àÅõ3{¥\")ÌÀ«\0yL(WÀ452;¾N…,³¨*+ô©LÈÏKTfÆ@Qg_7Y@&öè¨x0÷Ÿ¥óBªu°GêñÙ¸Å=Gu_—ù`ÿ\0Ùe‚lÎç´\r~Wùwpª’bŒ¸°*5ˆ[‡f¨›Ü|gô([…°{¡0”L`ß’`[nÁé~ÈŠØÚù(§âŒ~!ìî÷Æ@ä€î²|™ì‰ üüÁö¬Ôäm¸qìq=OÂÑzÇƒ÷?É¥G€ \0®¸šŠs\09²MÍ‚;ø‚X±qC¦£ıÈ0ã¶(î2úDyÓ@ÙÙS@|T“²7Q²ø¬jÜ¼b³“ú•zı5\0ü¯v±‹¥˜ù¸­Ïµÿ\0é¹é€i(ÿ\0öeÊNcKÓBlñ |ŸÑ=ìT•*Ú´\"Éóæ“[ë«¨ò•xÕFš­ÆèÂÇô»ÕY\'BáÆÚ‹¡}İF`PŠ0Êy¦áLd\\‘\"?UìÆìl$F!H¢GƒˆCµğb*‘îŞìBà<—¢<Ïyÿ\0pÌlyN qn€úŠ+Æ ÃÓ8ìrÔ_KTlŒmlƒDB¸²oöø1b>¢~!¨^”Ì˜ÚÇ¯kãèÂ¼yS¾±Œhs°JõªÄšó=&8ÉVå¨Uáß&L¤WF€feÁÿ\0Œ¥rb\'Ô·™ËğøğQro~>!ôù·ò·¯ò¿äM	òf„×™³ùjuùcç—Ÿ6òÔÄP¢“ğ9t!d()‡ıÃ•ò5ÒÙ÷|T^/ŒsE7OÛKgkû‘zßÍÀ–Ü@q¯ıÑÈ~“òÂhï\ZÜÂUtËÈÜ#ñGƒGö\'¸I{ìĞ£q1b\r÷óâyc\0YZ8òºh¼˜ò/óâ ÈYô€:›P€Ö¾µ2;!Ü9¢l|E*ºP;%{r,Ö¢·ûLx1Ù}¥\'µ½İGíâr.hq_m“²K.Îâ§árè\"\r±o¹BÂ‡:+¯?dD,´	e•tgê{<|NUÄ\'-“p“z³rúZ?´Q„¿ò…÷BŒÈñ\ZtÃbaÆtI,LÆÓÏŠ¸µ›GA©¾TÃê¬WÌl¯CÛğF¶eëU\" !Pïˆ—¿î!~$\0\0ùñ’¼Aõ?Næ4N\\ø•±ãqÂ«|R˜a\0ëËDöæåÀ§J>LÇÊø²ö„×d1rÚñşƒ¡b1ÈÊ9\n 	ÙV¯‰ÿ\0ù6 ÛìÃ‰óİU\0^ì‰—7,l6SV~RX¼	“\n…´rT†¦ëQ\nâÊ%&Àú&+©@#fzo¨ì‘Èu¨…I•¶XÈb9W/?pòâüFr_+ù-ÿ\0@@Ï˜@rğwÊ\nãuü•ssÜÌ\0ü´%\n¡7ùîÅ“(f¨hqoH·ËÚ[6rËÌÑ.rİßé€zşãN[®ç·Ì\"· <ı\'¨§\'°5{Ç÷\\QL%‚Ûos‹s¶âµ£ÜQYŠ£0Ég‰«YŠƒ÷¹|—ˆeì,n4lüşÓ&1T@(˜ÄÖµâq| r!I }ßP•j¿cçLIb¡0á¦,şbßÔ!3ë ù€äÇ¥Bz-İÊÍıxÉ„\ZíOÈˆù	Û‘|À’Ğ\rîª¤C	²AS\\a˜nş{€ãôG¢°³ÔtÙe\0T,«°‡`·…ôô“&ØÑ$ÏSt,Ìxœ*\0„)FÌà9\0ÄÎJF™:¸9\r]ö7\0Ï…÷Xé„U”=q\0äF&P0Ömaõ~bäE¸ğ/¨1áæ\0÷Ú×F¡püY‡¾¡F«rI¦i^îV:â(¢Q¢¹T|ënz?‡ÆtI¬}|Ì‡ñd­†ŞÏÏÜl-ÄSjÏ‹&rË‘J(è€Oÿ\0Lå˜¬iŠ‹ŒŠrıµ+,…‘«¹rÍí#Û÷¸Ç.©P3¶ŠòIk™f%ˆ#£q‹qôù^Ë?Ÿì\"z¾ áÊir°°?âyş3ÏçJ«ÿ\0¸\rÛ´ -Ïïù)3aeşãb.iÃEşU`*¨6ç•´¡­J6Éø0(sÁ5}ÃclyFÌâ€Æ\Z¼xª¹ŒĞ·Äşî-àƒò9˜/fW´üCäÙ­F®<‰:ãFí”µßƒp9m†ât§Å	•Ó¢ŠÚÿ\0Lx±(#d?ò\0›üEJ1ñ4z&qø¾ÉÂ»F7d]ìõ¡SˆñP³xsù¹RÃ.øùó&4ES@¯4\" ä¶	ıBSã6\nŠ©YTCÅ9â!ÍkÜ eØCÙR+@\06<CCk)ßÂÊx/€Ø=†\"¶Vu^ÎÎ†¢ŠèÆs÷\0Sàˆy¾ÁŒ¸Ü~¯‰X‹Å|@)t\" aFƒj)Œ@\Z˜ñAl47ƒ¿!ŒW±ÇõBÇº==A€f`Î+µ±%=J¾7¢L<ÿ\0\rˆ•ê\r‘`âÃŒû…DsØ”!Ko¯¹íÈ¼‚îwSÁw]˜¾¯y²,¤Ş‚ìP_+ô€k¸	IáúŠ÷~*¦\\…ó’\0ŞÛò	ó=……¡ôLå“‹’ı”[è˜rş8)àš´¸ª“Ğ“0L \0ù52;ŠÂ¼šı-1áÄhq!½¿¼\'r£ Úğºßğîkòööf—É‰„şZ?ˆÆ	ú-1†ü3ú•VBBîÓñfSğ	ƒ\r•¿­[âd°x©cälÜAÉY±äÅLÊ#1$±;£¿`ıÌ4¢ü^ gu®mğ;ĞŸ‡$­ø—%ŸéDü.^Ÿ¶äİßSuáaÆÊ-×\"èGE64(1ÕY­Ú¾ú…N:[rKW×ö…ğ°¯SÈú3\ZäNZ¥ò\'¹ô³|)ÛÌø©o–7ÅçªÏ»a£û	’‰¼j¾Òa°†³Õù€›w¿´Ëqû¸S’ŞN 9Šqë£òg½ÔØûLÅ@º²7*ölÿ\0q-ÅU	œW•©A ~âäP(o1T˜ª	öÖ˜üÎ‰6ŞDP¸™‰#áaW™VÎ‹“¢búHõêø>&ÊğÕ‚¬|’&.\0VW®´ æ©`¯EG€\r@q¡-HÇşH1ÓU^NP•h……ß\ZZ\'èßcàñ`ı|ÆÏ—ñŠF<`\n`@|ÕíLä^FPNàõQl†;Zneê}Š·îú‡6gãéc]\0Ş!lÏÛ|y&Ìbéİÿ\0˜ŠPNİ„*r<ü\nïCQ•…y1=ç¤Ä· §»ñĞ=³Ox{L„ŸÓñ\rtŒödåJO\"Q„Ğnkª1FıÅt5Ş¡Â2`_rˆŸˆ!Id‹\n‡ˆ4Mjÿ\0‡dOŸÏ–ØÍÜ:§rÉüïó#‰±æDL…O|O1ãü^!Ärò<Àş®TT#ÉÙ+-o«œŒ5R€bM¨Ğ\r^Ì+ø~	SÄ©)W`+3¸’uâÌGÊp£dÍÊØ±šÛ@	gÇÜµleQA×/¬C}Xº\n\'âŒÒ9¯ØÎXßÚÊ|Üç‹57‚%ª€0µE`kşDHßìfÄÛ!¯ßÄv \0,İÎSA…_p-İq\Z~FÛ}CŒ->\'aúŒF =«ãæ5(íû¹t´\0Ô Q\Z„:¸dÆ­FÄÆI#›ìÄ![²ÄÇEıN>¡~Ø\0°b¨7ƒ_3ÕB\0âFìÕÆ9[åºİ©Û\0Sd,·õj(õƒ0f6\0Sâ{ÂìE‚z_qˆ¸ÜûÙ¨¨óæ*xäb@\n¿¶¹1\ZdáÅyù<EÄG@€ß°€>Í©ëÄÅé‡äKêXé–˜ö ‚Â©Ê‘È`Osñ\\ó1?‰~b÷áDW|EC¾\"Ï˜0©p¸’@\0’wçâÄdl§+ò:…²£±ÊCYØÿ\0ßFÄPãÿ\0eVı`ìQ—ø\\D0ıˆ²#\"âéXlyå)£íÜäM%uU\0åTŸèB‹ˆeôÃèOQ+\0u_ûXbM‚z?ÁKû‡t÷\\¨n8Àë¾¹+Øƒ6ÖD~ÿ\0–ÿ\0‚õ<ÎÌóùy†€Øü©|üªh	³>¾Ïåb¡\n6,¼r€Ôx7FÆØ1Õ?Ë— Sl–0ŞB9#-TÛ‚|WBW˜×E}Ï×€>P‹ÁlîqU{â§âõB)KàPr†Vó°	©Ë\Z¯+\'@1Wåğ<	üÜzzş¥1½@o^+îeÍõ\0ADä*	b?c>¡ÅòœÁ: ù–Àx¦:\0xh¾	©Bw‰·ß+º¸}KÙìÎYOûº“wJ(¯³h}˜ªıñªœšüø‰Ä§¨ë”ö½ƒ/§@êvoKª…œŸ`Qˆ7{¦\"®gâü…×Æ¾OE²ŒH	ül—±B¡Äˆ¼O\Zoï v bàp²}Á`\'Ó,\n\nMÖ¾¢`)JÚŸŞz_†õ˜¿Ñ/Ò]Z®üLÁº\\ÚAñ«j\nqä‰]©«„—¥ÚŸ›è@  xİD³’=¶ÆG+\"Én1©ç“r,:V./p`©vk¾@wÕéD¶pÇ‘ÿ\0ï÷‡\Zf4åêLjIĞ\n£õytjáÙLÌ¹6ÊİL„¦Õ©X_uÆ*eb}¬zR!<l‘tGÌL©˜|fÃĞa›È-GÄ`€]Û2~¸ïúIİLŠp\'è¯Pr†[ôŠÒñü&J ¥p_ËÏğt&«óëf\'òßÇ,·ç¶èOÚlÍ™×˜@cÄ×{Ğhl<Îğfòb5øw²İİøƒ‚òdSİ·ÿ\0ê[Xoº˜±~%ñ.5fp}ª(4~Ùœµ.O‚> Dfäô:uğÿ\0„¿a;g‘¸yjãG±Òª¯ƒóSôcğz¿òóàN$‹±µ#Áp)ùÛŸ‰Ç’ò)kN$@J°_mñQàCë”°×ÿ\0Pcìˆ@ 0Sl/Ì÷Ù \"g-fÛ°a_¥Ô\'–û‡±SÌ[|`ûe`Ğ,CkCàÃ¯1qaYoÌ7®Mç[ñ8åR91¯pû©“\nÑµ&•¿b;Z˜TFÁ‘FGk³û=%b›è(ƒ/áÀEaç•ÄDf\rışê\"å#ÚÀXŞ Ê¸P@<ôğ0]4ËM¥P¼Ü‚&<²{‹OË]\0D›ìñt-îâcãüF\\`—(î/¥nÁ>.Ÿˆû¡âf.ò*à]\Z<¨B¬]¨r°>\00¾fSÅ@Ò³ârböf³T_~Èè1T$ˆ‡&OSŞê† ˆÂŠÈÊ5ûËªH)ûBù#)È€\ZÁ»OxCÃéˆ¡owÉ¸åTWWÆàş…¨µ>ò\'!Ê‹Eeåò.2ºæÕW\0=ìÅ¿‹y_×}§ÍşÑ•YAÓPÿ\0…ê*§èäëW\rÈõíñ±³b›à=“üTY«û~^\'}ÍŸÊÏÄ÷K??å³hK›ñõ\'½÷ûÂá±Ş‡™´-êÔ»*°s\rĞß£nË|Bø“Ù„7Ï“=€î(!Â„8Óbúñúmªú€ƒàÅâT­qr8È¥O h0¦·!õ¯ù¹Šúaÿ\0JE$còÆzŠ\0®=µĞó 6A0‹ññp$ )9ñ\05Òİ€Şó¸Ü/ÚM9– /Ìe\nMØ4~µ¥ÇÃ4}M»q`v£ ’Ú³$QÄü3Dl˜øß†ÉˆÉÈ2Ÿ||ÎHµ’I×˜UÁbãáˆğ³VHÔ,OuĞÀpÖAfÁ]k›•ófú‰knqãµâ~¾fSd®(©Ÿ‰x*_Ú Ù1Q‚ñ<Íì@2·$É‹da[ù˜‚œ‡®$(ƒ&FP¡T¸Ò<-ÊïîÏØ‡Óü:1°(šî;ãÎE–È1ËƒË…« èÈÑâZììÑìÁ˜¢ `¾¦QvlÃè¹¶ùmŞ„ÇŒ±âŠ?SKËÍG“ÏŸıWú˜EäÃù÷Œ’Ïdš‡—d™^­\0·g{+\Zº³=fŞÌNGå¡ãî^:jòb{€ñp°Ä\'(?Ò4y…r(#Ô\"ñ•¤4pÖ{!\nèˆŠü©²A©G¹…}[¶ØŠpR²ñ=¶&íoÿ\0£òè~~+&øÅ}Y›c,SêoÄ47_•’ ä4|J\n•ö&«¿ú—4e¢—[FWÍc‘ qúûÿ\0¬9u{ø(GPArùV,aÑc¿%Kk$ÙƒP[GDãL·¡ìT\n¿`ö>*IP<ÀK1oıM#Rïdù–Mò?p­r‹àq†:\0x¨IÏ¶ÆŠÆ8ªşH¸Ù8‹+TlıÄR´„í¡FCÉ¿«‘¨ÇÕ¥+ú„jOÿ\0*ŞØFc`tDõ¹lÕü€‹ø¨\"…µ?¥f š(B~±û\n¡3¨ö~ÀÆj»ã¢L¬D|Jş×¡¥¿?áÿ\0¿AÕ/î|ÇâëÙ6,\n2Ô5cS+dqµE¹‘P365%}ª||ˆ.Ë]x©HÃÛî W«•‡aŸCK÷äÜõ°rê6Ö¥¨}4, ñaÕ“»0@ÑßS\\H\nUÈ“¯©•²U…ºŞOÌVá•¹¢ù>®vÒ\"ÿ\0@_\Z\Zd¥0úƒú˜“ßˆøÆU:\'|Ïï9®¡U•‰É³åc:×µÔÙºñ	`Hıá9Òümilİ?È‹”q¦R<¥XqP’oÄÈ¬(UB­THƒÓäyØ1œì«×}ÌÊ˜Ô!Ö¼ÅÇ‰Ÿõôe~w´W!PàIÑ¢#&3‰ˆVì1îoÉşrèÜ×)ú‰?‘ï¶–z¸`äM(œœh±è}	vw¯şM\0V¨Kü÷`¹°•+Ã\"ßÕÆ4¦ıÚúÔ˜-rÃBSgGqS¥Qv&vø„Ç^y±i…>‚ÿ\0ÙÈÕhğ%>!¸›ë^nßD||ˆX.€\Z²Óˆbw8‹®qM¿˜¼?¤4%qâGdy€$‚İI*9×ıBRÍQ³ôhBI§äBîù2úAÕÁY*’|ù\Zœ”–Vì·Fd\\¥¹à-¤)İ¨”s;Y	mËç^0~ Ç¡A_w=<øC¡FeªO²aÇøfü@Ç™ñxTğÈªYœy\'ÿ\0fcâ€„j_Ò<	˜³è*vDüQ®-ÅTµı×1d.Ö„õS. \r’	®Œã…RµÜ<‰ ¨&5VL_ÃàSíÈÌô>“&6÷’\0$©Š‘‰jªM!!¢<yñæn‡Šv}BÀøXÃ\n×!İUAÉ_-¬?¨š‹“1É@t %)Ña8	~)î1]p!\')«lĞv_@R‰_‡¡Èÿ\0º@\nQõã!IQª…HZÀ…ÊGÌıB°ùñ~ ƒÅ_Gæ0ºZ>Zpe\'˜_›Œ¬<Aºóÿ\0W-\\ñõ\rš€û]óu“úwÄ3‘oÒø¦Rx¢ƒö²Ùç`Õƒi”Ñì<´ÍíØØ»®‰‹—T\'! Ä÷â*ãG°‰Şáw/’¶m@úş\r~^jçõ\0ä5òOˆhyù”<NL~|J¡×=æh@>>§ì?-M™¯‰ª•¾§´]~_Ã®`7ÁFí¦¸¼KÃÊÿ\0öO›ä²æË‹›;UtA\0®»0°kåC¨JZñ$~©ÁÀ&Šèó1ãlhG°5ñ~@†M\r@; ‘ñÕÀ1:\0~#²?·ô±Ñû©‡ñ8Æİ˜ée13~T£—^j ôf\"ø×ù|?Pı§âœb¬Û5t!Äz‹Ú«twä@¿‰\"Ğ•±ËÍ™Ÿ\ni˜t®ÄĞƒ&/HsG@QuÕÁ…x¿¥|‚f ñ”Ëú‹©6Ñıeïğ¦)oê`(˜á}mZ¨{•Â‹/†şÿ\0Sô°ñÓl4\"·%¬‚÷GÄ$2+T “[#¸Ö9Èïs4¡Ú¯&«ıŒ\\™2•”|]öbòÀk°@ıÀÀÃ*ZdBu \0óªu=SU¶ì›Y_ˆÎBşÂsæ(±¶ğ#è°Èø…U}§ÉªôT¨C›6½ÀÄĞ\'­Œbå+İ¯£=ìEGé X$ÂŞ¹ÑêÌW½PòL£ÿ\0OG±\0ã X°7˜LxîS°²³ÒCAòH°u	Èô-ôbzÜBª>‚øÿ\0™‰s8(\r‚Ü|¹ë. K0l»ÉA¸X/~\Z£. 2[ù­ÿ\0r÷ùh½ÍÊ³|?m÷ø¡)Gmó6w()ûşëòıÇÌèNüÍ‘ÔS_Æ¾+æY=CÜC¯³ü\0åı·çÌ§dlauVÑvõÁÉğoÂïKÀ–52ctÅÃ\"•\'Bq³Zµxû¸œĞ–×ê}	<¹‰¿˜\"5}ŞÎ>c?¨¬WÁìŞº¦\0rk‰ŒåãÄXÙø&„ÀÊûnP(f·gj~!Äæ¼”]u]Y‡mÈ \0rè MÈ#VÈ?q]Ëòl­ı\\º0Ã‡Ñ\\Kf:¸X/|c•5JMª6öùëæ=¢>Úı«æ^gÛº+‚òv>5ó6à¼ºŞ¦,N„¹Vj%<<˜r–e²Hıõá[7{$ÂªÚùˆïJ7î|Liˆ-»N dãä~»826~ş9±¸.)¶¬4¢ê·6qİuÆqœ¨jş£d®Å™A|Œ. xıÈdí=ıjˆìø0ùƒÕ]€|@ÊílëæW.d>:‚û¡³L/D‘9T\"æÍeN3¢*1¸\0ä¾ZR«È“Åõµ£òf<x4½“³W1æÉˆöl†¯†¢~˜w-v…îÅ\Z…W\Z|Öú ˆ,Ø{×b\"á|…õ‘ûAé6KÊêéùŒ€:XEÖëâ+aÀÉ½d\0ŒqE£ûÍ“¸ÊîëpÕT¥©^hC:ìÏÙfü	@Q-ÿ\0SöÜe¨J×_sf\\ı«¸û¯ÄÔöÿ\0	‘}¼¶9øH%“ÅP¹â~>@êœ½^FbälX=Q®ÄÈ¥I¡Gİ1¦UVÈµ$\0@0,@0²dSî])Sû×pA—öo”¨§\Z’—êL>‹WÚH@ß1±FãÂ©µ\rLkøËß˜Ş£^‡‚;7ó2¾7ÉÓmÀ1ìí,›7\"‹³ÄçpcÈTz™<¯ûšÌ„–f\0lÄCY\0Wãd“1»«_:³cZMHOF3¦\\6z¹LJ’ªÕÁùˆøìSr¹&3ŸT ¾ JÊÂ@ÇØù3\Zlqåú‰1ğ\"íô®·âáu‰1oßâ\"€åuRh÷Ä)8€„®À\Z11V6d,us’cA?Ô{&\n›ìELe‚…LUO³ùûÔU¹¡í¿ûK,µÆ¼ıN!6	ıjv`{Ô15€ÄğÀ¤0(‚ã°w\0Æ•Ç~â|˜FAØ1y+ş°veâ+çc÷Âö„Ô™`j[‹&0ûÃèÜ8p©µãí16,ØöH&Ü Î2ruK«3\'©ı@’´/±*€ÖÖ0ğàÍL¥wôz3‚)[¸™¼cjÄ•êU’ñ‘8€J|¾p¹¬jË[Zİ™üÌî·û)\rüWÄ\\ìÙûŸ§ÜaäA³‚ïõuäø•{©íM™ÉÌäŞ\0œu¥øû2ÉñPynÏÜ²t«ÿ\0Ògs¡J&ÏpÃÊ­¦¼€í—ğïÇì«u\ZÁ`	ø\"Ä:ÅJOûû…W?áÂÕ{W(\0È<Š+çrƒDŸù‰u‘\n´N¨™KlVÈ:tRŠôıÈ‹lÄY<C•yœu¢hhØ‡)Ì«WØ£¹íL¬®FˆZœàÛ!œÎBˆ\ràÜ<\0®ÇÖæ<y2ä¬¤\r²3bP8÷3n÷ğ\"©¿qıú™.HÜFâ¦=\0å%9ÕË^Í]ÿ\0ÍÆô5Lc–€Q~#@Ì¨¬AFüèOx@ ¶£\0¬•Ì§Lc€Š¨˜•ØÑ\0»6mÙ¸[2° :e­OrµĞ U«!èC›¡Øèó?fÍ™XÚ€êÜñ‰ØÒ…É\0Q‘‘PÃD}AK“yŒ¾H&êÍ¶OôÎˆ\n7²VaW^D¼ªwÈø‰é.2[İÕN`l¯í^ø&€ƒPÌ°! ¨Õ×Ej7¢ +=\0Š4·èpZÕ[*­0»¨ÈÙq–R†\0c¨ùpº{Ùß“ó7\n0fÑËm°·äÔç“Óä¬uf•Ø5M\r\\2q‹½“Lüå@Ö‰…\ZvlDgcåŸÏÄ¡:ş„ĞÜäû	€KúÇÜâwåkó+âu¢Ş?a×Ùù3Û{?¼7;‡jO^I•­Øñucò;ù•.‡ğÿ\0%È\\£åb¾74¥¨UËYıB…Dôñ3z}`Ÿ˜¾±ŞJÙ\nL+™hcF±ÙŠSJ©·ûˆÌÒozÂ\0I‰yr±àN¹/p?âil|Fõ¹Ğ²NÁĞ%ğQDÛæÄª¥\n»…½ÜxK~Û‡>´<ÂWÿ\0¸\ZÙêdÄ‡‘İuàÜR˜Ğ‡T;ì÷9J\0º?f:%w¢1v,˜¹ÉKÒ–¿¡#œc<€*¡1W%r4cëE•ÓñlªÇ¶G“±©‹š lÙ†ÿ\0°Œ\rnhç/7zÌ†«È¨F4E¢tMØÛ(jÂŸ;ş(·zãû˜¤~‰á¦/ôLüIüJ‹ôhT[bÀ¢Š\0¦¿hªêÀ¿¸Ùreö\núŞ¥cF¬ŠÚ Æ_e¸øı£>MUwöc6\nhqË‘C÷ñä»±àÇTo; F8ù\r^˜ÇäŠJù{r?8şñ2a³Ì) ƒVº\0Ü,¡:äìˆY1·ªÌ?Io+û	•S‰ı4ß¤TOC@W>éÃğøÅätÕøã¥n©B¥1Âe}’° E!Ë-•~„lÊşşLôü‘qü1Uş¢a|I”„\'²?±6MOÒ?êj„½A¹¸KÙ7¹ô!>*j¿àJ]ûVy÷7ı	×òª\0||@Mõ<Y¹í¡A ¢;2Éêæˆóæ|ƒ<\rb.9©˜é’-ê;°#&ˆ\0†)]ËÄ˜3¥¿%ñpo)‹{Î¼üÚbÆÏ|Ov#b)”datÈ¡9oÄÉ˜¶6\'‹sàGÍ	&Š3 \n´|óùd(¾ ä{c£õ©ãª¹l€¨Ê{¦ú™Ænw¶äÔ´B ¢<ˆ°æ,ÌIöòä™6@ÓoıÀÄPŠÖç°‚í½õŞ0|)ãğc³²æ1™³¶EG\"XØX°\'\"m¢ş0>¡â>wôü»}P†ëæ1U6@‘×Öí©yœÒòİ–5Ö\'ŞÇw=Ì,şâÁ\"2æºQdˆo‘_ıN-œŸPUşä}Î9RÑõ¶ú\"è(ÙÙñ2aÍ‰O,g\\àP¤Ğ#ÇÌV•,}\n©+é±¥+ËK¯0®DbX£8thõCë»œ­I\0hÌùNDÿ\0Yät%äô¶/Ø²–ˆİÚ£äüRæ•»E_+Õ|Œê…5Éº@\'É„ó+ârâƒ\Zò:7D’OfÅ€p~D•ZÖ¾oÄÈ¸rfÀc\0³i¸ÃğøZÀ\"ƒ9ÿ\0¡üFU<Oš?ÇÙ€\0(N¶gDOşZ¾ÿ\0-ÊQÙó¯È]h|“6`9V4\0ø×åIz>IúœB‹ãğ~aZÑ3Ûÿ\0³5_ğ!P;&Õ·À—WBoÇÔ­ìù&nhhJÀC£ƒ‚¾­›r‚Rñú„evâŠ¤›Ôi\n€~7°}0ÿ\0P‚½CŒ¶TÁ÷q1Y2\"&_Qşë§“îoÜÃ•\0Bİü\\\n\nìÍwöícò\n\rŠ»Ä§«VÀncõ8r+uCá¦$.Ì}1²>æ7ÈHg%yFAˆUtâ*ãKbŞZ{Š\0T³qÿ\0ø®$ıÇ9édPêQºªÔ¾T\'ó²î¼ œòP%ÎÍÃr‹ikD™³@}Ew rU‰>npûâ!²1œùèF¼XË:ïf(÷«X¨Kl~¢<E.½v7wQ¸ö>A‹ÂÙ™ús®®)ü>:k`Ğ»4Üv\ZŒˆ”ä€/zÙ­ŠÑ“lv{ù˜ÎMİ›­D81&Éé˜Ğ3Çy_@ñÔlx›k`r]P«•È`8ãlÒÄLÙpe\\\\œcfùœìÊàY<DL<şRÆüH|\0¿—\ruTeÅù“ñßf^PÁ]ıÎæê”FeL¼Y«ïs“¢\"’½Ù–Môâñ6ª.ÌÖ¬ÏÚY¹fìÏ3U(	[ü«ÅüÊ0Ğ†‡Iÿ\0û€‘|@ñ(¯ÄóS`ıÌº|oÌh&‘f§&;¯\rÕÔ£ü]J|lOØ„>l\0–@(š¸õÑÁ~gbÄŸ4 ×Ud¸„±Øºâ\"­öãdı¥YõûŞç\0ªñaï7\n=ÖBv@EÌXÓ(xÏ]™—˜‹y`b*€Ì§˜øXìãj1l|Ùè.wpäÏø‡/•‰òOK ı+ÄlØ•ú#\\¾ãµ½›ê„$)¡ê0¦û\"‹(U~Œ¥»ÈÕf„gİZ0²© <ÃÈuòeNMİ_pQíf®ª0ä‹Ì|5O`e€Úkë_!æ”lŠ”ô{|8«u1#­‚åSjà¼%ª®¬©“›“¤>Ğ>árcpœÊê®Ab:å=l\\@w\"À>jÉÃ‚ƒ¥³ßR˜,jâ»äÅîb=ÇË”§ª[Š¨S{1@^¿·Š³\\¹8l?Oí…orù5 ìï—üÆÎŒü\Z`çèÂ9#çÅFãé€¥X3gñõfã2¨gnGÀO‘˜^ÎÍïøôfİëû	ÜŞ¿/&›–ÑQH$³hOÛîlû	¯şË$Tónk¡ğ.\Z£¥¿ı™bõPX^Fü¥\r~ÂoÉ2‡m}™Ğ©È¨—FÍÔÙz›ş3Áñ–ÁôË²ÚàÉ±É–èÔ(‡!\r_%\"„ôğ/j ³ËædÛ•®€L¾¡ª\n6¤µ1\"®R0¾¼F°-İŸ<A\róìœ²¸å‘¼ıáfÜÀXŸÒ£‘û¹‘1·ö‡“jÉ–UjÏA„_Qs”Ğè]M£\"3bF+öª‘½Ln AŒ¨ö´ö/áú¹„­%u0&Û!\'B>\\9i²9åğ%†5F/¾@n3]›\r¸\r’Xvgò	”vŠIĞQâ\0¤éI…©‰R5£UNv-Œo\0öÏ{¨9t<\\/Tª\0PnıÄö s×û®>\\™æ§ewÜÈ¤3(l@²A‰›5ö3;İÏÖÈ*èàÌØKú!¾¢¸\rÇ.Ç:;±1ş#>¸]¸«èÍO.%_bÔvDá“‹¼5Å—èÀp«pùn„m×\Z˜±‚)A\Z 5ı\rÁüœš£ó¡ÿ\0ÙüŞ6ÄhÅ!™¹Q:Æ¤r,l\'r°tì?«øûü¶©ÿ\0³:—cÌÕÑiı¥“ùQ0ë_dÏkt¿SC¡1%T|™@î\Z”°’A-ªx÷@>MşĞìÿ\0ÉèNNÖ¢YêT÷ù{ˆû~Zü¨\\ˆÁ•¾Ä*ÙğJÈ/_~è¾®1dZ€]¨2ñ/½›D“à‹™9è»|@N<ÁÃ8½õq>Zâh“æBæ–¿Iªşó†\'ù•_üù0\0­Ø½9år)¾\0ñ2*±Ô[ªæVJ›ıç±ë_şÒÀac]ÂsE¸B\rµy‰Œ`ÄMUÜ\\V•AC†B‚ü²‚b¸Âh®.5T°B{yPmCú¶¾!TQ¢Ì,j{¿¨,©Pzc(MİÑrFÖ å“ãZYšÎÂ\"C\"šO¸p°æşlô!sŠË\\µ²h’\n·€!fUp\\¿`N)Ê‚ÕÌg»4WÄ \\·‘âÇ˜cr\\¦¢Á|vb©Z¯,,x\"åî…ìÁ‡ÿ\0\'=.bå­º]Y…Š\'7Ğ\0·Æ€ÔÄøİ\rnÄK\\l«¼š\0y?0+æÉ;TäùÜÛÕŠäÈäª¡æzxØ’QÏå°¤Í	îî\']ƒ;›ŸÿÙ');

/*Table structure for table `tbldetallescompra` */

DROP TABLE IF EXISTS `tbldetallescompra`;

CREATE TABLE `tbldetallescompra` (
  `IdDC` int(11) NOT NULL AUTO_INCREMENT,
  `IdC` int(11) DEFAULT NULL,
  `idPF` int(11) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  `idP` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdDC`),
  KEY `IdC` (`IdC`),
  KEY `idPF` (`idPF`),
  CONSTRAINT `tbldetallescompra_ibfk_1` FOREIGN KEY (`IdC`) REFERENCES `compra` (`IdC`),
  CONSTRAINT `tbldetallescompra_ibfk_2` FOREIGN KEY (`idPF`) REFERENCES `productofinal` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbldetallescompra` */

insert  into `tbldetallescompra`(`IdDC`,`IdC`,`idPF`,`Precio`,`Cantidad`,`Subtotal`,`idP`) values 
(1,4,NULL,6,2,12,47),
(2,4,NULL,1,2,2,49),
(3,5,NULL,6,3,18,47),
(4,5,NULL,1,3,3,49),
(5,6,NULL,6,3,18,47),
(6,6,NULL,1,3,3,49),
(7,7,NULL,6,1,6,47),
(8,7,NULL,1,1,1,49),
(9,8,NULL,8,1,8,47),
(10,8,NULL,1,1,1,49),
(11,8,NULL,3,1,3,51),
(12,10,NULL,8,2,16,47),
(13,10,NULL,1,2,2,49),
(14,10,NULL,3,1,3,51),
(15,11,NULL,8,1,8,47),
(16,11,NULL,1,1,1,49),
(17,11,NULL,3,1,3,51),
(18,12,NULL,8,1,8,47),
(19,12,NULL,1,1,1,49),
(20,12,NULL,3,1,3,51),
(21,13,NULL,8,2,16,47),
(22,13,NULL,1,2,2,49),
(23,13,NULL,3,3,9,51),
(24,14,NULL,8,1,8,47),
(25,14,NULL,3,1,3,53),
(26,14,NULL,2,1,2,52),
(27,14,NULL,1,1,1,49),
(28,14,NULL,3,1,3,51),
(29,15,NULL,8,1,8,47),
(30,15,NULL,3,1,3,53),
(31,15,NULL,2,1,2,52),
(32,15,NULL,1,1,1,49),
(33,15,NULL,3,1,3,51),
(34,16,NULL,8,1,8,47),
(35,16,NULL,3,1,3,53),
(36,16,NULL,2,1,2,52),
(37,16,NULL,1,1,1,49),
(38,16,NULL,3,1,3,51),
(39,17,NULL,8,1,8,47),
(40,17,NULL,3,1,3,53),
(41,17,NULL,2,1,2,52),
(42,17,NULL,1,2,2,49),
(43,17,NULL,3,2,6,51),
(44,18,NULL,8,2,16,47),
(45,18,NULL,3,1,3,53),
(46,18,NULL,2,1,2,52),
(47,18,NULL,1,1,1,49),
(48,18,NULL,3,1,3,51),
(49,19,NULL,8,1,8,47),
(50,19,NULL,3,1,3,53),
(51,19,NULL,2,2,4,52),
(52,19,NULL,1,1,1,49),
(53,19,NULL,3,1,3,51),
(54,20,NULL,8,2,16,47),
(55,20,NULL,3,3,9,53),
(56,20,NULL,2,1,2,52),
(57,20,NULL,1,1,1,49),
(58,20,NULL,3,1,3,51),
(59,21,NULL,8,1,8,47),
(60,21,NULL,3,1,3,53),
(61,21,NULL,2,1,2,52),
(62,21,NULL,1,1,1,49),
(63,21,NULL,3,1,3,51);

/*Table structure for table `tbldireccion` */

DROP TABLE IF EXISTS `tbldireccion`;

CREATE TABLE `tbldireccion` (
  `IdDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `Domicilio` varchar(100) DEFAULT NULL,
  `Colonia` varchar(100) DEFAULT NULL,
  `Calle` varchar(100) DEFAULT NULL,
  `idmunicipio` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdDireccion`),
  KEY `idmunicipio` (`idmunicipio`),
  CONSTRAINT `tbldireccion_ibfk_1` FOREIGN KEY (`idmunicipio`) REFERENCES `municipios` (`IdMunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbldireccion` */

insert  into `tbldireccion`(`IdDireccion`,`Domicilio`,`Colonia`,`Calle`,`idmunicipio`) values 
(1,'Huejutla','Cantores','5',NULL),
(2,'Jaltocan','La capilla','La revolucion',NULL);

/*Table structure for table `tblfinal` */

DROP TABLE IF EXISTS `tblfinal`;

CREATE TABLE `tblfinal` (
  `Idfinal` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Idfinal`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `tblfinal_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productofinal` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblfinal` */

insert  into `tblfinal`(`Idfinal`,`idProducto`,`Total`,`idCliente`,`Descripcion`) values 
(4,5,8,17,'Lechuga'),
(6,7,30,21,'Cebolla');

/*Table structure for table `tblproveedores` */

DROP TABLE IF EXISTS `tblproveedores`;

CREATE TABLE `tblproveedores` (
  `Folio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apaterno` varchar(50) DEFAULT NULL,
  `Amaterno` varchar(50) DEFAULT NULL,
  `IdPDireccion` int(11) DEFAULT NULL,
  `IdPTelefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`Folio`),
  KEY `IdPDireccion` (`IdPDireccion`),
  KEY `IdPTelefono` (`IdPTelefono`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblproveedores` */

insert  into `tblproveedores`(`Folio`,`Nombre`,`Apaterno`,`Amaterno`,`IdPDireccion`,`IdPTelefono`) values 
(1,'David','Alaya','Cruz',1,2);

/*Table structure for table `tbltelefono` */

DROP TABLE IF EXISTS `tbltelefono`;

CREATE TABLE `tbltelefono` (
  `IdTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `Telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IdTelefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbltelefono` */

insert  into `tbltelefono`(`IdTelefono`,`Telefono`) values 
(1,'7712345666'),
(2,'7711223456'),
(3,'1213141517');

/*Table structure for table `tipos` */

DROP TABLE IF EXISTS `tipos`;

CREATE TABLE `tipos` (
  `IdTipo` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipos` */

insert  into `tipos`(`IdTipo`,`Tipo`) values 
(1,'Cliente'),
(2,'Empleado');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) DEFAULT NULL,
  `pssw` varchar(100) DEFAULT NULL,
  `Tipo` enum('Cliente','Empleado') DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idCliente` (`Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idUsuario`,`Usuario`,`pssw`,`Tipo`) values 
(3,'Dennis','d0f7423e6e494bbabdbd1039696d474a','Cliente'),
(5,'Fabian','1960161b53ff409fac80f6f80985b6de','Empleado'),
(6,'Deniso','08a9061908f39352fe12fa091b45fceb','Cliente'),
(7,'brayan','827ccb0eea8a706c4c34a16891f84e7b','Cliente'),
(11,'yo','6d0007e52f7afb7d5a0650b0ffb8a4d1','Empleado'),
(12,'jesus','110d46fcd978c24f306cd7fa23464d73','Empleado'),
(13,'Brayan','202cb962ac59075b964b07152d234b70','Empleado');

/* Trigger structure for table `productofinal` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tggr_InsertaProductoF` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tggr_InsertaProductoF` AFTER INSERT ON `productofinal` FOR EACH ROW BEGIN
    DECLARE ToTAal FLOAT;
    SET ToTAal=new.precio*new.Cantidad;
    
    
    INSERT INTO tblfinal(idProducto,Total,idCliente,Descripcion)
    VALUES(new.idProducto,ToTAal,new.idCliente,new.Descripcion);
    END */$$


DELIMITER ;

/* Trigger structure for table `productofinal` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tggr_ActualizaProductF` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tggr_ActualizaProductF` AFTER UPDATE ON `productofinal` FOR EACH ROW BEGIN
    DECLARE ToTAal FLOAT;
    SET ToTAal=new.precio*new.Cantidad;
    
    UPDATE tblfinal SET idProducto=new.idProducto,Total=ToTAal,idCliente=new.idCliente,Descripcion=new.Descripcion WHERE idProducto=new.idProducto;
    END */$$


DELIMITER ;

/* Trigger structure for table `productofinal` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tggr_EliminaProductoF` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tggr_EliminaProductoF` BEFORE DELETE ON `productofinal` FOR EACH ROW BEGIN
delete from tblfinal where idProducto=old.idProducto;
    END */$$


DELIMITER ;

/* Procedure structure for procedure `so_ConsultaINFcliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `so_ConsultaINFcliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `so_ConsultaINFcliente`()
BEGIN
		select * from view_ConsultaClientesDatos;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `SpIngresaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `SpIngresaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SpIngresaProducto`(IN nombrep VARCHAR(100), IN precios float,IN catego INT,in img longblob)
BEGIN
	INSERT INTO `productos`(Nombre,Precio,Categoria,Imagen) VALUES(nombrep,precios,catego,img);

	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃƒÂ±adeMunicipio` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃƒÂ±adeMunicipio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃƒÂ±adeMunicipio`(in Nom varchar(100))
BEGIN
insert into municipios(Nombre) values(Nom);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃƒÂ±adePF` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃƒÂ±adePF` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃƒÂ±adePF`(in Descri varchar(150), in Paga float, IN IDC INT, in Image varchar(200))
BEGIN
insert into productofinal(Descripcion,precio,idCliente, Imagen) values (Descri,Paga,IDC, Image);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃƒÂ±adirCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃƒÂ±adirCategoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃƒÂ±adirCategoria`(in catego varchar(100))
BEGIN
INSERT INTO categorias(descripcion) VALUES(catego);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃƒÂ±adirEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃƒÂ±adirEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃƒÂ±adirEmpleado`(IN n VARCHAR (50), IN ap VARCHAR (50), IN am VARCHAR (50), IN IT VARCHAR(10),
IN IDI VARCHAR(100), IN Usu VARCHAR(20), IN pssw VARCHAR(200))
BEGIN
INSERT INTO empleados (Nombre,Apaterno,Amaterno,Telefono,Direccion,Usuario,Pssword,IdTipo)
		VALUES (n,ap,am,IT,IDI,Usu,MD5(pssw),2);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃƒÂ±adirProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃƒÂ±adirProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃƒÂ±adirProducto`(in Nom varchar(120), in pago float, in Catego int, in Image blob)
BEGIN
insert into productos(Nombre,Precio,Categoria, Imagen) values (Nom,pago,Catego, Image);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ActualizaClientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ActualizaClientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ActualizaClientes`(IN Cod int, IN nom VARCHAR(100), IN ap VARCHAR(100), IN am VARCHAR(100),IN IT varchar(10), 
IN IDI varchar(100), iN Usu varchar(20), in pssw varchar(200))
BEGIN
UPDATE cliente SET Nombre=nom, APaterno=ap, AMaterno=am, Telefono=IT, Direccion=IDI, Usuario=Usu, pssword=md5(pssw), IdTipo=1
WHERE IdCliente=Cod;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ActualizaDireccion` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ActualizaDireccion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ActualizaDireccion`(in Cod int, IN Domi VARCHAR(100),IN Col VARCHAR(100),IN Cayie VARCHAR(100), IN Muni INT)
BEGIN
UPDATE tbldireccion SET Domicilio=Domi, Colonia=Col, Calle=Cayie, idmunicipio=Muni
		WHERE IdDireccion=Cod;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ActualizaEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ActualizaEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ActualizaEmpleado`(iN Cod INT, IN nom VARCHAR(100), IN ap VARCHAR(100), IN am VARCHAR(100),IN IT VARCHAR(10), 
IN IDI VARCHAR(100), IN Usu VARCHAR(20))
BEGIN
UPDATE empleados SET Nombre=nom, APaterno=ap, AMaterno=am, Telefono=IT, Direccion=IDI, Usuario=Usu, IdTipo=2
		WHERE idEmpleado=Cod;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ActualizaPF` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ActualizaPF` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ActualizaPF`(IN PF INT,IN Des VARCHAR(100),IN Paga FLOAT, IN Cod INT, IN Stock INT)
BEGIN
Update productofinal set Descripcion=Des, precio=Paga, idCliente=Cod, Cantidad=Stock Where idProducto=PF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ActualizaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ActualizaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ActualizaProducto`(in Product int, in nom varchar(150), in paga float, in Catego int)
BEGIN
update productos set Nombre=nom, Precio=paga, Categoria=Catego where Idp=Product;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ActualizaProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ActualizaProveedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ActualizaProveedor`(IN Cod INT, IN nom VARCHAR(100), IN ap VARCHAR(100), IN am VARCHAR(100), IN IDI INT, iN IT INT)
BEGIN
UPDATE tblproveedores SET Nombre=nom, APaterno=ap, AMaterno=am, IdPDireccion=IDI, IdPTelefono=IT
		WHERE Folio=Cod;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ActualizaTelefono` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ActualizaTelefono` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ActualizaTelefono`(IN ITEL INT, IN tel varchar(10))
BEGIN
update tbltelefono set Telefono=tel where IdTelefono=ITEL;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃ±adeMunicipio` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃ±adeMunicipio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃ±adeMunicipio`(in Nom varchar(100))
BEGIN
insert into municipios(Nombre) values(Nom);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃ±adePF` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃ±adePF` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃ±adePF`(in Descri varchar(150), in Paga float, IN IDC INT, in Image varchar(200))
BEGIN
insert into productofinal(Descripcion,precio,idCliente, Imagen) values (Descri,Paga,IDC, Image);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃ±adirCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃ±adirCategoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃ±adirCategoria`(in catego varchar(100))
BEGIN
INSERT INTO categorias(descripcion) VALUES(catego);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃ±adirEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃ±adirEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃ±adirEmpleado`(IN n VARCHAR (50), IN ap VARCHAR (50), IN am VARCHAR (50), IN IT VARCHAR(10),
IN IDI VARCHAR(100), IN Usu VARCHAR(20), IN pssw VARCHAR(200))
BEGIN
INSERT INTO empleados (Nombre,Apaterno,Amaterno,Telefono,Direccion,Usuario,Pssword,IdTipo)
		VALUES (n,ap,am,IT,IDI,Usu,MD5(pssw),2);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃ±adirProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃ±adirProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃ±adirProducto`(in Nom varchar(120), in pago float, in Catego int, in Image blob)
BEGIN
insert into productos(Nombre,Precio,Categoria, Imagen) values (Nom,pago,Catego, Image);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_AÃ±adirUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_AÃ±adirUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AÃ±adirUsuario`(IN Usu VARCHAR(100), IN Pss VARCHAR(120), in tipo varchar(120))
BEGIN
INSERT INTO usuarios (Usuario, pssw, Tipo) 
VALUES (Usu, MD5(Pss), tipo);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_BusquedaEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_BusquedaEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_BusquedaEmpleado`(IN usu VARCHAR(120), IN pss VARCHAR(120))
BEGIN
   SELECT Usuario,Pssword, IdTipo FROM empleados WHERE Usuario=usu AND Pssword=MD5(pss);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_BusquedaU` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_BusquedaU` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_BusquedaU`(IN usu VARCHAR(120), IN pss VARCHAR(120))
BEGIN
SELECT Usuario,pssword, IdTipo FROM cliente WHERE Usuario=usu AND pssword=MD5(pss);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ConsultaCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ConsultaCategoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ConsultaCategoria`()
BEGIN

SELECT idCategoria, descripcion from categorias;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ConsultaDireccionEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ConsultaDireccionEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ConsultaDireccionEmpleado`(IN Direcc VARCHAR(100))
BEGIN
     SELECT empleados.`Direccion`, COUNT(empleados.`Nombre`) AS EmpleadosDireccion
     FROM empleados
     WHERE empleados.`Direccion`=Direcc;
     
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ConsultaEmpleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ConsultaEmpleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ConsultaEmpleados`()
BEGIN
		SELECT * FROM empleados;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_EliminaCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_EliminaCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_EliminaCliente`(in Num int)
BEGIN
delete from cliente where IdCliente=Num;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_EliminaDireccion` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_EliminaDireccion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_EliminaDireccion`(in Cod INT)
BEGIN
delete from tbldireccion where IdDireccion=Cod;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_EliminaEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_EliminaEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_EliminaEmpleado`(IN Num INT)
BEGIN
DELETE FROM empleados WHERE idEmpleado=Num;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_EliminaMunicipio` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_EliminaMunicipio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_EliminaMunicipio`(in Muni int)
BEGIN
delete from municipios where IdMunicipio=Muni;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_EliminaPF` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_EliminaPF` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_EliminaPF`(IN PF INT)
BEGIN
DELEte from productofinal where idProducto=PF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_EliminaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_EliminaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_EliminaProducto`(in Producto int)
BEGIN
delete from productos where Idp=Producto;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_EliminaProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_EliminaProveedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_EliminaProveedor`(in Num int)
BEGIN
DELETE FROM tblproveedores WHERE Folio=Num;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Icliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Icliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Icliente`(in n varchar (50), in ap varchar (50), in am varchar (50), IN IT VARCHAR(10), 
IN IDI VARCHAR(100), IN Usu VARCHAR(20), IN pssw VARCHAR(200))
BEGIN
		INSERT INTO cliente (Nombre,Apaterno,Amaterno,Telefono,Direccion,Usuario,pssword,IdTipo)
		VALUES (n,ap,am,IT,IDI,Usu,Md5(pssw),1);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Idireccion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Idireccion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Idireccion`(in domi varchar(100), in coli varchar(100), in cayie varchar(100), in MuniID INT)
BEGIN
		insert into tbldireccion(Domicilio,Colonia,Calle, idmunicipio)
		values(domi,coli,cayie,MuniID);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_InsertaProductoF` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_InsertaProductoF` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_InsertaProductoF`(in Des varchar(100),in Paga float, in Cod int, in Stock int)
BEGIN
INSERT INTO productofinal (Descripcion,precio,idCliente,Cantidad) VALUES(Des,Paga,Cod,Stock);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Iprovedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Iprovedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Iprovedor`(IN n VARCHAR (50), IN ap VARCHAR (50), IN am VARCHAR (50), IN IT INT, IN IDi INT)
BEGIN
		INSERT INTO tblproveedores (Nombre,Apaterno,Amaterno,IdPDireccion,IdPTelefono)
		VALUES (n,ap,am,IDi,IT);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_TablaClientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_TablaClientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_TablaClientes`()
BEGIN
select *from cliente;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_TablaCompra` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_TablaCompra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_TablaCompra`()
BEGIN
select *from compra;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_TablaEmpleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_TablaEmpleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_TablaEmpleados`()
BEGIN
select *from empleados;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_TablaPF` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_TablaPF` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_TablaPF`()
BEGIN
Select *from productofinal;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_TablaProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_TablaProductos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_TablaProductos`()
BEGIN
SELECT
   productos.`Idp`   AS `codigo_prod`, 
  `productos`.`Nombre`       AS `Nombre`,
  `productos`.`Precio`       AS `Precio`,
  `productos`.`Imagen`       AS `Imagen`,
  `categorias`.`IdCategoria` AS `IdCategoria`
FROM (`productos`
   JOIN `categorias`)
WHERE `productos`.`Categoria` = `categorias`.`IdCategoria`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_telefono` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_telefono` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_telefono`(in t varchar (10))
BEGIN
		insert into tbltelefono(Telefono)
		values (t);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_VistaDelFINAL` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_VistaDelFINAL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_VistaDelFINAL`()
BEGIN
Select Idfinal, Idproducto, Total, Idcliente, Descripcion from tblfinal;
	END */$$
DELIMITER ;

/*Table structure for table `view_consultaclientesdatos` */

DROP TABLE IF EXISTS `view_consultaclientesdatos`;

/*!50001 DROP VIEW IF EXISTS `view_consultaclientesdatos` */;
/*!50001 DROP TABLE IF EXISTS `view_consultaclientesdatos` */;

/*!50001 CREATE TABLE  `view_consultaclientesdatos`(
 `IdCliente` int(11) ,
 `Nombre` varchar(30) ,
 `APaterno` varchar(30) ,
 `AMaterno` varchar(30) ,
 `Telefono` varchar(10) ,
 `Direccion` varchar(100) ,
 `Usuario` varchar(20) ,
 `pssword` varchar(200) ,
 `IdTipo` int(11) 
)*/;

/*Table structure for table `view_producto` */

DROP TABLE IF EXISTS `view_producto`;

/*!50001 DROP VIEW IF EXISTS `view_producto` */;
/*!50001 DROP TABLE IF EXISTS `view_producto` */;

/*!50001 CREATE TABLE  `view_producto`(
 `codigo_prod` int(11) ,
 `Nombre` varchar(100) ,
 `Precio` float ,
 `Imagen` longblob ,
 `IdCategoria` int(11) 
)*/;

/*View structure for view view_consultaclientesdatos */

/*!50001 DROP TABLE IF EXISTS `view_consultaclientesdatos` */;
/*!50001 DROP VIEW IF EXISTS `view_consultaclientesdatos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_consultaclientesdatos` AS (select `cliente`.`IdCliente` AS `IdCliente`,`cliente`.`Nombre` AS `Nombre`,`cliente`.`APaterno` AS `APaterno`,`cliente`.`AMaterno` AS `AMaterno`,`cliente`.`Telefono` AS `Telefono`,`cliente`.`Direccion` AS `Direccion`,`cliente`.`Usuario` AS `Usuario`,`cliente`.`pssword` AS `pssword`,`cliente`.`IdTipo` AS `IdTipo` from `cliente`) */;

/*View structure for view view_producto */

/*!50001 DROP TABLE IF EXISTS `view_producto` */;
/*!50001 DROP VIEW IF EXISTS `view_producto` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_producto` AS (select `productos`.`Idp` AS `codigo_prod`,`productos`.`Nombre` AS `Nombre`,`productos`.`Precio` AS `Precio`,`productos`.`Imagen` AS `Imagen`,`categorias`.`IdCategoria` AS `IdCategoria` from (`productos` join `categorias`) where `productos`.`Categoria` = `categorias`.`IdCategoria`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
