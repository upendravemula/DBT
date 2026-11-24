with source as (

    select * from {{ source('ecommerce', 'payments') }}
)
,

renamed as (
select  payment_id, order_id, payment_method, amount_cents, amount_cents/100 as amount_dollar, paid_at
from
source

)
select * from renamed