{% macro cleandata(args) %}
    initcap(trim({{args}}))
{% endmacro %}