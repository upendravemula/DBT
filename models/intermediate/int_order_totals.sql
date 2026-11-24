with orderlist as (

select * from {{ ref('stg_order_items') }}


),


total_orders as (

select 

sum(order_id) order_id , count(*) count_orders, sum(quantity) quantity, sum(quantity * unit_price_dollar) order_total

from
orderlist group by order_id

)
select * from total_orders