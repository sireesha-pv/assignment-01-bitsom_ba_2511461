-- =========================
-- 1. CUSTOMERS TABLE
-- =========================
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

-- =========================
-- 2. PRODUCTS TABLE
-- =========================
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products VALUES
('P001', 'Laptop', 'Electronics', 55000),
('P002', 'Mouse', 'Electronics', 800),
('P003', 'Desk Chair', 'Furniture', 8500),
('P004', 'Notebook', 'Stationery', 120),
('P005', 'Headphones', 'Electronics', 3200);

-- =========================
-- 3. OFFICES TABLE
-- =========================
CREATE TABLE Offices (
    office_id INT PRIMARY KEY AUTO_INCREMENT,
    office_address VARCHAR(255) NOT NULL
);

INSERT INTO Offices (office_address) VALUES
('Mumbai HQ, Nariman Point, Mumbai - 400021'),
('Delhi Office, Connaught Place, New Delhi - 110001'),
('South Zone, MG Road, Bangalore - 560001'),
('Mumbai HQ, Nariman Pt, Mumbai - 400021'),
('South Zone, MG Road, Bangalore');

-- =========================
-- 4. SALES REPS TABLE
-- =========================
CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_id INT,
    FOREIGN KEY (office_id) REFERENCES Offices(office_id)
);

INSERT INTO Sales_Reps VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 1),
('SR02', 'Anita Desai', 'anita@corp.com', 2),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 3),
('SR04', 'Temp Rep1', 'temp1@corp.com', 4),
('SR05', 'Temp Rep2', 'temp2@corp.com', 5);

-- =========================
-- 5. ORDERS TABLE
-- =========================
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

INSERT INTO Orders VALUES
('ORD1001', 'C001', 'SR01', '2023-01-11'),
('ORD1002', 'C002', 'SR02', '2023-02-19'),
('ORD1003', 'C003', 'SR03', '2023-03-15'),
('ORD1004', 'C004', 'SR01', '2023-04-10'),
('ORD1005', 'C005', 'SR02', '2023-05-20');

-- =========================
-- 6. ORDER ITEMS TABLE
-- =========================
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
('ORD1001', 'P001', 2),
('ORD1001', 'P002', 3),
('ORD1002', 'P003', 1),
('ORD1003', 'P004', 5),
('ORD1004', 'P005', 2);
