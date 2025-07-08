SELECT * FROM customers;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM product_reviews;


-- 1. Select all customers who signed up in the last 30 days.
select * from customers 
where signup_date>=  Current_DATE - INTERVAL '30 days';

select * from customers 
where signup_date between (current_date -Interval '30 days')AND current_date;


-- 2. Retrieve all products that cost more than 100.
select * from products where price>100;

-- 3. List the first 5 orders placed by any customer.
select  * from orders;
select * from orders order by order_id asc limit 5;


-- 4. Show distinct product categories from the products table.
select * from products;
select distinct category from products;


-- 5. Get the total number of customers.
select count(customer_id) as total_customers from customers;


-- 6. Find all orders where status is not 'Cancelled'.
select * from orders;
select * from order_items;

select * from orders where status='Cancelled'

-- 7. List products priced between 100 and 300.
select product_name,price from products where price between 100 and 300;

-- 8. Show customers whose email contains 'example'.
select * from customers where email like '%example%';

-- 9. Retrieve products with stock_quantity less than 20, ordered by price descending.
select * from products where stock_quantity<20  order by price desc;


-- 10. List all orders placed by customer with customer_id = 3.
select * from orders where customer_id=3;

-- 11. Find the total number of orders placed by each customer.
select * from orders;
select o.customer_id,c.first_name,count(o.order_id)
from orders o
JOIN customers c ON c.customer_id=o.customer_id
group by o.customer_id,c.first_name;

-- 12. Get the average order amount from the payments table.
select avg(amount) as AVERAGE_AMMOUNT from payments;

-- 13. Find the product with the highest price.
select product_name,price from products where price=(select max(price)from products); 

-- 14. Count how many products belong to each category.
select * from products;

select category,count(product_id)
from products 
group by category;

-- 15. Show customers who have placed more than 2 orders.
select * from orders;
select * from order_items;
select * from customers;

select O.customer_id,C.first_name from orders O  
join customers C on C.customer_id= O.customer_id
GROUP BY O.customer_id,C.first_name
HaVIng count(O.customer_id)>2;


-- 16. Get all orders along with the customer’s full name.

select O.*,concat(C.first_name,' ',C.last_name) as full_name 
from orders O
JOIN customers C ON O.customer_id=C.customer_id;

-- 17. List all order items with product names and their quantities.

select * from order_items;
select * from orders;
select * from products;
select * from payments;
select * from customers;
select * from product_reviews;

select OI.*,P.product_name,P.stock_quantity
from order_items OI
JOIN products P ON P.product_id=OI.product_id;


-- 18. Show all payments along with order status.
select P.*,O.status 
from payments P
JOIN orders O ON P.order_id=O.order_id;

-- 19. Retrieve reviews with customer name and product name.
select PR.review_text,concat(C.first_name,' ',C.last_name),P.product_name
FROM 
    product_reviews PR
JOIN 
    customers C ON PR.customer_id = C.customer_id
JOIN 
    products P ON PR.product_id = P.product_id;


-- 20. Find all products that were never ordered.
-- 21. Find the most expensive product ordered.
-- 22. Show customers who haven’t placed any orders.
-- 23. List products with prices higher than the average product price.
-- 24. Find the customer(s) who made the highest payment.
-- 25. Show the names of customers who ordered the cheapest product.
-- 26. Find customers who either placed an order or wrote a review (use UNION).
-- 27. Find customers who placed orders but never wrote a review.
-- 28. Get products reviewed but never ordered.
-- 29. Combine two SELECT queries using INTERSECT.
-- 30. Show difference between customers who placed orders and those who made payments.
-- 31. Insert a new product into the products table.
-- 32. Update the status of an order to 'Delivered'.
-- 33. Delete an order that has status 'Cancelled'.
-- 34. Create a new table called 'returns'.
-- 35. Alter the payments table to add a 'currency' column.
-- 36. Add a NOT NULL constraint to the 'email' column in customers.
-- 37. Create an index on the 'email' column.
-- 38. Drop the primary key from the orders table.
-- 39. Add a foreign key from reviews to orders.
-- 40. Add a CHECK constraint to ensure rating is between 1 and 5.
-- 41. Convert all customer names to uppercase.
-- 42. Show the length of each product name.
-- 43. Extract the year from the order_date.
-- 44. Calculate the number of days since each customer signed up.
-- 45. Replace spaces in product names with hyphens.
-- 46. Rank customers based on the total amount they paid.
-- 47. Assign row numbers to all products ordered, ordered by price.
-- 48. Show the cumulative sum of payments for each customer.
-- 49. Use LAG to find the previous order amount for each order.
-- 50. Use NTILE to divide customers into 4 payment quartiles.