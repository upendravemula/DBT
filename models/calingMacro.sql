

--select * from snd
--select  {{addingnumber(1,2)}}


select  {{cleandata('ccode')}}
from 
{{ source('Dev', 'snd') }}