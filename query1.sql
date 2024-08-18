SELECT 
    products.product_category AS category, 
    ROUND(CAST(SUM(payments.payment_value) AS NUMERIC), 2) AS total_sales
FROM 
    products 
JOIN 
    order_items ON products.product_id = order_items.product_id
JOIN 
    payments ON payments.order_id = order_items.order_id
GROUP BY 
    products.product_category;

