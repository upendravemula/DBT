{% macro DBCreation(sourcedb,targetdb) %}

{% set CloneQuery %}

create or replace database {{targetdb}}  clone {{sourcedb}}
{%endset%}   
{%do run_query(CloneQuery)%}
{% endmacro %}