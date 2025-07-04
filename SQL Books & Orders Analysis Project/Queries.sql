-- Reterieve all books in the fiction genre
SELECT * FROM books where genre='Fiction';

-- Find Books Published After the Year 1950
SELECT * FROM books where published_year >1950;

-- List all customers from the Canada
SELECT * FROM customers where country='Canada';

-- Show orders placed in November 2023
SELECT * FROM orders where  EXTRACT(MONTH FROM order_date)=11 AND EXTRACT(YEAR FROM order_date)=2023

SELECT * FROM orders where order_date BETWEEN '2023-11-1' AND '2023-11-30';

-- Retrieve the total stock of books available
SELECT SUM(stock) as TOTAL_STOCK FROM books;

-- Find the details of the most expensive book
SELECT * FROM books where price=(SELECT price from books order by price desc limit 1);

SELECT * from books order by price desc limit 1

-- Show all customers who ordered more than 1 quantity of a book
SELECT * FROM orders where quantity>1;

-- Retrieve all orders where the total amount exceeds $20
SELECT * FROM orders where total_amount > 20;


-- List all genres available in the Books table
SELECT DISTINCT genre from books;

--Find the book with the lowest stock
SELECT * from books order by stock limit 1;


-- Calculate the total revenue generated from all orders
SELECT SUM(total_amount)as TOTAL_REVENUE from orders; 


