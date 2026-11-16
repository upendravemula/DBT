

--select * from dbt_db.dbt_raw.snd
{{
    config(
        materialized='table',
        transient=true
    )
}}

select * from {{ source('Dev', 'snd') }}