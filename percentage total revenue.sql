--Calculate the percentage of total revenue contributed by each product category.


-- with cnt as(
-- select  sum(p2.payment_value) as numerator,p1.product_id,p1.product_category as category 
--from products as p1 join order_items as o1
-- on p1.product_id=o1.product_id 
-- join payments as p2 on p2.order_id=o1.order_id
-- group by p1.product_category, p1.product_id)

-- select cnt.category, cnt.numerator/sum(payment_value) from payments


SELECT  
    p1.product_category AS category,
    (SUM(p2.payment_value) / (SELECT SUM(payment_value) FROM payments))*100 AS percentage_of_total_revenue
FROM 
    products AS p1
JOIN 
    order_items AS o1 ON p1.product_id = o1.product_id
JOIN 
    payments AS p2 ON p2.order_id = o1.order_id
GROUP BY 
    p1.product_category;

-- select upper(products.product_category) category, 
-- round((sum(payments.payment_value)/(select sum(payment_value) from payments))*100,2) sales_percentage
-- from products join order_items 
-- on products.product_id = order_items.product_id
-- join payments 
-- on payments.order_id = order_items.order_id
-- group by category order by sales_percentage desc


