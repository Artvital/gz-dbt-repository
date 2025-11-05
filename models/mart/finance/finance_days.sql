

WITH calcul AS
(
SELECT
    date_date,
    COUNT(DISTINCT orders_id) AS total_transactions,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(operational_margin), 2) AS operational_margin,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(logcost), 2) AS log_costs,
    ROUND(SUM(shipping_fee), 2) AS shipping_fee,
    ROUND(SUM(quantity), 2) AS products_sold
FROM
    {{ ref('int_orders_operational') }}

GROUP BY
    date_date
)

SELECT
    date_date,
    total_transactions,
    revenue,
    ROUND(revenue/NULLIF(total_transactions, 0), 2) AS average_basket,
    operational_margin,
    purchase_cost,
    log_costs,
    shipping_fee,
    products_sold

FROM
    calcul

ORDER BY
    date_date DESC