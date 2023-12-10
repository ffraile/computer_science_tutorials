-- START HERE IF YOU ARE WORKING ON YOUR MYSQL INSTANCE
DROP DATABASE IF EXISTS santas_list;
CREATE DATABASE santas_list;
USE santas_list;

-- START HERE IF YOU ARE WORKING ON SQL_FIDDLE
CREATE TABLE Child (
childId INT PRIMARY KEY,
firstName VARCHAR(40),
lastName VARCHAR(40),
birthDate DATETIME,
address VARCHAR(100),
gender ENUM('male', 'female', 'Other')
);

CREATE TABLE PresentList (
presentListId INT PRIMARY KEY,
childFk INT,
presentYear INT,
isnice BIT(1),
CONSTRAINT present_list_child_fk FOREIGN KEY (childFk) REFERENCES Child(childId),
CONSTRAINT present_child_year_uq UNIQUE (childFk, presentYear)
);

CREATE TABLE Present (
presentId INT PRIMARY KEY,
description VARCHAR(500),
intendedGender ENUM('male', 'female', 'gender-neutral'),
intendedMinRange INT,
intendedMaxRange INT
);

CREATE TABLE PresentListItems(
presentListItemId INT PRIMARY KEY,
presentListFk INT,
presentFk INT,
granted BIT(1),
CONSTRAINT item_present_list_fk FOREIGN KEY (presentListFk) REFERENCES PresentList(presentListId),
CONSTRAINT presentFk FOREIGN KEY (presentFk) REFERENCES Present(presentId)
);

-- Child Table
INSERT INTO Child (childId, firstName, lastName, birthDate, address, gender) VALUES
(1, 'Linnie', 'McCallister', '2014-06-10', '123 Candy Cane Lane', 'female'),
(2, 'Kevin', 'McCallister', '2016-08-15', '123 Candy Cane Lane', 'male'),
(3, 'Sally', 'Finkelstein', '2013-05-22', '456 Snowflake Blvd', 'male'),
(4, 'Cindy-Lou', 'Quien', '2015-03-18', '789 Elf Road', 'female'),
(5, 'Francis-Xavier', 'Cross', '2012-10-30', '101 Reindeer Street', 'male'),
(6, 'Ebenezer', 'Scrooge', '2017-12-12', '202 Gingerbread Avenue', 'female');


-- Present list
INSERT INTO PresentList (presentListId, childFk, presentYear, isnice) VALUES
(1, 1, 2020, 1),
(2, 1, 2021, 1),
(3, 2, 2020, 1),
(4, 2, 2021, 0),
(5, 3, 2020, 1),
(6, 3, 2021, 1),
(7, 4, 2020, 1),
(8, 4, 2021, 1),
(9, 5, 2020, 0),
(10, 5, 2021, 1),
(11, 6, 2020, 1),
(12, 6, 2021, 1);

-- Present list
INSERT INTO Present (presentId, description, intendedGender, intendedMinRange, intendedMaxRange) VALUES
(1, 'Bicycle', 'gender-neutral', 5, 10),
(2, 'Toy Train Set', 'gender-neutral', 3, 7),
(3, 'Dollhouse', 'female', 4, 8),
(4, 'Remote Control Car', 'male', 6, 12),
(5, 'Science Kit', 'gender-neutral', 7, 14),
(6, 'Building Blocks', 'gender-neutral', 2, 5);

-- Present list items
INSERT INTO PresentListItems (presentListItemId, presentListFk, presentFk, granted) VALUES
(1, 1, 1, 1),
(2, 2, 3, 1),
(3, 3, 2, 1),
(4, 4, 4, 0),
(5, 5, 5, 1),
(6, 6, 1, 1),
(7, 7, 3, 1),
(8, 8, 6, 1),
(9, 9, 4, 0),
(10, 10, 5, 1),
(11, 11, 6, 1),
(12, 12, 2, 1),
(13, 1, 2, 1),
(14, 2, 4, 1),
(15, 3, 3, 1),
(16, 4, 5, 0),
(17, 5, 6, 1),
(18, 6, 1, 1),
(19, 7, 2, 1),
(20, 8, 3, 1);


