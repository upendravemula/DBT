{{
    config(
        materialized='incremental',
        incremental_strategy ='delete+insert',
        unique_key = 'id'
        
    )
}}

select * from {{ source('RAW', 'emp_src') }}

{%if is_incremental()  %}
where updated_at > (select max(updated_at) from {{this}})

{% endif %}