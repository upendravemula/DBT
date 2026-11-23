

{% macro macrogender(gendertype) %}

case when {{gendertype}} = 'm' then 'male'
when {{gendertype}} = 'f' then 'female'
end as gen
    
{% endmacro %}