use Store;
INSERT INTO Store VALUES
(1, 'Central Market', '123 Main St', '08:00:00', '22:00:00', 'Franchise'),
(2, 'East Point', '456 East Ave', '09:00:00', '21:00:00', 'Corporate'),
(3, 'West Mall', '789 West Blvd', '10:00:00', '23:00:00', 'Franchise'),
(4, 'North Plaza', '321 North St', '08:30:00', '22:30:00', 'Corporate'),
(5, 'South Corner', '654 South Rd', '07:00:00', '23:00:00', 'Franchise'),
(6, 'City Center', '111 City Center', '09:00:00', '22:00:00', 'Corporate'),
(7, 'Harbor Side', '222 Harbor St', '10:00:00', '20:00:00', 'Franchise'),
(8, 'Airport Store', '333 Airport Rd', '06:00:00', '23:59:00', 'Corporate'),
(9, 'Parkview', '444 Park Ave', '07:30:00', '21:30:00', 'Franchise'),
(10, 'University Gate', '555 University Blvd', '08:00:00', '22:00:00', 'Corporate'),
(11, 'River Mall', '777 River Rd', '08:00:00', '22:00:00', 'Franchise'),
(12, 'Tech Square', '888 Tech Blvd', '09:00:00', '21:00:00', 'Corporate'),
(13, 'Grand Plaza', '999 Grand Ave', '07:00:00', '23:00:00', 'Franchise');

INSERT INTO Vendor VALUES
(1, 'Fresh Foods Inc.', '010-1000-0001', 'vendor1@fresh.com'),
(2, 'Beverage World', '010-1000-0002', 'vendor2@beverage.com'),
(3, 'Snack House', '010-1000-0003', 'vendor3@snack.com'),
(4, 'Daily Bakery', '010-1000-0004', 'vendor4@bakery.com'),
(5, 'Organic Farm', '010-1000-0005', 'vendor5@organic.com'),
(6, 'Coffee Master', '010-1000-0006', 'vendor6@coffee.com'),
(7, 'Frozen Goods', '010-1000-0007', 'vendor7@frozen.com'),
(8, 'Dairy Supplier', '010-1000-0008', 'vendor8@dairy.com'),
(9, 'Global Imports', '010-1000-0009', 'vendor9@import.com'),
(10, 'Health Drinks', '010-1000-0010', 'vendor10@health.com');

INSERT INTO Product VALUES
('000000000001', 'Coffee', 'Coffee Master', 'Bottle', '250ml', 3.50, 'Coffee', 6),
('000000000002', 'Latte', 'Coffee Master', 'Cup', '300ml', 4.00, 'Coffee', 6),
('000000000003', 'Cheese Sandwich', 'Fresh Foods', 'Pack', '200g', 5.50, 'Food', 1),
('000000000004', 'Ham Sandwich', 'Fresh Foods', 'Pack', '220g', 5.80, 'Food', 1),
('000000000005', 'Orange Juice', 'Beverage World', 'Bottle', '500ml', 3.00, 'Beverage', 2),
('000000000006', 'Apple Juice', 'Beverage World', 'Bottle', '500ml', 3.00, 'Beverage', 2),
('000000000007', 'Potato Chips', 'Snack House', 'Bag', '150g', 2.50, 'Snack', 3),
('000000000008', 'Chocolate Muffin', 'Daily Bakery', 'Box', '150g', 2.80, 'Bakery', 4),
('000000000009', 'Organic Milk', 'Dairy Supplier', 'Bottle', '1L', 3.20, 'Dairy', 8),
('000000000010', 'Frozen Pizza', 'Frozen Goods', 'Box', '450g', 7.00, 'Frozen', 7),
('000000000011', 'Cappuccino', 'Coffee Master', 'Cup', '250ml', 4.20, 'Coffee', 6),
('000000000012', 'Bagel', 'Daily Bakery', 'Pack', '150g', 3.00, 'Bakery', 4),
('000000000013', 'Yogurt', 'Dairy Supplier', 'Bottle', '200ml', 2.50, 'Dairy', 8),
('000000000014', 'Green Smoothie', 'Health Drinks', 'Bottle', '500ml', 4.00, 'Beverage', 10),
('000000000015', 'Strawberry Smoothie', 'Health Drinks', 'Bottle', '500ml', 4.20, 'Beverage', 10),
('000000000016', 'Blueberry Muffin', 'Daily Bakery', 'Box', '150g', 2.90, 'Bakery', 4),
('000000000017', 'Turkey Sandwich', 'Fresh Foods', 'Pack', '200g', 5.90, 'Food', 1),
('000000000018', 'Sparkling Water', 'Beverage World', 'Bottle', '500ml', 2.00, 'Beverage', 2),
('000000000019', 'Energy Drink', 'Health Drinks', 'Can', '250ml', 3.00, 'Beverage', 10),
('000000000020', 'Tofu Snack', 'Organic Farm', 'Pack', '150g', 3.50, 'Snack', 5),
('000000000021', 'Avocado Sandwich', 'Fresh Foods', 'Pack', '220g', 6.50, 'Food', 1),
('000000000022', 'Herbal Tea', 'Beverage World', 'Box', '20bags', 5.00, 'Beverage', 2);

