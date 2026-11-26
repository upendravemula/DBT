with orders as (

    select * from {{ ref('stg_orders') }}

),

order_totals as (

    select * from {{ ref('int_order_totals') }}

),

order_payments as (

    select * from {{ ref('int_order_payments') }}

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_ts,
        orders.status,
        coalesce(order_totals.count_orders,0) item_count,  
        coalesce(order_totals.order_total,0) order_total,
        order_payments.payment_method,
        order_payments.payment_amount
    from orders
    left join order_totals
        on orders.order_id = order_totals.order_id
    left join order_payments
        on orders.order_id = order_payments.order_id

)

select * from final