--Identify the correlation between product price and the number of times a 
--product has been purchased

-- select p1.product_category,count(o1.order_id),avg(o1.price)
-- 	from products as p1 join order_items as o1
-- on p1.product_id=o1.product_id 
-- group by p1.product_category,o1.price,o1.order_id

--What's wrong??
-- why not order_id???

select products.product_category, 
count(order_items.product_id) as number_of_times_bought,
round(avg(order_items.price)::numeric,2) as avg_pdt_price
from products join order_items
on products.product_id = order_items.product_id
group by products.product_category