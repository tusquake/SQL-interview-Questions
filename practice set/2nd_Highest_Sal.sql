SELECT max(amount)
FROM Orders
where amount < (SELECT max(amount)
FROM Orders);
