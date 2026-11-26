with source as
(

    select * from {{ source('ecommerce', 'order_items') }}
)
,

renamed as
(

select order_item_id, order_id, product_id, quantity, unit_price_cents, {{cents_to_dollars('unit_price_cents') }}   unit_price_dollar
from
source


)
select * from renamed