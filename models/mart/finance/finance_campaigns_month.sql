SELECT
    FORMAT_TIMESTAMP('%B', date_date) AS datemonth,
    ROUND(SUM(ads_margin), 2) AS ads_margin,
    ROUND(SUM(average_basket), 2) AS average_basket,
    ROUND(SUM(operational_margin), 2) AS operational_margin,
    SUM(ads_cost) AS ads_cost,
    SUM(ads_impression) AS ads_impression,
    SUM(ads_click) AS ads_click,
    SUM(quantity) AS quantity,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(shipping_fee), 2) AS shipping_fee,
    ROUND(SUM(log_costs), 2) AS log_costs
FROM
    {{ ref('finance_campaigns_day') }}
GROUP BY
    datemonth