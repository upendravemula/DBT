{% macro DBschemTbl(tdb,tsch,tbllist) %}
{% set DBCreation %}
create or replace database {{tdb}}
{%endset%}
{%do run_query(DBCreation)%} 

{% set shemaCreation %}
create or replace schema {{tdb}}.{{tsch}}
{%endset%}
{%do run_query(shemaCreation)%}

{% for T in tbllist %}
    {% set sourcetbl = tdb~'.'~tsch~'.'~T  %}

    {%set createtbl %}
    create or replace table {{sourcetbl}}(id int)
    {%endset%}
    {%do run_query(createtbl)%}
    {{ log("Created " ~ sourcetbl, info=True) }}
{% endfor %}


{% endmacro %}

