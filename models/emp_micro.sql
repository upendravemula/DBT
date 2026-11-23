{{
    config(
        materialized='incremental',
        incremental_strategy = 'microbatch',
        event_time = 'updated_at',
        batch_size ='day',
        begin = '2026-11-17'
        
    )
}}

select * from {{ source('RAW', 'emp_mb_src') }}