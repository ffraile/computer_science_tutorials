CREATE DATABASE example_database;

USE example_database;

CREATE TABLE Customer (
	Vat_ID VARCHAR(10) UNIQUE,
    Address VARCHAR(100),
    Phone_Number VARCHAR(20),
    email VARCHAR(50),
    Contact_Name VARCHAR(50),
    
    PRIMARY KEY (Vat_ID)
);

CREATE TABLE Product (
	Product_Code VARCHAR(10) UNIQUE,
    Product_Name VARCHAR(100),
    Unitary_Price DECIMAL(10,3),
    
    PRIMARY KEY (Product_Code)
);

CREATE TABLE Payment (
	Payment_ID INT UNIQUE AUTO_INCREMENT,
    Payment_Type ENUM("Card", "Bank Transfer", "Cash"),
    Payment_Date TIMESTAMP,
    Customer_fk VARCHAR(10),
    Product_fk VARCHAR(10),
    Units INT,
    
    PRIMARY KEY (Payment_ID),
    CONSTRAINT Payment_Customer_fk FOREIGN KEY (Customer_fk) REFERENCES Customer(Vat_ID),
	CONSTRAINT Payment_Product_fk FOREIGN KEY (Product_fk) REFERENCES Product(Product_Code)
);

-- INSERT DUMMY DATA
INSERT INTO 
	Customer (Vat_ID, Address, Phone_Number, email, Contact_Name)
VALUES
("1234", "Elm Street 2", "(666) 49 47 50", "fkrugger@ymn.com", "Freddie Krueger"), 
("4789", "Marina de Empresas", "(555) 69 79 79", "tstark@edem.es", "Tony Startk"),
("1012", "Penn. Av. 1600", "(555) 58 89 90", "ridley@cognito.com", "Reagan Ridley");

INSERT INTO 
	Product (Product_Code, Product_Name, Unitary_Price)
VALUES
("AA0111", "Robotus", 90.7),
("AA0112", "Alpha-Beta", 100.3),
("AA0113", "JFK Clone", 50.2),
("AA0114", "Robo-Reagan", 90.7),
("BB0111", "Reptoid sensor", 10.2);

INSERT INTO 
	Payment (Payment_Type, Payment_Date, Customer_fk, Product_fk, Units)
VALUES
("Card", "2022-09-20 10:00", "1234", "AA0114", 1),
("Card", "2022-09-21 10:00", "4789", "AA0114", 1),
("Card", "2022-10-01 09:00", "4789", "BB0111", 10),
("Card", "2022-10-02 11:00", "1234", "AA0112", 1),
("Bank Transfer", "2022-10-03 13:00", "4789", "AA0113", 1),
("Card", "2022-10-04 11:00", "1234", "AA0112", 1),
("Card", "2022-10-07 17:00", "1012", "AA0114", 1),
("Card", "2022-10-09 19:00", "1234", "AA0111", 1);


