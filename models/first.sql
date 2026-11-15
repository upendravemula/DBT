-- 4 ways to run dbt model 1) dbt run -m <name> 2) dbt run -s <name> 3) dbt run --select <name> 4) dbt run --model <name>
-- by default view will be created in snowflake, if you want to have table then we have to mention materialized = table
-- then Transient table will be created, if we mention transient = false then we will have perminent table
{{
    config(
        materialized='table',
        Transient=false,
        query_tag = 'dbt'
    )
}}
-- to identify list of queries execute particular user or particular model then we use Query_tag
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

