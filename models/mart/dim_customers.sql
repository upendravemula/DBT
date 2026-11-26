with customers as (

    select *from {{ ref('stg_customers') }}
),

 orders as (

    select * from {{ ref('stg_orders') }}
),

 ordertotals as (

select * from {{ ref('int_order_totals') }}

),

totals as (

select
customer_id,
count(ord.order_id) as lifetime_orders,
sum(ort.order_total) as lifetime_value

from 
orders ord
left outer join 
ordertotals ort 
on ord.order_id = ort.order_id
group by ord.customer_id

),

final as (

select 
cust.customer_id, cust.fullname, cust.email, cust.city, cust.created_at, coalesce(lifetime_orders,0) as lifetime_orders,
coalesce(lifetime_value,0) as lifetime_value

from 
customers cust left outer join totals t on cust.customer_id=t.customer_id


)

select * from final 