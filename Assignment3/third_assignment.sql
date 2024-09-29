/* CREATE DATABASE record_shop;
USE record_shop; 

-- created each table with three cosntraints  , not null for first name , last name , email and date joined and UNIQUE email to ensure there are no duplicates -- table also has three different data types int varchar and date
CREATE TABLE Customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL  UNIQUE,
phone_number VARCHAR(15),
address VARCHAR(255),
city VARCHAR(50),
postcode VARCHAR (10),
date_joined DATE NOT NULL
);

-- constraints artist_name not null and unique
CREATE TABLE Artists (
artist_id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(100) NOT NULL UNIQUE,
genre VARCHAR(50),
formed_in YEAR
);

-- constraints on  and not null and Unique on album_name, artist_id
CREATE TABLE Albums (
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(150) NOT NULL UNIQUE,
artist_id INT NOT NULL,
release_date DATE,
genre  VARCHAR(50),
label VARCHAR(100),
CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- constraints on  CHECK ensures quantity_in_stock is never negative and price greater than zero
CREATE TABLE Inventory (
inventory_id INT PRIMARY KEY AUTO_INCREMENT,
album_id INT NOT NULL,
quantity_in_stock INT NOT NULL CHECK (quantity_in_stock >=0),
price DECIMAL (10,2) NOT NULL CHECK (price > 0),
CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

-- constraints on references to customers table and not null , also checked to ensure amount is not negative and payment satus is defined
CREATE TABLE Orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
payment_status VARCHAR(50) NOT NULL CHECK(payment_status IN('Paid', 'Pending', 'Cancelled')),
CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);
-- constraints NOT NULL and CHECK
CREATE TABLE Order_items (
order_item_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT NOT NULL,
album_id INT NOT NULL,
quantity INT NOT NULL CHECK(quantity > 0),
price_per_unit DECIMAL(10,2) NOT NULL CHECK (price_per_unit > 0),
shipping_date DATE,
CONSTRAINT fk_order FOREIGN KEY(order_id) REFERENCES Orders(order_id),
CONSTRAINT fk_album_order FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

INSERT INTO Customers (first_name, last_name, email, phone_number, address, city,  postcode, date_joined)
VALUES
('John', 'Doe', 'john.doe@gmail.com', '0778-456-7890', '123 Oxford Street', 'London', 'W1D 1BS', '2023-01-15'),
('Jane', 'Smith', 'jane.smith@gmail.com', '0758-567-8901', '50 High Street', 'Manchester', 'M1 4AB', '2022-12-05'),
('Robert', 'Johnson', 'robert.j@gmail.com', '0778-678-9012', '77 Park Lane', 'Birmingham', 'B1 2HQ', '2021-11-23'),
('Emily', 'Davis', 'emily.d@gmail.com', '0748-789-0123', '10 Kings Road', 'Bristol', 'BS1 5JD', '2020-09-10'),
('Michael', 'Brown', 'michael.b@gmail.com', '0788-890-1234', '34 Green Street', 'Leeds', 'LS1 2DE', '2019-08-17'),
('Linda', 'Garcia', 'linda.g@gmail.com', '0738-901-2345', '22 Victoria Avenue', 'Glasgow', 'G1 3PQ', '2021-02-13'),
('William', 'Martinez', 'william.m@gmail.com', '0789-012-3456', '99 Regent Street', 'Edinburgh', 'EH2 4AH', '2022-07-19'),
('Jessica', 'Wilson', 'jessica.w@gmail.com', '0790-123-4567', '7 North Road', 'Cardiff', 'CF10 3EG', '2023-04-01'),
('David', 'Anderson', 'david.a@gmail.com', '0701-234-5678', '17 Castle Hill', 'Newcastle', 'NE1 2BQ', '2021-06-25'),
('Sarah', 'Taylor', 'sarah.t@gmail.com', '0712-345-6789', '5 Rose Lane', 'Liverpool', 'L1 9AB', '2020-12-12');


INSERT INTO Artists (artist_name, genre, formed_in)
VALUES
('The Beatles', 'Rock', 1960),
('Pink Floyd', 'Progressive Rock', 1965),
('Led Zeppelin', 'Hard Rock', 1968),
('Queen', 'Rock', 1970),
('The Rolling Stones', 'Rock', 1962),
('Metallica', 'Heavy Metal', 1981),
('Radiohead', 'Alternative Rock', 1985),
('Coldplay', 'Alternative Rock', 1996),
('Nirvana', 'Grunge', 1987),
('The Clash', 'Punk Rock', 1976);

-- the artist_id refers to the corresponding artist in the Artists table and the genre and label desribe the specific album
INSERT INTO Albums (album_name, artist_id, release_date, genre, label)
VALUES
('Abbey Road', 1, '1969-09-26', 'Rock', 'Apple Records'),
('The Dark Side of the Moon', 2, '1973-03-01', 'Progressive Rock', 'Harvest Records'),
('Led Zeppelin IV', 3, '1971-11-08', 'Hard Rock', 'Atlantic Records'),
('A Night at the Opera', 4, '1975-11-21', 'Rock', 'EMI Records'),
('Let It Bleed', 5, '1969-12-05', 'Rock', 'Decca Records'),
('Master of Puppets', 6, '1986-03-03', 'Heavy Metal', 'Elektra Records'),
('OK Computer', 7, '1997-05-21', 'Alternative Rock', 'Parlophone'),
('A Rush of Blood to the Head', 8, '2002-08-26', 'Alternative Rock', 'Parlophone'),
('Nevermind', 9, '1991-09-24', 'Grunge', 'DGC Records'),
('London Calling', 10, '1979-12-14', 'Punk Rock', 'CBS Records');


INSERT INTO Inventory (album_id, quantity_in_stock, price)
VALUES
(1, 50, 15.99),
(2, 30, 19.99),
(3, 40, 17.99),
(4, 25, 21.50),
(5, 35, 14.99),
(6, 60, 18.50),
(7, 45, 22.99),
(8, 20, 16.75),
(9, 55, 13.99),
(10, 15, 20.00);


INSERT INTO Orders (customer_id, order_date, total_amount, payment_status)
VALUES
(1, '2023-01-20', 150.00, 'Paid'),
(2, '2023-02-10', 200.50, 'Pending'),
(3, '2023-03-05', 75.99, 'Cancelled'),
(4, '2023-01-15', 120.00, 'Paid'),
(5, '2023-04-12', 99.99, 'Paid'),
(6, '2023-02-28', 180.00, 'Pending'),
(7, '2023-03-19', 50.75, 'Cancelled'),
(8, '2023-04-03', 210.00, 'Paid'),
(9, '2023-01-30', 130.50, 'Paid'),
(10, '2023-05-22', 89.99, 'Pending');


INSERT INTO Order_items (order_id, album_id, quantity, price_per_unit, shipping_date)
VALUES
(1, 1, 2, 15.99, '2023-01-21'),
(2, 2, 1, 19.99, '2023-02-12'),
(3, 3, 1, 17.99, NULL),
(4, 4, 4, 21.50, '2023-01-16'),
(5, 5, 5,  14.99, '2023-04-13'),
(6, 6, 3,  18.50, '2023-03-01'),
(7, 7, 1,  22.99, NULL),
(8, 8, 8,  16.75, '2023-04-05'),
(9, 9, 9,  13.99, '2023-01-31'),
(10, 10, 10, 20.00, '2023-05-24');




-- query to retrieve the data form the Artists table - all abums and their genres
SELECT artist_name, genre, formed_in
FROM Artists;


-- query for retrieving all order items for a specific order
SELECT OI.order_item_id, OI.quantity, OI.price_per_unit, A.album_name
FROM Order_items OI
JOIN Albums A ON OI.album_id = A.album_id
WHERE OI.order_id = 1
ORDER BY A.album_name ASC;

-- query to retrieve the stock levels and price for each album in the Inventory table

SELECT I.album_id, A.album_name, I.quantity_in_stock, I.price
FROM Inventory I
JOIN Albums A ON I.album_id = A.album_id
ORDER BY I.quantity_in_stock DESC;


-- Scenario: a new customers sends an e-mail to the record shop asking for a Nirvana album called 'Orange and Blue'. step 1
-- He states he loves grunge and that would like to see what other albums under this genre we have in stock, as he is getting ready to make a playlist for a party : step 2
-- Part of the shop retention policy is to offer a 5% discount for new members that join our newsletter : step 3
-- To increase sales, store has decided to offer  a 30£ voucher for purchases that are over 100£: step 4

-- step 1 : add the new customer details in the customer table, even if he has not placed an order yet and enquiry was via email 

INSERT INTO customers (first_name, last_name, email, date_joined)
VALUES ('Jack', 'Button', 'jackyb@gmail.com', CURDATE());


           --  does the record shop has in it's inventory the Nirvana album called 'Orange and Blue'
           SELECT * 
           FROM Albums 
           WHERE album_name 
           IN('Orange and Blue');
           
-- step 2: find what genre is Nirvana band and find similar records in the shop to offer - as the album required is not in stock
 SELECT * 
FROM artists
where genre = 'grunge' ;
    -- step 3:  once we have identified the artist we can query to display quantity in stock and price sorted by the price quantity . Will add a 5 % discount to this
SELECT I.album_id, A.album_name, I.quantity_in_stock, I.price,
       ROUND(I.price * 0.95, 2) AS discounted_price
FROM Inventory I
JOIN Albums A ON I.album_id = A.album_id
JOIN Artists AR ON A.artist_id = AR.artist_id
WHERE AR.artist_name = 'Nirvana'
ORDER BY I.quantity_in_stock DESC;
      

 */

