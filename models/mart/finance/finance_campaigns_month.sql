SELECT
    EXTRACT(MONTH FROM date_date) AS date_month,
    SUM(ads_margin) AS total_ads_margin,
    SUM(operational_margin) AS total_operational_margin,
    SUM(ads_cost) AS total_ads_cost,
    SUM(ads_impression) AS total_ads_impression,
    SUM(ads_click) AS total_ads_click,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    SUM(purchase_cost) AS total_purchase_cost,
    SUM(shipping_fee) AS total_shipping_fee,
    SUM(log_costs) AS total_log_costs
FROM
    {{ ref('finance_campaigns_day') }}

GROUP BY
    date_month