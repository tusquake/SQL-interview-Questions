# SQL-interview-Questions
--Q1(a):.Find the list of customers whose age in between 20 to 30.
--SELECT customer_id,age
--FROM Customers
--Where age Between 20 and 30;

--Q1(b): Write a query to retrieve the list of customers from the same country.
--SELECT E1.customer_id, E1.first_name,E1.last_name, E1.country
--FROM Customers E1, Customers E2
--WHERE E1.country = E2.country AND E1.customer_id != E2.customer_id

--Q1(c): Query to find the null values in the Customers table.
--SELECT * FROM Customers
--WHERE customer_id IS NULL

--Q2(a):Query to find the cumulative sum of order amount.
--SELECT order_id, amount, SUM(amount) OVER (ORDER BY order_id) AS CumulativeSum
--FROM Orders

--Q2(b): What’s the keyboard, mouse ,monitor, mousepad order ratio.
--SELECT
--(COUNT(*) FILTER (WHERE item = "Keyboard") * 10.0 / COUNT(*)) AS keyPct,
--(COUNT(*) FILTER (WHERE item = "Mouse") * 10.0 / COUNT(*)) AS msPct,
--(COUNT(*) FILTER (WHERE item = "Monitor") * 10.0 / COUNT(*)) AS mon,
--(COUNT(*) FILTER (WHERE item = "Mousepad") * 10.0 / COUNT(*)) AS mspadPct
--FROM Orders;

--Q2(c): Write a query to fetch 50% records from the Orders table.
--SELECT * FROM Orders
--WHERE order_id <= (SELECT COUNT(order_id)/2 from Orders)

--Note : If order_id is not auto-increment field or numeric, then we can use Row NUMBER function
--SELECT * FROM Orders
--(SELECT *,ROW_NUMBER() OVER (ORDER BY order_id) AS RowNumber
--From Orders) AS ord
--WHERE ord.RowNumber <= (SELECT COUNT(order_id)/2 from Orders)

--Q3: Query to fetch the order amount but replace the LAST 2 digits with ‘XX’ i.e 12345 will be 123XX
--SELECT amount, CONCAT(LEFT(CAST(amount AS text), LENGTH(CAST(amount AS text))-2), 'XX')
--AS masked_number
--FROM Orders

--Q4.Write a query to fetch even and odd rows from Order table.
--SELECT * FROM Orders
--WHERE MOD(order_id,2)=0;

--Note : If you don't have an auto-increment field like EmpID then we can use the

--SELECT * FROM
--(SELECT *, ROW_NUMBER() OVER(ORDER BY order_id) AS
--RowNumber
--FROM Orders) AS Emp
--WHERE Emp.RowNumber % 2 = 1

--SELECT * FROM
--(SELECT *, ROW_NUMBER() OVER(ORDER BY order_id) AS
--RowNumber
--FROM Orders) AS Emp
--WHERE Emp.RowNumber % 2 = 0
