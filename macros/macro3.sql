

{% macro stringcon(fname,lname) %}
    {{fname}} ||' . ' || {{lname}}
{% endmacro %}