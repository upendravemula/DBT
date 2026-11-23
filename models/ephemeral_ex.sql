{{
    config(
        materialized='ephemeral'
    )
}}
select id, upper(name) as name from {{ source('RAW', 'emp_tbl') }}
where sal >10