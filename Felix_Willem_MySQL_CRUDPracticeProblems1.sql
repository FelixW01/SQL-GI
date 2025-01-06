-- Felix WIllem GI SQL-CRUD Week 14

USE crud;
SHOW TABLES;

-- Insert a New Transaction:

INSERT INTO user_customer_info (username, email, password, firstName, lastName, userType, amountSpent)
VALUES ('felix_willem', 'felixwillem@yahoo.com', 'password', 'Felix', 'Willem', 'premium', 999.9)

-- Retrieve All Transactions:

SELECT * 
FROM user_customer_info;

-- Update the Subscription Type of Customer 'Alice Smith' to 'premium'
-- There was no Alice Smith in the DB so I inserted one for the sake of the exercise <--- NOTES
INSERT INTO user_customer_info (username, email, password, firstName, lastName, userType, amountSpent)
VALUES ('alice_smith', 'alice@yahoo.com', 'password', 'Alice', 'Smith', 'regular', 500.5);

UPDATE user_customer_info
SET userType = 'premium'
WHERE username = 'alice_smith';

-- Delete: Delete Transactions with Amount Less Than $100:

DELETE FROM user_customer_info
WHERE amountSpent < 100;

-- Insert a New Customer with Transaction:

INSERT INTO user_customer_info (username, email, password, firstName, lastName, userType, amountSpent)
VALUES ('janaya_rock', 'janaya@yahoo.com', 'password', 'Janaya', 'Rock', 'premium', 299.9)

-- Update: Update the Amount of Transaction Made by Customer 'Alice Smith' to $500:

UPDATE user_customer_info
SET amountSpent = 500
WHERE username = 'alice_smith';

-- Delete Transactions Made by Customer 'John Doe':

DELETE FROM user_customer_info
WHERE username = 'john_doe';

-- Insert a New Transaction with a Different Email

INSERT INTO user_customer_info (username, email, password, firstName, lastName, userType, amountSpent)
VALUES ('Bill_nye', 'science@email.com', 'password', 'Bill', 'Nye', 'premium', 3489.9);

-- Retrieve Transactions with Amount Greater Than $200:

SELECT *
FROM user_customer_info
WHERE amountSpent > 200;

-- Update the Email of Customer 'Alice' to 'THEalicesmith@gmail.com':

UPDATE user_customer_info
SET email = 'THEalicesmith@gmail.com'
WHERE username = 'alice_smith';

-- Change the Amount of Transactions Made on '2022-03-10' to $300:
-- Inserted Dates to DB by using a new auto increment id column <--- NOTES
ALTER TABLE user_customer_info ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
SET @start_date = '2022-03-01';
-- Add transaction_date column with the type of DATE  <--- NOTES
ALTER TABLE user_customer_info
ADD COLUMN transaction_date DATE;
-- Start date is '2022-03-01', id - 1 denotes how many numbers to add to the start date,1 <--- NOTES
UPDATE user_customer_info
-- Example first person would have 2022-03-01 since id of 1 - 1 is 0, nothing is added to the start date <--- NOTES
SET transaction_date = DATE_ADD(@start_date, INTERVAL id - 1 DAY);

-- This is the actual logic to update amountSpent based on the transaction date <--- ANSWER, NOTES
UPDATE user_customer_info
SET amountSpent = 300
WHERE transaction_date = '2022-03-10';

-- Delete Transactions Made by Customer 'Ella Johnson':
-- There was no Ella Johnson in the DB so I inserted one for the sake of the exercise <--- NOTES
INSERT INTO user_customer_info (username, email, password, firstName, lastName, userType, amountSpent)
VALUES ('ella_johnson', 'ella@email.com', 'password', 'Ella', 'Johnson', 'premium', 99.9);

-- Delete the whole customer information <--- NOTES
DELETE FROM user_customer_info
WHERE username = 'ella_johnson';
-- RESETS the amount spent to 0 <--- NOTES
UPDATE user_customer_info
SET amountSpent = 0
WHERE username = 'ella_johnson';