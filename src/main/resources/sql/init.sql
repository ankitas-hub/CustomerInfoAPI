CREATE DATABASE IF NOT EXISTS customerdb;
USE customerdb;

CREATE TABLE IF NOT EXISTS customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20)
);

INSERT INTO customers (customer_id, name, email, phone) VALUES
(101, 'John Doe', 'john.doe@gmail.com', '9876543210'),
(102, 'Ankita Dutta', 'ankita.dutta@gmail.com', '9876501234'),
(103, 'Riya Sen', 'riya.sen@gmail.com', '9876523456')
ON DUPLICATE KEY UPDATE name=VALUES(name);
