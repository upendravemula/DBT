-- by default view will be created in snowflake, if you want to have table then we have to mention materialized = table
-- then Transient table will be created, if we mention transient = false then we will have perminent table
{{
    config(
        materialized='table',
        Transient=false,
        query_tag = 'dbt'
    )
}}

-- it will create secure view
{#
{{
    config(
        materialized='view'
        secure=true
    )
}}
#}


select 1 as id, 'ffff' as address1

-- dbt run -m <ModelName>

