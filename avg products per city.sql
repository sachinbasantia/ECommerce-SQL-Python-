--Find the average number of products per order, grouped by customer city

-- select (
--select avg(count(product_id)) from order_items group by order_id
-- from customer as c1 join orders as o1 on c1.customer_id=o1.customer_id 
-- join order_id as o2 on o1.order_id = o2.order_id 
-- group by c1.customer_city
with count_per_order as (select o1.order_id, o1.customer_id, count(o2.order_id) as order_count
from orders as o1 join order_items as o2
on o1.order_id=o2.order_id
group by o1.order_id, o1.customer_id)

select customers.customer_city, round(avg(count_per_order.order_count),2)
from customers join count_per_order 
on customers.customer_id=count_per_order.customer_id
group by customers.customer_city