SHOW DATABASES;

CREATE DATABASE techcorp;

USE techcorp;

SHOW TABLES FROM techcorp;

CREATE TABLE Products (
	product_id INT auto_increment primary key,
	product_name VARCHAR(100) not null,
	category VARCHAR(50),
	price DECIMAL(10,2),
	stock_quantity INT
);

SELECT * FROM Products;

CREATE TABLE Customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE,
	phone VARCHAR(20),
	address VARCHAR(200)
);

SELECT * FROM customers;

CREATE TABLE Orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	order_date DATE,
	total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

SELECT * FROM orders;

CREATE TABLE OrderDetails (
	order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
	order_id INT,
	product_id INT,
	quantity INT,
	unit_price DECIMAL(10,2),
	FOREIGN KEY (order_id) REFERENCES Orders(Order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

SELECT * FROM OrderDetails;

CREATE TABLE Employees (
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    hire_date DATE,
    department VARCHAR(50)
);

SELECT * FROM employees;

CREATE TABLE SupportTickets (
	ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    issue TEXT,
    status VARCHAR(20),
    created_at DATETIME,
    resolved_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

SELECT * FROM SupportTickets;

-- Menambahkan kolom 
SELECT * FROM products;
ALTER TABLE Products ADD COLUMN discount DECIMAL(5,2) DEFAULT 0;

-- Mengganti tipe data kolom
ALTER TABLE employees MODIFY last_name VARCHAR(50);
