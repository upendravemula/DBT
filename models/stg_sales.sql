{{
    config(
        materialized='table',
        transient='false'
    )
}}
select * from {{ source('sal', 'sales') }}