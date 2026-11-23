{{
    config(
        materialized='incremental',
        incremental_strategy = 'delete+insert',
        unique_key='id'
    )
}}

select * from {{ source('RAW', 'emp_src') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where updated_at > (select dateadd(day, -{{ var('lookback_days',5)}} , max(updated_at)) from {{ this }}) 
   


{% endif %}

