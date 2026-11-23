{% macro macrogender(dbname,schemaname,  tblname) %}
{% set query1 %}
   create or replace table {{dbname}}.{{schemaname}}.{{tblname}} (id int)
{% endset %} 
{% do run_query(query1) %}
{% endmacro %}