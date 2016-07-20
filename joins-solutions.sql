1. Get all customers and their addresses.
SELECT * FROM customers JOIN addresses ON customers.id = addresses.customer_id;

2. Get all orders and their line items.
SELECT * FROM orders LEFT JOIN line_items ON orders.id = line_items.order_id;

3. Which warehouses have cheetos?
SELECT w.warehouse FROM products AS p
JOIN warehouse_product AS wp ON p.id = wp.product_id
JOIN warehouse AS w ON wp.warehouse_id = w.id
WHERE p.description LIKE 'cheeto%';

4. Which warehouses have diet pepsi?
SELECT w.warehouse FROM products AS p
JOIN warehouse_product AS wp ON p.id = wp.product_id
JOIN warehouse AS w ON wp.warehouse_id = w.id
WHERE p.description LIKE 'diet p%';

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT c.*, count(o.id) FROM customers AS c
JOIN addresses AS a ON c.id = a.customer_id
JOIN orders AS o ON a.id = o.address_id
GROUP BY c.id;

6. How many customers do we have?
SELECT count(*) FROM customers;

7. How many products do we carry?
SELECT count(*) FROM products;

8. What is the total available on-hand quantity of diet pepsi?
SELECT sum(wp.on_hand) FROM products AS p
JOIN warehouse_product AS wp ON p.id = wp.product_id
WHERE p.decription = 'diet pepsi';
