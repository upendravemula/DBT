select * from {{ ref("stg_sales") }}
where revenue <0