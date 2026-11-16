

--select * from snd

--select  {{addingnumber(1,2)}}

select *
from 
{{ source('Dev', 'snd') }}