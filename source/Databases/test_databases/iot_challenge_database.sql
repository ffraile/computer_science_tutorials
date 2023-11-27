
DROP TABLE IF EXISTS `commands`;
CREATE TABLE `commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `command` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
CREATE TABLE `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `response` varchar(45) DEFAULT NULL,
  `command_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `command_fk_idx` (`command_fk`),
  CONSTRAINT `command_fk` FOREIGN KEY (`command_fk`) REFERENCES `commands` (`id`)
);
--
-- Table structure for table `sensor_data`
--
CREATE TABLE `sensor_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `humidity` float DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `soil_moisture` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);