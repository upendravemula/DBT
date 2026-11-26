{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy = 'merge',
        on_schema_change = 'append_new_columns'
    )
}}
with 
 orders as (

    select * from {{ ref('stg_orders') }}
    {% if is_incremental() %}
        -- this filter will only be applied on an incremental run
        --  3 day lookback so late-arriving updates are reprocessed
        where updated_at  >= (select dateadd('day', -3,  max(updated_at)) from {{ this }}) 
    {% endif %}

    qualify row_number() over (partition by order_id order by updated_at desc) = 1

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
        order_payments.payment_amount,
        orders.updated_at
    from orders
    left join order_totals
        on orders.order_id = order_totals.order_id
    left join order_payments
        on orders.order_id = order_payments.order_id

)

select * from final