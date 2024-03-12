# Host: localhost  (Version 5.5.5-10.1.37-MariaDB)
# Date: 2019-06-13 12:34:50
# Generator: MySQL-Front 6.1  (Build 1.26)
#
# Structure for table "auditoria"
#
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `usuario_nombre` varchar(150) COLLATE macroman_bin DEFAULT NULL,
  `permiso` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `controller` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `method` varchar(225) COLLATE macroman_bin DEFAULT NULL,
  `descripcion` varchar(225) COLLATE macroman_bin DEFAULT NULL,
  `data` text COLLATE macroman_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2317 DEFAULT CHARSET=macroman COLLATE=macroman_bin;
#
# Structure for table "configuracion_general"
#
DROP TABLE IF EXISTS `configuracion_general`;
CREATE TABLE `configuracion_general` (
  `idConfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `HoraInicioIntervalo` time DEFAULT NULL,
  `HoraFinIntervalo` time DEFAULT NULL,
  `CobrarTicket` tinyint(4) DEFAULT NULL,
  `CuentaCorreo` text,
  `PasswordCorreo` text,
  `Encriptacion` varchar(50) NOT NULL,
  PRIMARY KEY (`idConfiguracion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
#
# Data for table "configuracion_general"
#

INSERT INTO `configuracion_general` VALUES (1,'08:00:00','23:00:00',0,'AdmiWebOnline@gmail.com','qwertyytrewq','tls');
#
# Structure for table "dinero_default"
#

DROP TABLE IF EXISTS `dinero_default`;
CREATE TABLE `dinero_default` (
  `idDineroDefault` int(11) NOT NULL AUTO_INCREMENT,
  `monto` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDineroDefault`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 PACK_KEYS=0;

INSERT INTO `dinero_default` VALUES (1,1,1),(2,2,1),(3,4,1),(4,5,1),(5,10,1),(6,20,1),(7,50,1),(8,100,1);

#
# Structure for table "empresa"
#

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `idEmpresa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `razonSocial` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
#
# Structure for table "juego"
#
DROP TABLE IF EXISTS `juego`;
CREATE TABLE `juego` (
  `idJuego` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lapsoProxEventoHoras` int(11) DEFAULT NULL,
  `lapsoProxEventoDia` int(11) DEFAULT NULL,
  `lapsoProxEventoMinutos` int(11) DEFAULT NULL,
  `apuestaMinima` decimal(18,2) DEFAULT NULL,
  `apuestaMaxima` decimal(18,2) DEFAULT NULL,
  `segBloqueoAntesEvento` int(11) DEFAULT NULL,
  `idMoneda` int(11) DEFAULT NULL,
  `diasVigentesCobroTicket` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `segBloqueoAntesAnimacion` int(11) NOT NULL,
  `segCajaGirando` int(11) DEFAULT NULL,
  PRIMARY KEY (`idJuego`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "juego"
#
INSERT INTO `juego` VALUES (1,'Cuy','icontombola.png',0,0,2,1.00,2000.00,10,94,3,1,30,10),(3,'Cuy2','cuy.png',0,0,2,1.00,1000.00,10,94,3,0,30,10);

#
# Structure for table "migrations"
#

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "migrations"
#

INSERT INTO `migrations` VALUES (441,'2014_10_12_000000_create_users_table',1),(442,'2014_10_12_100000_create_password_resets_table',1),(443,'2019_01_16_152206_create_empresa_table',1),(444,'2019_01_16_183845_create_punto_venta_table',1),(445,'2019_01_16_183930_create_ubigeo_table',1),(446,'2019_01_18_200749_create_apertura_caja_table',1),(447,'2019_01_18_200809_create_apuesta_table',1),(448,'2019_01_18_200825_create_caja_table',1),(449,'2019_01_18_200842_create_cliente_table',1),(450,'2019_01_18_200908_create_configuracion_evento_table',1),(451,'2019_01_18_200934_create_configuracion_jackpot_table',1),(452,'2019_01_18_200953_create_configuracion_pozo_table',1),(453,'2019_01_18_201019_create_detalle_evento_table',1),(454,'2019_01_18_201043_create_evento_table',1),(455,'2019_01_18_201108_create_ganador_evento_table',1),(456,'2019_01_18_201129_create_jackpot_table',1),(457,'2019_01_18_201148_create_moneda_table',1),(458,'2019_01_18_201236_create_pozo_jackpot_table',1),(459,'2019_01_18_201253_create_pozo_online_table',1),(460,'2019_01_18_201311_create_ticket_table',1),(461,'2019_01_18_201333_create_tipo_apuesta_table',1),(462,'2019_01_18_201356_create_tipo_pago_table',1),(463,'2019_01_18_201412_create_turno_table',1),(464,'2019_01_22_093627_create_jackpot_punto_venta_table',1);

#
# Structure for table "moneda"
#

DROP TABLE IF EXISTS `moneda`;
CREATE TABLE `moneda` (
  `idMoneda` int(11) unsigned NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `simbolo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codlso` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `principal` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "moneda"
#

INSERT INTO `moneda` VALUES (1,'Dólar australiano','$','AUD',0,1),(2,'Lek albanés','ALL','ALL',0,1),(3,'Dinar argelino','NA','DZD',0,1),(4,'Peso argentino','$','ARS',0,1),(5,'Florín arubeño','?','AWG',0,1),(6,'Libra esterlina','£','GBP',0,1),(7,'Dólar de las Bahamas','B$','BSD',0,1),(8,'Dinar de Bahréin','NA','BHD',0,1),(9,'Taka de Bangladesh','Tk','BDT',0,1),(10,'Dólar de Barbados','BBD','BBD',0,1),(11,'Rublo bielorruso','Br','BYR',0,1),(12,'Dólar de Belice','BZ$','BZD',0,1),(13,'Dólar de Bermudas','BD$','BMD',0,1),(14,'Ngultrum de Bhutan','Nu.','BTN',0,1),(15,'Boliviano','Bs','BOB',0,1),(16,'Pula de Botsuana','P','BWP',0,1),(17,'Real brasileño','R$','BRL',0,1),(18,'Dólar de Brunéi','B$','BND',0,1),(19,'Lev búlgaro','NA','BGN',0,1),(20,'Franco burundí','FBu','BIF',0,1),(21,'Dólar canadiense','C$','CAD',0,1),(22,'Yuan chino','¥','CNY',0,1),(23,'Riel camboyano','KHR','KHR',0,1),(24,'Escudo caboverdiano','Esc','CVE',0,1),(25,'Dólar de las Islas Caimán','$','KYD',0,1),(26,'Franco CFA (BCEAO)','BCEAO','XOF',0,1),(27,'Franco CFA (BEAC)','BEAC','XAF',0,1),(28,'Peso chileno','$','CLP',0,1),(29,'Peso colombiano','$','COP',0,1),(30,'Franco comorano','KMF','KMF',0,1),(31,'Colón costarricense','NA','CRC',0,1),(32,'Kuna croata','kn','HRK',0,1),(33,'Peso cubano','$MN','CUP',0,1),(34,'Corona checa','NA','CZK',0,1),(35,'Corona danesa','kr','DKK',0,1),(36,'Franco yibutiano','Fdj','DJF',0,1),(37,'Peso dominicano','RD$','DOP',0,1),(38,'Euro','?','EUR',0,1),(39,'Dólar del Caribe Oriental','EC$','XCD',0,1),(40,'Libra egipcia','NA','EGP',0,1),(41,'El Colon del Salvador','NA','SVC',0,1),(42,'Corona estonia','EEK','EEK',0,1),(43,'Birr etíope','Br','ETB',0,1),(44,'Libra malvinense','£','FKP',0,1),(45,'Dólar de Fiji','FJ$','FJD',0,1),(46,'Dalasi gambiano','D','GMD',0,1),(47,'Quetzal de Guatemala','Q','GTQ',0,1),(48,'Franco guineano','FG','GNF',0,1),(49,'Dólar guyanés','GY$','GYD',0,1),(50,'Cedi ghanes','GHS','GHS',0,1),(51,'Dólar de Hong Kong','HK$','HKD',0,1),(52,'Gourde haitiano','','HTG',0,1),(53,'Lempira hondureña','L','HNL',0,1),(54,'Florín húngaro','Ft','HUF',0,1),(55,'Rupia indonesia','Rp','IDR',0,1),(56,'Rupia india','Rs.','INR',0,1),(57,'Corona islandesa','kr','ISK',0,1),(58,'Rial iraní','','IRR',0,1),(59,'Dinar iraquí','NA','IQD',0,1),(60,'Shekel israelí','NA','ILS',0,1),(61,'Yen japonés','¥','JPY',0,1),(62,'Dinar jordano','JOD','JOD',0,1),(63,'Tenge kazako','KZT','KZT',0,1),(64,'Chelín keniano','KSh','KES',0,1),(65,'Won coreano','NA','KRW',0,1),(66,'Dinar kuwaití','NA','KWD',0,1),(67,'Kirguistán Som','KGS','KGS',0,1),(68,'Pataca de Macao','$','MOP',0,1),(69,'Dinar macedonio','MKD','MKD',0,1),(70,'Kwacha malawiano','MK','MWK',0,1),(71,'Ringgit malayo','RM','MYR',0,1),(72,'Rupia de Maldivas','Rf','MVR',0,1),(73,'Ouguiya de Mauritania','UM','MRO',0,1),(74,'Rupia mauricia','NA','MUR',0,1),(75,'Peso mexicano','$','MXN',0,1),(76,'Leu moldavo','MDL','MDL',0,1),(77,'Tugrik mongol','NA','MNT',0,1),(78,'Dirham marroquí','NA','MAD',0,1),(79,'Kyat de Myanmar','K','MMK',0,1),(80,'Dólar de Namibia','N$','NAD',0,1),(81,'Rupia nepalí','NA','NPR',0,1),(82,'Guilder antillano','NA?','ANG',0,1),(83,'Dólar neozelandés','$','NZD',0,1),(84,'Córdoba nicaragüense','C$','NIO',0,1),(85,'Naira nigeriano','NA','NGN',0,1),(86,'Won de Corea del Norte','NA','KPW',0,1),(87,'Corona noruega','kr','NOK',0,1),(88,'Rial omaní','NA','OMR',0,1),(89,'Franco CFP','F','XPF',0,1),(90,'Rupia pakistaní','Rs.','PKR',0,1),(91,'Balboa panameño','B','PAB',0,1),(92,'Kina de Papúa Nueva Guinea','K','PGK',0,1),(93,'Guaraní paraguayo','','PYG',0,1),(94,'Nuevo Sol peruano','S/','PEN',2,1),(95,'Peso filipino','NA','PHP',0,1),(96,'Zloty polaco','NA','PLN',0,1),(97,'Riyal Qatarí','NA','QAR',0,1),(98,'Leu rumano','L','RON',0,1),(99,'Rublo ruso','NA','RUB',0,1),(100,'Franco ruandés','RF','RWF',0,1),(101,'Franco suizo','CHF','CHF',0,1),(102,'Tala de Samoa','WS$','WST',0,1),(103,'Dobra de Santo Tomé','Db','STD',0,1),(104,'Riyal saudí','NA','SAR',0,1),(105,'Rupia de Seychelles','SR','SCR',0,1),(106,'Leone de Sierra Leona','Le','SLL',0,1),(107,'Dólar de Singapur','S$','SGD',0,1),(108,'Corona eslovaca','Sk','SKK',0,1),(109,'Dólar de las Islas Salomón','SI$','SBD',0,1),(110,'Chelín somalí','So.','SOS',0,1),(111,'Rand sudafricano','R','ZAR',0,1),(112,'Rupia de Sri Lanka','NA','LKR',0,1),(113,'Libra de Santa Helena','£','SHP',0,1),(114,'Libra sudanesa','SDG','SDG',0,1),(115,'Lilangeni de Suazilandia','SZL','SZL',0,1),(116,'Corona sueca','kr','SEK',0,1),(117,'Libra siria','SYP','SYP',0,1),(118,'Baht tailandés','NA','THB',0,1),(119,'Lira turca','YTL','TRY',0,1),(120,'Dólar taiwanés','NT$','TWD',0,1),(121,'Chelín tanzano','x','TZS',0,1),(122,'Pa\'anga del Reino de Tonga','T$','TOP',0,1),(123,'Dólar de Trinidad y Tobago','TTD','TTD',0,1),(124,'Dinar tunecino','NA','TND',0,1),(125,'Dólar estadounidense','$','USD',1,1),(126,'Dirham de Emiratos Arabes Unidos','NA','AED',0,1),(127,'Chelín ugandés','USh','UGX',0,1),(128,'Grivnia de Ucrania','','UAH',0,1),(129,'Peso uruguayo','UYU','UYU',0,1),(130,'Uzbekistán Sum','UZS','UZS',0,1),(131,'Vatu de Vanuatu','Vt','VUV',0,1),(132,'Dong de Vietnam','NA','VND',0,1),(133,'Bolívar venezolano','VEF','VEF',0,1),(134,'Rial yemení','YER','YER',0,1),(135,'Kwacha zambiano','ZMK','ZMK',0,1);

#
# Structure for table "evento"
#

DROP TABLE IF EXISTS `evento`;
CREATE TABLE `evento` (
  `idEvento` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idJuego` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaEvento` datetime DEFAULT NULL,
  `fechaFinEvento` datetime DEFAULT NULL,
  `apuestaMinima` decimal(18,2) DEFAULT NULL,
  `apuestaMaxima` decimal(18,2) DEFAULT NULL,
  `fechaEventoReprogramacion` datetime DEFAULT NULL,
  `idMoneda` int(11) unsigned NOT NULL,
  `estadoEvento` int(11) DEFAULT NULL COMMENT '0=Anulado\r\n1=Ejecucion\r\n2=Terminado\r\n3=PendPago\r\n4=Pagado\r\n5=Suspendido',
  `estadoAnimacion` int(11) DEFAULT NULL,
  `tokenAnimacion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puntosCuy` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`idEvento`),
  KEY `evento_fk1` (`idJuego`),
  KEY `idMoneda` (`idMoneda`),
  CONSTRAINT `evento_fk1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`),
  CONSTRAINT `evento_fk2` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "evento"
#


#
# Structure for table "password_resets"
#

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "password_resets"
#


#
# Structure for table "permisos"
#

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL COMMENT '0:menu,1:permiso',
  `nombre` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `controller` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `method` varchar(255) COLLATE macroman_bin DEFAULT NULL,
  `descripcion` varchar(450) COLLATE macroman_bin DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=macroman COLLATE=macroman_bin;

#
# Data for table "permisos"
#

INSERT INTO `permisos` VALUES (1,NULL,'Dashboard','App\\Http\\Controllers\\HomeController@DashboardVista','GET',NULL,'2019-04-25 17:56:07',1),(2,NULL,'EmpresaListar','App\\Http\\Controllers\\EmpresaController@EmpresaListarVista','GET',NULL,'2019-04-25 17:56:07',1),(3,NULL,'EmpresaInsertar','App\\Http\\Controllers\\EmpresaController@EmpresaInsertarVista','GET',NULL,'2019-04-25 17:56:07',1),(4,NULL,'EmpresaEditar/{idEmpresa}','App\\Http\\Controllers\\EmpresaController@EmpresaEditarVista','GET',NULL,'2019-04-25 17:56:07',1),(5,NULL,'EmpresaInsertarJson','App\\Http\\Controllers\\EmpresaController@EmpresaInsertarJson','POST',NULL,'2019-04-25 17:56:07',1),(6,NULL,'EmpresaEditarJson','App\\Http\\Controllers\\EmpresaController@EmpresaEditarJson','POST',NULL,'2019-04-25 17:56:07',1),(7,NULL,'PuntoVentaListar','App\\Http\\Controllers\\PuntoVentaController@PuntoVentaListarVista','GET',NULL,'2019-04-25 17:56:07',1),(8,NULL,'PuntoVentaEditar/{idPuntoVenta}','App\\Http\\Controllers\\PuntoVentaController@PuntoVentaEditarVista','GET',NULL,'2019-04-25 17:56:07',1),(9,NULL,'PuntoVentaEditarJson','App\\Http\\Controllers\\PuntoVentaController@PuntoVentaEditarJson','POST',NULL,'2019-04-25 17:56:08',1),(10,NULL,'JackpotListar','App\\Http\\Controllers\\JackpotController@JackpotListarVista','GET',NULL,'2019-04-25 17:56:08',1),(11,NULL,'JackpotInsertar','App\\Http\\Controllers\\JackpotController@JackpotInsertarVista','GET',NULL,'2019-04-25 17:56:08',1),(12,NULL,'JackpotEditar/{idJackpot}','App\\Http\\Controllers\\JackpotController@JackpotEditarVista','GET',NULL,'2019-04-25 17:56:08',1),(13,NULL,'VentanaCaja','App\\Http\\Controllers\\VentaController@Index','GET',NULL,'2019-04-25 17:56:08',1),(14,NULL,'VentanaCaja2','App\\Http\\Controllers\\VentaController@IndexNuevo','GET',NULL,'2019-04-25 17:56:08',1),(15,NULL,'ConfiguracionJackpotListar','App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotListarVista','GET',NULL,'2019-04-25 17:56:08',1),(16,NULL,'ConfiguracionJackpotInsertar','App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotInsertarVista','GET',NULL,'2019-04-25 17:56:08',1),(17,NULL,'ConfiguracionJackpotEditar/{idConfiguracionJackpot}','App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotEditarVista','GET',NULL,'2019-04-25 17:56:08',1),(18,NULL,'ConfiguracionJackpotInsertarJson','App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotInsertarJson','POST',NULL,'2019-04-25 17:56:08',1),(19,NULL,'ConfiguracionJackpotEditarJson','App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotEditarJson','POST',NULL,'2019-04-25 17:56:08',1),(20,NULL,'CajaListar','App\\Http\\Controllers\\CajaController@CajaListarVista','GET',NULL,'2019-04-25 17:56:08',1),(21,NULL,'CajaInsertar','App\\Http\\Controllers\\CajaController@CajaInsertarVista','GET',NULL,'2019-04-25 17:56:08',1),(22,NULL,'CajaEditar/{idCaja}','App\\Http\\Controllers\\CajaController@CajaEditarVista','GET',NULL,'2019-04-25 17:56:08',1),(23,NULL,'CajaInsertarJson','App\\Http\\Controllers\\CajaController@CajaInsertarJson','POST',NULL,'2019-04-25 17:56:08',1),(24,NULL,'CajaEditarJson','App\\Http\\Controllers\\CajaController@CajaEditarJson','POST',NULL,'2019-04-25 17:56:08',1),(25,NULL,'AperturaCajaListar','App\\Http\\Controllers\\AperturaCajaController@AperturaCajaListarVista','GET',NULL,'2019-04-25 17:56:08',1),(26,NULL,'AperturaCajaInsertar','App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarVista','GET',NULL,'2019-04-25 17:56:08',1),(27,NULL,'AperturaCajaEditar/{idAperturaCaja}','App\\Http\\Controllers\\AperturaCajaController@AperturaCajaEditarVista','GET',NULL,'2019-04-25 17:56:08',1),(28,NULL,'AperturaCajaInsertarJson','App\\Http\\Controllers\\AperturaCajaController@AperturaCajaInsertarJson','POST',NULL,'2019-04-25 17:56:08',1),(29,NULL,'AperturaCajaEditarJson','App\\Http\\Controllers\\AperturaCajaController@AperturaCajaEditarJson','POST',NULL,'2019-04-25 17:56:08',1),(30,NULL,'AperturaRevisarJson','App\\Http\\Controllers\\AperturaCajaController@AperturaRevisarJson','POST',NULL,'2019-04-25 17:56:08',1),(31,NULL,'TurnoListar','App\\Http\\Controllers\\TurnoController@TurnoListarVista','GET',NULL,'2019-04-25 17:56:08',1),(32,NULL,'TurnoInsertar','App\\Http\\Controllers\\TurnoController@TurnoInsertarVista','GET',NULL,'2019-04-25 17:56:08',1),(33,NULL,'TurnoEditar/{idTurno}','App\\Http\\Controllers\\TurnoController@TurnoEditarVista','GET',NULL,'2019-04-25 17:56:09',1),(34,NULL,'TurnoInsertarJson','App\\Http\\Controllers\\TurnoController@TurnoInsertarJson','POST',NULL,'2019-04-25 17:56:09',1),(35,NULL,'TurnoEditarJson','App\\Http\\Controllers\\TurnoController@TurnoEditarJson','POST',NULL,'2019-04-25 17:56:09',1),(36,NULL,'DineroDefaultListar','App\\Http\\Controllers\\DineroDefaultController@DineroDefaultListarVista','GET',NULL,'2019-04-25 17:56:09',1),(37,NULL,'DineroDefaultInsertar','App\\Http\\Controllers\\DineroDefaultController@DineroDefaultInsertarVista','GET',NULL,'2019-04-25 17:56:09',1),(38,NULL,'DineroDefaultEditar/{idDineroDefault}','App\\Http\\Controllers\\DineroDefaultController@DineroDefaultEditarVista','GET',NULL,'2019-04-25 17:56:09',1),(39,NULL,'DineroDefaultInsertarJson','App\\Http\\Controllers\\DineroDefaultController@DineroDefaultInsertarJson','POST',NULL,'2019-04-25 17:56:09',1),(40,NULL,'DineroDefaultEditarJson','App\\Http\\Controllers\\DineroDefaultController@DineroDefaultEditarJson','POST',NULL,'2019-04-25 17:56:09',1),(41,NULL,'TipoPagoListar','App\\Http\\Controllers\\TipoPagoController@TipoPagoListarVista','GET',NULL,'2019-04-25 17:56:09',1),(42,NULL,'TipoPagoInsertar','App\\Http\\Controllers\\TipoPagoController@TipoPagoInsertarVista','GET',NULL,'2019-04-25 17:56:09',1),(43,NULL,'TipoPagoEditar/{idTipoPago}','App\\Http\\Controllers\\TipoPagoController@TipoPagoEditarVista','GET',NULL,'2019-04-25 17:56:09',1),(44,NULL,'TipoPagoInsertarJson','App\\Http\\Controllers\\TipoPagoController@TipoPagoInsertarJson','POST',NULL,'2019-04-25 17:56:09',1),(45,NULL,'TipoPagoEditarJson','App\\Http\\Controllers\\TipoPagoController@TipoPagoEditarJson','POST',NULL,'2019-04-25 17:56:09',1),(46,NULL,'TipoApuestaListar','App\\Http\\Controllers\\TipoApuestaController@TipoApuestaListarVista','GET',NULL,'2019-04-25 17:56:09',1),(47,NULL,'TipoApuestaInsertar','App\\Http\\Controllers\\TipoApuestaController@TipoApuestaInsertarVista','GET',NULL,'2019-04-25 17:56:09',1),(48,NULL,'TipoApuestaEditar/{idTipoApuesta}','App\\Http\\Controllers\\TipoApuestaController@TipoApuestaEditarVista','GET',NULL,'2019-04-25 17:56:09',1),(49,NULL,'TipoApuestaInsertarJson','App\\Http\\Controllers\\TipoApuestaController@TipoApuestaInsertarJson','POST',NULL,'2019-04-25 17:56:09',1),(50,NULL,'TipoApuestaEditarJson','App\\Http\\Controllers\\TipoApuestaController@TipoApuestaEditarJson','POST',NULL,'2019-04-25 17:56:09',1),(56,NULL,'ReportedeVentasVista','App\\Http\\Controllers\\ReporteController@ReporteApuestaVista','GET',NULL,'2019-04-25 17:56:10',1),(57,NULL,'ReporteVentasEventosVista','App\\Http\\Controllers\\ReporteController@ReporteVentaVista','GET',NULL,'2019-04-25 17:56:10',1),(58,NULL,'ReporteHistorialEventosVista','App\\Http\\Controllers\\ReporteController@ReporteVentaJuegoVista','GET',NULL,'2019-04-25 17:56:10',1),(60,NULL,'ReporteHistorialTicketVista','App\\Http\\Controllers\\ReporteController@ReporteHistorialTicketVista','GET',NULL,'2019-04-25 17:56:10',1),(61,NULL,'ReporteDetalleApuestaEventoVista','App\\Http\\Controllers\\ReporteController@ReporteHistorialGanadoresVista','GET',NULL,'2019-04-25 17:56:10',1),(62,NULL,'ReporteJackPot','App\\Http\\Controllers\\ReporteController@ReporteJackPotVista','GET',NULL,'2019-04-25 17:56:10',1),(63,NULL,'ProgresivoListar','App\\Http\\Controllers\\ProgresivoController@ProgresivoListarVista','GET',NULL,'2019-04-25 17:56:10',1),(64,NULL,'ProgresivoInsertar','App\\Http\\Controllers\\ProgresivoController@ProgresivoInsertarVista','GET',NULL,'2019-04-25 17:56:10',1),(65,NULL,'ProgresivoConfiguracion','App\\Http\\Controllers\\ProgresivoController@ProgresivoConfiguracionVista','GET',NULL,'2019-04-25 17:56:10',1),(66,NULL,'UsuarioPuntoVenta','App\\Http\\Controllers\\UsuarioPuntoVentaController@UsuarioPuntoVentaListarVista','GET',NULL,'2019-04-25 17:56:10',1),(67,NULL,'UsuarioPuntoVentaEditar/{idUsuarioPuntoVenta}','App\\Http\\Controllers\\UsuarioPuntoVentaController@UsuarioPuntoVentaEditarVista','GET',NULL,'2019-04-25 17:56:10',1),(68,NULL,'Auditoria','App\\Http\\Controllers\\ReporteController@ReporteAuditoriaVista','GET',NULL,'2019-04-25 17:56:10',1),(69,NULL,'ReporteJackPotListarJson','App\\Http\\Controllers\\ReporteController@ReporteJackPotListarJson','POST',NULL,'2019-04-25 17:56:10',1),(70,NULL,'ConfiguracionJackpotListarJson','App\\Http\\Controllers\\ConfiguracionJackpotController@ConfiguracionJackpotListarJson','POST',NULL,'2019-04-25 17:56:10',1),(71,NULL,'ConfiguracionGeneral','App\\Http\\Controllers\\ConfiguracionGeneralController@ConfiguracionGeneralVista','GET',NULL,'2019-04-25 17:56:10',1),(72,NULL,'Seguridad','App\\Http\\Controllers\\SeguridadController@PermisosUsuarioVista','GET',NULL,'2019-04-25 17:56:11',1),(74,NULL,'JuegoEditarVista/{IdJuego}','App\\Http\\Controllers\\JuegoController@JuegoEditarVista','GET',NULL,'2019-04-29 13:51:39',1),(75,NULL,'JuegoEditarJson','App\\Http\\Controllers\\JuegoController@JuegoEditarJson','POST',NULL,'2019-04-29 13:51:39',1),(76,NULL,'JuegoListarVista','App\\Http\\Controllers\\JuegoController@JuegoListarVista','GET',NULL,'2019-04-29 13:52:05',1),(77,NULL,'ReporteAlertasVista','App\\Http\\Controllers\\ReporteController@ReporteAlertasVista','GET',NULL,'2019-04-30 11:29:25',1),(78,NULL,'TipoAlertaVista','App\\Http\\Controllers\\SeguridadController@TipoAlertaVista','GET',NULL,'2019-05-02 13:00:02',1),(80,NULL,'TipoAlertaPuntoVenta/{idTipoAlerta}','App\\Http\\Controllers\\SeguridadController@TipoAlertaPuntoVentaVista','GET',NULL,'2019-05-02 17:49:55',1),(81,NULL,'TipoAlertaPuntoVentaInsertarJson','App\\Http\\Controllers\\SeguridadController@TipoAlertaPuntoVentaInsertarJson','POST',NULL,'2019-05-02 17:49:55',1),(82,NULL,'TipoAlertaPuntoVentaEditarJson','App\\Http\\Controllers\\SeguridadController@TipoAlertaPuntoVentaEditarJson','POST',NULL,'2019-05-03 13:17:14',1),(83,NULL,'CierreCajaVista','App\\Http\\Controllers\\ReporteController@ReporteCierraVentaVista','GET',NULL,'2019-05-14 21:44:03',1);

#
# Structure for table "permisos_perfil"
#

DROP TABLE IF EXISTS `permisos_perfil`;
CREATE TABLE `permisos_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_id` int(11) DEFAULT NULL COMMENT '0:administrador,1:cajero',
  `permiso_id` int(11) DEFAULT NULL COMMENT 'usuario',
  `estado` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=macroman COLLATE=macroman_bin;

#
# Data for table "permisos_perfil"
#

INSERT INTO `permisos_perfil` VALUES (366,1,1,1,'2019-05-02 17:50:16'),(367,1,2,1,'2019-05-02 17:50:16'),(368,1,3,1,'2019-05-02 17:50:16'),(369,1,4,1,'2019-05-02 17:50:16'),(370,1,5,1,'2019-05-02 17:50:16'),(371,1,6,1,'2019-05-02 17:50:16'),(372,1,7,1,'2019-05-02 17:50:16'),(373,1,8,1,'2019-05-02 17:50:17'),(374,1,9,1,'2019-05-02 17:50:17'),(375,1,10,1,'2019-05-02 17:50:17'),(376,1,11,1,'2019-05-02 17:50:17'),(377,1,12,1,'2019-05-02 17:50:17'),(378,1,13,1,'2019-05-02 17:50:17'),(379,1,14,1,'2019-05-02 17:50:17'),(380,1,15,1,'2019-05-02 17:50:17'),(381,1,16,1,'2019-05-02 17:50:17'),(382,1,17,1,'2019-05-02 17:50:17'),(383,1,18,1,'2019-05-02 17:50:17'),(384,1,19,1,'2019-05-02 17:50:17'),(385,1,20,1,'2019-05-02 17:50:17'),(386,1,21,1,'2019-05-02 17:50:17'),(387,1,22,1,'2019-05-02 17:50:17'),(388,1,23,1,'2019-05-02 17:50:17'),(389,1,24,1,'2019-05-02 17:50:17'),(390,1,25,1,'2019-05-02 17:50:17'),(391,1,26,1,'2019-05-02 17:50:17'),(392,1,27,1,'2019-05-02 17:50:17'),(393,1,28,1,'2019-05-02 17:50:17'),(394,1,29,1,'2019-05-02 17:50:17'),(395,1,30,1,'2019-05-02 17:50:17'),(396,1,31,1,'2019-05-02 17:50:17'),(397,1,32,1,'2019-05-02 17:50:17'),(398,1,33,1,'2019-05-02 17:50:17'),(399,1,34,1,'2019-05-02 17:50:17'),(400,1,35,1,'2019-05-02 17:50:17'),(401,1,36,1,'2019-05-02 17:50:18'),(402,1,37,1,'2019-05-02 17:50:18'),(403,1,38,1,'2019-05-02 17:50:18'),(404,1,39,1,'2019-05-02 17:50:18'),(405,1,40,1,'2019-05-02 17:50:18'),(406,1,41,1,'2019-05-02 17:50:18'),(407,1,42,1,'2019-05-02 17:50:18'),(408,1,43,1,'2019-05-02 17:50:18'),(409,1,44,1,'2019-05-02 17:50:18'),(410,1,45,1,'2019-05-02 17:50:18'),(411,1,46,1,'2019-05-02 17:50:18'),(412,1,47,1,'2019-05-02 17:50:18'),(413,1,48,1,'2019-05-02 17:50:18'),(414,1,49,1,'2019-05-02 17:50:18'),(415,1,50,1,'2019-05-02 17:50:18'),(416,1,56,1,'2019-05-02 17:50:18'),(417,1,57,1,'2019-05-02 17:50:18'),(418,1,58,1,'2019-05-02 17:50:18'),(420,1,60,1,'2019-05-02 17:50:18'),(421,1,61,1,'2019-05-02 17:50:18'),(422,1,62,1,'2019-05-02 17:50:18'),(423,1,63,1,'2019-05-02 17:50:18'),(424,1,64,1,'2019-05-02 17:50:18'),(425,1,65,1,'2019-05-02 17:50:18'),(426,1,66,1,'2019-05-02 17:50:18'),(427,1,67,1,'2019-05-02 17:50:18'),(428,1,68,1,'2019-05-02 17:50:18'),(429,1,69,1,'2019-05-02 17:50:19'),(430,1,70,1,'2019-05-02 17:50:19'),(431,1,71,1,'2019-05-02 17:50:19'),(432,1,72,1,'2019-05-02 17:50:19'),(433,1,74,1,'2019-05-02 17:50:19'),(434,1,75,1,'2019-05-02 17:50:19'),(435,1,76,1,'2019-05-02 17:50:19'),(436,1,77,1,'2019-05-02 17:50:19'),(437,1,78,1,'2019-05-02 17:50:19'),(438,1,80,1,'2019-05-02 17:50:19'),(439,1,81,1,'2019-05-02 17:50:19'),(440,1,82,1,'2019-05-03 13:18:01'),(441,1,83,1,'2019-05-14 21:44:25'),(442,0,1,1,'2019-05-15 22:27:51'),(443,0,2,1,'2019-05-15 22:27:51'),(444,0,3,1,'2019-05-15 22:27:51'),(445,0,4,1,'2019-05-15 22:27:51'),(446,0,5,1,'2019-05-15 22:27:51'),(447,0,6,1,'2019-05-15 22:27:51'),(448,0,7,1,'2019-05-15 22:27:51'),(449,0,8,1,'2019-05-15 22:27:51'),(450,0,9,1,'2019-05-15 22:27:51'),(451,0,10,1,'2019-05-15 22:27:52'),(452,0,11,1,'2019-05-15 22:27:52'),(453,0,12,1,'2019-05-15 22:27:52'),(454,0,13,1,'2019-05-15 22:27:52'),(455,0,14,1,'2019-05-15 22:27:52'),(456,0,15,1,'2019-05-15 22:27:52'),(457,0,16,1,'2019-05-15 22:27:52'),(458,0,17,1,'2019-05-15 22:27:52'),(459,0,18,1,'2019-05-15 22:27:52'),(460,0,19,1,'2019-05-15 22:27:52'),(461,0,20,1,'2019-05-15 22:27:52'),(462,0,21,1,'2019-05-15 22:27:52'),(463,0,22,1,'2019-05-15 22:27:52'),(464,0,23,1,'2019-05-15 22:27:52'),(465,0,24,1,'2019-05-15 22:27:52'),(466,0,25,1,'2019-05-15 22:27:52'),(467,0,26,1,'2019-05-15 22:27:52'),(468,0,27,1,'2019-05-15 22:27:52'),(469,0,28,1,'2019-05-15 22:27:52'),(470,0,29,1,'2019-05-15 22:27:52'),(471,0,30,1,'2019-05-15 22:27:52'),(472,0,31,1,'2019-05-15 22:27:52'),(473,0,32,1,'2019-05-15 22:27:52'),(474,0,33,1,'2019-05-15 22:27:52'),(475,0,34,1,'2019-05-15 22:27:52'),(476,0,35,1,'2019-05-15 22:27:52'),(477,0,36,1,'2019-05-15 22:27:52'),(478,0,37,1,'2019-05-15 22:27:52'),(479,0,38,1,'2019-05-15 22:27:52'),(480,0,39,1,'2019-05-15 22:27:52'),(481,0,40,1,'2019-05-15 22:27:52'),(482,0,41,1,'2019-05-15 22:27:52'),(483,0,42,1,'2019-05-15 22:27:52'),(484,0,43,1,'2019-05-15 22:27:52'),(485,0,44,1,'2019-05-15 22:27:52'),(486,0,45,1,'2019-05-15 22:27:52'),(487,0,46,1,'2019-05-15 22:27:52'),(488,0,47,1,'2019-05-15 22:27:52'),(489,0,48,1,'2019-05-15 22:27:52'),(490,0,49,1,'2019-05-15 22:27:52'),(491,0,50,1,'2019-05-15 22:27:52'),(492,0,56,1,'2019-05-15 22:27:52'),(493,0,57,1,'2019-05-15 22:27:52'),(494,0,58,1,'2019-05-15 22:27:52'),(495,0,60,1,'2019-05-15 22:27:52'),(496,0,61,1,'2019-05-15 22:27:52'),(497,0,62,1,'2019-05-15 22:27:52'),(498,0,63,1,'2019-05-15 22:27:52'),(499,0,64,1,'2019-05-15 22:27:52'),(500,0,65,1,'2019-05-15 22:27:52'),(501,0,66,1,'2019-05-15 22:27:52'),(502,0,67,1,'2019-05-15 22:27:52'),(503,0,68,1,'2019-05-15 22:27:52'),(504,0,69,1,'2019-05-15 22:27:52'),(505,0,70,1,'2019-05-15 22:27:52'),(506,0,71,1,'2019-05-15 22:27:52'),(507,0,72,1,'2019-05-15 22:27:52'),(508,0,74,1,'2019-05-15 22:27:52'),(509,0,75,1,'2019-05-15 22:27:52'),(510,0,76,1,'2019-05-15 22:27:52'),(511,0,77,1,'2019-05-15 22:27:52'),(512,0,78,1,'2019-05-15 22:27:52'),(513,0,80,1,'2019-05-15 22:27:52'),(514,0,81,1,'2019-05-15 22:27:52'),(515,0,82,1,'2019-05-15 22:27:52'),(516,0,83,1,'2019-05-15 22:27:52');

#
# Structure for table "punto_venta_tipo_alerta"
#

DROP TABLE IF EXISTS `punto_venta_tipo_alerta`;
CREATE TABLE `punto_venta_tipo_alerta` (
  `idPuntoVentaTipoAlerta` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoAlerta` int(11) DEFAULT NULL,
  `idPuntoVenta` int(10) unsigned DEFAULT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `mensaje` text,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idPuntoVentaTipoAlerta`),
  KEY `F4` (`idTipoAlerta`),
  KEY `FK3` (`idPuntoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "punto_venta_tipo_alerta"
#

INSERT INTO `punto_venta_tipo_alerta` VALUES (3,1,7,1000.00,'MONTO MAXIMO VENTA PUNTO VENTA: TARAPOTO 01','EL PUNTO DE VENTA TARAPOTO 01 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00',1),(4,1,241,1000.00,'MONTO MAXIMO VENTA PUNTO VENTA: AT SANTA BARBARA','EL PUNTO DE VENTA AT SANTA BARBARA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1000.00\r\n',1),(5,1,2,1000.00,'MONTO MAXIMO VENTA PUNTO VENTA: EL GOLF','EL PUNTO DE VENTA EL GOLF LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1000.00\r\n',1),(6,1,3,10000.00,'MONTO MAXIMO VENTA PUNTO VENTA: CIX CENTRO 1\r\n','EL PUNTO DE VENTA CIX CENTRO 1 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00\r\n',1),(7,1,9,1500.00,'MONTO MAXIMO VENTA PUNTO VENTA: MOYOBAMBA 01','EL PUNTO DE VENTA MOYOBAMBA 01 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1500.00\r\n',1),(8,1,8,2500.00,'MONTO MAXIMO VENTA PUNTO VENTA: VILLA EL SALVADOR','EL PUNTO DE VENTA VILLA EL SALVADOR LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 2500.00\r\n',1),(9,1,4,1500.00,'MONTO MAXIMO VENTA PUNTO VENTA: GRIFO PECSA','EL PUNTO DE VENTA GRIFO PECSA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1500.00\r\n',1),(10,1,259,1000.00,'MONTO MAXIMO VENTA PUNTO VENTA: AT LOCAL MERPROLIMA','EL PUNTO DE VENTA AT LOCAL MERPROLIMA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1000.00\r\n',1);

#
# Structure for table "historial_alerta"
#

DROP TABLE IF EXISTS `historial_alerta`;
CREATE TABLE `historial_alerta` (
  `idHistorialAlerta` int(11) NOT NULL AUTO_INCREMENT,
  `idPuntoVentaTipoAlerta` int(11) DEFAULT NULL,
  `fechaAlerta` datetime DEFAULT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  `correos_envio` varchar(255) DEFAULT NULL,
  `estado_envio` tinyint(1) DEFAULT NULL,
  `asunto` varchar(255) DEFAULT NULL,
  `mensaje` text,
  PRIMARY KEY (`idHistorialAlerta`),
  KEY `F8` (`idPuntoVentaTipoAlerta`),
  CONSTRAINT `F9` FOREIGN KEY (`idPuntoVentaTipoAlerta`) REFERENCES `punto_venta_tipo_alerta` (`idPuntoVentaTipoAlerta`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "historial_alerta"
#

INSERT INTO `historial_alerta` VALUES (1,5,'2019-05-16 12:55:02',4704.00,'freditocarbonel@gmail.com',1,'MONTO MAXIMO VENTA PUNTO VENTA: EL GOLF','EL PUNTO DE VENTA EL GOLF LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),(2,7,'2019-05-16 13:09:23',1940.00,'freditocarbonel@gmail.com',1,'MONTO MAXIMO VENTA PUNTO VENTA: MOYOBAMBA 01','EL PUNTO DE VENTA MOYOBAMBA 01 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),(3,8,'2019-05-16 13:13:47',3000.00,'freditocarbonel@gmail.com',1,'MONTO MAXIMO VENTA PUNTO VENTA: VILLA EL SALVADOR','EL PUNTO DE VENTA VILLA EL SALVADOR LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),(4,7,'2019-05-17 10:00:42',2140.00,'freditocarbonel@gmail.com',1,'MONTO MAXIMO VENTA PUNTO VENTA: MOYOBAMBA 01','EL PUNTO DE VENTA MOYOBAMBA 01 LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),(5,4,'2019-05-17 11:42:31',2400.00,'freditocarbonel@gmail.com',1,'MONTO MAXIMO VENTA PUNTO VENTA: AT SANTA BARBARA','EL PUNTO DE VENTA AT SANTA BARBARA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),(6,5,'2019-05-17 11:43:03',2400.00,'freditocarbonel@gmail.com',1,'MONTO MAXIMO VENTA PUNTO VENTA: EL GOLF','EL PUNTO DE VENTA EL GOLF LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),(7,9,'2019-05-17 11:55:22',600.00,'freditocarbonel@gmail.com',1,'MONTO MAXIMO VENTA PUNTO VENTA: GRIFO PECSA','EL PUNTO DE VENTA GRIFO PECSA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 10000.00'),(8,10,'2019-05-23 15:01:47',1400.00,'christianrogerpm@gmail.com',1,'MONTO MAXIMO VENTA PUNTO VENTA: AT LOCAL MERPROLIMA','EL PUNTO DE VENTA AT LOCAL MERPROLIMA LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE 1000.00\r\n');

#
# Structure for table "detalle_punto_venta_tipo_alerta"
#

DROP TABLE IF EXISTS `detalle_punto_venta_tipo_alerta`;
CREATE TABLE `detalle_punto_venta_tipo_alerta` (
  `idDetallePuntoVentaTipoAlerta` int(11) NOT NULL AUTO_INCREMENT,
  `idPuntoVentaTipoAlerta` int(11) DEFAULT NULL,
  `correoDestino` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idDetallePuntoVentaTipoAlerta`),
  KEY `FK1` (`idPuntoVentaTipoAlerta`),
  CONSTRAINT `FK5` FOREIGN KEY (`idPuntoVentaTipoAlerta`) REFERENCES `punto_venta_tipo_alerta` (`idPuntoVentaTipoAlerta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "detalle_punto_venta_tipo_alerta"
#

INSERT INTO `detalle_punto_venta_tipo_alerta` VALUES (3,3,'freditocarbonel@gmail.com',1),(4,4,'freditocarbonel@gmail.com',1),(5,5,'freditocarbonel@gmail.com',1),(6,6,'demo@gmail.com',1),(7,7,'freditocarbonel@gmail.com',1),(8,8,'freditocarbonel@gmail.com',1),(9,9,'freditocarbonel@gmail.com',1),(10,10,'christianrogerpm@gmail.com',1);

#
# Structure for table "resultado_evento"
#

DROP TABLE IF EXISTS `resultado_evento`;
CREATE TABLE `resultado_evento` (
  `idResultadosEvento` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idEvento` bigint(20) unsigned DEFAULT NULL,
  `multiplicadorApuestaGanada` decimal(18,2) DEFAULT NULL,
  `valorGanador` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idTipoPago` int(10) unsigned DEFAULT NULL,
  `estado` int(11) DEFAULT NULL COMMENT '0=Anulado\r\n1=Activo',
  `idTipoApuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idResultadosEvento`),
  KEY `resultado_evento_fk1` (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "resultado_evento"
#


#
# Structure for table "ticket"
#

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `idTicket` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idAperturaCaja` int(10) unsigned DEFAULT NULL,
  `idEvento` bigint(20) unsigned DEFAULT NULL,
  `codigoQR` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nroTicketParticipante` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ganador` int(11) DEFAULT NULL COMMENT '0=NoGano,1=gano',
  `estadoTicket` int(11) DEFAULT NULL COMMENT '0=Anulado\r\n1=Ejecucion\r\n2=Pagado\r\n3=Suspendido',
  `montoTotal` decimal(18,2) DEFAULT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `idAperturaCajaPago` int(11) DEFAULT NULL,
  `fechaRegistro` datetime DEFAULT NULL,
  PRIMARY KEY (`idTicket`),
  KEY `ticket_fk1` (`idAperturaCaja`),
  KEY `ticket_fk2` (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "ticket"
#

INSERT INTO `ticket` VALUES (1,1,37717,'37717','37717',0,2,15.00,'2019-05-04 19:15:00',1,'2019-05-04 19:12:22'),(2,1,37717,'37717','37717',0,1,42.00,NULL,NULL,'2019-05-04 19:13:03'),(3,1,37718,'37718','37718',0,1,25.00,NULL,NULL,'2019-05-04 19:15:25'),(4,1,37718,'37718','37718',0,1,16.00,NULL,NULL,'2019-05-04 19:15:41'),(5,1,37719,'37719','37719',0,1,80.00,NULL,NULL,'2019-05-04 19:16:27'),(6,1,37719,'37719','37719',0,1,70.00,NULL,NULL,'2019-05-04 19:17:13'),(7,1,37719,'37719','37719',0,1,150.00,NULL,NULL,'2019-05-04 19:17:37'),(8,1,37720,'37720','37720',0,2,20.00,'2019-05-04 19:22:20',1,'2019-05-04 19:18:30'),(9,1,37720,'37720','37720',0,1,20.00,NULL,NULL,'2019-05-04 19:18:48'),(10,1,37720,'37720','37720',0,2,20.00,'2019-05-04 19:22:40',1,'2019-05-04 19:19:06'),(11,1,37720,'37720','37720',0,1,20.00,NULL,NULL,'2019-05-04 19:19:17'),(12,1,37720,'37720','37720',0,1,30.00,NULL,NULL,'2019-05-04 19:19:49'),(13,1,37722,'37722','37722',0,2,30.00,'2019-05-04 19:24:54',1,'2019-05-04 19:23:19'),(14,1,37722,'37722','37722',0,2,10.00,'2019-05-04 19:25:05',1,'2019-05-04 19:23:42'),(15,1,37723,'37723','37723',0,1,10.00,NULL,NULL,'2019-05-04 19:24:27'),(16,1,37723,'37723','37723',0,1,10.00,NULL,NULL,'2019-05-04 19:24:39'),(17,2,38248,'38248','38248',0,1,60.00,NULL,NULL,'2019-05-06 08:54:20'),(18,2,38248,'38248','38248',0,1,400.00,NULL,NULL,'2019-05-06 08:54:36'),(19,2,38248,'38248','38248',0,1,300.00,NULL,NULL,'2019-05-06 08:54:55'),(20,3,41836,'41836','41836',0,1,6.00,NULL,NULL,'2019-05-14 16:31:04'),(21,3,41837,'41837','41837',0,1,2.00,NULL,NULL,'2019-05-14 16:33:17'),(22,3,41843,'41843','41843',0,2,40.00,'2019-05-14 16:52:24',4,'2019-05-14 16:45:06'),(23,3,41847,'41847','41847',0,1,8.00,NULL,NULL,'2019-05-14 16:53:00'),(24,3,41879,'41879','41879',0,1,20.00,NULL,NULL,'2019-05-14 17:57:46'),(25,3,42098,'42098','42098',0,1,13.00,NULL,NULL,'2019-05-15 11:14:12'),(26,3,42230,'42230','42230',0,1,4.00,NULL,NULL,'2019-05-15 15:39:31'),(27,3,42230,'42230','42230',0,1,2.00,NULL,NULL,'2019-05-15 15:39:47'),(28,3,42231,'42231','42231',0,1,6.00,NULL,NULL,'2019-05-15 15:41:05'),(29,3,42232,'42232','42232',0,1,12.00,NULL,NULL,'2019-05-15 15:42:08'),(30,3,42235,'42235','42235',0,1,600.00,NULL,NULL,'2019-05-15 15:49:23'),(31,3,42235,'42235','42235',0,1,600.00,NULL,NULL,'2019-05-15 15:49:35'),(32,3,42236,'42236','42236',0,1,600.00,NULL,NULL,'2019-05-15 15:50:21'),(33,3,42236,'42236','42236',0,1,600.00,NULL,NULL,'2019-05-15 15:50:26'),(34,3,42238,'42238','42238',0,1,600.00,NULL,NULL,'2019-05-15 15:55:39'),(35,3,42239,'42239','42239',0,1,700.00,NULL,NULL,'2019-05-15 15:57:29'),(36,3,42239,'42239','42239',0,1,700.00,NULL,NULL,'2019-05-15 15:57:43'),(37,3,42242,'42242','42242',0,1,800.00,NULL,NULL,'2019-05-15 16:02:15'),(38,3,42243,'42243','42243',0,1,1000.00,NULL,NULL,'2019-05-15 16:04:42'),(39,3,42244,'42244','42244',0,1,1000.00,NULL,NULL,'2019-05-15 16:06:19'),(40,3,42244,'42244','42244',0,1,1000.00,NULL,NULL,'2019-05-15 16:07:13'),(41,3,42245,'42245','42245',0,1,300.00,NULL,NULL,'2019-05-15 16:09:00'),(42,3,42246,'42246','42246',0,1,400.00,NULL,NULL,'2019-05-15 16:11:25'),(43,3,42247,'42247','42247',0,1,400.00,NULL,NULL,'2019-05-15 16:13:33'),(44,3,42248,'42248','42248',0,1,400.00,NULL,NULL,'2019-05-15 16:15:06'),(45,3,42249,'42249','42249',0,1,400.00,NULL,NULL,'2019-05-15 16:16:24'),(46,3,42250,'42250','42250',0,1,400.00,NULL,NULL,'2019-05-15 16:19:41'),(47,3,42252,'42252','42252',0,1,200.00,NULL,NULL,'2019-05-15 16:22:49'),(48,3,42253,'42253','42253',0,1,100.00,NULL,NULL,'2019-05-15 16:24:43'),(49,3,42254,'42254','42254',0,1,200.00,NULL,NULL,'2019-05-15 16:26:49'),(50,3,42254,'42254','42254',0,1,400.00,NULL,NULL,'2019-05-15 16:27:27'),(51,3,42260,'42260','42260',0,1,400.00,NULL,NULL,'2019-05-15 16:38:39'),(52,3,42260,'42260','42260',0,1,400.00,NULL,NULL,'2019-05-15 16:38:47'),(53,3,42261,'42261','42261',0,1,200.00,NULL,NULL,'2019-05-15 16:40:56'),(54,3,42262,'42262','42262',0,1,300.00,NULL,NULL,'2019-05-15 16:42:13'),(55,3,42262,'42262','42262',0,1,200.00,NULL,NULL,'2019-05-15 16:43:42'),(56,3,42263,'42263','42263',0,1,100.00,NULL,NULL,'2019-05-15 16:44:36'),(57,3,42263,'42263','42263',0,1,300.00,NULL,NULL,'2019-05-15 16:45:24'),(58,3,42265,'42265','42265',0,1,100.00,NULL,NULL,'2019-05-15 16:48:47'),(59,3,42284,'42284','42284',0,1,60.00,NULL,NULL,'2019-05-15 17:26:10'),(60,3,42286,'42286','42286',0,1,400.00,NULL,NULL,'2019-05-15 17:31:09'),(61,3,42287,'42287','42287',0,1,400.00,NULL,NULL,'2019-05-15 17:32:11'),(62,3,42290,'42290','42290',0,1,8.00,NULL,NULL,'2019-05-15 17:39:34'),(63,3,42291,'42291','42291',0,1,40.00,NULL,NULL,'2019-05-15 17:40:50'),(64,3,42291,'42291','42291',0,1,40.00,NULL,NULL,'2019-05-15 17:41:10'),(65,3,42297,'42297','42297',0,1,300.00,NULL,NULL,'2019-05-15 17:52:54'),(66,3,42298,'42298','42298',0,1,400.00,NULL,NULL,'2019-05-15 17:55:11'),(67,3,42307,'42307','42307',0,1,200.00,NULL,NULL,'2019-05-15 18:12:14'),(68,3,42308,'42308','42308',0,1,50.00,NULL,NULL,'2019-05-15 18:14:22'),(69,3,42313,'42313','42313',0,1,150.00,NULL,NULL,'2019-05-15 18:25:02'),(70,3,42315,'42315','42315',0,1,150.00,NULL,NULL,'2019-05-15 18:28:11'),(71,3,42316,'42316','42316',0,1,80.00,NULL,NULL,'2019-05-15 18:30:43'),(72,3,42318,'42318','42318',0,1,20.00,NULL,NULL,'2019-05-15 18:34:08'),(73,3,42319,'42319','42319',0,1,20.00,NULL,NULL,'2019-05-15 18:37:20'),(74,3,42321,'42321','42321',0,1,20.00,NULL,NULL,'2019-05-15 18:40:39'),(75,3,42322,'42322','42322',0,1,40.00,NULL,NULL,'2019-05-15 18:42:38'),(76,3,42325,'42325','42325',0,1,40.00,NULL,NULL,'2019-05-15 18:48:15'),(77,3,42327,'42327','42327',0,1,30.00,NULL,NULL,'2019-05-15 18:53:30'),(78,3,42329,'42329','42329',0,1,8.00,NULL,NULL,'2019-05-15 18:56:59'),(79,3,42330,'42330','42330',0,1,700.00,NULL,NULL,'2019-05-15 18:59:06'),(80,3,42331,'42331','42331',0,1,900.00,NULL,NULL,'2019-05-15 19:00:58'),(81,3,42335,'42335','42335',0,1,30.00,NULL,NULL,'2019-05-15 19:09:20'),(82,5,42428,'42428','42428',0,1,20.00,NULL,NULL,'2019-05-15 22:14:32'),(83,5,42428,'42428','42428',0,1,4.00,NULL,NULL,'2019-05-15 22:15:09'),(84,4,42428,'42428','42428',0,1,4.00,NULL,NULL,'2019-05-15 22:15:39'),(85,4,42429,'42429','42429',0,2,2.00,'2019-05-15 22:18:06',4,'2019-05-15 22:17:37'),(86,4,42430,'42430','42430',0,1,40.00,NULL,NULL,'2019-05-15 22:19:10'),(87,5,42430,'42430','42430',0,1,8.00,NULL,NULL,'2019-05-15 22:19:34'),(88,6,42435,'42435','42435',0,2,40.00,'2019-05-15 22:30:26',5,'2019-05-15 22:28:46'),(89,5,42435,'42435','42435',0,2,8.00,'2019-05-15 22:30:44',5,'2019-05-15 22:29:15'),(90,5,42436,'42436','42436',0,1,40.00,NULL,NULL,'2019-05-15 22:31:22'),(91,6,42437,'42437','42437',0,1,2.00,NULL,NULL,'2019-05-15 22:32:11'),(92,5,42437,'42437','42437',0,1,8.00,NULL,NULL,'2019-05-15 22:32:33'),(93,8,42438,'42438','42438',0,1,4.00,NULL,NULL,'2019-05-15 22:35:10'),(94,7,42438,'42438','42438',0,1,8.00,NULL,NULL,'2019-05-15 22:35:30'),(95,9,42440,'42440','42440',0,1,40.00,NULL,NULL,'2019-05-15 22:38:36'),(96,9,42445,'42445','42445',0,2,100.00,'2019-05-15 22:50:24',9,'2019-05-15 22:49:46'),(97,9,42446,'42446','42446',0,1,100.00,NULL,NULL,'2019-05-15 22:50:58'),(98,7,42511,'42511','42511',0,2,40.00,'2019-05-16 10:02:28',7,'2019-05-16 10:00:42'),(99,7,42512,'42512','42512',0,1,200.00,NULL,NULL,'2019-05-16 10:02:47'),(100,9,42546,'42546','42546',0,2,200.00,'2019-05-16 11:12:40',9,'2019-05-16 11:11:08'),(101,9,42548,'42548','42548',0,1,1400.00,NULL,NULL,'2019-05-16 11:15:49'),(102,9,42549,'42549','42549',0,1,200.00,NULL,NULL,'2019-05-16 11:17:20'),(103,7,42562,'42562','42562',0,2,2.00,'2019-05-16 11:44:27',7,'2019-05-16 11:43:16'),(104,8,42562,'42562','42562',0,2,4.00,'2019-05-16 11:44:17',7,'2019-05-16 11:43:45'),(105,7,42563,'42563','42563',0,2,2.00,'2019-05-16 11:46:33',7,'2019-05-16 11:45:00'),(106,8,42563,'42563','42563',0,2,8.00,'2019-05-16 11:46:17',8,'2019-05-16 11:45:24'),(107,7,42564,'42564','42564',0,1,60.00,NULL,NULL,'2019-05-16 11:47:41'),(108,7,42573,'42573','42573',0,2,24.00,'2019-05-16 12:06:57',7,'2019-05-16 12:04:46'),(109,7,42573,'42573','42573',0,2,2400.00,'2019-05-16 12:07:26',7,'2019-05-16 12:05:14'),(110,7,42576,'42576','42576',0,2,40.00,'2019-05-16 12:12:11',7,'2019-05-16 12:10:27'),(111,9,42577,'42577','42577',0,1,400.00,NULL,NULL,'2019-05-16 12:12:40'),(112,10,42584,'42584','42584',0,2,100.00,'2019-05-16 12:28:29',10,'2019-05-16 12:26:27'),(113,8,42584,'42584','42584',0,2,4.00,'2019-05-16 12:29:00',8,'2019-05-16 12:26:53'),(114,11,42586,'42586','42586',0,2,4.00,'2019-05-16 12:32:44',11,'2019-05-16 12:30:40'),(115,10,42586,'42586','42586',0,2,40.00,'2019-05-16 12:32:16',10,'2019-05-16 12:31:09'),(116,11,42588,'42588','42588',0,2,2100.00,'2019-05-16 12:36:52',11,'2019-05-16 12:35:33'),(117,11,42598,'42598','42598',0,2,2600.00,'2019-05-16 12:56:20',11,'2019-05-16 12:55:01'),(118,10,42605,'42605','42605',0,1,1800.00,NULL,NULL,'2019-05-16 13:09:21'),(119,12,42607,'42607','42607',0,1,3000.00,NULL,NULL,'2019-05-16 13:13:47'),(120,12,42608,'42608','42608',0,2,3600.00,'2019-05-16 13:21:02',12,'2019-05-16 13:14:53'),(121,12,42610,'42610','42610',0,2,200.00,'2019-05-16 13:22:15',12,'2019-05-16 13:18:28'),(122,12,42610,'42610','42610',0,1,50.00,NULL,NULL,'2019-05-16 13:19:07'),(123,12,42612,'42612','42612',0,2,3000.00,'2019-05-16 13:24:48',12,'2019-05-16 13:23:43'),(124,10,42961,'42961','42961',0,2,200.00,'2019-05-17 10:03:30',10,'2019-05-17 10:00:40'),(125,10,42963,'42963','42963',0,2,3800.00,'2019-05-17 10:09:30',10,'2019-05-17 10:04:45'),(126,10,42967,'42967','42967',0,2,3800.00,'2019-05-17 10:18:24',10,'2019-05-17 10:12:58'),(127,10,42975,'42975','42975',0,1,3800.00,NULL,NULL,'2019-05-17 10:29:19'),(128,13,42980,'42980','42980',0,2,80.00,'2019-05-17 10:40:36',13,'2019-05-17 10:39:21'),(129,14,43012,'43012','43012',0,1,2400.00,NULL,NULL,'2019-05-17 11:42:30'),(130,15,43012,'43012','43012',0,1,2400.00,NULL,NULL,'2019-05-17 11:43:02'),(131,14,43012,'43012','43012',0,2,200.00,'2019-05-17 11:44:31',14,'2019-05-17 11:43:39'),(132,14,43013,'43013','43013',0,2,3600.00,'2019-05-17 11:46:26',14,'2019-05-17 11:45:43'),(133,14,43014,'43014','43014',0,2,100.00,'2019-05-17 11:48:55',14,'2019-05-17 11:47:21'),(134,16,43018,'43018','43018',0,1,600.00,NULL,NULL,'2019-05-17 11:55:21'),(135,17,45805,'45805','45805',0,1,1.00,NULL,NULL,'2019-05-23 14:49:10'),(136,18,45811,'45811','45811',0,1,1400.00,NULL,NULL,'2019-05-23 15:01:44'),(137,17,48446,'48446','48446',0,1,3.00,NULL,NULL,'2019-05-29 13:00:53'),(138,17,52106,'52106','52106',0,1,10.00,NULL,NULL,'2019-06-06 15:16:48'),(139,17,52107,'52107','52107',0,1,4.00,NULL,NULL,'2019-06-06 15:18:48'),(140,17,52109,'52109','52109',0,1,20.00,NULL,NULL,'2019-06-06 15:22:18'),(141,17,52110,'52110','52110',0,1,9.00,NULL,NULL,'2019-06-06 15:24:38'),(142,17,52110,'52110','52110',0,2,100.00,'2019-06-06 15:26:41',17,'2019-06-06 15:25:11'),(143,17,52114,'52114','52114',0,1,100.00,NULL,NULL,'2019-06-06 15:32:47'),(144,17,52115,'52115','52115',0,1,100.00,NULL,NULL,'2019-06-06 15:34:32'),(145,17,52115,'52115','52115',0,2,100.00,'2019-06-06 15:36:20',17,'2019-06-06 15:35:26'),(146,17,52116,'52116','52116',0,1,100.00,NULL,NULL,'2019-06-06 15:37:28'),(147,17,52117,'52117','52117',0,2,1.00,'2019-06-06 15:51:22',17,'2019-06-06 15:38:48'),(148,17,52117,'52117','52117',0,1,1.00,NULL,NULL,'2019-06-06 15:39:04'),(149,17,52117,'52117','52117',0,1,1.00,NULL,NULL,'2019-06-06 15:39:21'),(150,17,52125,'52125','52125',0,1,7.00,NULL,NULL,'2019-06-06 15:54:32'),(151,17,52127,'52127','52127',0,2,9.00,'2019-06-06 16:00:22',17,'2019-06-06 15:58:30'),(152,17,52135,'52135','52135',0,1,20.00,NULL,NULL,'2019-06-06 16:15:14'),(153,17,52136,'52136','52136',0,1,100.00,NULL,NULL,'2019-06-06 16:17:14'),(154,17,52137,'52137','52137',0,2,300.00,'2019-06-06 16:20:35',17,'2019-06-06 16:19:15'),(155,17,52454,'52454','52454',0,1,100.00,NULL,NULL,'2019-06-07 11:54:28'),(156,17,52455,'52455','52455',0,1,100.00,NULL,NULL,'2019-06-07 11:57:27'),(157,17,52458,'52458','52458',0,2,300.00,'2019-06-07 12:04:36',17,'2019-06-07 12:03:29'),(158,17,52459,'52459','52459',0,1,100.00,NULL,NULL,'2019-06-07 12:05:43'),(159,17,52460,'52460','52460',0,1,100.00,NULL,NULL,'2019-06-07 12:06:49'),(160,17,52461,'52461','52461',0,2,300.00,'2019-06-07 12:10:14',17,'2019-06-07 12:08:52'),(161,17,52464,'52464','52464',0,2,36.00,'2019-06-07 12:16:26',17,'2019-06-07 12:15:07'),(162,17,52490,'52490','52490',0,1,2.00,NULL,NULL,'2019-06-07 13:07:49'),(163,17,53817,'53817','53817',0,1,9.00,NULL,NULL,'2019-06-10 12:27:14'),(164,17,54210,'54210','54210',0,1,3.00,NULL,NULL,'2019-06-11 10:35:09'),(165,17,54384,'54384','54384',0,1,44.00,NULL,NULL,'2019-06-11 16:22:15'),(166,17,54416,'54416','54416',0,1,46.00,NULL,NULL,'2019-06-11 17:26:52'),(167,17,54417,'54417','54417',0,1,30.00,NULL,NULL,'2019-06-11 17:29:27'),(168,17,54434,'54434','54434',0,1,36.00,NULL,NULL,'2019-06-11 18:03:37'),(169,17,54573,'54573','54573',0,2,30.00,'2019-06-11 22:40:49',17,'2019-06-11 22:40:17'),(170,17,54573,'54573','54573',0,1,1.00,NULL,NULL,'2019-06-11 22:41:18');

#
# Structure for table "tipo_alerta"
#

DROP TABLE IF EXISTS `tipo_alerta`;
CREATE TABLE `tipo_alerta` (
  `idTipoAlerta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `mensaje` text,
  PRIMARY KEY (`idTipoAlerta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "tipo_alerta"
#

INSERT INTO `tipo_alerta` VALUES (1,'MAXIMA VENTA DIA\r\n',10000.00,1,'MONTO MAXIMO VENTA PUNTO VENTA:XXXXX\r\n','EL PUNTO DE VENTA XXXXX LLEGÓ AL LÍMITE DE PREMIOS CON EL MONTO DE YYYYYY\r\n');

#
# Structure for table "tipo_apuesta"
#

DROP TABLE IF EXISTS `tipo_apuesta`;
CREATE TABLE `tipo_apuesta` (
  `idTipoApuesta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idTipoPago` int(10) unsigned DEFAULT NULL,
  `valorapuesta` int(11) DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rgb` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `rgbLetra` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idTipoApuesta`),
  KEY `tipo_apuesta_fk1` (`idTipoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "tipo_apuesta"
#

INSERT INTO `tipo_apuesta` VALUES (1,1,1,'pleno','1 pleno','#16277D',1,'#FFFFFF'),(2,1,2,'pleno','2 pleno','#EAE399',1,'#5B1312'),(3,1,3,'pleno','3 pleno','#16277D',1,'#FFFFFF'),(4,1,4,'pleno','4 pleno','#EAE399',1,'#5B1312'),(5,1,5,'pleno','5 pleno','#16277D',1,'#FFFFFF'),(6,1,6,'pleno','6 pleno','#EAE399',1,'#5B1312'),(7,1,7,'pleno','7 pleno','#16277D',1,'#FFFFFF'),(8,1,8,'pleno','8 pleno','#EAE399',1,'#5B1312'),(9,1,9,'pleno','9 pleno','#16277D',1,'#FFFFFF'),(10,1,10,'pleno','10 pleno','#EAE399',1,'#5B1312'),(11,1,11,'pleno','11 pleno','#EAE399',1,'#5B1312'),(12,1,12,'pleno','12 pleno','#16277D',1,'#FFFFFF'),(13,1,13,'pleno','13 pleno','#EAE399',1,'#5B1312'),(14,1,14,'pleno','14 pleno','#16277D',1,'#FFFFFF'),(15,1,15,'pleno','15 pleno','#EAE399',1,'#5B1312'),(16,1,16,'pleno','16 pleno','#16277D',1,'#FFFFFF'),(17,1,17,'pleno','17 pleno','#EAE399',1,'#5B1312'),(18,1,18,'pleno','18 pleno','#16277D',1,'#FFFFFF'),(19,1,19,'pleno','19 pleno','#16277D',1,'#FFFFFF'),(20,1,20,'pleno','20 pleno','#EAE399',1,'#5B1312'),(21,1,21,'pleno','21 pleno','#16277D',1,'#FFFFFF'),(22,1,22,'pleno','22 pleno','#EAE399',1,'#5B1312'),(23,1,23,'pleno','23 pleno','#16277D',1,'#FFFFFF'),(24,1,24,'pleno','24 pleno','#EAE399',1,'#5B1312'),(25,1,25,'pleno','25 pleno','#16277D',1,'#FFFFFF'),(26,1,26,'pleno','26 pleno','#EAE399',1,'#5B1312'),(27,1,27,'pleno','27 pleno','#16277D',1,'#FFFFFF'),(28,1,28,'pleno','28 pleno','#EAE399',1,'#5B1312'),(29,1,29,'pleno','29 pleno','#EAE399',1,'#5B1312'),(30,1,30,'pleno','30 pleno','#16277D',1,'#FFFFFF'),(31,1,31,'pleno','31 pleno','#EAE399',1,'#5B1312'),(32,1,32,'pleno','32 pleno','#16277D',1,'#FFFFFF'),(33,1,33,'pleno','33 pleno','#EAE399',1,'#5B1312'),(34,1,34,'pleno','34 pleno','#16277D',1,'#FFFFFF'),(35,1,35,'pleno','35 pleno','#EAE399',1,'#5B1312'),(36,1,36,'pleno','36 pleno','#16277D',1,'#FFFFFF'),(37,2,-1,'CREMA','COLOR 1','#EAE399',1,'#5B1312'),(38,2,-1,'AZUL','COLOR 2','#16277D',1,'#FFFFFF'),(39,6,0,'CAJA X','CAJA BLOQUEDA','#2d572c',1,''),(40,5,-1,'1-12','1-12','#4D586C',1,''),(41,5,-1,'13-24','13-24','#4D586C',1,''),(42,5,-1,'25-36','25-36','#4D586C',1,''),(43,3,-1,'PAR','PAR','#4D586C',1,''),(44,3,-1,'IMPAR','IMPAR','#4D586C',1,'');

#
# Structure for table "apuesta"
#

DROP TABLE IF EXISTS `apuesta`;
CREATE TABLE `apuesta` (
  `idApuesta` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idTicket` bigint(20) unsigned DEFAULT NULL,
  `idTipoApuesta` int(10) unsigned DEFAULT NULL,
  `idMoneda` int(10) unsigned DEFAULT NULL,
  `montoApostado` decimal(18,2) DEFAULT NULL,
  `montoAPagar` decimal(18,2) DEFAULT NULL,
  `ganador` int(11) DEFAULT NULL,
  `ZonaComercial` int(11) DEFAULT NULL,
  PRIMARY KEY (`idApuesta`),
  KEY `apuesta_fk1` (`idTipoApuesta`),
  KEY `apuesta_fk2` (`idTicket`),
  CONSTRAINT `apuesta_fk1` FOREIGN KEY (`idTipoApuesta`) REFERENCES `tipo_apuesta` (`idTipoApuesta`),
  CONSTRAINT `apuesta_fk2` FOREIGN KEY (`idTicket`) REFERENCES `ticket` (`idTicket`)
) ENGINE=InnoDB AUTO_INCREMENT=819 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "apuesta"
#


#
# Structure for table "ganador_evento"
#

DROP TABLE IF EXISTS `ganador_evento`;
CREATE TABLE `ganador_evento` (
  `idGanadorEvento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idApuesta` bigint(20) unsigned DEFAULT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `montoAPagar` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serieComprobante` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nroComprobante` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idGanadorEvento`),
  KEY `ganador_evento_fk1` (`idApuesta`),
  CONSTRAINT `ganador_evento_fk1` FOREIGN KEY (`idApuesta`) REFERENCES `apuesta` (`idApuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "ganador_evento"
#


#
# Structure for table "tipo_pago"
#

DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago` (
  `idTipoPago` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multiplicadorDefecto` decimal(18,2) DEFAULT NULL,
  `plenoMinimo` int(11) DEFAULT NULL,
  `plenoMaximo` int(11) DEFAULT NULL,
  `intercalado` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTipoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "tipo_pago"
#

INSERT INTO `tipo_pago` VALUES (1,'Pleno',36.00,1,36,0,1),(2,'Color',2.00,1,24,0,1),(3,'Par e Impar',2.00,1,24,1,1),(4,'1era, 2da, 3ra ½ docena',3.00,1,24,1,1),(5,'Del 1 al 12, 13 al 24',3.00,1,24,0,1),(6,'CajaBloqueada',36.00,0,0,0,1);

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perfil_id` int(11) DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `users_email_unique` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'test.cajero1',1,'$2y$10$8hjo9mowaz5nauKbMhhSFeaIaHIR6wCEcwr2ioi6chy183PB45ngC','GBKA6kHlwBztznIJ4PNqXF9KrZfyxBgiduF2KzCpjR1ZPlpjD8PS1KvbWPkg','2019-03-20 17:50:59'),(2,'test.cajero2',1,'$2y$10$8hjo9mowaz5nauKbMhhSFeaIaHIR6wCEcwr2ioi6chy183PB45ngC','wzyr6inbTGYlJqM0QeIXEcjiA9wekwy7oDmUU209N2WLmxeE8sWUTFyU6YOV','2019-03-20 17:50:59'),(3,'test.cajero3',1,'$2y$10$8hjo9mowaz5nauKbMhhSFeaIaHIR6wCEcwr2ioi6chy183PB45ngC','9yX772IlNWKtFarSqDDwFqVLeKFk9Ixt1FyHK2ieV0jiLRf1F1Y5gXIja3rY','2019-03-20 17:51:00'),(4,'test.cajero4',1,'$2y$10$SouD8VeM6.6jANR9zySj9.19S3xBMneVCxfdWROf3TtvcePLHIZSu',NULL,'2019-05-23 11:21:09'),(5,'test.cajero5',1,'$2y$10$qjj2r/jniPjl/MAoD3CGVuVi8IN0qvXL/c4JQqxWz6D9/TCqEQlMW',NULL,'2019-05-23 11:21:10'),(6,'test.cajero6',1,'$2y$10$8nZbD8p.6i7o4wvCh2lPa.U72HokGnaxPWIa3Q2pjVLoOLHRqU7nG',NULL,'2019-05-23 11:21:10'),(7,'test.cajero7',1,'$2y$10$mbzCWvH/ElTo1LQF.2x0nek6f3Dkf8aQjwvZTCR/xcuhpr9KO5SzK',NULL,'2019-05-23 11:21:10'),(8,'test.cajero8',1,'$2y$10$.E40t8IfHGroGXU5IoUe3e6I4DPm7JUsJlLBfRWW29Yw.WinHXMA.',NULL,'2019-05-23 11:21:10'),(9,'test.cajero9',1,'$2y$10$vNMp0ozabWJ/21iLphd.aedX5xFJ0ZjQhuqMsiVnSxXxP78stvUbC',NULL,'2019-05-23 11:21:10'),(10,'test.cajero10',1,'$2y$10$qL74as5J8kN4wPrhi2bmg.SAz0Jx0V0kpHDTLgUXxF5FzzCnGAWTi',NULL,'2019-05-23 11:21:10'),(11,'test.cajero11',1,'$2y$10$vn8kbaS.laqOaC7sXLo9PuyqyYH1UevGHeREpX2dFXcReyGS96oGK',NULL,'2019-05-23 11:21:10'),(12,'test.cajero12',1,'$2y$10$M1pAcVOZTekl1v3LpktXGuN1RUBTb9ko40JQr/1sWc.4F6.JgOa2u',NULL,'2019-05-23 11:21:10'),(13,'test.cajero13',1,'$2y$10$ba/3SQRi7w3jMCjpX29AJOQ1kEmO9BhHlHDfROP8lIpcCN5VUuk92',NULL,'2019-05-23 11:21:10'),(14,'test.cajero14',1,'$2y$10$ImPeHIyvO4/HCxfzJyIzmuH0igd5iJfc0MUYaKC1anwXEqXZBxdfG',NULL,'2019-05-23 11:21:11'),(15,'test.cajero15',1,'$2y$10$AW06G0JYOddGP0kufCLz1OhFVxOwgAXHEy3zhVSqzvyA3ob4EG9ay',NULL,'2019-05-23 11:21:11'),(16,'test.cajero16',1,'$2y$10$/qLjeawy1.aUoC9Vn0EnOO4dTgNqx3CCOx2NCyHHPRw.5eb4INd4m',NULL,'2019-05-23 11:21:11'),(17,'test.cajero17',1,'$2y$10$T4vm/3Y7oI9xqGEriizDKONrfBELoJJaYJSG1Y6jDSK8lDkIieb..',NULL,'2019-05-23 11:21:11'),(18,'test.cajero18',1,'$2y$10$tSBer5/4ek8TExRJtsUoZOJuiktjoUeSZXhOL7jylyLMIm4VFK9PC',NULL,'2019-05-23 11:21:11'),(19,'test.cajero19',1,'$2y$10$0VOsWvgAKGem/cXc1h7R8eioOoSaClEy80SgR4MlFqAAObrwWdiZy',NULL,'2019-05-23 11:21:11'),(20,'test.cajero20',1,'$2y$10$gYkBn27J5cG0ExNc2u7vk.Rq01u4VEBn3Rs94SYzwQ865is2pXBIW',NULL,'2019-05-23 11:21:11'),(21,'test.cajero21',1,'$2y$10$sTZY97r1UEpt8D6yQXAWOOJ7Sad7BUg2pe1V3kG5XC4PzD.8FMBlG',NULL,'2019-05-23 11:21:11'),(22,'test.cajero22',1,'$2y$10$JyZsspUGpgzt1huMlGfp2OTPy.i/WkwpRR3eO0.YESIC2OQMPyv1K',NULL,'2019-05-23 11:21:11'),(23,'test.cajero23',1,'$2y$10$Oi05fkmwEVvPzV1xlzvg1eMgjMqUdXZaBdbHXoDkHhx.kLs.fHyNS',NULL,'2019-05-23 11:21:11'),(24,'test.cajero24',1,'$2y$10$3o3afzGGk2VGYbAIknc64u9O2K3H5nxn0RS73D82w/qpqeLh3ZXLG',NULL,'2019-05-23 11:21:11'),(25,'test.cajero25',1,'$2y$10$tqUpbmIVA1yEHeFceivShu0rqj6EP2yA2vGEJIpNyEX7XeYr0AQd2',NULL,'2019-05-23 11:21:11'),(26,'test.cajero26',1,'$2y$10$v8kxcG5BuyqkseoqRydhteosWXv4wIkQeTwEVKI4bJWeBaR0ZrE8.',NULL,'2019-05-23 11:21:12'),(27,'test.cajero27',1,'$2y$10$VEfelHw85cxw5w0F4gf24uTmU./tOtoHorCEZzOOUOIcyuMG4c7HG',NULL,'2019-05-23 11:21:12'),(28,'test.cajero28',1,'$2y$10$miT9fFCuGK6BoTKoVwUXiOCymnVHesr83RWYxq5fV.zsIDpoqSaWK',NULL,'2019-05-23 11:21:12'),(29,'test.cajero29',1,'$2y$10$lXVCiInTtcN5BhKCCunWeOUxuTZrSsRTqWQIv0MePTwP3fKB9dTWS',NULL,'2019-05-23 11:21:12'),(30,'test.cajero30',1,'$2y$10$abBYZXvSu1lMlZ3IBYEFh.S86lUsWkqdj6zCykaEGDoggP8F14T/6',NULL,'2019-05-23 11:21:12'),(31,'test.cajero31',1,'$2y$10$774mdJGfWuKTJAXHHx6lKOgFlBda8tl/mtiieYva6oeoPV7vA365a',NULL,'2019-05-23 11:21:12'),(32,'test.cajero32',1,'$2y$10$unnoc0/u3uAHoJVyGx1RXONVX8CIuXRIn2J1uC9INIzZpzsilG2LO',NULL,'2019-05-23 11:21:12'),(33,'test.cajero33',1,'$2y$10$81IH919CbibXuK3tWALV4euA5k43mOzSmxyEzg1ZiYfcFgNOebfXu',NULL,'2019-05-23 11:21:12'),(34,'test.cajero34',1,'$2y$10$urWJ9dIR62RnMfmk11qW4..xI4rKI/UmipiTyvOIsG/YfWfPb4U7q',NULL,'2019-05-23 11:21:12'),(35,'test.cajero35',1,'$2y$10$FyBPKJO4lUjvBOWrkyMP6udr1Fx3SSV6wmehI3FI25sTHmjpovuGm',NULL,'2019-05-23 11:21:12'),(36,'test.cajero36',1,'$2y$10$rwSUKdkgRdWgGie.51WMkO5h64Ntez8hoz6govBs1xa.s33r7epmm',NULL,'2019-05-23 11:21:12'),(37,'test.cajero37',1,'$2y$10$AMGa2vCYfXDY7Csq6FwG/u/I8CPV6S7TwuCNQ52OmGF2v83JpX5q2',NULL,'2019-05-23 11:21:13'),(38,'test.cajero38',1,'$2y$10$4SK1hgtAL3hXHnvJVRR0deyuk5e1RyD7KvmtYgAS2ulGZjwwyiFaW',NULL,'2019-05-23 11:21:13'),(39,'test.cajero39',1,'$2y$10$.0ElPNOf.sDZRRXGXfePOul7sFmpYfjVdt6iYzdIAXi7EZ2BsEooO',NULL,'2019-05-23 11:21:13'),(40,'test.cajero40',1,'$2y$10$FEh4za/wiC6Tz6og2lRz.OMC2Y3WOmX6dgwke1Q.eVT22M7IkeNjK',NULL,'2019-05-23 11:21:13'),(41,'test.cajero41',1,'$2y$10$4C8.dq6KgAl/0ugQ6/ZL3esliZc2JwUMB2oZ44.le.cm8D1rIURWu',NULL,'2019-05-23 11:21:13'),(42,'test.cajero42',1,'$2y$10$2uvnChJRmhi8.VE1lSuUke7TI6ldu5ekld2nI4tmwRJHXPHHqKhzG',NULL,'2019-05-23 11:21:13'),(43,'test.cajero43',1,'$2y$10$7R6G7JvbKnHR1F6GrkoQWuwtfgQL2nuIf.b9W2NQKE74Ao8k/lCSm',NULL,'2019-05-23 11:21:13'),(44,'test.cajero44',1,'$2y$10$/NeOn9aeP8E9j6R9GHfNh.Gaj8s9.u07rg5rr3m57Amr/l2FzwL1.',NULL,'2019-05-23 11:21:13'),(45,'test.cajero45',1,'$2y$10$5oYSbfgMSm5WHUqlxpewAOZjXEXrIVDmdKRZ.Wp4ceBvBHmY./B7C',NULL,'2019-05-23 11:21:13'),(46,'test.cajero46',1,'$2y$10$IJ0bo/CiL0pPKe/zcko1sOUJRbTIpbSirfBzSZzA251AlBXs1v5Lu',NULL,'2019-05-23 11:21:13'),(47,'test.cajero47',1,'$2y$10$gRK9NWFdbIcNj6vHToWj.elrlATGXi8vwFyjH5ZPZG6lUW2pJatyq',NULL,'2019-05-23 11:21:13'),(48,'test.cajero48',1,'$2y$10$xNCrKEPLJGmg01fzA89VMeNlaM0h8gkrSlj04pJrSK/8zV1Z4ZAem',NULL,'2019-05-23 11:21:14'),(49,'test.cajero49',1,'$2y$10$VqhIOeloLfym2sVvo3Wq2.SeQ0jD7lx3uYaNo233soZOH9kRj0BjC',NULL,'2019-05-23 11:21:14'),(50,'test.cajero50',1,'$2y$10$bnU7fcAcXovZSAbMVJaDbeGsS4gjpoJlcf0k857lACo0clDKZHvty',NULL,'2019-05-23 11:21:14'),(51,'test.cajero51',1,'$2y$10$o55Y9Bj0bUJNR/HRDkOe7.QHxAoY62GiIjitDlliXO/qQ1qjHugmm',NULL,'2019-05-23 11:21:14'),(52,'test.cajero52',1,'$2y$10$lG4oSb2QJ0jjtYZwawBwaui6uVq96DVSJrBaBfym/ZAqa0EZTl/ZS',NULL,'2019-05-23 11:21:14'),(53,'test.cajero53',1,'$2y$10$a2CfmZXHNFwGHjZ4fuTwD.Ued84wnYduGJNEcjVx3LV/t8JJ.FlWy',NULL,'2019-05-23 11:21:14'),(54,'test.cajero54',1,'$2y$10$SWt.j24T4/NhlQjZE7tOQ.bM83dklQ1bagC2ezp7qilqrHvtrPMoC',NULL,'2019-05-23 11:21:14'),(55,'test.cajero55',1,'$2y$10$UVqTIZyKXcJVH.RNfdPQLemFmqo1XAZdHUrHzgxjgxVkXCC6465Di',NULL,'2019-05-23 11:21:14'),(56,'test.cajero56',1,'$2y$10$YGAmBeCtkxIFZgCghWDJ0O5etFTDJEPDY6Vc6MDw4JlRQQ2qsj3Oy',NULL,'2019-05-23 11:21:14'),(57,'test.cajero57',1,'$2y$10$i6M46ON7NFTw6w5nHoCH8.05lIbaKK1dpTJsyjZrzQMKXkRl6LNxS',NULL,'2019-05-23 11:21:14'),(58,'test.cajero58',1,'$2y$10$c8F38H4WluG/VcYOo9sURuZ.nsBicNBZJVSk5u4BNKTbI1qmXUxFO',NULL,'2019-05-23 11:21:14'),(59,'test.cajero59',1,'$2y$10$eElkN690AIHa/IvMHEqcDe37Y/Y2yvwwXx0z2pLrstYYjogZDyizq',NULL,'2019-05-23 11:21:15'),(60,'test.cajero60',1,'$2y$10$gaQRU/1p21jVksJWDrBK1eKBe.JgMMrTYz6Vo5IJ0lTPv0pV.2CUa',NULL,'2019-05-23 11:21:15'),(61,'test.cajero61',1,'$2y$10$gVBgSVH9eXxS5IbcQSQCueZIRg1nRwmuN4S1Mn7/fRSyKOB9Vv1dS',NULL,'2019-05-23 11:21:15'),(62,'test.cajero62',1,'$2y$10$aEiWTY49yEJfvkAt/3wIheV0RVLZNvPPofZoDYOZudk94G5MZwY9e',NULL,'2019-05-23 11:21:15'),(63,'test.cajero63',1,'$2y$10$8zdkeZkJ2Wl0kTO7CoABX.ZdDU1HxH6P59OGhc0H.aa2gm08OR4FS',NULL,'2019-05-23 11:21:15'),(64,'test.cajero64',1,'$2y$10$SB2uJfSEK40P20rw0xGM1uxLouHr..lAPc3fup/Op9eHh/fMTMsUm',NULL,'2019-05-23 11:21:15'),(65,'test.cajero65',1,'$2y$10$n/yXKoPeSrzPwyg6PFPeveKCK4JaKYWEaVqQeiUmNgbfFd7aMzbGS',NULL,'2019-05-23 11:21:15'),(66,'test.cajero66',1,'$2y$10$IyhLHIawCWoS9p4R7DkhW.9XaaGAZbaZ9dYFtTFRcm/6WoAzN1yQa',NULL,'2019-05-23 11:21:15'),(67,'test.cajero67',1,'$2y$10$Q40.t5UaLmRkC3f6hQlA7e9.85mWAJe.DmA7SaGMkFdPfa8keeUQ2',NULL,'2019-05-23 11:21:15'),(68,'test.cajero68',1,'$2y$10$GNuaUIKqwr5xhJ9rhBjj3.d54fgrZzDqTiSqMSFiEX7OgwY1cVCWW',NULL,'2019-05-23 11:21:15'),(69,'test.cajero69',1,'$2y$10$oSRRN4NKzF.gcI2LeFGfPugBkiIt65zEgnbpbbo8CskYmrJF6CdU.',NULL,'2019-05-23 11:21:15'),(70,'test.cajero70',1,'$2y$10$cXYQsyTq9nXP5xxt7QQGo.gCL7tYU2yNG7BRjZckIwAekWL3TlTUm',NULL,'2019-05-23 11:21:15'),(71,'test.cajero71',1,'$2y$10$xMhrX/qt9CG5wg7et9iCm.L5A1XWXTwVXqQ5k.5dxAJkz4h2A8RFO',NULL,'2019-05-23 11:21:16'),(72,'test.cajero72',1,'$2y$10$RG16cX3tyiR6mcDPQGsltOSAqycnhPmtL5mdYD5vfip8hanzNEN6S',NULL,'2019-05-23 11:21:16'),(73,'test.cajero73',1,'$2y$10$sJQXvOWx62vLU3jXXxCNx.BjVTsb.LFY9OiYeFe77247ZcycWOmm2',NULL,'2019-05-23 11:21:16'),(74,'test.cajero74',1,'$2y$10$s9/lDliPJLOgb5K2G0.5g.DY4dIMAX5aaaRaU5OwIwZLe6BwsKPGa',NULL,'2019-05-23 11:21:16'),(75,'test.cajero75',1,'$2y$10$I3Pa3TP.gf/6zSbbo0XpVOxxmbbP6dtnHpEuPLxviOASMK3XgJfQ6',NULL,'2019-05-23 11:21:16'),(76,'test.cajero76',1,'$2y$10$3T8S3M0RNj5ZkY4pSgZfWuD.hmLwe8TNzMrwOM4t0T2aiqTP5IXHO',NULL,'2019-05-23 11:21:16'),(77,'test.cajero77',1,'$2y$10$Y.kOy5BDLmPNdA08TkFyu.eKRczlrjWXQ1InvldpDHBZcesgLVdQO',NULL,'2019-05-23 11:21:16'),(78,'test.cajero78',1,'$2y$10$JJIwLL4Z1YzJnUDdrqWhAufPNBvfdQD9Eayl.JhdQAbUAPQll7tsm',NULL,'2019-05-23 11:21:16'),(79,'test.cajero79',1,'$2y$10$CcwOZaPa6fIzuZg3P7frg.ZbpDwee7y7hddln1Wn7iwM.nK3QM9Wa',NULL,'2019-05-23 11:21:16'),(80,'test.cajero80',1,'$2y$10$sO1RPBJAu2aF1wBTybwfRO.n1G1YucQXa/OwW./44zvLfQkkFhtby',NULL,'2019-05-23 11:21:16'),(81,'test.cajero81',1,'$2y$10$g8kpINE2SJMymftv7zHnZ.R.BtWwdkAG2GVGFWrsk918QMjWAT3e6',NULL,'2019-05-23 11:21:16'),(82,'test.cajero82',1,'$2y$10$7qSqeIvaMND/0ks.y3iGkeSxfz7BgA9RizVIgPDvtXsQbbHiwlBMW',NULL,'2019-05-23 11:21:17'),(83,'test.cajero83',1,'$2y$10$u0nWD.iSUaLM3OHozNpjJ.nN7qqzRVifQY6wCbmo7oQTeeZO.1vfm',NULL,'2019-05-23 11:21:17'),(84,'test.cajero84',1,'$2y$10$UN48Art8mrkSCIoP/XTjJuapzqevJu7omIrxmErgvZgmEPZveEwA2',NULL,'2019-05-23 11:21:17'),(85,'test.cajero85',1,'$2y$10$l.c7jv/YG27sK3/BktLOo.NVNMlk8Ddh9cvNHhVxGhwImjDyV/R5m',NULL,'2019-05-23 11:21:17'),(86,'test.cajero86',1,'$2y$10$v/8M3Rrgu3iIl9cS97XogeGMP2jU027U8qGKuq/kMp.1lFP7YnJuy',NULL,'2019-05-23 11:21:17'),(87,'test.cajero87',1,'$2y$10$62snvxdLx6sCLguZwB4eyOPIJVN78LMVNG/B.N4fKDA/T1Pp3sD5C',NULL,'2019-05-23 11:21:17'),(88,'test.cajero88',1,'$2y$10$R9CtLaEFJikZSJQ7T1qIPeoFyFQiyanKpMhD9g2Wq/JhA6bfYSBXC',NULL,'2019-05-23 11:21:17'),(89,'test.cajero89',1,'$2y$10$QpUkCwGV6KEuf0UcPqDZbuJH.dWdsufPuTYQJibJVNb2pKv5lySMm',NULL,'2019-05-23 11:21:17'),(90,'test.cajero90',1,'$2y$10$CQRZ2JvLuwtr/o8H.cLh2.XP7p.gqrtAz3W5iZnVO/6BOjxuaWuGO',NULL,'2019-05-23 11:21:17'),(91,'test.cajero91',1,'$2y$10$z4Kn99mzQPuAFfX7N1nX2Or4reY0yVx.u5.bmJpBEyU0uqwGVYUMe',NULL,'2019-05-23 11:21:17'),(92,'test.cajero92',1,'$2y$10$qCMIeZ2vzecCqRUnJ16qFumDEFCJwyx8gEquYky4YX7S/XdRsalbm',NULL,'2019-05-23 11:21:17'),(93,'test.cajero93',1,'$2y$10$zaunlaOtqVNDhdsB4cSZRe5lSATgrq2/68lOqkfGCisqQFyh69wlS',NULL,'2019-05-23 11:21:18'),(94,'test.cajero94',1,'$2y$10$82UMJHOtnY90.cAX6HKUzuRL7eOAEYwswnd87e7k9zGj7kAqpNKTK',NULL,'2019-05-23 11:21:18'),(95,'test.cajero95',1,'$2y$10$jJKdihs0pdNLcReR5L77seHJVUyiH.UOHHmlXebhlZWpjCLIizwL2',NULL,'2019-05-23 11:21:18'),(96,'test.cajero96',1,'$2y$10$x3AXF.VAEsnJPol4dNqK7ObeToqC0WOwCWgS6VeguDubDlQkojdRe',NULL,'2019-05-23 11:21:18'),(97,'test.cajero97',1,'$2y$10$SkStOqmeWswv3CLXMSsJVeiUzi7PXl42xIOSLKctBJeuj/YzzUKpu',NULL,'2019-05-23 11:21:18'),(98,'test.cajero98',1,'$2y$10$lxKMfG3x1NNc5uXUIPABI.ZuIUW8BNZEe.RgMXN06lysdcHnxVpvy',NULL,'2019-05-23 11:21:18'),(99,'test.cajero99',1,'$2y$10$YB91sBMek0WHLDpeuvUsS.G8d6XrlpdUF5uqPFsSrAGsZ7wYMEv/i',NULL,'2019-05-23 11:21:18'),(100,'test.cajero100',1,'$2y$10$iivryYvm53fRpEzO0XuIGeZzrzfttII4tHDwLhfF.6YezCAiM5WYq',NULL,'2019-05-23 11:21:18');

#
# Structure for table "usuario_punto_venta"
#

DROP TABLE IF EXISTS `usuario_punto_venta`;
CREATE TABLE `usuario_punto_venta` (
  `idUsuarioPuntoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idPuntoVenta` int(11) unsigned NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuarioPuntoVenta`),
  KEY `FK_usuario_punto_venta_users` (`idUsuario`),
  KEY `FK_usuario_punto_venta_punto_venta` (`idPuntoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

#
# Data for table "usuario_punto_venta"
#

INSERT INTO `usuario_punto_venta` VALUES (1,1,1,1),(2,1,2,0),(3,1,3,0),(4,1,4,0),(5,1,5,0),(6,1,7,0),(7,1,6,0),(8,1,8,0),(9,1,10,0),(10,1,9,0),(12,1,11,0),(13,1,12,0),(14,2,2,1),(15,1,241,0),(16,2,241,0),(17,3,9,1),(18,2,7,0),(19,3,8,1),(20,100,259,1);
