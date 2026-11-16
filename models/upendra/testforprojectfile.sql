{{
    config(
        materialized='table',
        transient=false,
        alias ='overridertablename'
    )
}}

select 1 as id, 'testforconfigfromdpt' as config