CREATE DATABASE  IF NOT EXISTS `Region`;
USE `Region`;



DROP TABLE IF EXISTS `region`;

CREATE TABLE `region` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(55) DEFAULT NULL,
  `region_code` varchar(5) NOT NULL,
  `country_code` varchar(5) NOT NULL,
  PRIMARY KEY (`region_code`),
  UNIQUE KEY `id` (`id`)
);



INSERT INTO `region` VALUES (320,NULL,'00','US'),(302,'Alberta','AB','CA'),(312,'Alaska','AK','US'),(303,'Alabama','AL','US'),(291,'Arkansas','AR','US'),(267,'Arizona','AZ','US'),(294,'British Columbia','BC','CA'),(261,'California','CA','US'),(269,'Colorado','CO','US'),(259,'Connecticut','CT','US'),(287,'District of Columbia','DC','US'),(310,'Delaware','DE','US'),(258,'Florida','FL','US'),(260,'Georgia','GA','US'),(300,'Hawaii','HI','US'),(272,'Iowa','IA','US'),(288,'Idaho','ID','US'),(278,'Illinois','IL','US'),(285,'Indiana','IN','US'),(301,'Kansas','KS','US'),(270,'Kentucky','KY','US'),(297,'Louisiana','LA','US'),(262,'Massachusetts','MA','US'),(276,'Manitoba','MB','CA'),(256,'Maryland','MD','US'),(286,'Maine','ME','US'),(274,'Michigan','MI','US'),(298,'Minnesota','MN','US'),(263,'Missouri','MO','US'),(289,'Mississippi','MS','US'),(293,'Montana','MT','US'),(307,'New Brunswick','NB','CA'),(277,'North Carolina','NC','US'),(299,'North Dakota','ND','US'),(290,'Nebraska','NE','US'),(309,'New Hampshire','NH','US'),(279,'New Jersey','NJ','US'),(319,'Newfoundland','NL','CA'),(265,'New Mexico','NM','US'),(308,'Nova Scotia','NS','CA'),(317,'Northwest Territories','NT','CA'),(318,'Nunavut','NU','CA'),(284,'Nevada','NV','US'),(271,'New York','NY','US'),(296,'Ohio','OH','US'),(257,'Oklahoma','OK','US'),(273,'Ontario','ON','CA'),(283,'Oregon','OR','US'),(264,'Pennsylvania','PA','US'),(315,'Prince Edward Island','PE','CA'),(266,'Quebec','QC','CA'),(311,'Rhode Island','RI','US'),(275,'South Carolina','SC','US'),(314,'South Dakota','SD','US'),(306,'Saskatchewan','SK','CA'),(295,'Tennessee','TN','US'),(268,'Texas','TX','US'),(292,'Utah','UT','US'),(280,'Virginia','VA','US'),(313,'Vermont','VT','US'),(282,'Washington','WA','US'),(281,'Wisconsin','WI','US'),(304,'West Virginia','WV','US'),(305,'Wyoming','WY','US'),(316,'Yukon Territory','YT','CA');

