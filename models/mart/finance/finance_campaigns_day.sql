SELECT
    cd.date_date,
    (fd.operational_margin - cd.ads_cost) AS ads_margin,
    fd.average_basket,
    fd.operational_margin,
    cd.ads_cost,
    cd.impression AS ads_impression,
    cd.click AS ads_click,
    fd.products_sold AS quantity,
    fd.revenue,
    fd.purchase_cost,
    fd.shipping_fee,
    fd.log_costs
FROM
    {{ ref('int_campaign_day') }} cd
LEFT JOIN
    {{ ref('finance_days') }} fd
USING
    (date_date)
