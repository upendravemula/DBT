{{
    config(
        materialized='table', transient = false, alias = 'orgnial', query_tag ='dbt'
    )
}}
select * from dbt_db.public.bck_emp
