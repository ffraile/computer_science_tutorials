-- SKIP THIS PART IN SQL FIDDLE
CREATE DATABASE /*!32312 IF NOT EXISTS*/`iiot_database` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `iiot_database`;

-- START HERE IN SQL FIDDLE
drop table if exists sensor_readings;
drop table if exists sensors;
drop table if exists devices;
drop table if exists sensor_types;
drop table if exists device_types;

create table device_types (
  device_type_id int primary key,
  device_name varchar(30),
  device_description varchar(500)
);

drop table if exists sensor_types;
create table sensor_types (
  sensor_type_id int primary key,
  sensor_name varchar(30),
  device_type_fk int,
  unit varchar(10),
  upper_range decimal(13,3),
  lower_range decimal(13,3),
  CONSTRAINT sensor_device_type_fk FOREIGN KEY (device_type_fk) REFERENCES device_types(device_type_id)
);

drop table if exists devices;
create table devices (
  device_id int primary key,
  device_type_fk int,
  device_location varchar(30),
  status enum('OK', 'ERR') DEFAULT 'OK',
  CONSTRAINT device_type_fk FOREIGN KEY (device_type_fk) REFERENCES device_types(device_type_id)
);

drop table if exists sensors;
create table sensors (
  sensor_id int primary key,
  sensor_type_fk int,
  device_fk int,
  status enum('OK', 'ERR') DEFAULT 'OK',
  CONSTRAINT sensor_device_fk FOREIGN KEY (device_fk) REFERENCES devices(device_id),
  CONSTRAINT sensor_sensor_type_fk FOREIGN KEY (sensor_type_fk) REFERENCES sensor_types(sensor_type_id),
  UNIQUE KEY sensor_unique_idx (sensor_type_fk, device_fk)

);

drop table if exists sensor_readings;
CREATE TABLE sensor_readings (
  reading_id int primary key AUTO_INCREMENT,
  sensor_fk int,
  reading_value float,
  created timestamp,
  constraint sensor_reading_fk FOREIGN KEY (sensor_fk) REFERENCES sensors(sensor_id)
);

