
-- Q1) Retrieve all books in the "Fiction" genre
Select * from books
where Genre = "Fiction";

-- Q2) Find books published after the year 1950
select * from books 
where Published_Year > 1950;

-- Q3) List all customers from the Canada
Select * from customers
where Country = "Canada";

-- Q4) Show orders placed in November 2023
select * from orders
where Order_Date between "2023-11-01" and "2023-11-30";

-- Q5) Retrieve the total stock of books available
select sum(stock) as total_book_stock from books;

-- Q6) Find the details of the most expensive book
select * from books
order by price desc;

-- Q7) Show all customers who ordered more than 1 quant
select * from orders
where quantity > 2;

-- Q8) Retrieve all orders where the total amount exceeds $20
select * from orders
where Total_Amount > 20;

-- Q9) List all genres available in the Books table
select distinct(Genre) from books;

-- Q10) Find the book with the lowest stock
select * from books 
order by Stock limit 5;

-- Q11) Calculate the total revenue generated from all orders
select round(sum(total_Amount),2) as Total_revenue from orders;
