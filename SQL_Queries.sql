-- Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Revenue
SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id;

-- Top 5 Best Selling Pizzas
SELECT
    pizza_types.name,
    SUM(order_details.quantity) AS total_quantity
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_quantity DESC
LIMIT 5;

-- Retrieve the total number of orders placed
SELECT COUNT(order_id) AS total_orders
FROM orders;

-- Question 2: Calculate total revenue
SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id;

-- Calculate the Percentage Contribution of Each Pizza Category to Total Revenue
SELECT
    pizza_types.category,
    (
        SUM(order_details.quantity * pizzas.price) /
        (
            SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2)
            FROM order_details
            JOIN pizzas
                ON order_details.pizza_id = pizzas.pizza_id
        )
    ) * 100 AS revenue
FROM pizza_types
JOIN pizzas
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
    ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;


--Join Relevant Tables to Find the Category-wise Distribution of Pizzas
SELECT
    category,
    COUNT(name) AS total_pizzas
FROM pizza_types
GROUP BY category
ORDER BY category DESC;
