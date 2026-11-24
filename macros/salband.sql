{% macro sal_band(column_name, low=20,high=40) %}
    case when {{column_name}} < {{low}} then 'Low'
    when {{column_name}} = < {{high}} then 'Mediumn'
    else 'High' end as Sband 
{% endmacro %}