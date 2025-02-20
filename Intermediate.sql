
-- Q1) Retrieve the total number of books sold for each genre
SELECT 
    b.Genre, SUM(o.Quantity) AS Quantity
FROM
    books b
        JOIN
    orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Genre
ORDER BY Quantity DESC;

-- Q2) Find the average price of books in the "Fantasy" genre
SELECT 
    ROUND(AVG(price), 2) AS avg_price
FROM
    books
WHERE
    genre = 'Fantasy';

-- Q3) List customers who have placed at least 2 orders
SELECT 
    c.Name, o.Customer_ID, COUNT(o.Order_ID) AS total_order
FROM
    orders o
        JOIN
    customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID , c.Name
HAVING total_order >= 2;

-- Q4) Find the most frequently ordered book
SELECT 
    b.Title, o.Book_id, COUNT(o.Book_ID) AS Order_Count
FROM
    Orders o
        JOIN
    Books b ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID , b.Title
ORDER BY Order_count DESC;

-- Q5) Show the top 3 most expensive books of 'Fantasy' Genre 
SELECT 
    *
FROM
    books
WHERE
    Genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- Q6) Retrieve the total quantity of books sold by each author
SELECT 
    b.author, SUM(o.quantity) AS total_books
FROM
    books b
        JOIN
    orders o ON b.book_id = o.order_id
GROUP BY b.author;


-- Q7) List the cities where customers who spent over $30 are located
SELECT 
    c.city, COUNT(o.total_amount) AS total
FROM
    customers c
        JOIN
    orders o ON c.Customer_ID = o.Customer_ID
WHERE
    o.Total_Amount > 30
GROUP BY c.city;

-- Q8) Find the customer who spent the most on orders
SELECT 
    c.Customer_ID, ROUND(SUM(o.Total_Amount), 2) AS total
FROM
    customers c
        JOIN
    orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID
ORDER BY total DESC;

-- Q9) Calculate the stock remaining after fulfilling all orders 

SELECT 
    b.Book_ID,
    COALESCE(SUM(o.quantity), 0) AS Total_Quantity_sold,
    b.stock - COALESCE(SUM(o.quantity), 0) AS Remaining_Quantity
FROM
    books b
        LEFT JOIN
    orders o ON b.book_id = o.book_id
GROUP BY b.book_id , b.Stock;