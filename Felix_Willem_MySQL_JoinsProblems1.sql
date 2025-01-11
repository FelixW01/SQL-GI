-- Felix WIllem GI SQL-JOINS Week 14

-- 1. Using customer and salesman tables, write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city

SELECT joinslesson_saleman.name, joinslesson_customer.cust_name, joinslesson_saleman.city FROM joinslesson_saleman
INNER JOIN joinslesson_customer
ON joinslesson_saleman.city = joinslesson_customer.city;

-- 2. Using the order and customer tables, write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

SELECT joinslesson_orders.ord_no, joinslesson_orders.purch_amt, joinslesson_customer.cust_name, joinslesson_customer.city
FROM joinslesson_orders
INNER JOIN joinslesson_customer
ON joinslesson_orders.customer_id = joinslesson_customer.customer_id
WHERE joinslesson_orders.purch_amt BETWEEN 500 AND 2000;

-- 3. Using the customer, and salesmans tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.

SELECT joinslesson_customer.cust_name, joinslesson_customer.city, joinslesson_saleman.commission FROM joinslesson_customer
INNER JOIN joinslesson_saleman
ON joinslesson_customer.salesman_id = joinslesson_saleman.salesman_id;

-- 4. Using the customer and salesman tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.

SELECT joinslesson_customer.cust_name, joinslesson_customer.city, joinslesson_saleman.name,joinslesson_saleman.commission FROM joinslesson_customer
INNER JOIN joinslesson_saleman
ON joinslesson_customer.salesman_id = joinslesson_saleman.salesman_id
WHERE joinslesson_saleman.commission > 0.12;

-- 5. Using the customer and salesman tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.

SELECT joinslesson_customer.cust_name, joinslesson_customer.city, joinslesson_saleman.name, joinslesson_saleman.city, joinslesson_saleman.commission FROM joinslesson_customer
INNER JOIN joinslesson_saleman
ON joinslesson_customer.salesman_id = joinslesson_saleman.salesman_id
WHERE joinslesson_saleman.commission > 0.12
AND joinslesson_customer.city <> joinslesson_saleman.city;

-- 6. Using all three tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.

SELECT 
    joinslesson_orders.ord_no, joinslesson_orders.ord_date, joinslesson_orders.purch_amt, joinslesson_customer.cust_name,
    joinslesson_customer.grade, joinslesson_saleman.name AS sales_name, joinslesson_saleman.commission
FROM joinslesson_orders
INNER JOIN joinslesson_customer
    ON joinslesson_orders.customer_id = joinslesson_customer.customer_id
INNER JOIN joinslesson_saleman
    ON joinslesson_orders.salesman_id = joinslesson_saleman.salesman_id;

-- 7. Using all three tables, write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.

SELECT 
    joinslesson_orders.ord_no, joinslesson_orders.ord_date, joinslesson_orders.purch_amt, joinslesson_customer.cust_name, 
    joinslesson_customer.grade, joinslesson_saleman.name AS sales_name, joinslesson_saleman.commission
FROM joinslesson_orders
INNER JOIN joinslesson_customer
    ON joinslesson_orders.customer_id = joinslesson_customer.customer_id
INNER JOIN joinslesson_saleman
    ON joinslesson_orders.salesman_id = joinslesson_saleman.salesman_id;

-- 8. Using the customer and salesman tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.

SELECT joinslesson_customer.cust_name, joinslesson_customer.city, joinslesson_customer.grade, joinslesson_saleman.name, joinslesson_saleman.city FROM joinslesson_customer
	INNER JOIN joinslesson_saleman
	ON joinslesson_customer.salesman_id = joinslesson_saleman.salesman_id
	ORDER BY joinslesson_customer.customer_id ASC;

-- 9. Using the customer and salesman tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.

SELECT joinslesson_customer.cust_name, joinslesson_customer.city, joinslesson_customer.grade, joinslesson_saleman.name, joinslesson_saleman.city FROM joinslesson_customer
	INNER JOIN joinslesson_saleman
	ON joinslesson_customer.salesman_id = joinslesson_saleman.salesman_id
    WHERE joinslesson_customer.grade < 300
	ORDER BY joinslesson_customer.customer_id ASC;

-- 10. Using the customer and salesman tables, Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not. 

SELECT 
    joinslesson_customer.cust_name, joinslesson_customer.city, joinslesson_orders.ord_no, joinslesson_orders.ord_date, 
    joinslesson_orders.purch_amt AS order_amount
FROM joinslesson_customer
LEFT JOIN joinslesson_orders
    ON joinslesson_customer.customer_id = joinslesson_orders.customer_id
ORDER BY joinslesson_orders.ord_date ASC;

-- 11. Using all three tables, write an SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

SELECT 
    joinslesson_customer.cust_name, joinslesson_customer.city, joinslesson_orders.ord_no, 
    joinslesson_orders.ord_date, joinslesson_orders.purch_amt AS order_amount, joinslesson_saleman.name AS salesperson_name, 
    joinslesson_saleman.commission
FROM joinslesson_customer
LEFT JOIN joinslesson_orders
    ON joinslesson_customer.customer_id = joinslesson_orders.customer_id
LEFT JOIN joinslesson_saleman
    ON joinslesson_orders.salesman_id = joinslesson_saleman.salesman_id
ORDER BY joinslesson_orders.ord_date ASC;