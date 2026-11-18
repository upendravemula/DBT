{% macro warehouseselection(wh) %}
{{ log("Switching to warehouse " ~ wh, info=True) }}
use warehouse {{wh}}
    
{% endmacro %}