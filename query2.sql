SELECT 
    Round((SUM(CASE WHEN payment_installments > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)),2) AS percentage_of_installment_orders
FROM 
    payments;

--Remember this code where it is used (. Calculate the percentage of orders that were paid in installments.)