{{
    config(
        materialized='incremental',
        unique_key='id',
        incremental_strategy='merge',
        on_schema_change = 'sync_all_columns' 
    )
}}

select id,updated_at,dept from {{ source('RAW', 'emp_schemachange_src') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where updated_at > (select max(updated_at) from {{ this }}) 
{% endif %}