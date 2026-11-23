
-- local variables--
--{% set name ='anji' %}

--select * from emp_tbl where name = '{{name}}'

--global variables, name varible should be declared in dbt_project.yml file, need to mention under vars, it is applicable to all models
select * from emp_tbl where name= {{ var('name') }}


