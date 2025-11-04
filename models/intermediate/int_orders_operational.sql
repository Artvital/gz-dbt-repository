SELECT 
    oma.orders_id,
    oma.date_date,
    ROUND((oma.margin + gsh.shipping_fee - gsh.logcost - gsh.ship_cost), 2) AS operational_margin,
    oma.quantity
FROM 
    {{ ref('int_orders_margin') }} oma
LEFT JOIN 
    {{ ref('stg_raw__ship') }} gsh
USING(orders_id)