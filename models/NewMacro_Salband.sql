select * 
from
{{ source('RAW', 'emp_tbl_macro') }}