-- Customer 테이블
INSERT INTO Customer VALUES
(1, 'Alice Johnson', '010-2000-0001', 'alice@email.com'),
(2, 'Bob Smith', '010-2000-0002', 'bob@email.com'),
(3, 'Charlie Brown', '010-2000-0003', 'charlie@email.com'),
(4, 'David Green', '010-2000-0004', 'david@email.com'),
(5, 'Emily White', '010-2000-0005', 'emily@email.com'),
(6, 'Frank Black', '010-2000-0006', 'frank@email.com'),
(7, 'Grace Lee', '010-2000-0007', 'grace@email.com'),
(8, 'Henry King', '010-2000-0008', 'henry@email.com'),
(9, 'Irene Scott', '010-2000-0009', 'irene@email.com'),
(10, 'Jack Young', '010-2000-0010', 'jack@email.com'),
(11, 'Kevin Adams', '010-2000-0011', 'kevin@email.com'),
(12, 'Linda Baker', '010-2000-0012', 'linda@email.com');

-- Membership 테이블
INSERT INTO Membership VALUES
(1, 'Gold', '2024-01-01', 10.00),
(2, 'Silver', '2024-02-01', 5.00),
(3, 'Gold', '2024-03-01', 10.00),
(4, 'Silver', '2024-03-15', 5.00),
(5, 'Gold', '2024-04-01', 10.00),
(6, 'Silver', '2024-04-10', 5.00),
(7, 'Gold', '2024-05-01', 10.00),
(8, 'Silver', '2024-05-10', 5.00),
(9, 'Gold', '2024-06-01', 10.00),
(10, 'Silver', '2024-06-10', 5.00),
(11, 'Gold', '2025-05-15', 10.00),
(12, 'Silver', '2025-05-20', 5.00);

-- Inventory 테이블 (임계치 아래로 일부 넣어둠)
INSERT INTO Inventory VALUES
(1, '000000000001', 2, 10, 20),
(1, '000000000002', 5, 10, 10),
(1, '000000000003', 4, 10, 10),
(1, '000000000004', 12, 10, 10),
(1, '000000000005', 2, 5, 10),
(1, '000000000006', 0, 5, 10),
(1, '000000000007', 3, 20, 20),
(1, '000000000008', 7, 5, 10),
(1, '000000000009', 3, 10, 15),
(1, '000000000010', 5, 5, 10),

(2, '000000000011', 3, 5, 10),
(2, '000000000012', 6, 5, 5),
(2, '000000000013', 2, 5, 10),
(2, '000000000014', 1, 5, 10),
(3, '000000000015', 0, 5, 5),
(3, '000000000016', 9, 5, 10),
(3, '000000000017', 5, 5, 5),
(3, '000000000018', 2, 5, 10),
(3, '000000000019', 3, 5, 10),
(3, '000000000020', 4, 5, 10),
(3, '000000000021', 7, 5, 10),
(3, '000000000022', 6, 5, 10);

-- SaleTransaction 테이블 (오늘 날짜 + 2026년 5월 데이터 포함)
INSERT INTO SaleTransaction VALUES
(1, '2025-05-01 10:00:00', 'CreditCard', 1, 1),
(2, '2025-05-01 11:00:00', 'Cash', 1, 2),
(3, '2025-05-01 12:30:00', 'MobilePayment', 2, 3),
(4, '2025-05-01 14:15:00', 'BankTransfer', 3, 4),
(5, '2025-05-01 09:00:00', 'CreditCard', 4, 5),
(6, '2025-05-01 16:20:00', 'Cash', 5, 6),
(7, '2025-05-01 08:45:00', 'MobilePayment', 6, 7),
(8, '2025-05-01 11:10:00', 'CreditCard', 7, 8),
(9, '2025-05-01 13:00:00', 'Cash', 8, 9),
(10, '2025-05-01 18:30:00', 'CreditCard', 9, 10),
(11, '2025-05-01 10:00:00', 'CreditCard', 10, 11),
(12, '2025-05-01 11:00:00', 'Cash', 11, 12),
(13, '2026-05-10 10:00:00', 'CreditCard', 1, 1),
(14, '2026-05-11 11:00:00', 'MobilePayment', 2, 3),
(15, '2026-05-12 12:00:00', 'Cash', 3, 5);



-- SaleDetail 테이블
INSERT INTO SaleDetail VALUES
(1, '000000000001', 2, 3.50, 10.00),
(2, '000000000002', 1, 4.00, 5.00),
(3, '000000000003', 3, 5.50, 0.00),
(4, '000000000004', 1, 5.80, 0.00),
(5, '000000000005', 5, 3.00, 0.00),
(6, '000000000006', 2, 3.00, 0.00),
(7, '000000000007', 2, 2.50, 0.00),
(8, '000000000008', 1, 2.80, 0.00),
(9, '000000000009', 1, 3.20, 0.00),
(10, '000000000010', 1, 7.00, 0.00),
(11, '000000000011', 3, 4.20, 0.00),
(12, '000000000012', 1, 3.00, 0.00),
(13, '000000000001', 1, 3.50, 10.00),  -- Coffee
(13, '000000000003', 2, 5.50, 0.00),  -- Cheese Sandwich (Food)
(13, '000000000007', 1, 2.50, 0.00),  -- Potato Chips

(14, '000000000001', 2, 3.50, 0.00),  -- Coffee
(14, '000000000005', 1, 3.00, 0.00),  -- Orange Juice
(14, '000000000008', 2, 2.80, 0.00),  -- Chocolate Muffin

(15, '000000000001', 1, 3.50, 0.00),  -- Coffee
(15, '000000000004', 1, 5.80, 0.00),  -- Ham Sandwich
(15, '000000000009', 1, 3.20, 0.00);  -- Organic Milk





