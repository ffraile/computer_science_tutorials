# First let´s create the database
CREATE DATABASE tradetrainer;

# Use the database we just created
USE tradetrainer;

# Create a table for the meta markets
CREATE TABLE meta_markets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  acronym VARCHAR(255) NOT NULL
);

# Create a table for the stocks, each stock is selled in a market.
CREATE TABLE meta_stocks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  acronym VARCHAR(255) NOT NULL,
  market_id INT NOT NULL,
  FOREIGN KEY (market_id) REFERENCES meta_markets(id)
);

# Create a table for the users, users can operate in any stock
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

# Create a table to store the records
CREATE TABLE meta_records (
  id INT AUTO_INCREMENT PRIMARY KEY,
  timestamp DATETIME NOT NULL,
  selling_price DECIMAL(10,2) NOT NULL,
  meta_stock_id INT NOT NULL,
  buyer_id INT NOT NULL,
  seller_id INT NOT NULL,
  FOREIGN KEY (meta_stock_id) REFERENCES meta_stocks(id),
  FOREIGN KEY (buyer_id) REFERENCES users(id),
  FOREIGN KEY (seller_id) REFERENCES users(id)
);

## Insert into meta_markets
INSERT INTO meta_markets (name, acronym) VALUES
('New York Stock Exchange', 'NYSE'),
('NASDAQ', 'NASDAQ'),
('London Stock Exchange', 'LSE'),
('Tokyo Stock Exchange', 'TSE'),
('Shanghai Stock Exchange', 'SSE');

## Insert into meta_stocks
INSERT INTO meta_stocks (name, acronym, market_id) VALUES
('Stark Industries', 'STARK', 1),  -- Assuming NYSE has id 1
('Oscorp Industries', 'OSCORP', 1),  -- Assuming NYSE has id 1
('Pym Technologies', 'PYM', 2),  -- Assuming NASDAQ has id 2
('Rand Enterprises', 'RAND', 2),  -- Assuming NASDAQ has id 2
('Roxxon Energy Corporation', 'ROXXON', 3),  -- Assuming LSE has id 3
('Trask Industries', 'TRASK', 3),  -- Assuming LSE has id 3
('Frost International', 'FROST', 4),  -- Assuming TSE has id 4
('Parker Industries', 'PARKER', 4),  -- Assuming TSE has id 4
('Xavier Institute', 'XAVIER', 5),  -- Assuming SSE has id 5
('Damage Control Inc.', 'DAMAGE', 5);  -- Assuming SSE has id 5

## Insert into users
INSERT INTO users (username, email) VALUES
('MJ_Watson', 'mj_watsup@example.com'),
('Peter_Parker', 'pete_parker@example.com'),
('Ned_Leeds', 'guy_in_the_chair.brown@example.com'),
('Liz_Toomes', 'liz_toomes@example.com');


## Insert into records
INSERT INTO meta_records (timestamp, selling_price, meta_stock_id, buyer_id, seller_id) VALUES
('2023-01-15 09:30:00', 150.00, 1, 1, 2),
('2023-01-15 09:31:00', 155.00, 1, 3, 4),
('2023-01-15 09:32:00', 152.00, 1, 2, 1),
('2023-01-15 09:33:00', 158.00, 1, 4, 3),
('2023-01-15 09:34:00', 160.00, 1, 1, 2),
('2023-01-15 09:35:00', 162.00, 1, 3, 4),
('2023-01-15 09:36:00', 164.00, 2, 2, 1),
('2023-01-15 09:37:00', 166.00, 2, 4, 3),
('2023-01-15 09:38:00', 168.00, 2, 1, 2),
('2023-01-15 09:39:00', 170.00, 2, 3, 4),
('2023-01-15 09:40:00', 172.00, 2, 2, 1),
('2023-01-15 09:41:00', 174.00, 2, 4, 3),
('2023-01-15 09:42:00', 176.00, 3, 1, 2),
('2023-01-15 09:43:00', 178.00, 3, 3, 4),
('2023-01-15 09:44:00', 180.00, 3, 2, 1),
('2023-01-15 09:45:00', 182.00, 3, 4, 3),
('2023-01-15 09:46:00', 184.00, 3, 1, 2),
('2023-01-15 09:47:00', 186.00, 3, 3, 4),
('2023-01-15 09:48:00', 188.00, 4, 2, 1),
('2023-01-15 09:49:00', 190.00, 4, 4, 3),
('2023-01-15 09:50:00', 192.00, 4, 1, 2),
('2023-01-15 09:51:00', 194.00, 4, 3, 4),
('2023-01-15 09:52:00', 196.00, 4, 2, 1),
('2023-01-15 09:53:00', 198.00, 4, 4, 3),
('2023-01-15 09:54:00', 200.00, 5, 1, 2),
('2023-01-15 09:55:00', 202.00, 5, 3, 4),
('2023-01-15 09:56:00', 204.00, 5, 2, 1),
('2023-01-15 09:57:00', 206.00, 5, 4, 3),
('2023-01-15 09:58:00', 208.00, 5, 1, 2),
('2023-01-15 09:59:00', 210.00, 5, 3, 4),
('2023-01-15 10:00:00', 212.00, 6, 2, 1),
('2023-01-15 10:01:00', 214.00, 6, 4, 3),
('2023-01-15 10:02:00', 216.00, 6, 1, 2),
('2023-01-15 10:03:00', 218.00, 6, 3, 4),
('2023-01-15 10:04:00', 220.00, 6, 2, 1),
('2023-01-15 10:05:00', 222.00, 6, 4, 3),
('2023-01-15 10:06:00', 224.00, 7, 1, 2),
('2023-01-15 10:07:00', 226.00, 7, 3, 4),
('2023-01-15 10:08:00', 228.00, 7, 2, 1),
('2023-01-15 10:09:00', 230.00, 7, 4, 3),
('2023-01-15 10:10:00', 232.00, 7, 1, 2),
('2023-01-15 10:11:00', 234.00, 7, 3, 4),
('2023-01-15 10:12:00', 236.00, 8, 2, 1),
('2023-01-15 10:13:00', 238.00, 8, 4, 3),
('2023-01-15 10:14:00', 240.00, 8, 1, 2),
('2023-01-15 10:15:00', 242.00, 8, 3, 4),
('2023-01-15 10:16:00', 244.00, 8, 2, 1),
('2023-01-15 10:17:00', 246.00, 9, 4, 3),
('2023-01-15 10:18:00', 248.00, 9, 1, 2),
('2023-01-15 10:19:00', 250.00, 9, 3, 4);
