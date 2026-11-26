{% snapshot snapshot_SQL_customer %}
    {{
        config(
            target_schema='snapshotsql',
            unique_key='customer_id',
            strategy='timestamp',
            invalidate_hard_deletes=False,
            updated_at='updated_at'
        )
    }}

    select * from {{ source('ecommerce', 'customers') }}
 {% endsnapshot %}