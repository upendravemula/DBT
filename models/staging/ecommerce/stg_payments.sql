with source as (

    select * from {{ source('ecommerce', 'payments') }}
)
,

renamed as (
select  payment_id, order_id, payment_method, amount_cents,  {{cents_to_dollars('amount_cents') }}   as amount_dollar, paid_at
from
source

)
select * from renamed