INSERT INTO device_types (device_type_id, device_name, device_description) VALUES (1, 'BOSCH XDK 110', 'Wireless sensor for rapid prototyping, it allows users an easy transition from prototype to mass production by providing a clear road to product development.');
INSERT INTO sensor_types (sensor_type_id, sensor_name, device_type_fk, unit, upper_range, lower_range) VALUES (1, 'Accelometer', 1, 'g2', 2, 16), (2, 'Humidity', 1, '%rH', 10, 90), (3, 'Temperature', 1, 'ºC', -20, 60);
INSERT INTO devices (device_id, device_type_fk, device_location) VALUES (1, 1, 'Cieza, Murcia, Spain'), (2, 1, 'Benimodo, Valencia, Spain');
INSERT INTO sensors (sensor_id, sensor_type_fk, device_fk) VALUES (1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 1, 2), (5, 2, 2), (6, 3, 2);
INSERT INTO sensor_readings (sensor_fk, reading_value, created) VALUES
(1, 0.003, '2021-12-12 00:03:00'),
(1, 0.003, '2021-12-12 00:06:00'),
(1, 0.007, '2021-12-12 00:09:00'),
(1, 0.004, '2021-12-12 00:12:00'),
(1, 0.004, '2021-12-12 00:15:00'),
(1, 0.007, '2021-12-12 00:18:00'),
(1, 0.008, '2021-12-12 00:21:00'),
(1, 0.008, '2021-12-12 00:24:00'),
(1, 0.002, '2021-12-12 00:27:00'),
(1, 0.6, '2021-12-12 00:30:00'),
(1, 3.9, '2021-12-12 00:33:00'),
(1, 3.2, '2021-12-12 00:36:00'),
(1, 3.7, '2021-12-12 00:39:00'),
(1, 0.005, '2021-12-12 00:42:00'),
(1, 0.006, '2021-12-12 00:45:00'),
(1, 0.001, '2021-12-12 00:48:00'),
(1, 0.003, '2021-12-12 00:51:00'),
(1, 0.006, '2021-12-12 00:54:00'),
(1, 0.005, '2021-12-12 00:57:00'),
(1, 0.009, '2021-12-12 01:00:00'),
(4, 0.002, '2021-12-12 00:04:00'),
(4, 0.006, '2021-12-12 00:07:00'),
(4, 0.01, '2021-12-12 00:10:00'),
(4, 0.01, '2021-12-12 00:13:00'),
(4, 0.003, '2021-12-12 00:16:00'),
(4, 0.008, '2021-12-12 00:19:00'),
(4, 0.001, '2021-12-12 00:22:00'),
(4, 0.009, '2021-12-12 00:25:00'),
(4, 0.004, '2021-12-12 00:28:00'),
(4, 0.009, '2021-12-12 00:31:00'),
(4, 0.008, '2021-12-12 00:34:00'),
(4, 0.005, '2021-12-12 00:37:00'),
(4, 0.01, '2021-12-12 00:40:00'),
(4, 0.008, '2021-12-12 00:43:00'),
(4, 0.007, '2021-12-12 00:46:00'),
(4, 0.01, '2021-12-12 00:49:00'),
(4, 0.008, '2021-12-12 00:52:00'),
(4, 0.009, '2021-12-12 00:55:00'),
(4, 0.009, '2021-12-12 00:58:00'),
(4, 0.01, '2021-12-12 01:01:00'),
(2, 60.9, '2021-12-12 00:03:00'),
(2, 60.5, '2021-12-12 00:06:00'),
(2, 60.8, '2021-12-12 00:09:00'),
(2, 60.9, '2021-12-12 00:12:00'),
(2, 60.8, '2021-12-12 00:15:00'),
(2, 60.5, '2021-12-12 00:18:00'),
(2, 61, '2021-12-12 00:21:00'),
(2, 60.6, '2021-12-12 00:24:00'),
(2, 60.7, '2021-12-12 00:27:00'),
(2, 60.8, '2021-12-12 00:30:00'),
(2, 60.6, '2021-12-12 00:33:00'),
(2, 61, '2021-12-12 00:36:00'),
(2, 60.8, '2021-12-12 00:39:00'),
(2, 61, '2021-12-12 00:42:00'),
(2, 60.2, '2021-12-12 00:45:00'),
(2, 60.8, '2021-12-12 00:48:00'),
(2, 60.7, '2021-12-12 00:51:00'),
(2, 60.7, '2021-12-12 00:54:00'),
(2, 61, '2021-12-12 00:57:00'),
(2, 60.6, '2021-12-12 01:00:00'),
(5, 66.8, '2021-12-12 00:04:00'),
(5, 66, '2021-12-12 00:07:00'),
(5, 65.6, '2021-12-12 00:10:00'),
(5, 65.8, '2021-12-12 00:13:00'),
(5, 65.2, '2021-12-12 00:16:00'),
(5, 66.2, '2021-12-12 00:19:00'),
(5, 66.2, '2021-12-12 00:22:00'),
(5, 66.2, '2021-12-12 00:25:00'),
(5, 65.8, '2021-12-12 00:28:00'),
(5, 65.4, '2021-12-12 00:31:00'),
(5, 65.4, '2021-12-12 00:34:00'),
(5, 66.6, '2021-12-12 00:37:00'),
(5, 66.2, '2021-12-12 00:40:00'),
(5, 65.4, '2021-12-12 00:43:00'),
(5, 66.4, '2021-12-12 00:46:00'),
(5, 66.2, '2021-12-12 00:49:00'),
(5, 67, '2021-12-12 00:52:00'),
(5, 65.2, '2021-12-12 00:55:00'),
(5, 65.2, '2021-12-12 00:58:00'),
(5, 66.6, '2021-12-12 01:01:00'),
(3, 28.8, '2021-12-12 00:03:00'),
(3, 28.6, '2021-12-12 00:06:00'),
(3, 28.1, '2021-12-12 00:09:00'),
(3, 28.6, '2021-12-12 00:12:00'),
(3, 28.6, '2021-12-12 00:15:00'),
(3, 28.2, '2021-12-12 00:18:00'),
(3, 28.4, '2021-12-12 00:21:00'),
(3, 28.7, '2021-12-12 00:24:00'),
(3, 28.4, '2021-12-12 00:27:00'),
(3, 28.4, '2021-12-12 00:30:00'),
(3, 28.8, '2021-12-12 00:33:00'),
(3, 28.5, '2021-12-12 00:36:00'),
(3, 28.9, '2021-12-12 00:39:00'),
(3, 28.3, '2021-12-12 00:42:00'),
(3, 28.2, '2021-12-12 00:45:00'),
(3, 28.3, '2021-12-12 00:48:00'),
(3, 28.6, '2021-12-12 00:51:00'),
(3, 28.2, '2021-12-12 00:54:00'),
(3, 28.1, '2021-12-12 00:57:00'),
(3, 28.9, '2021-12-12 01:00:00'),
(6, 26.4, '2021-12-12 00:04:00'),
(6, 27, '2021-12-12 00:07:00'),
(6, 26.6, '2021-12-12 00:10:00'),
(6, 25.6, '2021-12-12 00:13:00'),
(6, 25.4, '2021-12-12 00:16:00'),
(6, 26.4, '2021-12-12 00:19:00'),
(6, 27, '2021-12-12 00:22:00'),
(6, 26.4, '2021-12-12 00:25:00'),
(6, 26.8, '2021-12-12 00:28:00'),
(6, 26.6, '2021-12-12 00:31:00'),
(6, 25.4, '2021-12-12 00:34:00'),
(6, 25.2, '2021-12-12 00:37:00'),
(6, 25.8, '2021-12-12 00:40:00'),
(6, 25.8, '2021-12-12 00:43:00'),
(6, 25.2, '2021-12-12 00:46:00'),
(6, 25.8, '2021-12-12 00:49:00'),
(6, 27, '2021-12-12 00:52:00'),
(6, 26.6, '2021-12-12 00:55:00'),
(6, 25.8, '2021-12-12 00:58:00'),
(6, 26.6, '2021-12-12 01:01:00');
