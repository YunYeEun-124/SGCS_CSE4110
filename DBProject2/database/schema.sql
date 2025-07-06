use store;
-- Store 테이블
CREATE TABLE Store (
    store_id INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(200),
    open_time TIME,
    close_time TIME,
    ownership_type ENUM('Franchise', 'Corporate')
);

-- Vendor 테이블
CREATE TABLE Vendor (
    vendor_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

-- Product 테이블
CREATE TABLE Product (
    upc CHAR(12) PRIMARY KEY,
    name VARCHAR(50),
    brand VARCHAR(50),
    package_type VARCHAR(50),
    size VARCHAR(50), 
    price DECIMAL(10,2),
    category VARCHAR(50),
    vendor_id INT,
    FOREIGN KEY (vendor_id) REFERENCES Vendor(vendor_id)
        ON DELETE SET NULL
);

-- Inventory 테이블
CREATE TABLE Inventory (
    store_id INT,
    upc CHAR(12),
    quantity INT,
    reorder_threshold INT,
    reorder_amount INT,
    PRIMARY KEY (store_id, upc),
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
        ON DELETE CASCADE,
    FOREIGN KEY (upc) REFERENCES Product(upc)
        ON DELETE CASCADE
);

-- Customer 테이블
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

-- Membership 테이블
CREATE TABLE Membership (
    customer_id INT PRIMARY KEY,
    level ENUM('Silver', 'Gold'),
    join_date DATE,
    discount_rate DECIMAL(5,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE CASCADE
);

-- SaleTransaction 테이블
CREATE TABLE SaleTransaction (
    saleTransaction_id INT PRIMARY KEY,
    transaction_time DATETIME,
    payment_method ENUM('BankTransfer','Cash','CreditCard','MobilePayment'),
    store_id INT,
    customer_id INT,
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
        ON DELETE SET NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE SET NULL
);

-- SaleDetail 테이블
CREATE TABLE SaleDetail (
    saleTransaction_id INT,
    upc CHAR(12),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_rate DECIMAL(5,2),
    PRIMARY KEY (saleTransaction_id, upc),
    FOREIGN KEY (saleTransaction_id) REFERENCES SaleTransaction(saleTransaction_id)
        ON DELETE CASCADE,
    FOREIGN KEY (upc) REFERENCES Product(upc)
      ON DELETE RESTRICT 
);

CREATE INDEX idx_transaction_time ON SaleTransaction(transaction_time);
CREATE INDEX idx_product_vendor ON Product(vendor_id);
CREATE INDEX idx_store_ownership ON Store(ownership_type);
