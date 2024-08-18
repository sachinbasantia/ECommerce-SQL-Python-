---Count the number of customers from each state.

select customer_state,count(customer_id) from customers
group by customer_state;

-- Calculate the number of orders per month in 2018.
SELECT 
    EXTRACT(MONTH FROM order_purchase_timestamp::timestamp) AS month,
    COUNT(*) AS number_of_orders
FROM 
    orders
WHERE 
    EXTRACT(YEAR FROM order_purchase_timestamp::timestamp) = 2018
GROUP BY 
    month
ORDER BY 
    month;
--order_purchase_timestamp::timestamp: Casts the order_purchase_timestamp column to a timestamp data type, 
--which makes it compatible with the EXTRACT function.

--my code
-- select sum(extract month from order_purchase_timestamp) as monthly from orders 
-- where year(order_purchase_timestamp)=2018
-- group by monthly


--summ and extract sath me nhi use kr sakte
--sum is used for aggregrate functions