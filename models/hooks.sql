{{
    config(
        materialized='table',
        query_tag ='DBT',
        alias = 'wareshousechange',
        pre_hook =["{{warehouseselection(var('Prewh'))}}"]  ,
        post_hook=["{{warehouseselection(var('postwh'))}}"]   
    )
}}
select * from {{ source('Dev', 'snd') }}