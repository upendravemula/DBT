with orderpayments as
(

select * from {{ ref('stg_payments') }}

),

orders as 
(


select   

order_id, 
payment_method ,
amount_dollar as payment_amount
from
orderpayments

)
select * From orders