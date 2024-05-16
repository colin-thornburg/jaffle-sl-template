with source as (
    select
        campaign_id,
        new_customers_acquired
    from {{ ref('new_customers_acquired') }}
)
select * from source