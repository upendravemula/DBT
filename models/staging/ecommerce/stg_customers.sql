-- staging model for customers: CI test change
with source as (

select * from {{ source('ecommerce', 'customers') }} 
),

renamed as (

select

customer_id, first_name, last_name, first_name ||' '||  last_name as fullname,
lower(email) as email, city, created_at, updated_at
from
source
)

select * from renamed
