-- checking merging option through jobs
with source as (

select * from {{ source('ecommerce', 'orders') }}

)

select * from source