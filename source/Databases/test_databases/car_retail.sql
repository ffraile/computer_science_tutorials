-- SKIP THIS PART IN SQL FIDDLE
CREATE DATABASE /*!32312 IF NOT EXISTS*/`car_retail` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `car_retail`;

-- START HERE IN SQL FIDDLE
-- schema
CREATE TABLE Departments (
    Id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(25) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE Employees (
    Id INT NOT NULL AUTO_INCREMENT,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber VARCHAR(11),
    ManagerId INT,
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL,
    HireDate DATETIME NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY (ManagerId) REFERENCES Employees(Id),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

CREATE TABLE Customers (
    Id INT NOT NULL AUTO_INCREMENT,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    Email varchar(100) NOT NULL,
    PhoneNumber VARCHAR(11),
    PreferredContact VARCHAR(5) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE Cars (
    Id INT NOT NULL AUTO_INCREMENT,
    CustomerId INT NOT NULL,
    EmployeeId INT NOT NULL,
    Model varchar(50) NOT NULL,
    Status varchar(25) NOT NULL,
    TotalCost INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);

-- datasets
INSERT INTO Departments
    (Id, Name)
VALUES
    (1, 'HR'),
    (2, 'Sales'),
    (3, 'Tech')
;

-- Inserting Miyagi-Do Employees
INSERT INTO Employees
    (Id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES
    (1, 'Daniel', 'LaRusso', '5550010001', NULL, 2, 80000, '2018-05-01'),
    (2, 'Amanda', 'LaRusso', '5550010002', 1, 1, 85000, '2018-05-02'),
    (3, 'Miguel', 'Diaz', '5550010003', 1, 3, 60000, '2019-08-15'),
    (4, 'Robby', 'Keene', '5550010004', 1, 2, 55000, '2020-01-15'),
    (5, 'Samantha', 'LaRusso', '5550010005', 1, 2, 65000, '2020-02-10'),
    (6, 'Demetri', 'Alexopoulos', '5550010006', 1, 2, 57000, '2020-04-20'),
    (7, 'Eli', 'Moskowitz', '5550010007', 3, 3, 58000, '2020-03-12'),
    (8, 'Anthony', 'LaRusso', '5550010008', 4, 2, 50000, '2021-06-01'),
    (9, 'Jessica', 'Andrews', '5550010009', 4, 2, 60000, '2019-09-10'),
    (10, 'Lucille', 'LaRusso', '5550010010', 2, 1, 62000, '2019-07-05');


-- Inserting Cobra Kai Customers
INSERT INTO Customers
    (Id, FName, LName, Email, PhoneNumber, PreferredContact)
VALUES
    (1, 'John', 'Kreese', 'senseikreese@cobrakai.com', '5550020001', 'Email'),
    (2, 'Terry', 'Silver', 'tsilver@cobrakai.com', '5550020002', 'Email'),
    (3, 'Johnny', 'Lawrence', 'nomercyjohnny@cobrakai.com', '5550020003', 'Phone'),
    (4, 'Mike', 'Barnes', 'karatebadboy@cobrakai.com', '5550020004', 'Email'),
    (5, 'Kyler', 'Park', 'kylerkick@cobrakai.com', '5550020005', 'Email'),
    (6, 'Tory', 'Nichols', 'toryn@cobrakai.com', '5550020006', 'Phone'),
    (7, 'Aisha', 'Robinson', 'aishar@cobrakai.com', '5550020007', 'Email'),
    (8, 'Mitch', 'Pennington', 'assface@cobrakai.com', '5550020008', 'Email'),
    (9, 'Raymond', 'Bishop', 'stingray@cobrakai.com', '5550020009', 'Phone'),
    (10, 'Edwin', 'Neal', 'edneal@cobrakai.com', '5550020010', 'Email'),
    (11, 'Big', 'Red', 'bigred@cobrakai.com', '5550020011', 'Email'),
    (12, 'Dieter', 'Reinhardt', 'dieter@cobrakai.com', '5550020012', 'Phone'),
    (13, 'Sarah', 'Dumont', 'sarahd@cobrakai.com', '5550020013', 'Email'),
    (14, 'Doug', 'Rickenberger', 'dougr@cobrakai.com', '5550020014', 'Email'),
    (15, 'Frank', 'Jenkins', 'frankj@cobrakai.com', '5550020015', 'Phone'),
    (16, 'Rick', 'Perez', 'rickp@cobrakai.com', '5550020016', 'Email'),
    (17, 'Vic', 'Brown', 'vicbrown@cobrakai.com', '5550020017', 'Email'),
    (18, 'Lyle', 'Samson', 'lyles@cobrakai.com', '5550020018', 'Phone'),
    (19, 'Paul', 'Walters', 'paulw@cobrakai.com', '5550020019', 'Email'),
    (20, 'Bert', 'Moore', 'bertm@cobrakai.com', '5550020020', 'Email');


-- Inserting Cars
INSERT INTO Cars
    (Id, CustomerId, EmployeeId, Model, Status, TotalCost)
VALUES
    (1, 1, 1, 'Dodge Charger - Black', 'Sold', 35000),
    (2, 2, 1, 'Ford Mustang - Silver', 'Sold', 30000),
    (3, 3, 4, 'Chevrolet Camaro - Red', 'Sold', 27000),
    (4, 4, 4, 'Dodge Challenger - Black', 'Available', 32000),
    (5, 5, 4, 'Honda Accord - White', 'Sold', 24000),
    (6, 5, 4, 'Tesla Model 3 - Red', 'Sold', 50000),
    (7, 6, 4, 'Subaru WRX - Blue', 'Available', 28000),
    (8, 7, 4, 'Audi A4 - Silver', 'Maintenance', 35000),
    (9, 8, 5, 'BMW 3 Series - Black', 'Sold', 40000),
    (10, 9, 5, 'Mercedes-Benz C-Class - White', 'Available', 42000),
    (11, 10, 6, 'Toyota Supra - Red', 'Sold', 50000),
    (12, 11, 6, 'Nissan 370Z - Black', 'Sold', 30000),
    (13, 11, 6, 'Ford F-150 - Blue', 'Maintenance', 35000),
    (14, 12, 6, 'Chevrolet Silverado - Silver', 'Sold', 37000),
    (15, 13, 9, 'Porsche 911 - Black', 'Available', 90000),
    (16, 14, 9, 'Lexus IS - Red', 'Available', 38000),
    (17, 14, 9, 'Jeep Wrangler - Green', 'Sold', 34000),
    (18, 15, 9, 'Hyundai Santa Fe - Blue', 'Available', 29000),
    (19, 16, 1, 'Kia Sorento - White', 'Available', 32000),
    (20, 17, 1, 'Toyota Camry - Grey', 'Sold', 25000),
    (21, 17, 1, 'Ford Explorer - Blue', 'Sold', 33000),
    (22, 18, 1, 'Mazda CX-5 - Red', 'Maintenance', 28000),
    (23, 19, 9, 'GMC Yukon - Black', 'Available', 60000),
    (24, 20, 9, 'Chevrolet Tahoe - White', 'Sold', 55000),
    (25, 20, 9, 'Cadillac Escalade - Black', 'Available', 85000);
