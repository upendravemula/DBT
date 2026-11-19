{% test tbl_duplicate(model, column_name) %}

select * from {{model}} 
qualify row_number() over(partition by {{column_name}} order by {{column_name}} ) > 1 
    
{% endtest %}