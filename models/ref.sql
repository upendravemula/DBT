--using ref function, we can ref other models, using model in some other places (using Ref funcation)
select * from {{ ref('first') }}