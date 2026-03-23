-- =========================
-- DIMENSION TABLES
-- =========================

-- 1. DATE DIMENSION
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    year INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL
);

INSERT INTO dim_date VALUES
(20230101, '2023-01-01', 2023, 1, 1),
(20230105, '2023-01-05', 2023, 1, 5),
(20230110, '2023-01-10', 2023, 1, 10),
(20230201, '2023-02-01', 2023, 2, 1),
(20230210, '2023-02-10', 2023, 2, 10);


-- 2. STORE DIMENSION
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

INSERT INTO dim_store VALUES
(1, 'Mumbai Store', 'Mumbai', 'West'),
(2, 'Delhi Store', 'Delhi', 'North'),
(3, 'Bangalore Store', 'Bangalore', 'South'),
(4, 'Chennai Store', 'Chennai', 'South'),
(5, 'Hyderabad Store', 'Hyderabad', 'South');


-- 3. PRODUCT DIMENSION
CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Cleaned: category standardized (Title Case)
INSERT INTO dim_product VALUES
('P001', 'Laptop', 'Electronics'),
('P002', 'Mouse', 'Electronics'),
('P003', 'Desk Chair', 'Furniture'),
('P004', 'Notebook', 'Stationery'),
('P005', 'Headphones', 'Electronics');


-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- INSERT CLEANED FACT DATA
-- =========================
-- Cleaning applied:
--  Dates standardized to YYYY-MM-DD
--  NULLs avoided
--  Category casing fixed in dim_product

INSERT INTO fact_sales (date_id, store_id, product_id, quantity, total_amount) VALUES
(20230101, 1, 'P001', 2, 110000),
(20230105, 2, 'P002', 5, 4000),
(20230110, 3, 'P003', 1, 8500),
(20230201, 4, 'P004', 10, 1200),
(20230210, 5, 'P005', 3, 9600),
(20230101, 2, 'P001', 1, 55000),
(20230105, 3, 'P002', 2, 1600),
(20230110, 4, 'P003', 2, 17000),
(20230201, 5, 'P004', 5, 600),
(20230210, 1, 'P005', 4, 12800);
