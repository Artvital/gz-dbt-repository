
    SELECT 
    gs.orders_id,
    gs.date_date,
    gs.revenue,
    gs.quantity,
    ROUND(gp.purchase_price * gs.quantity, 2) AS purchase_cost,
    ROUND(gs.revenue - (gp.purchase_price * gs.quantity), 2) AS margin
    FROM {{ ref('stg_raw__sales') }} gs
    LEFT JOIN {{ ref('stg_raw__product') }} gp
    ON gs.product_id = gp.products_id 

