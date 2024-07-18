create database BAKERYMANAGEMENTSYSTEM;
USE BAKERYMANAGEMENTSYSTEM;

-- table for customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255)
);
-- Inserting values into the customers table
INSERT INTO customers (customer_name, phone_number, email, address)
VALUES 
    ('Kaneez Zehra', '123-456-7890', 'kaneez@example.com', '123 Main St'),
    ('Ansa Anwaar', '456-789-0123', 'ansa@example.com', '456 Main St'),
    ('Zehra Ali', '789-012-3456', 'zehraa@example.com', '789 Main St');
    CREATE TABLE itemcategory (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10, 2) NOT NULL
);
INSERT INTO employee (name, dob, email, salary)
VALUES 
    ('Ali Rahman', '1980-04-15', 'ali.rahman@example.com', 60000),
    ('Sara Hussain', '1985-07-20', 'sara.hussain@example.com', 55000),
    ('Yusuf Malik', '1983-09-10', 'yusuf.malik@example.com', 62000),
    ('Aisha Ahmed', '1982-02-28', 'aisha.ahmed@example.com', 58000),
    ('Hassan Khan', '1986-11-05', 'hassan.khan@example.com', 59000),
    ('Fatima Ali', '1984-06-12', 'fatima.ali@example.com', 63000),
    ('Ahmed Malik', '1987-04-25', 'ahmed.malik@example.com', 57000),
    ('Zainab Rahman', '1981-10-15', 'zainab.rahman@example.com', 64000),
    ('Hamza Hussain', '1988-03-08', 'hamza.hussain@example.com', 56000),
    ('Mariam Khan', '1989-12-30', 'mariam.khan@example.com', 61000);


    -- Inserting values into the itemcategory table
INSERT INTO itemcategory (category_name)
VALUES 
    ('Bread'),
    ('Cakes'),
    ('Pastries'),
    ('Cookies');
-- table for items
CREATE TABLE items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES itemcategory(category_id)
);
-- Inserting values into the items table
INSERT INTO items (item_name, price, stock_quantity, category_id)
VALUES 
    ('Chocolate Cake', 2000, 50, 2),
    ('Croissant', 500, 75, 3),
    ('Chocolate Chip Cookies', 1500, 200, 4),
    ('Red Velvet Cake', 5000, 30, 2),
    ('Chocolate Fudge Cake', 3000, 100, 3);



-- table for orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Inserting values into the orders table
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES 
    (1, '2024-05-25', 5000),
    (2, '2024-05-25', 4000),
    (3, '2024-05-24', 8000),
    (1, '2024-05-24', 9000),
    (2, '2024-05-23', 7000);
-- table for contact
CREATE TABLE contact (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    message TEXT
);
-- Inserting values into the contact table
INSERT INTO contact (name, email, message)
VALUES 
    ('Zehra', 'Zehra@example.com', 'any discount?'),
    ('Fatima', 'Fatima@example.com', 'any discount?'),
    ('Hassan', 'hassan@example.com', 'any discount?');
    
    DELIMITER //

CREATE PROCEDURE InsertCustomer(
    IN customer_name VARCHAR(100),
    IN phone_number VARCHAR(20),
    IN email VARCHAR(100),
    IN address VARCHAR(255)
)
BEGIN
    INSERT INTO customers (customer_name, phone_number, email, address)
    VALUES (customer_name, phone_number, email, address);
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION CalculateTotalPrice(
    item_price DECIMAL(10, 2),
    quantity INT
)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SET total = item_price * quantity;
    RETURN total;
END //

DELIMITER ;

ALTER TABLE items 
ADD COLUMN total_investment DECIMAL(10, 2) AFTER price;

select * from customers;
INSERT INTO customers (customer_name, phone_number, email, address)
VALUES 
    ('Aisha Rahman', '111-222-3333', 'aisha.rahman@example.com', '1st Street'),
    ('Mohammad Khan', '222-333-4444', 'mohammad.khan@example.com', '2nd Street'),
    ('Zainab Ali', '333-444-5555', 'zainab.ali@example.com', '3rd Street'),
    ('Hamza Ahmed', '444-555-6666', 'hamza.ahmed@example.com', '4th Street'),
    ('Sara Hussain', '555-666-7777', 'sara.hussain@example.com', '5th Street'),
    ('Yusuf Malik', '666-777-8888', 'yusuf.malik@example.com', '6th Street'),
    ('Mariam Khan', '777-888-9999', 'mariam.khan@example.com', '7th Street'),
    ('Ibrahim Rahman', '888-999-0000', 'ibrahim.rahman@example.com', '8th Street'),
    ('Ayesha Ali', '999-000-1111', 'ayesha.ali@example.com', '9th Street'),
    ('Hassan Ahmed', '000-111-2222', 'hassan.ahmed@example.com', '10th Street'),
    ('Khadija Malik', '111-222-3333', 'khadija.malik@example.com', '11th Street'),
    ('Ahmed Hussain', '222-333-4444', 'ahmed.hussain@example.com', '12th Street'),
    ('Fatima Ali', '333-444-5555', 'fatima.ali@example.com', '13th Street'),
    ('Ali Rahman', '444-555-6666', 'ali.rahman@example.com', '14th Street'),
    ('Zara Khan', '555-666-7777', 'zara.khan@example.com', '15th Street');




