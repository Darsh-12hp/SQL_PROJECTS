-- 1) Retrieve the total number of books sold for each genre
SELECT * from orders;
SELECT * from books;

SELECT B.genre,sum(O.quantity)
FROM Orders as O
JOIN books as B on B.book_id=O.book_id
Group by B.genre;


-- 2) Find the average price of books in the "Fantasy" genre
SELECT avg(price) as AVERAGE_PRICE 
FROM books where genre='Fantasy';



-- 3) List customers who have placed at least 2 orders

SELECT O.customer_id,C.name,COUNT(O.order_id) AS ORDER_COUNT
FROM orders O
JOIN customers C ON O.customer_id=C.customer_id
GROUP BY O.customer_id,C.name
HAVING COUNT(order_id)>=2;

-- 4) Find the most frequently ordered book
select * from orders;

SELECT book_id,count(order_id) as Order_count
FROM orders
GROUP BY book_id
ORDER BY Order_count desc limit 1;


SELECT O.book_id,B.title,count(order_id) as Order_count
FROM orders as O
JOIN books as B ON O.book_id=B.book_id
GROUP BY O.book_id,B.title
ORDER BY Order_count desc limit 1;



-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 

SELECT * FROM BOOKS where genre='Fantasy' order by price DESC limit 3;


-- 6) Retrieve the total quantity of books sold by each author

SELECT B.author,SUM(O.quantity) as TOTAL_BOOK_SOLD
FROM orders O
JOIN books as B ON B.book_id=O.book_id
GROUP BY B.author;

-- 7) List the cities where customers who spent over $30 are located
SELECT * FROM Customers;

SELECT distinct C.city,total_amount
FROM customers as C 
JOIN orders as O ON C.customer_id=O.customer_id
where O.total_amount>30;

-- 8) Find the customer who spent the most on orders
SELECT C.name,SUM(O.total_amount) as TOTAL_SPENT
FROM orders as O
JOIN customers as C on C.customer_id=O.customer_id
group by C.name  
order by TOTAL_SPENT DESC limit 1;



-- 9) Calculate the stock remaining after fulfilling all orders
select * from orders;
select * from books;

SELECT B.book_id,B.title,B.stock,COALESCE(SUM(O.quantity),0) AS Order_Quantity,
		B.stock - COALESCE(SUM(O.quantity),0) AS REMAINING_STOCK
FROM books as B
JOIN orders O on B.book_id=O.book_id
GROUP by B.book_id