-- step 4:   find out how many customers have paid more than 100£ and using distinct to ensure that even if a customer has placed multiple orders they will appear only once in the result
                  -- query to list e-mails of the customers who spent more than 100, sorted by their order totals in descending order, so they can be sent a 30£ voucher
                    --  in this one I have added those withouth orders as they will appear as NULL
                    -- the results will be sent to the marketing team and they will send e-mails with the vouchers
/*
SELECT DISTINCT c.first_name, c.email, o.total_amount
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.total_amount >100 OR o.total_amount IS NULL
ORDER BY o.total_amount DESC;



-- Now for marketing purposes, the shop will find out the name and price of the album with the highest price in the inventory, and the artist associated with
-- using MAX as aggregate function
SELECT ar.artist_name, A.album_name, I.price
FROM Albums A
JOIN Inventory I ON A.album_id = I.album_id
LEFT JOIN artists ar
ON a.artist_id = Ar.artist_id 
WHERE I.price = (SELECT MAX(price) FROM Inventory);

-- the name and stock quantity of the album with the highest number of items in stock.
SELECT A.album_name, I.quantity_in_stock
FROM Albums A
JOIN Inventory I ON A.album_id = I.album_id
WHERE I.quantity_in_stock = (SELECT MAX(quantity_in_stock) FROM Inventory);

--to find the earliest release date of any of the album:
SELECT MIN(A.release_date) AS earliest_release
FROM Albums A;

-- album with the lowest quantity in stock return the album name and the minimum quantity in stock for that album.

SELECT A.album_name, I.quantity_in_stock
FROM Albums A
JOIN Inventory I ON A.album_id = I.album_id
WHERE I.quantity_in_stock = (SELECT MIN(quantity_in_stock) FROM Inventory);



-- additional built in function
-- I will categorise the orders based on their values by oder-id
SELECT order_id,
  CASE 
    WHEN total_amount > 100 THEN 'High' 
    WHEN total_amount > 50 THEN 'Medium' 
    ELSE 'Low' 
  END AS order_category
FROM Orders
ORDER BY order_category ASC;


-- another built in function using CASE to categorise the orders by total amount and defining them as high medium and low

SELECT order_id,
  CASE 
    WHEN total_amount > 100 THEN 'High' 
    WHEN total_amount > 50 THEN 'Medium' 
    ELSE 'Low' 
  END AS order_category
FROM Orders
ORDER BY order_category ASC;

-- create and use one stored procedures or function to achieve a goal
-- this procedure inserts a new order into the order table
DELIMITER //

CREATE PROCEDURE AddNewOrder(
    IN p_customer_id INT,
    IN p_total_amount DECIMAL(10, 2),
    IN p_payment_status VARCHAR(50)
)
BEGIN
    INSERT INTO Orders (customer_id, order_date, total_amount, payment_status)
    VALUES (p_customer_id, CURDATE(), p_total_amount, p_payment_status);
END //

DELIMITER ;
-- calling the stored procedure
CALL AddNewOrder(1, 150.00, 'Paid');

SELECT * FROM Orders WHERE customer_id = 1; -- checking this has updater the orders table for customer id 1 order

-- or we could use count to find customers that have placed more than one order
SELECT customer_id, COUNT(*) AS order_count
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- or the same example with in count

SELECT customer_id, COUNT(*) AS order_count
FROM Orders
WHERE customer_id IN (1, 2, 3, 4)  -- List of specific customer IDs
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- however because this customer has decided to cancel this order so we would need to update table
-- i chose to delete this by date as this was the latest order
-- used max(order_date) to identify it 

DELETE FROM Orders
WHERE order_id = (
  SELECT order_id FROM (
    SELECT order_id FROM Orders WHERE order_date = (SELECT MAX(order_date) FROM Orders)
  ) AS latest_order_date
);
*/