{% snapshot snapshot_name %}
    {{
        config(
            target_schema='Snap_schema',
            unique_key='id',
            strategy='check',
            invalidate_hard_deletes=true,
            check_cols = ['name','sal']
        )
    }}

    select * from {{ source('RAW', 'emp_tbl') }}
 {% endsnapshot %}