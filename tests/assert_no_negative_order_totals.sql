select * from {{ ref('fac_orders') }}
where order_total < 0