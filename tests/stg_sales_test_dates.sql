select * from {{ ref('stg_sales') }}
where order_date > shipped_date