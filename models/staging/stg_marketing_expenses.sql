with source as (
    select
        campaign_id,
        campaign_name,
        start_date,
        end_date,
        marketing_expense
    from {{ ref('marketing_expenses') }}
)
select * from source